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

    private long mUid;
    private long mAccessHash;
    private String mName;

    private final Handler mMain = new Handler(Looper.getMainLooper());
    private ArrayAdapter<Msg> mAdapter;
    private ListView mList;
    private EditText mInput;
    private volatile boolean mRunning = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mUid = getIntent().getLongExtra("uid", 0);
        mAccessHash = getIntent().getLongExtra("accessHash", 0);
        mName = getIntent().getStringExtra("name");
        if (mName == null) mName = "";

        setContentView(R.layout.ec_chat);
        ((TextView) findViewById(R.id.ec_chat_title)).setText(mName);
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

    private void onSend() {
        final String text = mInput.getText().toString().trim();
        if (text.length() == 0) return;
        mInput.setText("");
        new Thread(new Runnable() {
            public void run() {
                try {
                    TelegramManager.get(ChatActivity.this)
                            .syncSendMessage(mUid, mAccessHash, text);
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
                    .syncGetHistory(mUid, mAccessHash, 50);
            List<Object> msgs = hist.list("messages");
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
                    mm.text = text;
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

    private static void sleep(long ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException ignored) {
        }
    }
}
