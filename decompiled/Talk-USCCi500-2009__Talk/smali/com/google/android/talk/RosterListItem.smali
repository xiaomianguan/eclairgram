.class public Lcom/google/android/talk/RosterListItem;
.super Landroid/widget/LinearLayout;
.source "RosterListItem.java"


# static fields
.field private static final DEBUG_CLIENT_TYPE:Z = false

.field private static final DEBUG_QUICK_CONTACT:Z = false

.field private static final ITEM_TYPE_BUDDY:I = 0x2

.field private static final ITEM_TYPE_CONVERSATION:I = 0x1

.field private static final ITEM_TYPE_INVITATION:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "talk"

.field public static final VIEW_TYPE_COUNT:I = 0x3


# instance fields
.field private mApp:Lcom/google/android/talk/TalkApp;

.field private mAvatarHashColumn:I

.field private mAvatarView:Landroid/widget/QuickContactBadge;

.field private mBubbleDrawable:Landroid/graphics/drawable/Drawable;

.field private mClientTypeColumn:I

.field private mContactTypeColumn:I

.field private mCustomStatusColumn:I

.field private mLastUnreadMessageColumn:I

.field private mLine1:Landroid/widget/TextView;

.field private mLine2:Landroid/widget/TextView;

.field private mLine2Buffer:Landroid/database/CharArrayBuffer;

.field private mNicknameColumn:I

.field private mOfflineTextColors:Landroid/content/res/ColorStateList;

.field private mOnlineTextColors:Landroid/content/res/ColorStateList;

.field private mPresenceMode:I

.field private mPresenceStatusColumn:I

.field private mPresenceView:Landroid/widget/ImageView;

.field private mQuickContactColumn:I

.field private mSubscriptionStatusColumn:I

.field private mSubscriptionTypeColumn:I

.field private mTextWrapper:Landroid/view/View;

.field private mTypeIndicator:Landroid/widget/ImageView;

.field private mUsername:Ljava/lang/String;

.field private mUsernameColumn:I


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/talk/TalkApp;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "app"    # Lcom/google/android/talk/TalkApp;

    .prologue
    const/4 v1, 0x2

    .line 90
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 91
    iput-object p2, p0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    .line 96
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v1, v0, v1}, Lcom/google/android/talk/RosterListItem;->setPadding(IIII)V

    .line 97
    return-void
.end method

.method private getBubbleDrawable()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/google/android/talk/RosterListItem;->mBubbleDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 101
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020009

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/RosterListItem;->mBubbleDrawable:Landroid/graphics/drawable/Drawable;

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/RosterListItem;->mBubbleDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public static getItemViewType(Lcom/google/android/talk/TalkApp;Landroid/database/Cursor;)I
    .locals 5
    .param p0, "app"    # Lcom/google/android/talk/TalkApp;
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    .line 149
    const-string v4, "type"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 150
    .local v1, "contactType":I
    const-string v4, "username"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, "contact":Ljava/lang/String;
    const/4 v3, 0x0

    .line 154
    .local v3, "isGroupChatInvitation":Z
    const/4 v4, 0x2

    if-ne v1, v4, :cond_0

    .line 155
    iget-object v4, p0, Lcom/google/android/talk/TalkApp;->mGroupChatInvitations:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gtalkservice/GroupChatInvitation;

    .line 156
    .local v2, "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    if-eqz v2, :cond_1

    const/4 v4, 0x1

    move v3, v4

    .line 159
    .end local v2    # "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    :cond_0
    :goto_0
    invoke-static {p1, v3}, Lcom/google/android/talk/RosterListItem;->internalGetItemViewType(Landroid/database/Cursor;Z)I

    move-result v4

    return v4

    .line 156
    .restart local v2    # "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    :cond_1
    const/4 v4, 0x0

    move v3, v4

    goto :goto_0
.end method

.method private static internalGetItemViewType(Landroid/database/Cursor;Z)I
    .locals 9
    .param p0, "c"    # Landroid/database/Cursor;
    .param p1, "isGroupChatInvitation"    # Z

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 163
    if-eqz p1, :cond_0

    move v5, v7

    .line 179
    :goto_0
    return v5

    .line 167
    :cond_0
    const-string v5, "subscriptionType"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    int-to-long v3, v5

    .line 168
    .local v3, "subscriptionType":J
    const-wide/16 v5, 0x5

    cmp-long v5, v3, v5

    if-nez v5, :cond_1

    move v5, v7

    .line 169
    goto :goto_0

    .line 172
    :cond_1
    const-string v5, "last_message_date"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 173
    .local v0, "lastMessageDate":J
    const-wide/16 v5, 0x0

    cmp-long v5, v0, v5

    if-eqz v5, :cond_2

    move v2, v8

    .line 175
    .local v2, "showChat":Z
    :goto_1
    if-eqz v2, :cond_3

    move v5, v8

    .line 176
    goto :goto_0

    .end local v2    # "showChat":Z
    :cond_2
    move v2, v7

    .line 173
    goto :goto_1

    .line 179
    .restart local v2    # "showChat":Z
    :cond_3
    const/4 v5, 0x2

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 356
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    return-void
.end method

.method private setAvatar(Lcom/google/android/talk/TalkApp;Landroid/database/Cursor;JJZ)V
    .locals 16
    .param p1, "app"    # Lcom/google/android/talk/TalkApp;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "providerId"    # J
    .param p5, "accountId"    # J
    .param p7, "onlyLoadFromCache"    # Z

    .prologue
    .line 329
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mAvatarView:Landroid/widget/QuickContactBadge;

    move-object v15, v0

    .line 330
    .local v15, "i":Landroid/widget/ImageView;
    invoke-virtual {v15}, Landroid/widget/ImageView;->getWidth()I

    move-result v6

    invoke-virtual {v15}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v15}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v7

    sub-int v10, v6, v7

    .line 331
    .local v10, "desiredWidth":I
    invoke-virtual {v15}, Landroid/widget/ImageView;->getHeight()I

    move-result v6

    invoke-virtual {v15}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v15}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v7

    sub-int v11, v6, v7

    .line 333
    .local v11, "desiredHeight":I
    const/4 v6, 0x1

    move-wide/from16 v0, p3

    move-wide/from16 v2, p5

    move v4, v6

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/talk/AvatarCache;->getInstance(JJZ)Lcom/google/android/talk/AvatarCache;

    move-result-object v5

    .line 339
    .local v5, "cache":Lcom/google/android/talk/AvatarCache;
    const-string v6, "avatars_data"

    move-object/from16 v0, p2

    move-object v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    .line 342
    .local v8, "avatarDataColumn":I
    if-eqz p7, :cond_0

    .line 343
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mAvatarHashColumn:I

    move v7, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mUsername:Ljava/lang/String;

    move-object v9, v0

    const/4 v12, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/talk/TalkApp;->getGenericAvatar()Landroid/graphics/drawable/Drawable;

    move-result-object v13

    move-object/from16 v6, p2

    invoke-virtual/range {v5 .. v13}, Lcom/google/android/talk/AvatarCache;->getAvatarIfInCache(Landroid/database/Cursor;IILjava/lang/String;IILandroid/os/Message;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    .line 352
    .local v14, "avatar":Landroid/graphics/drawable/Drawable;
    :goto_0
    invoke-virtual {v15, v14}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 353
    return-void

    .line 347
    .end local v14    # "avatar":Landroid/graphics/drawable/Drawable;
    :cond_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mAvatarHashColumn:I

    move v7, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mUsername:Ljava/lang/String;

    move-object v9, v0

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/talk/TalkApp;->getGenericAvatar()Landroid/graphics/drawable/Drawable;

    move-result-object v12

    move-object/from16 v6, p2

    invoke-virtual/range {v5 .. v12}, Lcom/google/android/talk/AvatarCache;->getAvatar(Landroid/database/Cursor;IILjava/lang/String;IILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    .restart local v14    # "avatar":Landroid/graphics/drawable/Drawable;
    goto :goto_0
.end method


# virtual methods
.method public bind(Landroid/database/Cursor;JJZZLcom/google/android/talk/util/Markup;)V
    .locals 21
    .param p1, "c"    # Landroid/database/Cursor;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J
    .param p6, "isOnline"    # Z
    .param p7, "scrolling"    # Z
    .param p8, "markup"    # Lcom/google/android/talk/util/Markup;

    .prologue
    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mTextWrapper:Landroid/view/View;

    move-object v3, v0

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 189
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mUsernameColumn:I

    move v3, v0

    move-object/from16 v0, p1

    move v1, v3

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/RosterListItem;->mUsername:Ljava/lang/String;

    .line 191
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/talk/RosterListItem;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    .line 192
    .local v18, "r":Landroid/content/res/Resources;
    const/4 v14, 0x0

    .line 193
    .local v14, "isGroupChat":Z
    const/4 v15, 0x0

    .line 194
    .local v15, "isGroupChatInvitation":Z
    const/4 v13, 0x0

    .line 196
    .local v13, "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mContactTypeColumn:I

    move v3, v0

    move-object/from16 v0, p1

    move v1, v3

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 197
    .local v12, "contactType":I
    const/4 v3, 0x2

    if-ne v12, v3, :cond_0

    .line 198
    const/4 v14, 0x1

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v3, v0

    iget-object v3, v3, Lcom/google/android/talk/TalkApp;->mGroupChatInvitations:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mUsername:Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    check-cast v13, Lcom/google/android/gtalkservice/GroupChatInvitation;

    .line 200
    .restart local v13    # "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    if-eqz v13, :cond_3

    const/4 v3, 0x1

    move v15, v3

    .line 203
    :cond_0
    :goto_0
    move-object/from16 v0, p1

    move v1, v15

    invoke-static {v0, v1}, Lcom/google/android/talk/RosterListItem;->internalGetItemViewType(Landroid/database/Cursor;Z)I

    move-result v16

    .line 204
    .local v16, "itemViewType":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mNicknameColumn:I

    move v3, v0

    move-object/from16 v0, p1

    move v1, v3

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 206
    .local v17, "nickname":Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 207
    if-eqz v14, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mContext:Landroid/content/Context;

    move-object v3, v0

    const v4, 0x7f060043

    invoke-virtual {v3, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v17, v3

    .line 210
    :cond_1
    :goto_1
    if-nez v16, :cond_6

    .line 212
    if-eqz v14, :cond_5

    .line 213
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine1:Landroid/widget/TextView;

    move-object v3, v0

    const v4, 0x7f060045

    move-object/from16 v0, v18

    move v1, v4

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    move-object v3, v0

    invoke-virtual {v13}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getInviter()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/talk/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    :goto_2
    if-eqz p6, :cond_f

    .line 290
    if-nez p7, :cond_2

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mAvatarView:Landroid/widget/QuickContactBadge;

    move-object v3, v0

    invoke-virtual {v3}, Landroid/widget/QuickContactBadge;->clearColorFilter()V

    .line 292
    if-eqz v16, :cond_2

    .line 293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceView:Landroid/widget/ImageView;

    move-object v3, v0

    invoke-virtual {v3}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 296
    :cond_2
    const/4 v3, 0x1

    move/from16 v0, v16

    move v1, v3

    if-ne v0, v1, :cond_e

    .line 297
    const/4 v3, 0x0

    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    const/16 v4, 0xff

    invoke-virtual {v3, v4}, Landroid/content/res/ColorStateList;->withAlpha(I)Landroid/content/res/ColorStateList;

    move-result-object v20

    .line 311
    .local v20, "textColors":Landroid/content/res/ColorStateList;
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine1:Landroid/widget/TextView;

    move-object v3, v0

    move-object v0, v3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    move-object v3, v0

    move-object v0, v3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 315
    if-eqz v14, :cond_11

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mAvatarView:Landroid/widget/QuickContactBadge;

    move-object v3, v0

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/QuickContactBadge;->assignContactUri(Landroid/net/Uri;)V

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mAvatarView:Landroid/widget/QuickContactBadge;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v4, v0

    iget-object v4, v4, Lcom/google/android/talk/TalkApp;->mGroupAvatar:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v4}, Landroid/widget/QuickContactBadge;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mAvatarView:Landroid/widget/QuickContactBadge;

    move-object v3, v0

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/QuickContactBadge;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 325
    :goto_4
    return-void

    .line 200
    .end local v16    # "itemViewType":I
    .end local v17    # "nickname":Ljava/lang/String;
    .end local v20    # "textColors":Landroid/content/res/ColorStateList;
    :cond_3
    const/4 v3, 0x0

    move v15, v3

    goto/16 :goto_0

    .line 207
    .restart local v16    # "itemViewType":I
    .restart local v17    # "nickname":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mUsername:Ljava/lang/String;

    move-object v3, v0

    move-object/from16 v17, v3

    goto/16 :goto_1

    .line 216
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine1:Landroid/widget/TextView;

    move-object v3, v0

    const v4, 0x7f06002f

    move-object/from16 v0, v18

    move v1, v4

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    move-object v3, v0

    move-object v0, v3

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 221
    :cond_6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceStatusColumn:I

    move v3, v0

    move-object/from16 v0, p1

    move v1, v3

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    move v0, v3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceView:Landroid/widget/ImageView;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v4, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    move v5, v0

    invoke-virtual {v4, v5}, Lcom/google/android/talk/TalkApp;->getStatusIcon(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 224
    const/4 v3, 0x1

    move/from16 v0, v16

    move v1, v3

    if-ne v0, v1, :cond_9

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mTextWrapper:Landroid/view/View;

    move-object v3, v0

    invoke-direct/range {p0 .. p0}, Lcom/google/android/talk/RosterListItem;->getBubbleDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 226
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mLastUnreadMessageColumn:I

    move v3, v0

    move-object/from16 v0, p1

    move v1, v3

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 227
    .local v19, "s":Ljava/lang/String;
    if-eqz v19, :cond_8

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    move-object v3, v0

    move-object/from16 v0, p8

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/talk/util/Markup;->markup(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    .end local v19    # "s":Ljava/lang/String;
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine1:Landroid/widget/TextView;

    move-object v3, v0

    move-object v0, v3

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    const/4 v11, 0x0

    .line 263
    .local v11, "clientType":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    move v3, v0

    if-eqz v3, :cond_7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    move v3, v0

    const/4 v4, 0x1

    if-eq v3, v4, :cond_7

    .line 264
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mClientTypeColumn:I

    move v3, v0

    move-object/from16 v0, p1

    move v1, v3

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 282
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mTypeIndicator:Landroid/widget/ImageView;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v4, v0

    const/4 v5, 0x1

    move/from16 v0, v16

    move v1, v5

    if-ne v0, v1, :cond_d

    const/4 v5, 0x1

    :goto_6
    invoke-virtual {v4, v11, v5}, Lcom/google/android/talk/TalkApp;->getConnectionTypeIndicator(IZ)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_2

    .line 230
    .end local v11    # "clientType":I
    .restart local v19    # "s":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    move-object v3, v0

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 233
    .end local v19    # "s":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    move v3, v0

    const/4 v4, 0x5

    if-eq v3, v4, :cond_a

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    move v3, v0

    const/4 v4, 0x4

    if-eq v3, v4, :cond_a

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    move v3, v0

    const/4 v4, 0x3

    if-eq v3, v4, :cond_a

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    move v3, v0

    const/4 v4, 0x2

    if-ne v3, v4, :cond_c

    .line 237
    :cond_a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mCustomStatusColumn:I

    move v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2Buffer:Landroid/database/CharArrayBuffer;

    move-object v4, v0

    move-object/from16 v0, p1

    move v1, v3

    move-object v2, v4

    invoke-interface {v0, v1, v2}, Landroid/database/Cursor;->copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2Buffer:Landroid/database/CharArrayBuffer;

    move-object v3, v0

    iget v3, v3, Landroid/database/CharArrayBuffer;->sizeCopied:I

    if-nez v3, :cond_b

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v4, v0

    iget-object v4, v4, Lcom/google/android/talk/TalkApp;->mDefaultStatusStrings:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    move v5, v0

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 242
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2Buffer:Landroid/database/CharArrayBuffer;

    move-object v4, v0

    iget-object v4, v4, Landroid/database/CharArrayBuffer;->data:[C

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2Buffer:Landroid/database/CharArrayBuffer;

    move-object v6, v0

    iget v6, v6, Landroid/database/CharArrayBuffer;->sizeCopied:I

    invoke-virtual {v3, v4, v5, v6}, Landroid/widget/TextView;->setText([CII)V

    goto/16 :goto_5

    .line 245
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v4, v0

    iget-object v4, v4, Lcom/google/android/talk/TalkApp;->mDefaultStatusStrings:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceMode:I

    move v5, v0

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 282
    .restart local v11    # "clientType":I
    :cond_d
    const/4 v5, 0x0

    goto/16 :goto_6

    .line 299
    .end local v11    # "clientType":I
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mOnlineTextColors:Landroid/content/res/ColorStateList;

    move-object/from16 v20, v0

    .restart local v20    # "textColors":Landroid/content/res/ColorStateList;
    goto/16 :goto_3

    .line 302
    .end local v20    # "textColors":Landroid/content/res/ColorStateList;
    :cond_f
    if-nez p7, :cond_10

    .line 303
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mAvatarView:Landroid/widget/QuickContactBadge;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v4, v0

    iget-object v4, v4, Lcom/google/android/talk/TalkApp;->mOfflineColorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {v3, v4}, Landroid/widget/QuickContactBadge;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 304
    if-eqz v16, :cond_10

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mPresenceView:Landroid/widget/ImageView;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v4, v0

    iget-object v4, v4, Lcom/google/android/talk/TalkApp;->mOfflineColorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 308
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mOfflineTextColors:Landroid/content/res/ColorStateList;

    move-object/from16 v20, v0

    .restart local v20    # "textColors":Landroid/content/res/ColorStateList;
    goto/16 :goto_3

    .line 320
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v4, v0

    if-eqz p7, :cond_12

    const/4 v3, 0x1

    move v10, v3

    :goto_7
    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move-wide/from16 v6, p2

    move-wide/from16 v8, p4

    invoke-direct/range {v3 .. v10}, Lcom/google/android/talk/RosterListItem;->setAvatar(Lcom/google/android/talk/TalkApp;Landroid/database/Cursor;JJZ)V

    .line 321
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mAvatarView:Landroid/widget/QuickContactBadge;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/RosterListItem;->mUsername:Ljava/lang/String;

    move-object v4, v0

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Landroid/widget/QuickContactBadge;->assignContactFromEmail(Ljava/lang/String;Z)V

    goto/16 :goto_4

    .line 320
    :cond_12
    const/4 v3, 0x0

    move v10, v3

    goto :goto_7
.end method

.method final getNickname()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lcom/google/android/talk/RosterListItem;->mLine1:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method init(Landroid/database/Cursor;)V
    .locals 4
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    .line 109
    const v1, 0x7f0b002a

    :try_start_0
    invoke-virtual {p0, v1}, Lcom/google/android/talk/RosterListItem;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/google/android/talk/RosterListItem;->mLine1:Landroid/widget/TextView;

    .line 110
    const v1, 0x7f0b002b

    invoke-virtual {p0, v1}, Lcom/google/android/talk/RosterListItem;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    .line 111
    const v1, 0x7f0b0003

    invoke-virtual {p0, v1}, Lcom/google/android/talk/RosterListItem;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/QuickContactBadge;

    iput-object v1, p0, Lcom/google/android/talk/RosterListItem;->mAvatarView:Landroid/widget/QuickContactBadge;

    .line 112
    const v1, 0x7f0b0016

    invoke-virtual {p0, v1}, Lcom/google/android/talk/RosterListItem;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/google/android/talk/RosterListItem;->mPresenceView:Landroid/widget/ImageView;

    .line 113
    const v1, 0x7f0b002c

    invoke-virtual {p0, v1}, Lcom/google/android/talk/RosterListItem;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/google/android/talk/RosterListItem;->mTypeIndicator:Landroid/widget/ImageView;

    .line 114
    const v1, 0x7f0b0029

    invoke-virtual {p0, v1}, Lcom/google/android/talk/RosterListItem;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/RosterListItem;->mTextWrapper:Landroid/view/View;

    .line 116
    iget-object v1, p0, Lcom/google/android/talk/RosterListItem;->mLine1:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/RosterListItem;->mOnlineTextColors:Landroid/content/res/ColorStateList;

    .line 117
    const v1, -0x808081

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/RosterListItem;->mOfflineTextColors:Landroid/content/res/ColorStateList;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    const-string v1, "username"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mUsernameColumn:I

    .line 128
    const-string v1, "nickname"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mNicknameColumn:I

    .line 129
    const-string v1, "type"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mContactTypeColumn:I

    .line 130
    const-string v1, "subscriptionStatus"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mSubscriptionStatusColumn:I

    .line 131
    const-string v1, "subscriptionType"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mSubscriptionTypeColumn:I

    .line 132
    const-string v1, "mode"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mPresenceStatusColumn:I

    .line 133
    const-string v1, "status"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mCustomStatusColumn:I

    .line 134
    const-string v1, "client_type"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mClientTypeColumn:I

    .line 135
    const-string v1, "last_unread_message"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mLastUnreadMessageColumn:I

    .line 136
    const-string v1, "qc"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mQuickContactColumn:I

    .line 137
    const-string v1, "avatars_hash"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListItem;->mAvatarHashColumn:I

    .line 140
    new-instance v1, Landroid/database/CharArrayBuffer;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Landroid/database/CharArrayBuffer;-><init>(I)V

    iput-object v1, p0, Lcom/google/android/talk/RosterListItem;->mLine2Buffer:Landroid/database/CharArrayBuffer;

    .line 142
    iget-object v1, p0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 143
    iget-object v1, p0, Lcom/google/android/talk/RosterListItem;->mLine1:Landroid/widget/TextView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 144
    iget-object v1, p0, Lcom/google/android/talk/RosterListItem;->mLine1:Landroid/widget/TextView;

    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 145
    iget-object v1, p0, Lcom/google/android/talk/RosterListItem;->mLine2:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 146
    return-void

    .line 118
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 119
    .local v0, "e":Ljava/lang/ClassCastException;
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Init view failed, caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
