package cc.wuersan008.eclairgram;

import android.app.Activity;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * 联系人 / 群组 / 频道详情页。
 *
 * 与 Google Talk 一样：在好友列表或聊天里**点按头像**就会打开这个页面。
 */
public class DetailsActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.ec_details);
        setTitle(R.string.ec_details_title);

        String name = getIntent().getStringExtra("name");
        long photoId = getIntent().getLongExtra("photoId", 0);
        int type = getIntent().getIntExtra("type", 0);
        String username = getIntent().getStringExtra("username");
        long id = getIntent().getLongExtra("id", 0);
        int participants = getIntent().getIntExtra("participants", 0);

        ((TextView) findViewById(R.id.ec_detail_name)).setText(
                name == null || name.length() == 0 ? getString(R.string.ec_app_name) : name);
        ((TextView) findViewById(R.id.ec_detail_status)).setText(typeLabel(type));

        ImageView avatar = (ImageView) findViewById(R.id.ec_detail_avatar);
        android.graphics.Bitmap b = AvatarCache.get(photoId);
        if (b != null) avatar.setImageBitmap(b);
        else avatar.setImageResource(R.drawable.ic_contact_picture);

        LinearLayout fields = (LinearLayout) findViewById(R.id.ec_detail_fields);
        addField(fields, getString(R.string.ec_field_type), typeLabel(type));
        if (username != null && username.length() > 0) {
            addField(fields, getString(R.string.ec_field_username), "@" + username);
        }
        if (id != 0) {
            addField(fields, getString(R.string.ec_field_id), Long.toString(id));
        }
        if ((type == 1 || type == 2) && participants > 0) {
            addField(fields, getString(R.string.ec_field_members), Integer.toString(participants));
        }
    }

    private String typeLabel(int type) {
        if (type == 1) return getString(R.string.ec_type_group);
        if (type == 2) return getString(R.string.ec_type_channel);
        return getString(R.string.ec_type_user);
    }

    private void addField(LinearLayout parent, String label, String value) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(6), 0, dp(6));

        TextView l = new TextView(this);
        l.setText(label);
        l.setWidth(dp(96));
        l.setTextColor(0xff808080);
        row.addView(l);

        TextView v = new TextView(this);
        v.setText(value);
        v.setTextColor(0xff000000);
        v.setGravity(Gravity.LEFT);
        row.addView(v);

        parent.addView(row);
    }

    private int dp(int v) {
        float d = getResources().getDisplayMetrics().density;
        return (int) (v * d + 0.5f);
    }
}
