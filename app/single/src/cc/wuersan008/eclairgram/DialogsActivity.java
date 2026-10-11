package cc.wuersan008.eclairgram;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TabHost;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import cc.wuersan008.eclairgram.mtproto.MtpClient;
import cc.wuersan008.eclairgram.mtproto.TlObject;

/**
 * 会话列表（好友列表样式，复用 Talk 的头像/状态图与配色）。
 *
 * 数据来自 messages.getDialogs：每个 peerUser 会话 = 一位“好友”，
 * 最近一条消息作为状态行。
 */
public class DialogsActivity extends BaseActivity {

    // 系统菜单（菜单键）里的条目
    private static final int MENU_PROFILE = 1;
    private static final int MENU_SEARCH = 2;
    private static final int MENU_SETTINGS = 3;
    private static final int MENU_LOGOUT = 4;

    static final class Row {
        byte[] peer;
        String name;
        String status;
        int unread;
        long photoId;
        int photoDc;       // 头像所在的文件 DC（0 = 未知）
        int type;          // 0 user, 1 group(chat), 2 channel
        String username;
        long id;
        int participants;
        boolean online;
        boolean isSelf;
        // 会话文件夹筛选所需的标记
        boolean isContact;   // 联系人（用户）
        boolean isBot;       // 机器人（用户）
        boolean isMuted;     // 已静音
        boolean isRead;      // 已读（无未读）
    }

    /**
     * 会话文件夹（Telegram dialog filter）。id=0 是“全部”。
     *
     * 注意：messages.getDialogs 的 folder_id 只用于“归档”（peer folder，仅 0/1），
     * 自定义文件夹必须由客户端按这里的条件自己筛选，服务端没有按文件夹取会话的接口。
     */
    static final class Filter {
        int id;                       // 过滤器 id（只用来区分标签）
        String title;
        boolean contacts, nonContacts, groups, broadcasts, bots;
        boolean excludeMuted, excludeRead, excludeArchived;
        final Set<Long> pinned = new HashSet<Long>();
        final Set<Long> include = new HashSet<Long>();
        final Set<Long> exclude = new HashSet<Long>();
    }

    private final Handler mMain = new Handler(Looper.getMainLooper());
    private ArrayAdapter<Row> mAdapter;
    private ListView mList;
    private TextView mEmpty;
    private TextView mTitle;
    private TabHost mTabHost;
    private View mContent;
    private TelegramManager mTg;
    private volatile boolean mLoading = false;
    private boolean mShot;
    private volatile boolean mFetchAvatars = true;
    private int mFolderId = 0;                       // 当前文件夹（Filter.id）
    private final Set<Integer> mAddedFolders = new HashSet<Integer>();
    private boolean mFoldersLoaded = false;
    private volatile List<Filter> mFilterList;       // 文件夹缓存（含筛选条件）
    private final Object mFilterLock = new Object();

    private final List<Row> mAllRows = new ArrayList<Row>();   // 未过滤的完整列表
    private View mSearchBar;
    private EditText mSearchInput;
    private boolean mSearchMode = false;

    // 复用一个点击监听，避免每次绑定行都 new 一个匿名类
    private final View.OnClickListener mAvatarClick = new View.OnClickListener() {
        public void onClick(View x) {
            Object o = x.getTag();
            if (o instanceof Row) openDetails((Row) o);
        }
    };

    private final TelegramManager.Listener mUpd = new TelegramManager.Listener() {
        public void onUpdate() {
            reload();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);   // 顶栏交给标题栏/标签栏
        mTg = TelegramManager.get(this);
        mShot = getIntent().getBooleanExtra("shot", false);
        setContentView(R.layout.ec_dialogs);
        mList = (ListView) findViewById(R.id.ec_list);
        mEmpty = (TextView) findViewById(R.id.ec_empty);
        mTitle = (TextView) findViewById(R.id.ec_title);
        mContent = findViewById(R.id.ec_tabcontent);
        setupTabs();

        mSearchBar = findViewById(R.id.ec_search_bar);
        mSearchInput = (EditText) findViewById(R.id.ec_search_input);
        mSearchInput.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int a, int b, int c) {}
            public void onTextChanged(CharSequence s, int a, int b, int c) {
                applyFilter(s.toString());
            }
            public void afterTextChanged(Editable s) {}
        });

        mAdapter = new ArrayAdapter<Row>(this, 0, new ArrayList<Row>()) {
            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                View v = convertView;
                if (v == null) {
                    v = LayoutInflater.from(DialogsActivity.this)
                            .inflate(R.layout.ec_dialog_item, parent, false);
                }
                Row r = getItem(position);
                // 置顶的“收藏夹/我的资料”按原版 Talk 的自我状态行处理：整行铺背景，
                // 按下/选中交给系统列表高亮（ec_item_bg_self）；其它行仍用气泡背景。
                View bubble = v.findViewById(R.id.ec_item_bubble);
                if (r.isSelf) {
                    v.setBackgroundResource(R.drawable.ec_item_bg_self);
                    bubble.setBackgroundDrawable(null);
                } else {
                    v.setBackgroundDrawable(null);
                    bubble.setBackgroundResource(R.drawable.ec_item_bg);
                }
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
                avatar.setTag(r);
                avatar.setOnClickListener(mAvatarClick);
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
                i.putExtra("online", r.online);
                i.putExtra("self", r.isSelf);
                startActivity(i);
            }
        });
        mList.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            public boolean onItemLongClick(AdapterView<?> p, View v, int pos, long id) {
                openDetails(mAdapter.getItem(pos));
                return true;
            }
        });
        loadFolders();
        reload();
    }

    /** 建立 TabHost：先放一个“全部”标签让内容可见；有文件夹时再加标签并显示标签栏。 */
    private void setupTabs() {
        mTabHost = (TabHost) findViewById(android.R.id.tabhost);
        mTabHost.setup();
        addTab(0, getString(R.string.ec_folder_all));
        mTabHost.setOnTabChangedListener(new TabHost.OnTabChangeListener() {
            public void onTabChanged(String tag) {
                int id = parseFolderId(tag);
                if (id == mFolderId) return;
                mFolderId = id;
                reload();
            }
        });
    }

    private void addTab(int id, String title) {
        if (!mAddedFolders.add(Integer.valueOf(id))) return;
        TabHost.TabSpec ts = mTabHost.newTabSpec("f" + id);
        ts.setIndicator(EmojiFont.emojify(this, title, dp(16)));
        ts.setContent(R.id.ec_tabcontent);
        mTabHost.addTab(ts);
    }

    /** 消息是不是一张贴纸。 */
    private static boolean isStickerMessage(TlObject m) {
        TlObject media = m.obj("media");
        if (media == null || !media.type().equals("messageMediaDocument")) return false;
        TlObject doc = media.obj("document");
        if (doc == null) return false;
        java.util.List<Object> attrs = doc.list("attributes");
        if (attrs == null) return false;
        for (Object o : attrs) {
            if (((TlObject) o).type().equals("documentAttributeSticker")) return true;
        }
        return false;
    }

    private static int parseFolderId(String tag) {
        try {
            return Integer.parseInt(tag.substring(1));
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * 拉取账号的会话文件夹（含筛选条件），结果缓存。可在后台线程调用。
     *
     * messages.getDialogs 的 folder_id 只支持归档（peer folder，0/1），自定义文件夹
     * 得由客户端按这些条件自己筛，所以这里把条件也一起解析出来。
     */
    private List<Filter> filters() {
        List<Filter> cached = mFilterList;
        if (cached != null) return cached;
        synchronized (mFilterLock) {
            cached = mFilterList;
            if (cached != null) return cached;
            List<Filter> out = new ArrayList<Filter>();
            try {
                TlObject res = mTg.syncGetDialogFilters();
                List<Object> filters = res.list("filters");
                if (filters != null) {
                    for (Object o : filters) {
                        TlObject f = (TlObject) o;
                        String t = f.type();
                        Filter fo = new Filter();
                        if (t.equals("dialogFilterDefault")) {
                            fo.id = 0;
                            fo.title = getString(R.string.ec_folder_all);
                        } else if (t.equals("dialogFilter")
                                || t.equals("dialogFilterChatlist")) {
                            fo.id = f.i32("id");
                            fo.title = filterTitle(f);
                            fo.contacts = f.bool("contacts");
                            fo.nonContacts = f.bool("non_contacts");
                            fo.groups = f.bool("groups");
                            fo.broadcasts = f.bool("broadcasts");
                            fo.bots = f.bool("bots");
                            fo.excludeMuted = f.bool("exclude_muted");
                            fo.excludeRead = f.bool("exclude_read");
                            fo.excludeArchived = f.bool("exclude_archived");
                            addPeers(fo.pinned, f.list("pinned_peers"));
                            addPeers(fo.include, f.list("include_peers"));
                            addPeers(fo.exclude, f.list("exclude_peers"));
                        } else {
                            continue;
                        }
                        out.add(fo);
                    }
                }
            } catch (Throwable t) {
                // 取不到文件夹就当作没有，退回标题栏
            }
            mFilterList = out;
            return out;
        }
    }

    /** 把 InputPeer 列表里的原始 id 收进集合（按 id 匹配会话）。 */
    private static void addPeers(Set<Long> dst, List<Object> peers) {
        if (peers == null) return;
        for (Object o : peers) {
            TlObject p = (TlObject) o;
            long id = p.get("user_id") != null ? p.i64("user_id")
                    : p.get("channel_id") != null ? p.i64("channel_id")
                    : p.get("chat_id") != null ? p.i64("chat_id") : 0L;
            if (id != 0) dst.add(Long.valueOf(id));
        }
    }

    /** 某条会话是否属于某个文件夹（客户端筛选）。 */
    private static boolean matches(Filter f, Row r) {
        if (r.isSelf) return false;   // “收藏夹”只出现在“全部”里
        Long pid = Long.valueOf(r.id);
        if (f.exclude.contains(pid)) return false;
        if (f.pinned.contains(pid) || f.include.contains(pid)) return true;
        boolean cat;
        if (r.type == 0) {
            if (r.isBot) cat = f.bots;
            else if (r.isContact) cat = f.contacts;
            else cat = f.nonContacts;
        } else if (r.type == 1) {
            cat = f.groups;
        } else {
            cat = f.broadcasts;
        }
        if (!cat) return false;
        if (f.excludeMuted && r.isMuted) return false;
        if (f.excludeRead && r.isRead) return false;
        return true;
    }

    /** 拉取文件夹后建立标签栏（有自定义文件夹时把标题栏换成标签栏）。 */
    private void loadFolders() {
        if (mFoldersLoaded) return;
        mFoldersLoaded = true;
        new Thread(new Runnable() {
            public void run() {
                final List<Filter> folders = filters();
                mMain.post(new Runnable() {
                    public void run() {
                        applyFolders(folders);
                    }
                });
            }
        }).start();
    }

    private void applyFolders(List<Filter> folders) {
        int custom = 0;
        for (Filter f : folders) {
            if (f.id == 0 || mAddedFolders.contains(Integer.valueOf(f.id))) continue;
            addTab(f.id, f.title);
            custom++;
        }
        if (custom > 0) {
            mTabHost.getTabWidget().setVisibility(View.VISIBLE);
            mTitle.setVisibility(View.GONE);
        }
        // 所有标签共用同一份内容视图；addTab 会把它的可见性置为 GONE，这里恢复显示
        if (mContent != null) mContent.setVisibility(View.VISIBLE);
    }

    private String filterTitle(TlObject f) {
        String title = null;
        Object t = f.get("title");
        if (t instanceof String) {
            title = (String) t;
        } else if (t instanceof TlObject) {
            title = ((TlObject) t).str("text");
        }
        if (title == null || title.trim().length() == 0) {
            title = getString(R.string.ec_dialogs_title);
        }
        String emo = f.str("emoticon");
        if (emo != null && emo.length() > 0) title = emo + " " + title;
        return title;
    }

    @Override
    protected void onResume() {
        super.onResume();
        mFetchAvatars = true;
        Notifications.clearAll(this);
        mTg.addListener(mUpd);
        reload();
    }

    @Override
    protected void onPause() {
        mFetchAvatars = false;
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
        i.putExtra("self", r.isSelf);
        i.putExtra("peer", r.peer);
        startActivity(i);
    }

    private void reload() {
        if (mLoading) return;
        mLoading = true;
        new Thread(new Runnable() {
            public void run() {
                try {
                    final List<Row> rows = load(mFolderId);
                    android.util.Log.i("Eclairgram", "dialogs loaded: " + rows.size()
                            + " folder=" + mFolderId);
                    mMain.post(new Runnable() {
                        public void run() {
                            mAllRows.clear();
                            mAllRows.addAll(rows);
                            applyFilter(mSearchMode ? mSearchInput.getText().toString() : "");
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
                            mAllRows.clear();
                            mAdapter.clear();
                            mAdapter.notifyDataSetChanged();
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

    /** 后台并发下载头像（先内存/磁盘缓存，缺了才联网），下载到一个就刷新一次列表。
     *  共享一个固定线程池，避免每次 reload 都新建/销毁线程。 */
    private static final java.util.concurrent.ExecutorService AVATAR_POOL =
            java.util.concurrent.Executors.newFixedThreadPool(3);

    private void startAvatarFetch(final List<Row> rows) {
        for (final Row r : rows) {
            if (r.photoId == 0 || AvatarCache.has(r.photoId)) continue;
            AVATAR_POOL.execute(new Runnable() {
                public void run() {
                    if (!mFetchAvatars) return;
                    AvatarCache.load(DialogsActivity.this, mTg, r.peer, r.photoId, r.photoDc);
                    mMain.post(new Runnable() {
                        public void run() {
                            mAdapter.notifyDataSetChanged();
                        }
                    });
                }
            });
        }
    }

    // ============================================================ 菜单 / 搜索
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        menu.add(0, MENU_PROFILE, 0, R.string.ec_my_profile)
                .setIcon(android.R.drawable.ic_menu_myplaces);
        menu.add(0, MENU_SEARCH, 1, R.string.ec_search)
                .setIcon(android.R.drawable.ic_menu_search);
        menu.add(0, MENU_SETTINGS, 2, R.string.ec_settings)
                .setIcon(android.R.drawable.ic_menu_preferences);
        menu.add(0, MENU_LOGOUT, 3, R.string.ec_sign_out)
                .setIcon(android.R.drawable.ic_lock_power_off);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case MENU_PROFILE:
                openMyProfile();
                return true;
            case MENU_SEARCH:
                showSearch();
                return true;
            case MENU_SETTINGS:
                startActivity(new Intent(this, SettingsActivity.class));
                return true;
            case MENU_LOGOUT:
                confirmLogout();
                return true;
        }
        return super.onOptionsItemSelected(item);
    }

    /** “我的资料”：打开自己的资料页（详情页的 self 模式）。 */
    private void openMyProfile() {
        Intent i = new Intent(this, DetailsActivity.class);
        i.putExtra("self", true);
        startActivity(i);
    }

    /** 退出登录：确认后清掉会话并回到登录页。 */
    private void confirmLogout() {
        new AlertDialog.Builder(this)
                .setTitle(R.string.ec_sign_out)
                .setMessage(R.string.ec_logout_confirm)
                .setPositiveButton(R.string.ec_sign_out, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface d, int w) {
                        mTg.logout();
                        Notifications.clearAll(DialogsActivity.this);
                        Intent i = new Intent(DialogsActivity.this, MainActivity.class);
                        i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
                        startActivity(i);
                        finish();
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    /** 进入搜索模式：顶部出现搜索框，输入时按会话名过滤列表。 */
    private void showSearch() {
        if (mSearchMode) {
            mSearchInput.requestFocus();
            return;
        }
        mSearchMode = true;
        mSearchBar.setVisibility(View.VISIBLE);
        mSearchInput.setText("");
        mSearchInput.requestFocus();
        mSearchInput.post(new Runnable() {
            public void run() {
                InputMethodManager imm = (InputMethodManager)
                        getSystemService(Context.INPUT_METHOD_SERVICE);
                if (imm != null) {
                    imm.showSoftInput(mSearchInput, InputMethodManager.SHOW_IMPLICIT);
                }
            }
        });
    }

    private void hideSearch() {
        if (!mSearchMode) return;
        mSearchMode = false;
        mSearchBar.setVisibility(View.GONE);
        InputMethodManager imm = (InputMethodManager)
                getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null) {
            imm.hideSoftInputFromWindow(mSearchInput.getWindowToken(), 0);
        }
        mSearchInput.setText("");
        applyFilter("");
    }

    /** 用搜索关键字过滤会话列表（按会话标题，忽略大小写）。 */
    private void applyFilter(String query) {
        String q = query == null ? "" : query.trim().toLowerCase();
        mAdapter.clear();
        for (Row r : mAllRows) {
            String name = r.name == null ? "" : r.name;
            if (q.length() == 0 || name.toLowerCase().contains(q)) {
                mAdapter.add(r);
            }
        }
        mAdapter.notifyDataSetChanged();
        boolean empty = mAdapter.getCount() == 0;
        mEmpty.setVisibility(empty ? View.VISIBLE : View.GONE);
        if (empty) {
            mEmpty.setText(mSearchMode ? R.string.ec_search_no_results : R.string.ec_no_dialogs);
        }
    }

    /** 系统搜索键（部分老机型自带）也进入搜索模式。 */
    @Override
    public boolean onSearchRequested() {
        showSearch();
        return true;
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_SEARCH) {
            showSearch();
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public void onBackPressed() {
        if (mSearchMode) {
            hideSearch();
            return;
        }
        super.onBackPressed();
    }

    private int dp(int v) {
        float d = getResources().getDisplayMetrics().density;
        return (int) (v * d + 0.5f);
    }

    private List<Row> load(int folderId) throws Exception {
        // 始终取“全部”：getDialogs 的 folder_id 只支持归档(1)，
        // 自定义文件夹在本地按 Filter 的条件筛选（见 matches()）。
        TlObject d = TelegramManager.get(this).syncGetDialogs(40, 0);
        List<Object> users = d.list("users");
        List<Object> messages = d.list("messages");
        List<Object> dialogs = d.list("dialogs");
        List<Object> chats = d.list("chats");

        Map<Long, String> names = new HashMap<Long, String>();
        Map<Long, Long> access = new HashMap<Long, Long>();
        Map<Long, Long> photoIds = new HashMap<Long, Long>();
        Map<Long, Integer> photoDcs = new HashMap<Long, Integer>();
        Map<Long, String> usernames = new HashMap<Long, String>();
        Map<Long, Boolean> online = new HashMap<Long, Boolean>();
        Set<Long> contacts = new HashSet<Long>();
        Set<Long> bots = new HashSet<Long>();
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
                    photoDcs.put(Long.valueOf(id), Integer.valueOf(photo.i32("dc_id")));
                }
                TlObject status = u.obj("status");
                online.put(Long.valueOf(id), Boolean.valueOf(
                        status != null && status.type().equals("userStatusOnline")));
                if (u.bool("contact") || u.bool("mutual_contact")) {
                    contacts.add(Long.valueOf(id));
                }
                if (u.bool("bot")) bots.add(Long.valueOf(id));
            }
        }
        Map<Integer, String> msgText = new HashMap<Integer, String>();
        if (messages != null) {
            for (Object o : messages) {
                TlObject m = (TlObject) o;
                if (!m.type().equals("message")) continue;
                String text = m.str("message");
                if (text == null) text = "";
                if (text.length() == 0 && isStickerMessage(m)) {
                    text = getString(R.string.ec_media_sticker);
                }
                if (text.length() > 0) {
                    msgText.put(Integer.valueOf(m.i32("id")), text);
                }
            }
        }
        Map<Long, String> chatNames = new HashMap<Long, String>();
        Map<Long, Long> chatAccess = new HashMap<Long, Long>();
        Map<Long, Integer> chatParts = new HashMap<Long, Integer>();
        Map<Long, Long> chatPhotos = new HashMap<Long, Long>();
        Map<Long, Integer> chatPhotoDcs = new HashMap<Long, Integer>();
        Set<Long> megagroups = new HashSet<Long>();
        if (chats != null) {
            for (Object o : chats) {
                TlObject c = (TlObject) o;
                long id = c.i64("id");
                String title = c.str("title");
                chatNames.put(Long.valueOf(id), title == null ? "" : title);
                TlObject cp = c.obj("photo");
                if (cp != null && cp.type().equals("chatPhoto")) {
                    chatPhotos.put(Long.valueOf(id), Long.valueOf(cp.i64("photo_id")));
                    chatPhotoDcs.put(Long.valueOf(id), Integer.valueOf(cp.i32("dc_id")));
                }
                if (c.type().equals("channel")) {
                    chatAccess.put(Long.valueOf(id), Long.valueOf(c.i64("access_hash")));
                    chatParts.put(Long.valueOf(id), Integer.valueOf(c.i32("participants_count")));
                    // megagroup / gigagroup 是“超级群”，属于群组而不是广播频道
                    if (c.bool("megagroup") || c.bool("gigagroup")) {
                        megagroups.add(Long.valueOf(id));
                    }
                }
            }
        }
        Filter filter = null;
        if (folderId != 0) {
            for (Filter f : filters()) {
                if (f.id == folderId) { filter = f; break; }
            }
        }
        long now = System.currentTimeMillis() / 1000L;
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
                    Integer pdc = photoDcs.get(Long.valueOf(uid));
                    r.photoDc = pdc == null ? 0 : pdc.intValue();
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
                    Integer pdc = chatPhotoDcs.get(Long.valueOf(cid));
                    r.photoDc = pdc == null ? 0 : pdc.intValue();
                } else if (t.equals("peerChannel")) {
                    long cid = peer.i64("channel_id");
                    Long ah = chatAccess.get(Long.valueOf(cid));
                    r.peer = MtpClient.inputPeerChannel(cid, ah == null ? 0L : ah.longValue());
                    r.name = chatNames.get(Long.valueOf(cid));
                    // 超级群（megagroup/gigagroup）显示为群组，其余才是广播频道
                    r.type = megagroups.contains(Long.valueOf(cid)) ? 1 : 2;
                    r.id = cid;
                    Integer pc = chatParts.get(Long.valueOf(cid));
                    r.participants = pc == null ? 0 : pc.intValue();
                    Long cp = chatPhotos.get(Long.valueOf(cid));
                    r.photoId = cp == null ? 0L : cp.longValue();
                    Integer pdc2 = chatPhotoDcs.get(Long.valueOf(cid));
                    r.photoDc = pdc2 == null ? 0 : pdc2.intValue();
                } else {
                    continue;
                }
                if (r.name == null || r.name.trim().length() == 0) r.name = "Chat";
                r.status = msgText.get(Integer.valueOf(dg.i32("top_message")));
                r.unread = dg.i32("unread_count");
                // 文件夹筛选所需的标记
                r.isContact = contacts.contains(Long.valueOf(r.id));
                r.isBot = bots.contains(Long.valueOf(r.id));
                TlObject ns = dg.obj("notify_settings");
                r.isMuted = ns != null && ns.i32("mute_until") > now;
                r.isRead = dg.i32("unread_count") == 0
                        && dg.i32("unread_mentions_count") == 0;
                if (filter == null || matches(filter, r)) rows.add(r);
            }
        }
        // 把“收藏夹/我的资料”置顶（原版 Telegram 也把 Saved Messages 固定在顶部）
        for (int i = 0; i < rows.size(); i++) {
            if (rows.get(i).isSelf) {
                rows.add(0, rows.remove(i));
                break;
            }
        }
        return rows;
    }
}
