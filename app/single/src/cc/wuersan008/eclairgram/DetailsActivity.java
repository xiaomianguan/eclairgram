package cc.wuersan008.eclairgram;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;

import cc.wuersan008.eclairgram.mtproto.MtpClient;
import cc.wuersan008.eclairgram.mtproto.TlObject;

/**
 * 联系人 / 群组 / 频道详情页；对自己（收藏夹头像）则是“我的资料”页，
 * 可查看并修改头像、名字与简介。
 *
 * 与 Google Talk 一样：在好友列表或聊天里**点按头像**就会打开这个页面。
 */
public class DetailsActivity extends Activity {

    private static final int REQ_PICK = 1;

    private final Handler mMain = new Handler(Looper.getMainLooper());

    private boolean mSelf;
    private long mId;
    private int mType;
    private int mParticipants;
    private String mFallbackName;
    private long mPhotoId;
    private String mUsername = "";

    private ImageView mAvatar;
    private TextView mNameView;
    private TextView mStatusView;
    private LinearLayout mFields;

    private String mFirstName = "";
    private String mLastName = "";
    private String mAbout = "";
    private String mPhone = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.ec_details);

        mSelf = getIntent().getBooleanExtra("self", false);
        mId = getIntent().getLongExtra("id", 0);
        mType = getIntent().getIntExtra("type", 0);
        mParticipants = getIntent().getIntExtra("participants", 0);
        mFallbackName = getIntent().getStringExtra("name");
        mPhotoId = getIntent().getLongExtra("photoId", 0);
        String un = getIntent().getStringExtra("username");
        if (un != null) mUsername = un;

        mAvatar = (ImageView) findViewById(R.id.ec_detail_avatar);
        mNameView = (TextView) findViewById(R.id.ec_detail_name);
        mStatusView = (TextView) findViewById(R.id.ec_detail_status);
        mFields = (LinearLayout) findViewById(R.id.ec_detail_fields);

        if (mSelf) {
            setTitle(R.string.ec_my_profile);
            mAvatar.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    pickPhoto();
                }
            });
            loadSelf();
        } else {
            setTitle(R.string.ec_details_title);
            renderOther();
        }
    }

    // ======================================================== 他人 / 群组 / 频道
    private void renderOther() {
        String nm = mFallbackName == null || mFallbackName.length() == 0
                ? getString(R.string.ec_app_name) : mFallbackName;
        mNameView.setText(EmojiFont.emojify(this, nm, dp(24)));
        mStatusView.setText(typeLabel(mType));
        Bitmap b = AvatarCache.get(mPhotoId);
        if (b != null) mAvatar.setImageBitmap(b);
        else mAvatar.setImageResource(R.drawable.ic_contact_picture);

        addField(mFields, getString(R.string.ec_field_type), typeLabel(mType));
        if (mUsername.length() > 0) {
            addField(mFields, getString(R.string.ec_field_username), "@" + mUsername);
        }
        if (mId != 0) {
            addField(mFields, getString(R.string.ec_field_id), Long.toString(mId));
        }
        if ((mType == 1 || mType == 2) && mParticipants > 0) {
            addField(mFields, getString(R.string.ec_field_members),
                    Integer.toString(mParticipants));
        }
    }

    // ======================================================== 我的资料
    private void loadSelf() {
        new Thread(new Runnable() {
            public void run() {
                try {
                    TlObject res = TelegramManager.get(DetailsActivity.this).syncGetFullUserSelf();
                    TlObject full = res.obj("full_user");
                    TlObject user = null;
                    List<Object> users = res.list("users");
                    if (users != null) {
                        for (Object o : users) {
                            TlObject u = (TlObject) o;
                            if (u.bool("self")) { user = u; break; }
                        }
                        if (user == null && !users.isEmpty()) user = (TlObject) users.get(0);
                    }
                    final TlObject fUser = user;
                    final TlObject fFull = full;
                    mMain.post(new Runnable() {
                        public void run() {
                            renderSelf(fUser, fFull);
                        }
                    });
                } catch (final Throwable t) {
                    mMain.post(new Runnable() {
                        public void run() {
                            toast(getString(R.string.ec_status_error, String.valueOf(t.getMessage())));
                        }
                    });
                }
            }
        }).start();
    }

    private void renderSelf(TlObject user, TlObject full) {
        mFirstName = user == null ? "" : nz(user.str("first_name"));
        mLastName = user == null ? "" : nz(user.str("last_name"));
        mUsername = user == null ? "" : nz(user.str("username"));
        mPhone = user == null ? "" : nz(user.str("phone"));
        mAbout = full == null ? "" : nz(full.str("about"));
        long pid = 0;
        int pdc = 0;
        if (user != null) {
            TlObject photo = user.obj("photo");
            if (photo != null && photo.type().equals("userProfilePhoto")) {
                pid = photo.i64("photo_id");
                pdc = photo.i32("dc_id");
            }
        }
        mPhotoId = pid;
        loadAvatar(pid, pdc);

        String name = (mFirstName + " " + mLastName).trim();
        if (name.length() == 0) name = getString(R.string.ec_my_profile);
        mNameView.setText(EmojiFont.emojify(this, name, dp(24)));
        mStatusView.setText(EmojiFont.emojify(this,
                mUsername.length() > 0 ? "@" + mUsername : getString(R.string.ec_my_profile), dp(16)));

        mFields.removeAllViews();
        addEditField(mFields, getString(R.string.ec_field_name), name, new View.OnClickListener() {
            public void onClick(View v) { editName(); }
        });
        if (mUsername.length() > 0) {
            addField(mFields, getString(R.string.ec_field_username), "@" + mUsername);
        }
        if (mPhone.length() > 0) {
            addField(mFields, getString(R.string.ec_field_phone), mPhone);
        }
        addEditField(mFields, getString(R.string.ec_field_bio),
                mAbout.length() == 0 ? getString(R.string.ec_bio_empty) : mAbout,
                new View.OnClickListener() {
                    public void onClick(View v) { editBio(); }
                });
        addEditField(mFields, getString(R.string.ec_field_photo),
                getString(R.string.ec_change_photo), new View.OnClickListener() {
                    public void onClick(View v) { pickPhoto(); }
                });
    }

    private void loadAvatar(final long photoId, final int dcId) {
        if (photoId == 0) {
            mAvatar.setImageResource(R.drawable.ic_contact_picture);
            return;
        }
        Bitmap b = AvatarCache.get(photoId);
        if (b != null) {
            mAvatar.setImageBitmap(b);
            return;
        }
        mAvatar.setImageResource(R.drawable.ic_contact_picture);
        new Thread(new Runnable() {
            public void run() {
                final Bitmap nb = AvatarCache.load(DetailsActivity.this,
                        TelegramManager.get(DetailsActivity.this),
                        MtpClient.inputPeerSelf(), photoId, dcId);
                if (nb != null) {
                    mMain.post(new Runnable() {
                        public void run() { mAvatar.setImageBitmap(nb); }
                    });
                }
            }
        }).start();
    }

    private void editName() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        int p = dp(16);
        box.setPadding(p, dp(8), p, dp(8));
        final EditText first = new EditText(this);
        first.setHint(R.string.ec_field_first_name);
        first.setSingleLine(true);
        first.setText(mFirstName);
        EmojiFont.applyToEditable(this, first.getText(), dp(20));
        final EditText last = new EditText(this);
        last.setHint(R.string.ec_field_last_name);
        last.setSingleLine(true);
        last.setText(mLastName);
        EmojiFont.applyToEditable(this, last.getText(), dp(20));
        box.addView(first);
        box.addView(last);
        new AlertDialog.Builder(this)
                .setTitle(R.string.ec_edit_name)
                .setView(box)
                .setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface d, int w) {
                        saveProfile(first.getText().toString().trim(),
                                last.getText().toString().trim(), null);
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void editBio() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        int p = dp(16);
        box.setPadding(p, dp(8), p, dp(8));
        final EditText bio = new EditText(this);
        bio.setHint(R.string.ec_field_bio);
        bio.setText(mAbout);
        EmojiFont.applyToEditable(this, bio.getText(), dp(20));
        bio.setMinLines(3);
        bio.setGravity(Gravity.TOP | Gravity.LEFT);
        box.addView(bio);
        new AlertDialog.Builder(this)
                .setTitle(R.string.ec_edit_bio)
                .setView(box)
                .setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface d, int w) {
                        saveProfile(null, null, bio.getText().toString().trim());
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void saveProfile(final String first, final String last, final String about) {
        toast(getString(R.string.ec_saving));
        new Thread(new Runnable() {
            public void run() {
                try {
                    TelegramManager.get(DetailsActivity.this)
                            .syncUpdateProfile(first, last, about);
                    mMain.post(new Runnable() {
                        public void run() { loadSelf(); }
                    });
                } catch (final Throwable t) {
                    mMain.post(new Runnable() {
                        public void run() {
                            toast(getString(R.string.ec_status_error, String.valueOf(t.getMessage())));
                        }
                    });
                }
            }
        }).start();
    }

    private void pickPhoto() {
        Intent i = new Intent(Intent.ACTION_GET_CONTENT);
        i.setType("image/*");
        i.addCategory(Intent.CATEGORY_OPENABLE);
        try {
            startActivityForResult(i, REQ_PICK);
        } catch (Throwable t) {
            toast(String.valueOf(t.getMessage()));
        }
    }

    @Override
    protected void onActivityResult(int req, int res, Intent data) {
        super.onActivityResult(req, res, data);
        if (req != REQ_PICK || res != RESULT_OK || data == null || data.getData() == null) return;
        final Uri uri = data.getData();
        toast(getString(R.string.ec_saving));
        new Thread(new Runnable() {
            public void run() {
                try {
                    byte[] bytes = readAll(uri);
                    TelegramManager.get(DetailsActivity.this)
                            .syncUploadProfilePhoto(bytes, "profile.jpg");
                    mMain.post(new Runnable() {
                        public void run() { loadSelf(); }
                    });
                } catch (final Throwable t) {
                    mMain.post(new Runnable() {
                        public void run() {
                            toast(getString(R.string.ec_status_error, String.valueOf(t.getMessage())));
                        }
                    });
                }
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

    // ======================================================== 工具
    private String typeLabel(int type) {
        if (type == 1) return getString(R.string.ec_type_group);
        if (type == 2) return getString(R.string.ec_type_channel);
        return getString(R.string.ec_type_user);
    }

    private void addField(LinearLayout parent, String label, String value) {
        parent.addView(fieldRow(label, value, null));
    }

    private void addEditField(LinearLayout parent, String label, String value,
                              View.OnClickListener l) {
        View row = fieldRow(label, value, l);
        parent.addView(row);
    }

    private View fieldRow(String label, String value, View.OnClickListener l) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(8), 0, dp(8));

        TextView lv = new TextView(this);
        lv.setText(label);
        lv.setWidth(dp(96));
        lv.setTextColor(getResources().getColor(R.color.ec_text_secondary));
        row.addView(lv);

        TextView v = new TextView(this);
        v.setText(EmojiFont.emojify(this, value, dp(16)));
        v.setTextColor(getResources().getColor(R.color.ec_text_primary));
        v.setGravity(Gravity.LEFT);
        row.addView(v);

        if (l != null) {
            row.setFocusable(true);
            row.setClickable(true);
            row.setOnClickListener(l);
        }
        return row;
    }

    private void toast(final String s) {
        mMain.post(new Runnable() {
            public void run() {
                Toast.makeText(DetailsActivity.this, s, Toast.LENGTH_SHORT).show();
            }
        });
    }

    private static String nz(String s) {
        return s == null ? "" : s;
    }

    private int dp(int v) {
        float d = getResources().getDisplayMetrics().density;
        return (int) (v * d + 0.5f);
    }
}
