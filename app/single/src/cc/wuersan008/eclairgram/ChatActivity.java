package cc.wuersan008.eclairgram;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
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
import android.widget.ImageButton;
import android.widget.ImageView;
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
public class ChatActivity extends Activity {

    static final class Msg {
        boolean out;
        String text;
        int mediaType;        // 0 无, 1 图片, 2 视频
        byte[] location;      // InputFileLocation（可下载）
        String mediaName;
    }

    private static final int REQ_PICK = 1;

    private byte[] mPeer;
    private String mName;
    private long mPhotoId;
    private int mType;
    private String mUsername;
    private long mId;
    private int mParticipants;

    private final Handler mMain = new Handler(Looper.getMainLooper());
    private ArrayAdapter<Msg> mAdapter;
    private ListView mList;
    private EditText mInput;
    private volatile boolean mRunning = true;

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

        requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        setContentView(R.layout.ec_chat);
        ((TextView) findViewById(R.id.ec_chat_title)).setText(mName);
        ((TextView) findViewById(R.id.ec_chat_subtitle)).setText(typeLabel(mType));

        ImageView headerAvatar = (ImageView) findViewById(R.id.ec_header_avatar);
        android.graphics.Bitmap b = AvatarCache.get(mPhotoId);
        if (b != null) headerAvatar.setImageBitmap(b);
        else headerAvatar.setImageResource(R.drawable.ic_contact_picture);
        headerAvatar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                openDetails();
            }
        });
        ((ImageView) findViewById(R.id.ec_header_presence))
                .setImageResource(android.R.drawable.presence_online);
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
                View row = v.findViewById(R.id.ec_msg_row);
                TextView t = (TextView) v.findViewById(R.id.ec_msg_text);
                t.setText(m.text);
                if (m.out) {
                    ((android.widget.LinearLayout) row).setGravity(Gravity.RIGHT);
                    t.setBackgroundResource(R.drawable.im_bubble_highlight);
                    t.setTextColor(getResources().getColor(R.color.chat_me));
                } else {
                    ((android.widget.LinearLayout) row).setGravity(Gravity.LEFT);
                    t.setBackgroundResource(R.drawable.im_bubble_normal);
                    t.setTextColor(getResources().getColor(R.color.chat_from));
                }
                if (m.mediaType != 0) {
                    t.setOnClickListener(new View.OnClickListener() {
                        public void onClick(View x) {
                            openMedia(m);
                        }
                    });
                } else {
                    t.setOnClickListener(null);
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

        new Thread(new Runnable() {
            public void run() {
                while (mRunning) {
                    refresh();
                    sleep(4000);
                }
            }
        }).start();
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
    private void onAttach() {
        new AlertDialog.Builder(this)
                .setItems(new CharSequence[] {
                        getString(R.string.ec_attach_photo),
                        getString(R.string.ec_attach_video) },
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface d, int which) {
                                Intent i = new Intent(Intent.ACTION_GET_CONTENT);
                                i.setType(which == 1 ? "video/*" : "image/*");
                                i.addCategory(Intent.CATEGORY_OPENABLE);
                                try {
                                    startActivityForResult(i, REQ_PICK);
                                } catch (Throwable t) {
                                    toast(String.valueOf(t.getMessage()));
                                }
                            }
                        }).show();
    }

    @Override
    protected void onActivityResult(int req, int res, Intent data) {
        super.onActivityResult(req, res, data);
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
            if (msgs != null) {
                List<Object> ordered = new ArrayList<Object>(msgs);
                Collections.reverse(ordered);
                for (Object o : ordered) {
                    TlObject m = (TlObject) o;
                    if (!m.type().equals("message")) continue;
                    Msg mm = new Msg();
                    mm.out = m.bool("out");
                    String text = m.str("message");
                    if (text == null) text = "";

                    TlObject media = m.obj("media");
                    if (media != null && media.type().equals("messageMediaPhoto")) {
                        TlObject photo = media.obj("photo");
                        if (photo != null && photo.type().equals("photo")) {
                            mm.mediaType = 1;
                            mm.mediaName = getString(R.string.ec_media_photo);
                            mm.location = MtpClient.photoFileLocation(
                                    photo.i64("id"), photo.i64("access_hash"),
                                    asBytes(photo.get("file_reference")), biggestPhoto(photo));
                        }
                    } else if (media != null && media.type().equals("messageMediaDocument")) {
                        TlObject doc = media.obj("document");
                        if (doc != null && doc.type().equals("document")) {
                            mm.mediaType = 2;
                            mm.mediaName = getString(R.string.ec_media_video);
                            mm.location = MtpClient.documentFileLocation(
                                    doc.i64("id"), doc.i64("access_hash"),
                                    asBytes(doc.get("file_reference")), "");
                        }
                    }
                    if (mm.mediaType != 0) {
                        String tag = mm.mediaType == 1
                                ? getString(R.string.ec_media_photo)
                                : getString(R.string.ec_media_video);
                        text = text.length() == 0 ? tag : (tag + " " + text);
                    }
                    if (text.length() == 0) continue;
                    if (!mm.out) {
                        TlObject from = m.obj("from_id");
                        if (from != null && from.type().equals("peerUser")) {
                            String sn = unames.get(Long.valueOf(from.i64("user_id")));
                            if (sn != null && sn.length() > 0) text = sn + ": " + text;
                        }
                    }
                    mm.text = text + "\n" + time(m.i32("date"));
                    out.add(mm);
                }
            }
            mMain.post(new Runnable() {
                public void run() {
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

    /** 取最大的 PhotoSize 的 type（用于下载原图）。 */
    private static String biggestPhoto(TlObject photo) {
        List<Object> sizes = photo.list("sizes");
        String best = "x";
        int bestArea = 0;
        if (sizes != null) {
            for (Object o : sizes) {
                TlObject s = (TlObject) o;
                if (!s.type().equals("photoSize")) continue;
                int area = s.i32("w") * s.i32("h");
                if (area >= bestArea) {
                    bestArea = area;
                    best = s.str("type");
                }
            }
        }
        return best == null ? "x" : best;
    }

    private static String time(int unix) {
        if (unix <= 0) return "";
        java.text.SimpleDateFormat f = new java.text.SimpleDateFormat("HH:mm");
        return f.format(new java.util.Date(unix * 1000L));
    }

    private static void sleep(long ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException ignored) {
        }
    }
}
