package cc.wuersan008.eclairgram;

import android.app.Activity;
import android.content.Context;
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
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import cc.wuersan008.eclairgram.mtproto.TlObject;

/**
 * 聊天界面（复用 Talk 的聊天气泡 im_bubble_* 与 chat_from/chat_me 配色）。
 *
 * 历史来自 messages.getHistory，发送走 messages.sendMessage；
 * 每几秒轮询一次以显示对方的新消息。
 */
public class ChatActivity extends Activity {

    static final class Msg {
        boolean out;
        String text;
    }

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

        mAdapter = new ArrayAdapter<Msg>(this, 0, new ArrayList<Msg>()) {
            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                View v = convertView;
                if (v == null) {
                    v = LayoutInflater.from(ChatActivity.this)
                            .inflate(R.layout.ec_message_item, parent, false);
                }
                Msg m = getItem(position);
                View row = v.findViewById(R.id.ec_msg_row);
                TextView t = (TextView) v.findViewById(R.id.ec_msg_text);
                t.setText(m.text);
                if (m.out) {
                    ((android.widget.LinearLayout) row)
                            .setGravity(Gravity.RIGHT);
                    t.setBackgroundResource(R.drawable.im_bubble_highlight);
                    t.setTextColor(getResources().getColor(R.color.chat_me));
                } else {
                    ((android.widget.LinearLayout) row)
                            .setGravity(Gravity.LEFT);
                    t.setBackgroundResource(R.drawable.im_bubble_normal);
                    t.setTextColor(getResources().getColor(R.color.chat_from));
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
        android.content.Intent i = new android.content.Intent(this, DetailsActivity.class);
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
                    TelegramManager.get(ChatActivity.this)
                            .syncSendMessage(mPeer, text);
                } catch (final Throwable t) {
                    mMain.post(new Runnable() {
                        public void run() {
                            android.widget.Toast.makeText(ChatActivity.this,
                                    getString(R.string.ec_send_failed,
                                            String.valueOf(t.getMessage())),
                                    android.widget.Toast.LENGTH_SHORT).show();
                        }
                    });
                }
                refresh();
            }
        }).start();
    }

    private void refresh() {
        try {
            TlObject hist = TelegramManager.get(this)
                    .syncGetHistory(mPeer, 50);
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
                    String text = m.str("message");
                    if (text == null || text.length() == 0) continue;
                    Msg mm = new Msg();
                    mm.out = m.bool("out");
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
