.class public Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;
.super Landroid/widget/CursorAdapter;
.source "ChatSwitcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/util/ChatSwitcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SwitcherAdapter"
.end annotation


# instance fields
.field private mContentObserver:Landroid/database/ContentObserver;

.field private mLayout:I

.field private mMenuPlus:Ljava/lang/String;

.field final synthetic this$0:Lcom/google/android/talk/util/ChatSwitcher;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/util/ChatSwitcher;Landroid/database/Cursor;Landroid/app/Activity;)V
    .locals 2
    .param p2, "c"    # Landroid/database/Cursor;
    .param p3, "a"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x0

    .line 314
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    .line 317
    const/4 v0, 0x0

    invoke-direct {p0, p3, v1, v0}, Landroid/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 303
    new-instance v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$1;

    invoke-direct {v0, p0, v1}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$1;-><init>(Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->mContentObserver:Landroid/database/ContentObserver;

    .line 318
    const v0, 0x7f030007

    iput v0, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->mLayout:I

    .line 319
    invoke-static {p1, p3}, Lcom/google/android/talk/util/ChatSwitcher;->access$102(Lcom/google/android/talk/util/ChatSwitcher;Landroid/app/Activity;)Landroid/app/Activity;

    .line 320
    const v0, 0x7f060008

    invoke-virtual {p3, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->mMenuPlus:Ljava/lang/String;

    .line 322
    invoke-virtual {p0, p2}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 323
    return-void
.end method

.method private updateViewListeners(Landroid/view/View;Landroid/database/Cursor;I)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "c"    # Landroid/database/Cursor;
    .param p3, "position"    # I

    .prologue
    .line 427
    new-instance v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$2;

    invoke-direct {v0, p0, p2, p3}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$2;-><init>(Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;Landroid/database/Cursor;I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 432
    new-instance v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$3;

    invoke-direct {v0, p0, p2, p3}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$3;-><init>(Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;Landroid/database/Cursor;I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 446
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 35
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "c"    # Landroid/database/Cursor;

    .prologue
    .line 360
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v6, v6, Lcom/google/android/talk/util/ChatSwitcher;->mNicknameColumn:I

    move-object/from16 v0, p3

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 363
    .local v23, "nickname":Ljava/lang/String;
    const v6, 0x7f0b0017

    move-object/from16 v0, p1

    move v1, v6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v33

    check-cast v33, Landroid/widget/TextView;

    .line 364
    .local v33, "t":Landroid/widget/TextView;
    move-object/from16 v0, v33

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v6, v6, Lcom/google/android/talk/util/ChatSwitcher;->mPresenceStatusColumn:I

    move-object/from16 v0, p3

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v25

    .line 367
    .local v25, "presenceMode":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v6, v6, Lcom/google/android/talk/util/ChatSwitcher;->mLastUnreadMessageColumn:I

    move-object/from16 v0, p3

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v29

    .line 371
    .local v29, "s":Ljava/lang/String;
    if-eqz v29, :cond_0

    .line 372
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    invoke-static {v6}, Lcom/google/android/talk/util/ChatSwitcher;->access$300(Lcom/google/android/talk/util/ChatSwitcher;)Lcom/google/android/talk/TalkApp;

    move-result-object v6

    move-object v0, v6

    iget-object v0, v0, Lcom/google/android/talk/TalkApp;->mChatStatusIcon:Landroid/graphics/drawable/Drawable;

    move-object/from16 v24, v0

    .line 376
    .local v24, "presence":Landroid/graphics/drawable/Drawable;
    :goto_0
    const v6, 0x7f0b0016

    move-object/from16 v0, p1

    move v1, v6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v26

    check-cast v26, Landroid/widget/ImageView;

    .line 377
    .local v26, "presenceView":Landroid/widget/ImageView;
    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 381
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v6, v6, Lcom/google/android/talk/util/ChatSwitcher;->mShortcutColumn:I

    move-object/from16 v0, p3

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v30

    .line 382
    .local v30, "shortcut":J
    const v6, 0x7f0b0019

    move-object/from16 v0, p1

    move v1, v6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v32

    check-cast v32, Landroid/widget/TextView;

    .line 384
    .local v32, "shortcutView":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    invoke-static {v6}, Lcom/google/android/talk/util/ChatSwitcher;->access$400(Lcom/google/android/talk/util/ChatSwitcher;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/4 v6, 0x0

    :goto_1
    move-object/from16 v0, v32

    move v1, v6

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 385
    const-wide/16 v6, 0x0

    cmp-long v6, v30, v6

    if-ltz v6, :cond_2

    const-wide/16 v6, 0xa

    cmp-long v6, v30, v6

    if-gez v6, :cond_2

    .line 386
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->mMenuPlus:Ljava/lang/String;

    move-object v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object v0, v6

    move-wide/from16 v1, v30

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 391
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v6, v6, Lcom/google/android/talk/util/ChatSwitcher;->mProviderIdColumn:I

    move-object/from16 v0, p3

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v27

    .line 392
    .local v27, "providerId":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v6, v6, Lcom/google/android/talk/util/ChatSwitcher;->mAccountIdColumn:I

    move-object/from16 v0, p3

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v17

    .line 393
    .local v17, "accountId":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v6, v6, Lcom/google/android/talk/util/ChatSwitcher;->mUsernameColumn:I

    move-object/from16 v0, p3

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 394
    .local v9, "username":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v6, v6, Lcom/google/android/talk/util/ChatSwitcher;->mGroupChatColumn:I

    move-object/from16 v0, p3

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    move v0, v6

    int-to-long v0, v0

    move-wide/from16 v21, v0

    .line 395
    .local v21, "groupChat":J
    const v6, 0x7f0b0003

    move-object/from16 v0, p1

    move v1, v6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/ImageView;

    .line 396
    .local v20, "avatarView":Landroid/widget/ImageView;
    const/16 v19, 0x0

    .line 398
    .local v19, "avatar":Landroid/graphics/drawable/Drawable;
    const-wide/16 v6, 0x0

    cmp-long v6, v21, v6

    if-eqz v6, :cond_3

    .line 399
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    invoke-static {v6}, Lcom/google/android/talk/util/ChatSwitcher;->access$300(Lcom/google/android/talk/util/ChatSwitcher;)Lcom/google/android/talk/TalkApp;

    move-result-object v6

    move-object v0, v6

    iget-object v0, v0, Lcom/google/android/talk/TalkApp;->mGroupAvatar:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    .line 413
    :goto_3
    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 415
    const v6, 0x7f0b0018

    move-object/from16 v0, p1

    move v1, v6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v34

    check-cast v34, Landroid/widget/TextView;

    .line 416
    .local v34, "tv":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v6, v6, Lcom/google/android/talk/util/ChatSwitcher;->mLastChatColumn:I

    move-object/from16 v0, p3

    move v1, v6

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    const-wide/32 v14, 0xea60

    const/high16 v16, 0x40000

    invoke-static/range {v10 .. v16}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object v6

    move-object/from16 v0, v34

    move-object v1, v6

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 421
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    invoke-static {v6}, Lcom/google/android/talk/util/ChatSwitcher;->access$400(Lcom/google/android/talk/util/ChatSwitcher;)Z

    move-result v6

    if-eqz v6, :cond_5

    const/16 v6, 0x8

    :goto_4
    move-object/from16 v0, v34

    move v1, v6

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 423
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v6

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move v3, v6

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->updateViewListeners(Landroid/view/View;Landroid/database/Cursor;I)V

    .line 424
    return-void

    .line 374
    .end local v9    # "username":Ljava/lang/String;
    .end local v17    # "accountId":J
    .end local v19    # "avatar":Landroid/graphics/drawable/Drawable;
    .end local v20    # "avatarView":Landroid/widget/ImageView;
    .end local v21    # "groupChat":J
    .end local v24    # "presence":Landroid/graphics/drawable/Drawable;
    .end local v26    # "presenceView":Landroid/widget/ImageView;
    .end local v27    # "providerId":J
    .end local v30    # "shortcut":J
    .end local v32    # "shortcutView":Landroid/widget/TextView;
    .end local v34    # "tv":Landroid/widget/TextView;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    invoke-static {v6}, Lcom/google/android/talk/util/ChatSwitcher;->access$300(Lcom/google/android/talk/util/ChatSwitcher;)Lcom/google/android/talk/TalkApp;

    move-result-object v6

    move-object v0, v6

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/google/android/talk/TalkApp;->getStatusIcon(I)Landroid/graphics/drawable/Drawable;

    move-result-object v24

    .restart local v24    # "presence":Landroid/graphics/drawable/Drawable;
    goto/16 :goto_0

    .line 384
    .restart local v26    # "presenceView":Landroid/widget/ImageView;
    .restart local v30    # "shortcut":J
    .restart local v32    # "shortcutView":Landroid/widget/TextView;
    :cond_1
    const/16 v6, 0x8

    goto/16 :goto_1

    .line 388
    :cond_2
    const-string v6, ""

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 401
    .restart local v9    # "username":Ljava/lang/String;
    .restart local v17    # "accountId":J
    .restart local v19    # "avatar":Landroid/graphics/drawable/Drawable;
    .restart local v20    # "avatarView":Landroid/widget/ImageView;
    .restart local v21    # "groupChat":J
    .restart local v27    # "providerId":J
    :cond_3
    const/4 v6, 0x1

    move-wide/from16 v0, v27

    move-wide/from16 v2, v17

    move v4, v6

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/talk/AvatarCache;->getInstance(JJZ)Lcom/google/android/talk/AvatarCache;

    move-result-object v5

    .line 402
    .local v5, "avatarCache":Lcom/google/android/talk/AvatarCache;
    if-eqz v5, :cond_4

    .line 403
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v7, v6, Lcom/google/android/talk/util/ChatSwitcher;->mAvatarHashColumn:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    iget v8, v6, Lcom/google/android/talk/util/ChatSwitcher;->mAvatarDataColumn:I

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    invoke-static {v6}, Lcom/google/android/talk/util/ChatSwitcher;->access$300(Lcom/google/android/talk/util/ChatSwitcher;)Lcom/google/android/talk/TalkApp;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/talk/TalkApp;->getGenericAvatar()Landroid/graphics/drawable/Drawable;

    move-result-object v12

    move-object/from16 v6, p3

    invoke-virtual/range {v5 .. v12}, Lcom/google/android/talk/AvatarCache;->getAvatar(Landroid/database/Cursor;IILjava/lang/String;IILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v19

    goto/16 :goto_3

    .line 407
    :cond_4
    const-string v6, "talk"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ChatSwitcher.bindView: cannot find AvatarCache for provider="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object v0, v7

    move-wide/from16 v1, v27

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", account="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object v0, v7

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    move-object v6, v0

    invoke-static {v6}, Lcom/google/android/talk/util/ChatSwitcher;->access$300(Lcom/google/android/talk/util/ChatSwitcher;)Lcom/google/android/talk/TalkApp;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/talk/TalkApp;->getGenericAvatar()Landroid/graphics/drawable/Drawable;

    move-result-object v19

    goto/16 :goto_3

    .line 421
    .end local v5    # "avatarCache":Lcom/google/android/talk/AvatarCache;
    .restart local v34    # "tv":Landroid/widget/TextView;
    :cond_5
    const/4 v6, 0x0

    goto/16 :goto_4
.end method

.method public changeCursor(Landroid/database/Cursor;)V
    .locals 5
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    .line 332
    invoke-virtual {p0}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    .line 333
    .local v1, "oldCursor":Landroid/database/Cursor;
    if-ne v1, p1, :cond_1

    .line 351
    :cond_0
    :goto_0
    return-void

    .line 337
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/CursorAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 339
    if-eqz v1, :cond_3

    if-nez p1, :cond_3

    .line 341
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-static {v2}, Lcom/google/android/talk/util/ChatSwitcher;->access$100(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 342
    .local v0, "cr":Landroid/content/ContentResolver;
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 348
    .end local v0    # "cr":Landroid/content/ContentResolver;
    :cond_2
    :goto_1
    if-eqz v1, :cond_0

    .line 349
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 343
    :cond_3
    if-nez v1, :cond_2

    if-eqz p1, :cond_2

    .line 345
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-static {v2}, Lcom/google/android/talk/util/ChatSwitcher;->access$100(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 346
    .restart local v0    # "cr":Landroid/content/ContentResolver;
    sget-object v2, Landroid/provider/Im$Contacts;->CONTENT_URI_CHAT_CONTACTS:Landroid/net/Uri;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    goto :goto_1
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 327
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-static {v0}, Lcom/google/android/talk/util/ChatSwitcher;->access$200(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget v1, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->mLayout:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public validateCursor(Landroid/database/Cursor;)Z
    .locals 4
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    .line 354
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iget v2, v2, Lcom/google/android/talk/util/ChatSwitcher;->mAccountIdColumn:I

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 355
    .local v0, "accountId":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
