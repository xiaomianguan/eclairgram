package cc.wuersan008.eclairgram;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cc.wuersan008.eclairgram.mtproto.MtpClient;
import cc.wuersan008.eclairgram.mtproto.TlObject;

/**
 * 会话列表（好友列表样式，复用 Talk 的头像/状态图与配色）。
 *
 * 数据来自 messages.getDialogs：每个 peerUser 会话 = 一位“好友”，
 * 最近一条消息作为状态行。
 */
public class DialogsActivity extends Activity {

    static final class Row {
        byte[] peer;
        String name;
        String status;
        int unread;
        long photoId;
        int type;          // 0 user, 1 group(chat), 2 channel
        String username;
        long id;
        int participants;
        boolean online;
        boolean isSelf;
    }

    private final Handler mMain = new Handler(Looper.getMainLooper());
    private ArrayAdapter<Row> mAdapter;
    private ListView mList;
    private TextView mEmpty;
    private TelegramManager mTg;
    private volatile boolean mLoading = false;
    private boolean mShot;

    private final TelegramManager.Listener mUpd = new TelegramManager.Listener() {
        public void onUpdate() {
            reload();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mTg = TelegramManager.get(this);
        mShot = getIntent().getBooleanExtra("shot", false);
        setContentView(R.layout.ec_dialogs);
        mList = (ListView) findViewById(R.id.ec_list);
        mEmpty = (TextView) findViewById(R.id.ec_empty);

        mAdapter = new ArrayAdapter<Row>(this, 0, new ArrayList<Row>()) {
            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                View v = convertView;
                if (v == null) {
                    v = LayoutInflater.from(DialogsActivity.this)
                            .inflate(R.layout.ec_dialog_item, parent, false);
                }
                Row r = getItem(position);
                ((TextView) v.findViewById(R.id.ec_name))
                        .setText(EmojiFont.emojify(DialogsActivity.this, r.name, dp(20)));
                String st = r.status == null ? "" : r.status;
                if (r.unread > 0) st = "(" + r.unread + ") " + st;
                ((TextView) v.findViewById(R.id.ec_status))
                        .setText(EmojiFont.emojify(DialogsActivity.this, st, dp(16)));
                ImageView avatar = (ImageView) v.findViewById(R.id.ec_avatar);
                android.graphics.Bitmap b = AvatarCache.get(r.photoId);
                if (b != null) {
                    avatar.setImageBitmap(b);
                } else {
                    avatar.setImageResource(R.drawable.ic_contact_picture);
                }
                final Row fr = r;
                avatar.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View x) {
                        openDetails(fr);
                    }
                });
                ImageView presence = (ImageView) v.findViewById(R.id.ec_presence);
                if (r.type == 0 && !r.isSelf) {
                    presence.setVisibility(View.VISIBLE);
                    presence.setImageResource(r.online
                            ? android.R.drawable.presence_online
                            : android.R.drawable.presence_offline);
                } else {
                    presence.setVisibility(View.GONE);
                }
                return v;
            }
        };
        mList.setAdapter(mAdapter);
        mList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> p, View v, int pos, long id) {
                Row r = mAdapter.getItem(pos);
                Intent i = new Intent(DialogsActivity.this, ChatActivity.class);
                i.putExtra("peer", r.peer);
                i.putExtra("name", r.name);
                i.putExtra("photoId", r.photoId);
                i.putExtra("type", r.type);
                i.putExtra("username", r.username);
                i.putExtra("id", r.id);
                i.putExtra("participants", r.participants);
                startActivity(i);
            }
        });
        reload();
    }

    @Override
    protected void onResume() {
        super.onResume();
        mTg.addListener(mUpd);
        reload();
    }

    @Override
    protected void onPause() {
        mTg.removeListener(mUpd);
        super.onPause();
    }

    private void openDetails(Row r) {
        Intent i = new Intent(this, DetailsActivity.class);
        i.putExtra("name", r.name);
        i.putExtra("photoId", r.photoId);
        i.putExtra("type", r.type);
        i.putExtra("username", r.username);
        i.putExtra("id", r.id);
        i.putExtra("participants", r.participants);
        startActivity(i);
    }

    private void reload() {
        if (mLoading) return;
        mLoading = true;
        new Thread(new Runnable() {
            public void run() {
                try {
                    final List<Row> rows = load();
                    android.util.Log.i("Eclairgram", "dialogs loaded: " + rows.size());
                    mMain.post(new Runnable() {
                        public void run() {
                            mAdapter.clear();
                            for (Row r : rows) mAdapter.add(r);
                            mAdapter.notifyDataSetChanged();
                            mEmpty.setVisibility(rows.isEmpty() ? View.VISIBLE : View.GONE);
                            if (rows.isEmpty()) mEmpty.setText(R.string.ec_no_dialogs);
                            startAvatarFetch(rows);
                            if (mShot) {
                                mMain.postDelayed(new Runnable() {
                                    public void run() {
                                        DebugShot.capture(DialogsActivity.this, "shot_dialogs.png");
                                    }
                                }, 9000);
                            }
                        }
                    });
                } catch (final Throwable t) {
                    mMain.post(new Runnable() {
                        public void run() {
                            mEmpty.setVisibility(View.VISIBLE);
                            mEmpty.setText(getString(R.string.ec_status_error,
                                    String.valueOf(t.getMessage())));
                        }
                    });
                } finally {
                    mLoading = false;
                }
            }
        }).start();
    }

    /** 后台逐个下载头像，下载到一个就刷新一次列表（不阻塞列表显示）。 */
    private void startAvatarFetch(final List<Row> rows) {
        new Thread(new Runnable() {
            public void run() {
                int n = 0;
                for (final Row r : rows) {
                    if (n >= 20) break;
                    if (r.photoId != 0 && !AvatarCache.has(r.photoId)) {
                        AvatarCache.load(mTg, r.peer, r.photoId);
                        n++;
                        mMain.post(new Runnable() {
                            public void run() {
                                mAdapter.notifyDataSetChanged();
                            }
                        });
                    }
                }
            }
        }).start();
    }

    private int dp(int v) {
        float d = getResources().getDisplayMetrics().density;
        return (int) (v * d + 0.5f);
    }

    private List<Row> load() throws Exception {
        TlObject d = TelegramManager.get(this).syncGetDialogs(40);
        List<Object> users = d.list("users");
        List<Object> messages = d.list("messages");
        List<Object> dialogs = d.list("dialogs");
        List<Object> chats = d.list("chats");

        Map<Long, String> names = new HashMap<Long, String>();
        Map<Long, Long> access = new HashMap<Long, Long>();
        Map<Long, Long> photoIds = new HashMap<Long, Long>();
        Map<Long, String> usernames = new HashMap<Long, String>();
        Map<Long, Boolean> online = new HashMap<Long, Boolean>();
        long selfId = 0;
        if (users != null) {
            for (Object o : users) {
                TlObject u = (TlObject) o;
                long id = u.i64("id");
                if (u.bool("self")) selfId = id;
                String n = u.str("first_name");
                if (n == null) n = "";
                String ln = u.str("last_name");
                if (ln != null && ln.length() > 0) n = n.length() > 0 ? n + " " + ln : ln;
                if (n.length() == 0) {
                    String un = u.str("username");
                    n = un == null ? ("User " + id) : ("@" + un);
                }
                names.put(Long.valueOf(id), n);
                access.put(Long.valueOf(id), Long.valueOf(u.i64("access_hash")));
                String un = u.str("username");
                if (un != null && un.length() > 0) {
                    usernames.put(Long.valueOf(id), un);
                }
                TlObject photo = u.obj("photo");
                if (photo != null && photo.type().equals("userProfilePhoto")) {
                    photoIds.put(Long.valueOf(id), Long.valueOf(photo.i64("photo_id")));
                }
                TlObject status = u.obj("status");
                online.put(Long.valueOf(id), Boolean.valueOf(
                        status != null && status.type().equals("userStatusOnline")));
            }
        }
        Map<Integer, String> msgText = new HashMap<Integer, String>();
        if (messages != null) {
            for (Object o : messages) {
                TlObject m = (TlObject) o;
                if (!m.type().equals("message")) continue;
                String text = m.str("message");
                if (text != null && text.length() > 0) {
                    msgText.put(Integer.valueOf(m.i32("id")), text);
                }
            }
        }
        Map<Long, String> chatNames = new HashMap<Long, String>();
        Map<Long, Long> chatAccess = new HashMap<Long, Long>();
        Map<Long, Integer> chatParts = new HashMap<Long, Integer>();
        Map<Long, Long> chatPhotos = new HashMap<Long, Long>();
        if (chats != null) {
            for (Object o : chats) {
                TlObject c = (TlObject) o;
                long id = c.i64("id");
                String title = c.str("title");
                chatNames.put(Long.valueOf(id), title == null ? "" : title);
                TlObject cp = c.obj("photo");
                if (cp != null && cp.type().equals("chatPhoto")) {
                    chatPhotos.put(Long.valueOf(id), Long.valueOf(cp.i64("photo_id")));
                }
                if (c.type().equals("channel")) {
                    chatAccess.put(Long.valueOf(id), Long.valueOf(c.i64("access_hash")));
                    chatParts.put(Long.valueOf(id), Integer.valueOf(c.i32("participants_count")));
                }
            }
        }
        List<Row> rows = new ArrayList<Row>();
        if (dialogs != null) {
            for (Object o : dialogs) {
                TlObject dg = (TlObject) o;
                TlObject peer = dg.obj("peer");
                if (peer == null) continue;
                Row r = new Row();
                String t = peer.type();
                if (t.equals("peerUser")) {
                    long uid = peer.i64("user_id");
                    Long ah = access.get(Long.valueOf(uid));
                    r.peer = MtpClient.inputPeerUser(uid, ah == null ? 0L : ah.longValue());
                    r.name = names.get(Long.valueOf(uid));
                    Long pid = photoIds.get(Long.valueOf(uid));
                    r.photoId = pid == null ? 0L : pid.longValue();
                    r.type = 0;
                    r.id = uid;
                    r.username = usernames.get(Long.valueOf(uid));
                    Boolean on = online.get(Long.valueOf(uid));
                    r.online = on != null && on.booleanValue();
                    if (uid == selfId) {
                        r.isSelf = true;
                        r.name = getString(R.string.ec_saved_messages);
                    }
                } else if (t.equals("peerChat")) {
                    long cid = peer.i64("chat_id");
                    r.peer = MtpClient.inputPeerChat(cid);
                    r.name = chatNames.get(Long.valueOf(cid));
                    r.type = 1;
                    r.id = cid;
                    Long cp = chatPhotos.get(Long.valueOf(cid));
                    r.photoId = cp == null ? 0L : cp.longValue();
                } else if (t.equals("peerChannel")) {
                    long cid = peer.i64("channel_id");
                    Long ah = chatAccess.get(Long.valueOf(cid));
                    r.peer = MtpClient.inputPeerChannel(cid, ah == null ? 0L : ah.longValue());
                    r.name = chatNames.get(Long.valueOf(cid));
                    r.type = 2;
                    r.id = cid;
                    Integer pc = chatParts.get(Long.valueOf(cid));
                    r.participants = pc == null ? 0 : pc.intValue();
                    Long cp = chatPhotos.get(Long.valueOf(cid));
                    r.photoId = cp == null ? 0L : cp.longValue();
                } else {
                    continue;
                }
                if (r.name == null || r.name.trim().length() == 0) r.name = "Chat";
                r.status = msgText.get(Integer.valueOf(dg.i32("top_message")));
                r.unread = dg.i32("unread_count");
                rows.add(r);
            }
        }
        return rows;
    }
}
