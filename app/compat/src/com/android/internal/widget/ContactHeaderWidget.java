package com.android.internal.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.provider.ContactsContract;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.QuickContactBadge;
import android.widget.TextView;

import cc.wuersan008.eclairgram.R;

/**
 * Android 4.0 兼容替身：{@code com.android.internal.widget.ContactHeaderWidget}。
 *
 * <p>原版 Google Talk（为 2.1 编译）的 {@code chat_screen} 布局引用了框架内部的
 * 联系人标题控件 {@code com.android.internal.widget.ContactHeaderWidget}。该控件
 * 在 Android 4.0 中被从框架移除（同时移到 Contacts 应用里），导致 4.0 上聊天界面
 * 在 inflate 时直接 {@code ClassNotFoundException} 崩溃。
 *
 * <p>这里提供一个外观与行为一致的替身实现：布局结构照抄 2.1 框架的
 * {@code res/layout/contact_header.xml}，背景与默认头像图片也取自 2.1 框架。
 *
 * <p><b>只在 4.0+ 生效</b>：2.1–2.3 的系统框架里仍有同名类，boot classpath 优先，
 * 本类被忽略，界面与行为完全不变（与其它 {@code compat/legacy} 类同样的机制）。
 */
public class ContactHeaderWidget extends FrameLayout implements View.OnClickListener {

    private QuickContactBadge mPhotoView;
    private TextView mDisplayNameView;
    private TextView mPhoneticNameView;
    private TextView mStatusView;
    private ImageView mPresenceView;
    private Uri mContactUri;

    public ContactHeaderWidget(Context context) {
        this(context, null);
    }

    public ContactHeaderWidget(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public ContactHeaderWidget(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        LayoutInflater.from(context).inflate(R.layout.eclairgram_contact_header, this);
        mPhotoView = (QuickContactBadge) findViewById(R.id.contact_header_photo);
        mDisplayNameView = (TextView) findViewById(R.id.contact_header_name);
        mStatusView = (TextView) findViewById(R.id.contact_header_status);
        mPresenceView = (ImageView) findViewById(R.id.contact_header_presence);
    }

    /** 与框架原版同名方法：设置显示名（及拼音名）。 */
    public void setDisplayName(CharSequence displayName, CharSequence phoneticName) {
        mDisplayNameView.setText(displayName);
        if (mPhoneticNameView != null) {
            mPhoneticNameView.setText(phoneticName);
        }
    }

    /** 与框架原版同名方法：设置头像；为空时退回框架风格的默认联系人头像。 */
    public void setPhoto(Bitmap bitmap) {
        if (bitmap != null) {
            mPhotoView.setImageBitmap(bitmap);
        } else {
            mPhotoView.setImageResource(R.drawable.eclairgram_ic_contact_picture);
        }
    }

    /** 与框架原版同名方法：设置状态/自定义签名；为空时隐藏。 */
    public void setSocialSnippet(CharSequence snippet) {
        if (snippet == null) {
            mStatusView.setVisibility(View.GONE);
        } else {
            mStatusView.setText(snippet);
            mStatusView.setVisibility(View.VISIBLE);
        }
    }

    /** 与框架原版同名方法：设置在线状态图标（复用系统框架的状态图标）。 */
    public void setPresence(int presence) {
        mPresenceView.setImageResource(
                ContactsContract.StatusUpdates.getPresenceIconResourceId(presence));
    }

    /** 与框架原版同名方法：记录联系人 URI（本替身不做联系人查询）。 */
    public void setContactUri(Uri uri) {
        mContactUri = uri;
    }

    /** 与框架原版同名方法：按邮箱绑定联系人（本替身不做查询，仅保留接口）。 */
    public void bindFromEmail(String emailAddress) {
    }

    @Override
    public void onClick(View v) {
    }
}
