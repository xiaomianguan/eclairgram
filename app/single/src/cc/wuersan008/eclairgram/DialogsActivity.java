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

import cc.wuersan008.eclairgram.mtproto.TlObject;

/**
 * 会话列表（好友列表样式，复用 Talk 的头像/状态图与配色）。
 *
 * 数据来自 messages.getDialogs：每个 peerUser 会话 = 一位“好友”，
 * 最近一条消息作为状态行。
 */
public class DialogsActivity extends Activity {

    static final class Row {
        long uid;
        long accessHash;
        String name;
        String status;
    }

    private final Handler mMain = new Handler(Looper.getMainLooper());
    private ArrayAdapter<Row> mAdapter;
    private ListView mList;
    private TextView mEmpty;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
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
                ((TextView) v.findViewById(R.id.ec_name)).setText(r.name);
                ((TextView) v.findViewById(R.id.ec_status))
                        .setText(r.status == null ? "" : r.status);
                ((ImageView) v.findViewById(R.id.ec_avatar))
                        .setImageResource(R.drawable.ic_contact_picture);
                ((ImageView) v.findViewById(R.id.ec_presence))
                        .setImageResource(R.drawable.status_chat);
                return v;
            }
        };
        mList.setAdapter(mAdapter);
        mList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> p, View v, int pos, long id) {
                Row r = mAdapter.getItem(pos);
                Intent i = new Intent(DialogsActivity.this, ChatActivity.class);
                i.putExtra("uid", r.uid);
                i.putExtra("accessHash", r.accessHash);
                i.putExtra("name", r.name);
                startActivity(i);
            }
        });
        reload();
    }

    @Override
    protected void onResume() {
        super.onResume();
        reload();
    }

    private void reload() {
        new Thread(new Runnable() {
            public void run() {
                try {
                    final List<Row> rows = load();
                    mMain.post(new Runnable() {
                        public void run() {
                            mAdapter.clear();
                            for (Row r : rows) mAdapter.add(r);
                            mAdapter.notifyDataSetChanged();
                            mEmpty.setVisibility(rows.isEmpty() ? View.VISIBLE : View.GONE);
                            if (rows.isEmpty()) mEmpty.setText(R.string.ec_no_dialogs);
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
                }
            }
        }).start();
    }

    private List<Row> load() throws Exception {
        TlObject d = TelegramManager.get(this).syncGetDialogs(40);
        List<Object> users = d.list("users");
        List<Object> messages = d.list("messages");
        List<Object> dialogs = d.list("dialogs");

        Map<Long, String> names = new HashMap<Long, String>();
        Map<Long, Long> access = new HashMap<Long, Long>();
        if (users != null) {
            for (Object o : users) {
                TlObject u = (TlObject) o;
                long id = u.i64("id");
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
        List<Row> rows = new ArrayList<Row>();
        if (dialogs != null) {
            for (Object o : dialogs) {
                TlObject dg = (TlObject) o;
                TlObject peer = dg.obj("peer");
                if (peer == null || !peer.type().equals("peerUser")) continue;
                long uid = peer.i64("user_id");
                Row r = new Row();
                r.uid = uid;
                Long ah = access.get(Long.valueOf(uid));
                r.accessHash = ah == null ? 0L : ah.longValue();
                String nm = names.get(Long.valueOf(uid));
                if (nm == null || nm.trim().length() == 0) nm = "User " + uid;
                r.name = nm;
                r.status = msgText.get(Integer.valueOf(dg.i32("top_message")));
                rows.add(r);
            }
        }
        return rows;
    }
}
