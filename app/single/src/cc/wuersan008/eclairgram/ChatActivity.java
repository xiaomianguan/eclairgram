package cc.wuersan008.eclairgram;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import cc.wuersan008.eclairgram.mtproto.MtpClient;
import cc.wuersan008.eclairgram.mtproto.TlObject;

/**
 * 聊天界面（复用 Talk 的聊天气泡与配色）。
 *
 * 历史来自 messages.getHistory，发送走 messages.sendMessage / sendMedia；
 * 支持查看图片/视频附件（点击气泡下载后打开）。
 */
public class ChatActivity extends BaseActivity {

    static final class Msg {
        int id;
        boolean out;
        String text;
        int mediaType;        // 0 无, 1 图片, 2 视频
        byte[] location;      // 原文件的 InputFileLocation（可下载）
        String mediaName;
        // 内联缩略图
        byte[] thumbLocation; // 缩略图的 InputFileLocation（可下载，可能为 null）
        byte[] thumbInline;   // 内联字节（photoCachedSize，可能为 null）
        String thumbKey;      // 缓存键
        int thumbW, thumbH;   // 缩略图尺寸（用于排版）

        boolean hasThumb() {
            return thumbKey != null && (thumbInline != null || thumbLocation != null);
        }
    }

    private static final int REQ_PICK = 1;
    private static final int REQ_CAMERA = 2;

    private byte[] mPeer;
    private String mName;
    private long mPhotoId;
    private int mType;
    private String mUsername;
    private long mId;
    private int mParticipants;
    private boolean mOnline;
    private boolean mSelf;

    private final Handler mMain = new Handler(Looper.getMainLooper());
    private ArrayAdapter<Msg> mAdapter;
    private ListView mList;
    private EditText mInput;
    private volatile boolean mRunning = true;
    private volatile boolean mResumed = false;
    private volatile boolean mWake = false;   // 唤醒轮询线程立即刷新
    private int mLastSig = 0;                 // 上次渲染的消息指纹，未变则不重绑
    private static final long POLL_MS = 8000; // 轮询间隔（仅在界面可见时轮询）

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mPeer = getIntent().getByteArrayExtra("peer");
        mName = getIntent().getStringExtra("name");
        if (mName == null) mName = "";
        mPhotoId = getIntent().getLongExtra("photoId", 0);
        mType = getIntent().getIntExtra("type", 0);
        mUsername = getIntent().getStringExtra("username");
        mId = getIntent().getLongExtra("id", 0);
        mParticipants = getIntent().getIntExtra("participants", 0);
        mOnline = getIntent().getBooleanExtra("online", false);
        mSelf = getIntent().getBooleanExtra("self", false);

        requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        setContentView(R.layout.ec_chat);
        ((TextView) findViewById(R.id.ec_chat_title)).setText(EmojiFont.emojify(this, mName, dp(20)));
        ((TextView) findViewById(R.id.ec_chat_subtitle)).setText(
                mType == 0 ? getString(mOnline ? R.string.ec_online : R.string.ec_offline)
                           : typeLabel(mType));

        ImageView headerAvatar = (ImageView) findViewById(R.id.ec_header_avatar);
        android.graphics.Bitmap b = AvatarCache.get(mPhotoId);
        if (b != null) headerAvatar.setImageBitmap(b);
        else headerAvatar.setImageResource(R.drawable.ic_contact_picture);
        headerAvatar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                openDetails();
            }
        });
        ImageView headerPresence = (ImageView) findViewById(R.id.ec_header_presence);
        if (mType == 0) {
            headerPresence.setVisibility(View.VISIBLE);
            headerPresence.setImageResource(mOnline
                    ? android.R.drawable.presence_online
                    : android.R.drawable.presence_offline);
        } else {
            headerPresence.setVisibility(View.GONE);
        }
        mList = (ListView) findViewById(R.id.ec_messages);
        mInput = (EditText) findViewById(R.id.ec_input);
        Button send = (Button) findViewById(R.id.ec_send);
        ImageButton attach = (ImageButton) findViewById(R.id.ec_attach);

        mAdapter = new ArrayAdapter<Msg>(this, 0, new ArrayList<Msg>()) {
            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                View v = convertView;
                if (v == null) {
                    v = LayoutInflater.from(ChatActivity.this)
                            .inflate(R.layout.ec_message_item, parent, false);
                }
                final Msg m = getItem(position);
                LinearLayout row = (LinearLayout) v.findViewById(R.id.ec_msg_row);
                LinearLayout bubble = (LinearLayout) v.findViewById(R.id.ec_msg_bubble);
                final FrameLayout thumbWrap = (FrameLayout) v.findViewById(R.id.ec_msg_thumbwrap);
                final ImageView thumb = (ImageView) v.findViewById(R.id.ec_msg_thumb);
                ImageView play = (ImageView) v.findViewById(R.id.ec_msg_play);
                TextView t = (TextView) v.findViewById(R.id.ec_msg_text);

                row.setGravity(m.out ? Gravity.RIGHT : Gravity.LEFT);
                final boolean sticker = m.mediaType == 3;
                if (sticker) {
                    bubble.setBackgroundDrawable(null);   // 贴纸不套气泡
                } else {
                    bubble.setBackgroundResource(m.out
                            ? R.drawable.ec_bubble_out : R.drawable.ec_bubble_in);
                }

                if (sticker) {
                    t.setVisibility(View.GONE);
                } else {
                    t.setVisibility(View.VISIBLE);
                    t.setText(EmojiFont.emojify(ChatActivity.this, m.text, dp(20)));
                    t.setTextColor(getResources().getColor(R.color.ec_text_primary));
                }

                if (m.hasThumb()) {
                    thumbWrap.setVisibility(View.VISIBLE);
                    int box = sticker ? dp(140) : dp(200);
                    int maxW = box, maxH = box;
                    int iw = m.thumbW > 0 ? m.thumbW : 4;
                    int ih = m.thumbH > 0 ? m.thumbH : 3;
                    float scale = Math.min((float) maxW / iw, (float) maxH / ih);
                    int dw = Math.max(dp(48), (int) (iw * scale));
                    int dh = Math.max(dp(48), (int) (ih * scale));
                    thumb.setLayoutParams(new FrameLayout.LayoutParams(dw, dh));
                    play.setVisibility(m.mediaType == 2 ? View.VISIBLE : View.GONE);
                    play.setColorFilter(Color.WHITE, PorterDuff.Mode.SRC_IN);

                    final String key = m.thumbKey;
                    thumb.setTag(key);
                    Bitmap b = ThumbCache.get(key);
                    if (b != null) {
                        thumb.setImageBitmap(b);
                        thumb.setBackgroundColor(0);
                    } else {
                        thumb.setImageBitmap(null);
                        thumb.setBackgroundColor(0x22000000);
                        ThumbCache.load(ChatActivity.this, key, m.thumbLocation, m.thumbInline,
                                dp(150), new ThumbCache.Listener() {
                                    public void onThumb(String k, Bitmap bmp) {
                                        if (bmp == null) return;
                                        if (key.equals(thumb.getTag())) {
                                            thumb.setImageBitmap(bmp);
                                            thumb.setBackgroundColor(0);
                                        } else {
                                            // 视图已被复用：刷新一次让缓存里的缩略图立刻出现
                                            mAdapter.notifyDataSetChanged();
                                        }
                                    }
                                });
                    }
                } else {
                    thumbWrap.setVisibility(View.GONE);
                    thumb.setTag(null);
                }

                // 媒体气泡整体可聚焦/可点按：气泡背景自带 state_focused 蓝边，
                // D-pad 聚焦到整条消息，中键打开原文件（无缩略图时也一样）。
                t.setFocusable(false);
                t.setOnClickListener(null);
                if (m.mediaType != 0 && !sticker) {
                    bubble.setFocusable(true);
                    bubble.setClickable(true);
                    bubble.setOnClickListener(new View.OnClickListener() {
                        public void onClick(View x) {
                            openMedia(m);
                        }
                    });
                } else {
                    bubble.setFocusable(false);
                    bubble.setClickable(false);
                    bubble.setOnClickListener(null);
                }
                return v;
            }
        };
        mList.setAdapter(mAdapter);

        send.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                onSend();
            }
        });
        attach.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                onAttach();
            }
        });
        ImageButton emoji = (ImageButton) findViewById(R.id.ec_emoji);
        emoji.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                onEmoji();
            }
        });
        ImageButton sticker = (ImageButton) findViewById(R.id.ec_sticker);
        sticker.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                onSticker();
            }
        });
        mInput.addTextChangedListener(new android.text.TextWatcher() {
            public void beforeTextChanged(CharSequence s, int a, int b, int c) {}
            public void onTextChanged(CharSequence s, int a, int b, int c) {}
            public void afterTextChanged(android.text.Editable s) {
                EmojiFont.applyToEditable(ChatActivity.this, s, dp(20));
            }
        });

        new Thread(new Runnable() {
            public void run() {
                while (mRunning) {
                    if (mResumed) refresh();
                    // 分片睡眠：暂停时不轮询，恢复时能马上唤醒刷新
                    long waited = 0;
                    while (mRunning && !mWake && waited < POLL_MS) {
                        sleep(200);
                        waited += 200;
                    }
                    mWake = false;
                }
            }
        }).start();
    }

    @Override
    protected void onResume() {
        super.onResume();
        mResumed = true;
        mWake = true;                                   // 让轮询线程立即刷新一次
        TelegramManager.get(this).setActivePeer(mPeer);   // 正在看这个会话：别弹它的通知
        Notifications.clearAll(this);
    }

    @Override
    protected void onPause() {
        mResumed = false;                               // 不可见就不轮询（省电/省流量）
        TelegramManager.get(this).setActivePeer(null);
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        mRunning = false;
        super.onDestroy();
    }

    private String typeLabel(int type) {
        if (type == 1) return getString(R.string.ec_type_group);
        if (type == 2) return getString(R.string.ec_type_channel);
        return getString(R.string.ec_type_user);
    }

    private void openDetails() {
        Intent i = new Intent(this, DetailsActivity.class);
        i.putExtra("name", mName);
        i.putExtra("photoId", mPhotoId);
        i.putExtra("type", mType);
        i.putExtra("username", mUsername);
        i.putExtra("id", mId);
        i.putExtra("participants", mParticipants);
        i.putExtra("self", mSelf);
        startActivity(i);
    }

    private void onSend() {
        final String text = mInput.getText().toString().trim();
        if (text.length() == 0) return;
        mInput.setText("");
        new Thread(new Runnable() {
            public void run() {
                try {
                    TelegramManager.get(ChatActivity.this).syncSendMessage(mPeer, text);
                } catch (final Throwable t) {
                    toast(getString(R.string.ec_send_failed, String.valueOf(t.getMessage())));
                }
                refresh();
            }
        }).start();
    }

    // ============================================================ 附件
    private void onEmoji() {
        new EmojiPicker(this, new EmojiPicker.Listener() {
            public void onEmoji(int cp) {
                String s = new String(Character.toChars(cp));
                int start = mInput.getSelectionStart();
                if (start < 0) start = mInput.getText().length();
                mInput.getText().insert(start, s);
            }
        }).show();
    }

    private void onSticker() {
        new StickerPicker(this, new StickerPicker.Listener() {
            public void onSticker(final long id, final long accessHash, final byte[] fileRef) {
                new Thread(new Runnable() {
                    public void run() {
                        try {
                            TelegramManager.get(ChatActivity.this)
                                    .syncSendSticker(mPeer, id, accessHash, fileRef);
                        } catch (final Throwable t) {
                            toast(getString(R.string.ec_send_failed, String.valueOf(t.getMessage())));
                        }
                        refresh();
                    }
                }).start();
            }
        }).show();
    }

    private void onAttach() {
        new AlertDialog.Builder(this)
                .setItems(new CharSequence[] {
                        getString(R.string.ec_attach_camera),
                        getString(R.string.ec_attach_photo),
                        getString(R.string.ec_attach_video) },
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface d, int which) {
                                if (which == 0) {
                                    takePhoto();
                                    return;
                                }
                                Intent i = new Intent(Intent.ACTION_GET_CONTENT);
                                i.setType(which == 2 ? "video/*" : "image/*");
                                i.addCategory(Intent.CATEGORY_OPENABLE);
                                try {
                                    startActivityForResult(i, REQ_PICK);
                                } catch (Throwable t) {
                                    toast(String.valueOf(t.getMessage()));
                                }
                            }
                        }).show();
    }

    /**
     * 用应用内相机（{@link CameraActivity}）拍一张并直接发送。拍到的 JPEG 只在
     * 内存里传递，不写任何用户存储，因此不依赖 SD 卡。
     */
    private void takePhoto() {
        try {
            CameraActivity.sLastJpeg = null;
            startActivityForResult(new Intent(this, CameraActivity.class), REQ_CAMERA);
        } catch (Throwable t) {
            toast(String.valueOf(t.getMessage()));
        }
    }

    @Override
    protected void onActivityResult(int req, int res, Intent data) {
        super.onActivityResult(req, res, data);

        if (req == REQ_CAMERA) {
            final byte[] jpeg = CameraActivity.sLastJpeg;
            CameraActivity.sLastJpeg = null;
            if (res != RESULT_OK || jpeg == null || jpeg.length == 0) return;
            new Thread(new Runnable() {
                public void run() {
                    try {
                        TelegramManager.get(ChatActivity.this)
                                .syncSendPhoto(mPeer, jpeg, "photo.jpg", "");
                    } catch (final Throwable t) {
                        toast(getString(R.string.ec_send_failed, String.valueOf(t.getMessage())));
                    }
                    refresh();
                }
            }).start();
            return;
        }

        if (req != REQ_PICK || res != RESULT_OK || data == null || data.getData() == null) return;
        final Uri uri = data.getData();
        new Thread(new Runnable() {
            public void run() {
                try {
                    byte[] bytes = readAll(uri);
                    TelegramManager.get(ChatActivity.this)
                            .syncSendPhoto(mPeer, bytes, "photo.jpg", "");
                } catch (final Throwable t) {
                    toast(getString(R.string.ec_send_failed, String.valueOf(t.getMessage())));
                }
                refresh();
            }
        }).start();
    }

    private byte[] readAll(Uri uri) throws Exception {
        InputStream in = getContentResolver().openInputStream(uri);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[16384];
        int n;
        while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
        in.close();
        return out.toByteArray();
    }

    // ============================================================ 媒体查看
    private void openMedia(final Msg m) {
        if (m.location == null) return;
        Toast.makeText(this, R.string.ec_media_downloading, Toast.LENGTH_SHORT).show();
        new Thread(new Runnable() {
            public void run() {
                try {
                    byte[] data = TelegramManager.get(ChatActivity.this)
                            .syncDownloadLocation(m.location);
                    if (data == null || data.length == 0) {
                        toast(getString(R.string.ec_media_failed));
                        return;
                    }
                    File f = new File(getCacheDir(), "media_" + System.currentTimeMillis());
                    FileOutputStream out = new FileOutputStream(f);
                    out.write(data);
                    out.close();
                    Intent i = new Intent(ChatActivity.this, MediaActivity.class);
                    i.putExtra("path", f.getAbsolutePath());
                    i.putExtra("type", m.mediaType);
                    i.putExtra("name", m.mediaName);
                    startActivity(i);
                } catch (final Throwable t) {
                    toast(getString(R.string.ec_media_failed));
                }
            }
        }).start();
    }

    private void toast(final String s) {
        mMain.post(new Runnable() {
            public void run() {
                Toast.makeText(ChatActivity.this, s, Toast.LENGTH_SHORT).show();
            }
        });
    }

    // ============================================================ 刷新
    private void refresh() {
        try {
            TlObject hist = TelegramManager.get(this).syncGetHistory(mPeer, 50);
            List<Object> msgs = hist.list("messages");
            java.util.Map<Long, String> unames = new java.util.HashMap<Long, String>();
            List<Object> users = hist.list("users");
            if (users != null) {
                for (Object o : users) {
                    TlObject u = (TlObject) o;
                    String n = u.str("first_name");
                    if (n == null) n = "";
                    String ln = u.str("last_name");
                    if (ln != null && ln.length() > 0) n = n.length() > 0 ? n + " " + ln : ln;
                    if (n.length() == 0) {
                        String un = u.str("username");
                        n = un == null ? ("User " + u.i64("id")) : ("@" + un);
                    }
                    unames.put(Long.valueOf(u.i64("id")), n);
                }
            }
            final List<Msg> out = new ArrayList<Msg>();
            int sig = 17;
            if (msgs != null) {
                // 从末尾（最新）往前遍历，避免 Collections.reverse 的整表复制
                for (int oi = msgs.size() - 1; oi >= 0; oi--) {
                    Object o = msgs.get(oi);
                    TlObject m = (TlObject) o;
                    if (!m.type().equals("message")) continue;
                    Msg mm = new Msg();
                    mm.id = m.i32("id");
                    mm.out = m.bool("out");
                    sig = sig * 31 + mm.id;
                    String text = m.str("message");
                    if (text == null) text = "";

                    TlObject media = m.obj("media");
                    if (media != null && media.type().equals("messageMediaPhoto")) {
                        TlObject photo = media.obj("photo");
                        if (photo != null && photo.type().equals("photo")) {
                            mm.mediaType = 1;
                            mm.mediaName = getString(R.string.ec_media_photo);
                            long pid = photo.i64("id");
                            long pah = photo.i64("access_hash");
                            byte[] pref = asBytes(photo.get("file_reference"));
                            mm.location = MtpClient.photoFileLocation(pid, pah, pref, biggestPhoto(photo));
                            // 内联缩略图：选一个较小的普通尺寸
                            String tt = photoThumbType(photo);
                            if (tt != null) {
                                int[] dim = photoSizeDims(photo, tt);
                                mm.thumbLocation = MtpClient.photoFileLocation(pid, pah, pref, tt);
                                mm.thumbW = dim[0];
                                mm.thumbH = dim[1];
                                mm.thumbKey = "p" + pid + ":" + tt;
                            }
                        }
                    } else if (media != null && media.type().equals("messageMediaDocument")) {
                        TlObject doc = media.obj("document");
                        if (doc != null && doc.type().equals("document")) {
                            boolean sticker = isSticker(doc);
                            mm.mediaType = sticker ? 3 : 2;
                            mm.mediaName = getString(sticker
                                    ? R.string.ec_media_sticker : R.string.ec_media_video);
                            long did = doc.i64("id");
                            long dah = doc.i64("access_hash");
                            byte[] dref = asBytes(doc.get("file_reference"));
                            mm.location = MtpClient.documentFileLocation(did, dah, dref, "");
                            // 贴纸取最大的缩略图（老系统解不了 webp），视频优先内联字节
                            Object[] th = sticker ? stickerThumb(doc) : documentThumb(doc);
                            if (th != null) {
                                byte[] inline = (byte[]) th[0];
                                String tt = (String) th[1];
                                int tw = ((Integer) th[2]).intValue();
                                int thh = ((Integer) th[3]).intValue();
                                if (inline != null && inline.length > 0) {
                                    mm.thumbInline = inline;
                                } else if (tt != null) {
                                    mm.thumbLocation = MtpClient.documentFileLocation(did, dah, dref, tt);
                                }
                                if (tw <= 0 || thh <= 0) {
                                    int[] vd = videoDims(doc);
                                    if (vd != null) { tw = vd[0]; thh = vd[1]; }
                                }
                                mm.thumbW = tw;
                                mm.thumbH = thh;
                                mm.thumbKey = "d" + did + ":" + (tt == null ? "cached" : tt);
                            }
                        }
                    }
                    // 没有可用缩略图时，退回旧的 [图片]/[视频]/[贴纸] 文本标记
                    if (mm.mediaType != 0 && !mm.hasThumb()) {
                        String tag = mm.mediaType == 1
                                ? getString(R.string.ec_media_photo)
                                : mm.mediaType == 3
                                    ? getString(R.string.ec_media_sticker)
                                    : getString(R.string.ec_media_video);
                        text = text.length() == 0 ? tag : (tag + " " + text);
                    }
                    if (text.length() == 0 && mm.mediaType == 0) continue;
                    if (!mm.out) {
                        TlObject from = m.obj("from_id");
                        if (from != null && from.type().equals("peerUser")) {
                            String sn = unames.get(Long.valueOf(from.i64("user_id")));
                            if (sn != null && sn.length() > 0) {
                                text = text.length() == 0 ? sn : (sn + ": " + text);
                            }
                        }
                    }
                    String when = time(m.i32("date"));
                    mm.text = text.length() == 0 ? when : (text + "\n" + when);
                    out.add(mm);
                }
            }
            final int fsig = sig;
            mMain.post(new Runnable() {
                public void run() {
                    if (fsig == mLastSig) return;   // 内容没变：不重绑整个列表
                    mLastSig = fsig;
                    mAdapter.clear();
                    for (Msg m : out) mAdapter.add(m);
                    mAdapter.notifyDataSetChanged();
                    mList.setSelection(mAdapter.getCount() - 1);
                }
            });
        } catch (Throwable t) {
            // 忽略：下次轮询重试
        }
    }

    private static byte[] asBytes(Object o) {
        return (o instanceof byte[]) ? (byte[]) o : new byte[0];
    }

    /** 可下载的尺寸类型（photoSize / photoSizeProgressive）。 */
    private static boolean downloadableSize(String t) {
        return t.equals("photoSize") || t.equals("photoSizeProgressive");
    }

    /** 取最大的可下载尺寸的 type（用于下载原图）。 */
    private static String biggestPhoto(TlObject photo) {
        List<Object> sizes = photo.list("sizes");
        String best = "x";
        int bestArea = 0;
        if (sizes != null) {
            for (Object o : sizes) {
                TlObject s = (TlObject) o;
                if (!downloadableSize(s.type())) continue;
                int area = s.i32("w") * s.i32("h");
                if (area >= bestArea) {
                    bestArea = area;
                    best = s.str("type");
                }
            }
        }
        return best == null ? "x" : best;
    }

    /** 取一个适合内联显示的小尺寸 type：优先 >=100px 里最小的，否则取最大的。 */
    private static String photoThumbType(TlObject photo) {
        List<Object> sizes = photo.list("sizes");
        if (sizes == null) return null;
        String small = null;
        int smallArea = Integer.MAX_VALUE;
        String big = null;
        int bigArea = 0;
        for (Object o : sizes) {
            TlObject s = (TlObject) o;
            if (!downloadableSize(s.type())) continue;
            int area = s.i32("w") * s.i32("h");
            if (area >= 100 * 100 && area < smallArea) {
                smallArea = area;
                small = s.str("type");
            }
            if (area >= bigArea) {
                bigArea = area;
                big = s.str("type");
            }
        }
        return small != null ? small : big;
    }

    private static int[] photoSizeDims(TlObject photo, String type) {
        List<Object> sizes = photo.list("sizes");
        if (sizes != null) {
            for (Object o : sizes) {
                TlObject s = (TlObject) o;
                if (type.equals(s.str("type"))) {
                    return new int[] { s.i32("w"), s.i32("h") };
                }
            }
        }
        return new int[] { 0, 0 };
    }

    /** document 里是否带贴纸属性。 */
    private static boolean isSticker(TlObject doc) {
        List<Object> attrs = doc.list("attributes");
        if (attrs == null) return false;
        for (Object o : attrs) {
            if (((TlObject) o).type().equals("documentAttributeSticker")) return true;
        }
        return false;
    }

    /** 贴纸缩略图：取最大的可下载尺寸 {内联|null, type, w, h}（老系统解不了 webp）。 */
    private static Object[] stickerThumb(TlObject doc) {
        List<Object> thumbs = doc.list("thumbs");
        if (thumbs == null) return null;
        byte[] inline = null;
        int iw = 0, ih = 0;
        String big = null;
        int bigArea = 0, bw = 0, bh = 0;
        for (Object o : thumbs) {
            TlObject s = (TlObject) o;
            String t = s.type();
            int w = s.i32("w"), h = s.i32("h");
            if (t.equals("photoCachedSize")) {
                Object b = s.get("bytes");
                if (inline == null && b instanceof byte[] && ((byte[]) b).length > 0) {
                    inline = (byte[]) b;
                    iw = w;
                    ih = h;
                }
            } else if (downloadableSize(t)) {
                int area = w * h;
                if (area >= bigArea) {
                    bigArea = area;
                    big = s.str("type");
                    bw = w;
                    bh = h;
                }
            }
        }
        if (big != null) {
            return new Object[] { null, big, Integer.valueOf(bw), Integer.valueOf(bh) };
        }
        if (inline != null) {
            return new Object[] { inline, "cached", Integer.valueOf(iw), Integer.valueOf(ih) };
        }
        return null;
    }

    /** document 的缩略图：{内联字节|null, type|null, w, h}。 */
    private static Object[] documentThumb(TlObject doc) {
        List<Object> thumbs = doc.list("thumbs");
        if (thumbs == null) return null;
        byte[] inline = null;
        int tw = 0, th = 0;
        String small = null;
        int smallArea = Integer.MAX_VALUE;
        String big = null;
        int bigArea = 0;
        int bw = 0, bh = 0;
        for (Object o : thumbs) {
            TlObject s = (TlObject) o;
            String t = s.type();
            int w = s.i32("w"), h = s.i32("h");
            int area = w * h;
            if (t.equals("photoCachedSize")) {
                Object b = s.get("bytes");
                if (inline == null && b instanceof byte[] && ((byte[]) b).length > 0) {
                    inline = (byte[]) b;
                    tw = w;
                    th = h;
                }
            } else if (downloadableSize(t)) {
                if (area >= 100 * 100 && area < smallArea) {
                    smallArea = area;
                    small = s.str("type");
                }
                if (area >= bigArea) {
                    bigArea = area;
                    big = s.str("type");
                    bw = w;
                    bh = h;
                }
            }
        }
        if (inline != null) {
            return new Object[] { inline, "cached", Integer.valueOf(tw), Integer.valueOf(th) };
        }
        if (small != null) {
            int[] d = documentSizeDims(doc, small);
            return new Object[] { null, small, Integer.valueOf(d[0]), Integer.valueOf(d[1]) };
        }
        if (big != null) {
            return new Object[] { null, big, Integer.valueOf(bw), Integer.valueOf(bh) };
        }
        return null;
    }

    private static int[] documentSizeDims(TlObject doc, String type) {
        List<Object> thumbs = doc.list("thumbs");
        if (thumbs != null) {
            for (Object o : thumbs) {
                TlObject s = (TlObject) o;
                if (type.equals(s.str("type"))) {
                    return new int[] { s.i32("w"), s.i32("h") };
                }
            }
        }
        return new int[] { 0, 0 };
    }

    /** 视频属性里的尺寸（缩略图没有 w/h 时用）。 */
    private static int[] videoDims(TlObject doc) {
        List<Object> attrs = doc.list("attributes");
        if (attrs != null) {
            for (Object o : attrs) {
                TlObject a = (TlObject) o;
                if (a.type().equals("documentAttributeVideo")) {
                    return new int[] { a.i32("w"), a.i32("h") };
                }
            }
        }
        return null;
    }

    // 每条消息都 new SimpleDateFormat 很贵（50 条 × 每次刷新）。按线程复用。
    private static final ThreadLocal<java.text.SimpleDateFormat> TIME_FMT =
            new ThreadLocal<java.text.SimpleDateFormat>() {
                @Override
                protected java.text.SimpleDateFormat initialValue() {
                    return new java.text.SimpleDateFormat("HH:mm");
                }
            };

    private static String time(int unix) {
        if (unix <= 0) return "";
        return TIME_FMT.get().format(new java.util.Date(unix * 1000L));
    }

    private static void sleep(long ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException ignored) {
        }
    }

    private int dp(int v) {
        float d = getResources().getDisplayMetrics().density;
        return (int) (v * d + 0.5f);
    }
}
