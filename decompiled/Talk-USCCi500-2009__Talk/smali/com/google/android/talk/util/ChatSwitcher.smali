.class public Lcom/google/android/talk/util/ChatSwitcher;
.super Ljava/lang/Object;
.source "ChatSwitcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;,
        Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;,
        Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;
    }
.end annotation


# static fields
.field private static final LOCAL_DEBUG:Z = true

.field private static final PROVIDER_CATEGORY_COLUMN:I = 0x0

.field private static final PROVIDER_CATEGORY_PROJECTION:[Ljava/lang/String;

.field private static final QUERY_SELECTION:Ljava/lang/String; = "provider=?"

.field private static final sPeriodicUpdatePeriod:J = 0xea60L

.field private static final sQueryToken:I = 0x1


# instance fields
.field public mAccountIdColumn:I

.field private mActivity:Landroid/app/Activity;

.field private mApp:Lcom/google/android/talk/TalkApp;

.field public mAvatarDataColumn:I

.field public mAvatarHashColumn:I

.field private mEmptyView:Landroid/view/View;

.field private mFocused:Landroid/view/View;

.field private mGridView:Landroid/widget/GridView;

.field public mGroupChatColumn:I

.field private mHandler:Landroid/os/Handler;

.field private mInflater:Landroid/view/LayoutInflater;

.field public mLastChatColumn:I

.field public mLastUnreadMessageColumn:I

.field public mNicknameColumn:I

.field private mOkToShowEmptyView:Z

.field private mOnCloseCallback:Ljava/lang/Runnable;

.field private mPreferMenuShortcut:Z

.field public mPresenceStatusColumn:I

.field public mProviderIdColumn:I

.field private mQueryHandler:Landroid/content/AsyncQueryHandler;

.field private mQuerySelectionArgs:[Ljava/lang/String;

.field public mShortcutColumn:I

.field private mSimpleUpdateRunnable:Ljava/lang/Runnable;

.field public mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

.field private mSwitcherCallback:Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;

.field private mSwitcherTitle:Landroid/widget/TextView;

.field private mSwitcherView:Landroid/view/View;

.field public mUsernameColumn:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 54
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "category"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/util/ChatSwitcher;->PROVIDER_CATEGORY_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Landroid/os/Handler;Lcom/google/android/talk/TalkApp;Landroid/view/LayoutInflater;Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;Ljava/lang/Runnable;Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V
    .locals 6
    .param p1, "a"    # Landroid/app/Activity;
    .param p2, "handler"    # Landroid/os/Handler;
    .param p3, "app"    # Lcom/google/android/talk/TalkApp;
    .param p4, "inflater"    # Landroid/view/LayoutInflater;
    .param p5, "switcher"    # Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;
    .param p6, "onClose"    # Ljava/lang/Runnable;
    .param p7, "onQueryCompleteCallback"    # Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    .prologue
    const/4 v5, 0x0

    const-string v4, "talk"

    .line 470
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-boolean v5, p0, Lcom/google/android/talk/util/ChatSwitcher;->mPreferMenuShortcut:Z

    .line 66
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mQuerySelectionArgs:[Ljava/lang/String;

    .line 613
    new-instance v1, Lcom/google/android/talk/util/ChatSwitcher$5;

    invoke-direct {v1, p0}, Lcom/google/android/talk/util/ChatSwitcher$5;-><init>(Lcom/google/android/talk/util/ChatSwitcher;)V

    iput-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSimpleUpdateRunnable:Ljava/lang/Runnable;

    .line 471
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    .line 472
    iput-object p3, p0, Lcom/google/android/talk/util/ChatSwitcher;->mApp:Lcom/google/android/talk/TalkApp;

    .line 473
    iput-object p2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mHandler:Landroid/os/Handler;

    .line 474
    iput-object p4, p0, Lcom/google/android/talk/util/ChatSwitcher;->mInflater:Landroid/view/LayoutInflater;

    .line 475
    iput-object p6, p0, Lcom/google/android/talk/util/ChatSwitcher;->mOnCloseCallback:Ljava/lang/Runnable;

    .line 476
    iput-object p5, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherCallback:Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;

    .line 478
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mApp:Lcom/google/android/talk/TalkApp;

    if-nez v1, :cond_0

    .line 479
    const-string v1, "talk"

    const-string v1, "mApp is null, bailing"

    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 569
    :goto_0
    return-void

    .line 484
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mApp:Lcom/google/android/talk/TalkApp;

    const-string v2, "GTalk"

    invoke-virtual {v1, v2}, Lcom/google/android/talk/TalkApp;->getProviderDef(Ljava/lang/String;)Lcom/google/android/talk/ProviderDef;

    move-result-object v0

    .line 485
    .local v0, "def":Lcom/google/android/talk/ProviderDef;
    if-nez v0, :cond_1

    .line 486
    const-string v1, "talk"

    const-string v1, "no provider def for GTALK, bailing"

    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 487
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 491
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mQuerySelectionArgs:[Ljava/lang/String;

    iget-wide v2, v0, Lcom/google/android/talk/ProviderDef;->mId:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    .line 493
    new-instance v1, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2, p1}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;-><init>(Lcom/google/android/talk/util/ChatSwitcher;Landroid/database/Cursor;Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    .line 495
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0b0014

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/GridView;

    iput-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    .line 496
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0b0015

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mEmptyView:Landroid/view/View;

    .line 497
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 498
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0b0013

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherTitle:Landroid/widget/TextView;

    .line 499
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    new-instance v2, Lcom/google/android/talk/util/ChatSwitcher$3;

    invoke-direct {v2, p0}, Lcom/google/android/talk/util/ChatSwitcher$3;-><init>(Lcom/google/android/talk/util/ChatSwitcher;)V

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 517
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/talk/util/ChatSwitcher;->setNumColumns(Landroid/content/res/Configuration;)V

    .line 519
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    const v2, 0x7f0b0012

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherView:Landroid/view/View;

    .line 521
    new-instance v1, Lcom/google/android/talk/util/ChatSwitcher$4;

    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-direct {v1, p0, v2, p7}, Lcom/google/android/talk/util/ChatSwitcher$4;-><init>(Lcom/google/android/talk/util/ChatSwitcher;Landroid/content/ContentResolver;Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V

    iput-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mQueryHandler:Landroid/content/AsyncQueryHandler;

    .line 565
    const-string v1, "talk"

    const/4 v1, 0x3

    invoke-static {v4, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 566
    const-string v1, "constructor: start query (TODO: only do this when necessary)"

    invoke-direct {p0, v1}, Lcom/google/android/talk/util/ChatSwitcher;->log(Ljava/lang/String;)V

    .line 568
    :cond_2
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->startQuery()V

    goto/16 :goto_0
.end method

.method static synthetic access$000(Lcom/google/android/talk/util/ChatSwitcher;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/google/android/talk/util/ChatSwitcher;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/google/android/talk/util/ChatSwitcher;Landroid/database/Cursor;ILjava/lang/String;JJ)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;
    .param p1, "x1"    # Landroid/database/Cursor;
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # J
    .param p6, "x5"    # J

    .prologue
    .line 51
    invoke-direct/range {p0 .. p7}, Lcom/google/android/talk/util/ChatSwitcher;->rotateChat(Landroid/database/Cursor;ILjava/lang/String;JJ)V

    return-void
.end method

.method static synthetic access$102(Lcom/google/android/talk/util/ChatSwitcher;Landroid/app/Activity;)Landroid/app/Activity;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;
    .param p1, "x1"    # Landroid/app/Activity;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    return-object p1
.end method

.method static synthetic access$200(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/view/LayoutInflater;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/talk/util/ChatSwitcher;)Lcom/google/android/talk/TalkApp;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mApp:Lcom/google/android/talk/TalkApp;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/talk/util/ChatSwitcher;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;

    .prologue
    .line 51
    iget-boolean v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mPreferMenuShortcut:Z

    return v0
.end method

.method static synthetic access$500(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/widget/GridView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    return-object v0
.end method

.method static synthetic access$602(Lcom/google/android/talk/util/ChatSwitcher;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;
    .param p1, "x1"    # Z

    .prologue
    .line 51
    iput-boolean p1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mOkToShowEmptyView:Z

    return p1
.end method

.method static synthetic access$700(Lcom/google/android/talk/util/ChatSwitcher;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->update()V

    return-void
.end method

.method static synthetic access$800(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$900(Lcom/google/android/talk/util/ChatSwitcher;Landroid/database/Cursor;I)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/util/ChatSwitcher;
    .param p1, "x1"    # Landroid/database/Cursor;
    .param p2, "x2"    # I

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(Landroid/database/Cursor;I)V

    return-void
.end method

.method private cancelPreviousQuery()V
    .locals 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mQueryHandler:Landroid/content/AsyncQueryHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/AsyncQueryHandler;->cancelOperation(I)V

    .line 104
    return-void
.end method

.method private static findCategory(Landroid/content/ContentResolver;J)Ljava/lang/String;
    .locals 8
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J

    .prologue
    const/4 v4, 0x0

    .line 573
    sget-object v1, Landroid/provider/Im$Provider;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/util/ChatSwitcher;->PROVIDER_CATEGORY_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id = "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 580
    .local v7, "providerCursor":Landroid/database/Cursor;
    const/4 v6, 0x0

    .line 582
    .local v6, "category":Ljava/lang/String;
    if-eqz v7, :cond_1

    .line 584
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 585
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v6

    .line 588
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 594
    :goto_0
    return-object v6

    .line 588
    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v0

    .line 591
    :cond_1
    const-string v0, "findCategory"

    invoke-static {v0}, Lcom/google/android/talk/util/ChatSwitcher;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private findCurrent(Landroid/database/Cursor;Ljava/lang/String;JJ)I
    .locals 3
    .param p1, "c"    # Landroid/database/Cursor;
    .param p2, "contact"    # Ljava/lang/String;
    .param p3, "accountId"    # J
    .param p5, "providerId"    # J

    .prologue
    const/4 v2, -0x1

    .line 722
    invoke-interface {p1, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 723
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 724
    iget v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mAccountIdColumn:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    cmp-long v0, v0, p3

    if-nez v0, :cond_0

    .line 727
    iget v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mProviderIdColumn:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    cmp-long v0, v0, p5

    if-nez v0, :cond_0

    .line 730
    iget v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mUsernameColumn:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 734
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    .line 736
    :goto_0
    return v0

    :cond_1
    move v0, v2

    goto :goto_0
.end method

.method private handleShortcut(Landroid/database/Cursor;I)V
    .locals 6
    .param p1, "c"    # Landroid/database/Cursor;
    .param p2, "key"    # I

    .prologue
    .line 690
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 702
    :cond_0
    :goto_0
    return-void

    .line 694
    :cond_1
    const/4 v2, -0x1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 695
    :cond_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 696
    iget v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mShortcutColumn:I

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 697
    .local v0, "shortcut":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_2

    const-wide/16 v2, 0xa

    cmp-long v2, v0, v2

    if-gez v2, :cond_2

    int-to-long v2, p2

    const-wide/16 v4, 0x30

    add-long/2addr v4, v0

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    .line 698
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v2

    invoke-virtual {p0, p1, v2}, Lcom/google/android/talk/util/ChatSwitcher;->select(Landroid/database/Cursor;I)V

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 783
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ChatSwitcher] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 784
    return-void
.end method

.method private static logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p0, "function"    # Ljava/lang/String;

    .prologue
    .line 787
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ChatSwitcher] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": empty cursor, possibly low memory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 788
    return-void
.end method

.method public static makeChatIntent(Landroid/content/ContentResolver;JJLjava/lang/String;JI)Landroid/content/Intent;
    .locals 3
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "provider"    # J
    .param p3, "account"    # J
    .param p5, "contact"    # Ljava/lang/String;
    .param p6, "contactId"    # J
    .param p8, "groupChat"    # I

    .prologue
    .line 599
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    sget-object v2, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, p6, p7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 601
    .local v0, "i":Landroid/content/Intent;
    invoke-static {p0, p1, p2}, Lcom/google/android/talk/util/ChatSwitcher;->findCategory(Landroid/content/ContentResolver;J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 602
    const-string v1, "from"

    invoke-virtual {v0, v1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 603
    const-string v1, "providerId"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 604
    const-string v1, "accountId"

    invoke-virtual {v0, v1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 606
    if-eqz p8, :cond_0

    .line 607
    const-string v1, "groupChat"

    invoke-virtual {v0, v1, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 610
    :cond_0
    return-object v0
.end method

.method private rotateChat(Landroid/database/Cursor;ILjava/lang/String;JJ)V
    .locals 9
    .param p1, "c"    # Landroid/database/Cursor;
    .param p2, "direction"    # I
    .param p3, "contact"    # Ljava/lang/String;
    .param p4, "accountId"    # J
    .param p6, "providerId"    # J

    .prologue
    .line 740
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v7

    .line 741
    .local v7, "count":I
    const/4 v0, 0x2

    if-ge v7, v0, :cond_1

    .line 758
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-wide v3, p4

    move-wide v5, p6

    .line 745
    invoke-direct/range {v0 .. v6}, Lcom/google/android/talk/util/ChatSwitcher;->findCurrent(Landroid/database/Cursor;Ljava/lang/String;JJ)I

    move-result v8

    .line 746
    .local v8, "position":I
    const/4 v0, -0x1

    if-eq v8, v0, :cond_0

    .line 750
    add-int/2addr v8, p2

    .line 751
    if-ne v8, v7, :cond_3

    .line 752
    const/4 v8, 0x0

    .line 757
    :cond_2
    :goto_1
    invoke-virtual {p0, p1, v8}, Lcom/google/android/talk/util/ChatSwitcher;->select(Landroid/database/Cursor;I)V

    goto :goto_0

    .line 753
    :cond_3
    const/4 v0, -0x1

    if-ne v8, v0, :cond_2

    .line 754
    const/4 v0, 0x1

    sub-int v8, v7, v0

    goto :goto_1
.end method

.method private setNumColumns(Landroid/content/res/Configuration;)V
    .locals 3
    .param p1, "config"    # Landroid/content/res/Configuration;

    .prologue
    .line 451
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    move v0, v1

    .line 452
    .local v0, "landscape":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 453
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 457
    :goto_1
    return-void

    .line 451
    .end local v0    # "landscape":Z
    :cond_0
    const/4 v1, 0x0

    move v0, v1

    goto :goto_0

    .line 455
    .restart local v0    # "landscape":Z
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setNumColumns(I)V

    goto :goto_1
.end method

.method private startQuery()V
    .locals 1

    .prologue
    .line 107
    new-instance v0, Lcom/google/android/talk/util/ChatSwitcher$1;

    invoke-direct {v0, p0}, Lcom/google/android/talk/util/ChatSwitcher$1;-><init>(Lcom/google/android/talk/util/ChatSwitcher;)V

    invoke-direct {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->startQuery(Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V

    .line 112
    return-void
.end method

.method private startQuery(Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V
    .locals 8
    .param p1, "runnable"    # Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    .prologue
    const/4 v4, 0x0

    .line 138
    const-string v0, "talk"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    const-string v0, "startQuery"

    invoke-direct {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->log(Ljava/lang/String;)V

    .line 142
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->cancelPreviousQuery()V

    .line 143
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mQueryHandler:Landroid/content/AsyncQueryHandler;

    const/4 v1, 0x1

    sget-object v3, Landroid/provider/Im$Contacts;->CONTENT_URI_CHAT_CONTACTS:Landroid/net/Uri;

    const-string v5, "provider=?"

    iget-object v6, p0, Lcom/google/android/talk/util/ChatSwitcher;->mQuerySelectionArgs:[Ljava/lang/String;

    move-object v2, p1

    move-object v7, v4

    invoke-virtual/range {v0 .. v7}, Landroid/content/AsyncQueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method private update()V
    .locals 1

    .prologue
    .line 640
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->notifyDataSetChanged()V

    .line 641
    return-void
.end method


# virtual methods
.method public close()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 199
    invoke-virtual {p0}, Lcom/google/android/talk/util/ChatSwitcher;->isOpen()Z

    move-result v2

    if-nez v2, :cond_1

    .line 234
    :cond_0
    :goto_0
    return-void

    .line 204
    :cond_1
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->cancelPreviousQuery()V

    .line 205
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSimpleUpdateRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 207
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherView:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 210
    new-instance v1, Landroid/view/animation/TranslateAnimation;

    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v1, v4, v4, v4, v2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 216
    .local v1, "outAnimation":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 217
    invoke-virtual {v1}, Landroid/view/animation/Animation;->startNow()V

    .line 218
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 220
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mOnCloseCallback:Ljava/lang/Runnable;

    if-eqz v2, :cond_2

    .line 221
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mOnCloseCallback:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 224
    :cond_2
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mFocused:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 225
    const/4 v0, -0x1

    .line 226
    .local v0, "id":I
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mFocused:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setNextFocusDownId(I)V

    .line 227
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mFocused:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setNextFocusUpId(I)V

    .line 228
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mFocused:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setNextFocusLeftId(I)V

    .line 229
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mFocused:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setNextFocusRightId(I)V

    .line 231
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mFocused:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    .line 232
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mFocused:Landroid/view/View;

    goto :goto_0
.end method

.method public closeCursor()V
    .locals 2

    .prologue
    .line 629
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 630
    return-void
.end method

.method public handleShortcut(I)V
    .locals 2
    .param p1, "key"    # I

    .prologue
    .line 705
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 706
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(Landroid/database/Cursor;I)V

    .line 719
    :goto_0
    return-void

    .line 708
    :cond_0
    const-string v0, "talk"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 709
    const-string v0, "handleShortcut"

    invoke-direct {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->log(Ljava/lang/String;)V

    .line 712
    :cond_1
    new-instance v0, Lcom/google/android/talk/util/ChatSwitcher$6;

    invoke-direct {v0, p0, p1}, Lcom/google/android/talk/util/ChatSwitcher$6;-><init>(Lcom/google/android/talk/util/ChatSwitcher;I)V

    invoke-direct {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->startQuery(Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V

    goto :goto_0
.end method

.method public intentForPosition(I)Landroid/content/Intent;
    .locals 13
    .param p1, "position"    # I

    .prologue
    .line 644
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v9

    .line 646
    .local v9, "c":Landroid/database/Cursor;
    if-eqz v9, :cond_0

    invoke-interface {v9, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 647
    :cond_0
    const-string v0, "talk"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "select: moved to pos="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " on cursor="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " failed"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v0, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 649
    const/4 v0, 0x0

    .line 661
    :goto_0
    return-object v0

    .line 652
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v0, p1}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getItemId(I)J

    move-result-wide v6

    .line 653
    .local v6, "contactId":J
    iget v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mUsernameColumn:I

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 654
    .local v5, "contact":Ljava/lang/String;
    iget v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mAccountIdColumn:I

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 655
    .local v3, "accountId":J
    iget v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mProviderIdColumn:I

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 656
    .local v1, "providerId":J
    iget v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGroupChatColumn:I

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 657
    .local v8, "groupChat":I
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static/range {v0 .. v8}, Lcom/google/android/talk/util/ChatSwitcher;->makeChatIntent(Landroid/content/ContentResolver;JJLjava/lang/String;JI)Landroid/content/Intent;

    move-result-object v10

    .local v10, "intent":Landroid/content/Intent;
    move-object v0, v10

    .line 661
    goto :goto_0
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 460
    invoke-direct {p0, p1}, Lcom/google/android/talk/util/ChatSwitcher;->setNumColumns(Landroid/content/res/Configuration;)V

    .line 461
    return-void
.end method

.method public onKey(Landroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 237
    invoke-virtual {p0}, Lcom/google/android/talk/util/ChatSwitcher;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 293
    :goto_0
    return v0

    .line 241
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_1
    :goto_1
    move v0, v1

    .line 293
    goto :goto_0

    .line 243
    :sswitch_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    .line 244
    invoke-virtual {p0}, Lcom/google/android/talk/util/ChatSwitcher;->close()V

    move v0, v2

    .line 245
    goto :goto_0

    .line 251
    :sswitch_1
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->keyboard:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_2

    .line 253
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_3

    .line 254
    iput-boolean v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mPreferMenuShortcut:Z

    .line 255
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->update()V

    :cond_2
    :goto_2
    move v0, v1

    .line 261
    goto :goto_0

    .line 256
    :cond_3
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_2

    .line 257
    iput-boolean v1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mPreferMenuShortcut:Z

    .line 258
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->update()V

    goto :goto_2

    .line 263
    :sswitch_2
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 266
    :sswitch_3
    const/16 v0, 0x31

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 269
    :sswitch_4
    const/16 v0, 0x32

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 272
    :sswitch_5
    const/16 v0, 0x33

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 275
    :sswitch_6
    const/16 v0, 0x34

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 278
    :sswitch_7
    const/16 v0, 0x35

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 281
    :sswitch_8
    const/16 v0, 0x36

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 284
    :sswitch_9
    const/16 v0, 0x37

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 287
    :sswitch_a
    const/16 v0, 0x38

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 290
    :sswitch_b
    const/16 v0, 0x39

    invoke-virtual {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    goto :goto_1

    .line 241
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x7 -> :sswitch_2
        0x8 -> :sswitch_3
        0x9 -> :sswitch_4
        0xa -> :sswitch_5
        0xb -> :sswitch_6
        0xc -> :sswitch_7
        0xd -> :sswitch_8
        0xe -> :sswitch_9
        0xf -> :sswitch_a
        0x10 -> :sswitch_b
        0x52 -> :sswitch_1
    .end sparse-switch
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 633
    invoke-virtual {p0}, Lcom/google/android/talk/util/ChatSwitcher;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 634
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->update()V

    .line 636
    :cond_0
    return-void
.end method

.method public open(Landroid/view/View;)V
    .locals 8
    .param p1, "focused"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 158
    invoke-virtual {p0}, Lcom/google/android/talk/util/ChatSwitcher;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 196
    :goto_0
    return-void

    .line 162
    :cond_0
    iput-boolean v7, p0, Lcom/google/android/talk/util/ChatSwitcher;->mOkToShowEmptyView:Z

    .line 163
    iput-boolean v7, p0, Lcom/google/android/talk/util/ChatSwitcher;->mPreferMenuShortcut:Z

    .line 165
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->update()V

    .line 167
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSimpleUpdateRunnable:Ljava/lang/Runnable;

    const-wide/32 v4, 0xea60

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 169
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherView:Landroid/view/View;

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 172
    new-instance v1, Landroid/view/animation/TranslateAnimation;

    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v1, v6, v6, v2, v6}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 178
    .local v1, "inAnimation":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 179
    invoke-virtual {v1}, Landroid/view/animation/Animation;->startNow()V

    .line 180
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 181
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherTitle:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    const v4, 0x7f0600a0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v6}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2}, Landroid/widget/GridView;->getId()I

    move-result v0

    .line 185
    .local v0, "id":I
    invoke-virtual {p1, v0}, Landroid/view/View;->setNextFocusDownId(I)V

    .line 186
    invoke-virtual {p1, v0}, Landroid/view/View;->setNextFocusUpId(I)V

    .line 187
    invoke-virtual {p1, v0}, Landroid/view/View;->setNextFocusLeftId(I)V

    .line 188
    invoke-virtual {p1, v0}, Landroid/view/View;->setNextFocusRightId(I)V

    .line 190
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2, v0}, Landroid/widget/GridView;->setNextFocusDownId(I)V

    .line 191
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2, v0}, Landroid/widget/GridView;->setNextFocusUpId(I)V

    .line 192
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2, v0}, Landroid/widget/GridView;->setNextFocusLeftId(I)V

    .line 193
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher;->mGridView:Landroid/widget/GridView;

    invoke-virtual {v2, v0}, Landroid/widget/GridView;->setNextFocusRightId(I)V

    .line 195
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher;->mFocused:Landroid/view/View;

    goto :goto_0
.end method

.method public requery()V
    .locals 2

    .prologue
    .line 130
    const-string v0, "talk"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    const-string v0, "requery"

    invoke-direct {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->log(Ljava/lang/String;)V

    .line 133
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->cancelPreviousQuery()V

    .line 134
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->startQuery()V

    .line 135
    return-void
.end method

.method public requery(Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V
    .locals 2
    .param p1, "r"    # Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    .prologue
    .line 115
    const-string v0, "talk"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "requery, OnQueryCompleteRunnable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->log(Ljava/lang/String;)V

    .line 118
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/util/ChatSwitcher;->cancelPreviousQuery()V

    .line 119
    new-instance v0, Lcom/google/android/talk/util/ChatSwitcher$2;

    invoke-direct {v0, p0, p1}, Lcom/google/android/talk/util/ChatSwitcher$2;-><init>(Lcom/google/android/talk/util/ChatSwitcher;Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V

    invoke-direct {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->startQuery(Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V

    .line 127
    return-void
.end method

.method public rotateChat(ILjava/lang/String;JJ)V
    .locals 8
    .param p1, "direction"    # I
    .param p2, "contact"    # Ljava/lang/String;
    .param p3, "accountId"    # J
    .param p5, "providerId"    # J

    .prologue
    .line 764
    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 780
    :goto_0
    return-void

    .line 767
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 768
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-wide v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/google/android/talk/util/ChatSwitcher;->rotateChat(Landroid/database/Cursor;ILjava/lang/String;JJ)V

    goto :goto_0

    .line 770
    :cond_1
    const-string v0, "talk"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 771
    const-string v0, "rotateChat"

    invoke-direct {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->log(Ljava/lang/String;)V

    .line 773
    :cond_2
    new-instance v0, Lcom/google/android/talk/util/ChatSwitcher$7;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-wide v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/google/android/talk/util/ChatSwitcher$7;-><init>(Lcom/google/android/talk/util/ChatSwitcher;ILjava/lang/String;JJ)V

    invoke-direct {p0, v0}, Lcom/google/android/talk/util/ChatSwitcher;->startQuery(Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V

    goto :goto_0
.end method

.method public select(Landroid/database/Cursor;I)V
    .locals 17
    .param p1, "c"    # Landroid/database/Cursor;
    .param p2, "position"    # I

    .prologue
    .line 665
    invoke-interface/range {p1 .. p2}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 666
    const-string v2, "talk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "select: moved to pos="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " on cursor="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " failed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 687
    :goto_0
    return-void

    .line 671
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    move-object v2, v0

    move-object v0, v2

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getItemId(I)J

    move-result-wide v8

    .line 672
    .local v8, "contactId":J
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mUsernameColumn:I

    move v2, v0

    move-object/from16 v0, p1

    move v1, v2

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 673
    .local v7, "contact":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mAccountIdColumn:I

    move v2, v0

    move-object/from16 v0, p1

    move v1, v2

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    .line 674
    .local v5, "accountId":J
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mProviderIdColumn:I

    move v2, v0

    move-object/from16 v0, p1

    move v1, v2

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 675
    .local v3, "providerId":J
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mGroupChatColumn:I

    move v2, v0

    move-object/from16 v0, p1

    move v1, v2

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 677
    .local v10, "groupChat":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    move-object v2, v0

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static/range {v2 .. v10}, Lcom/google/android/talk/util/ChatSwitcher;->makeChatIntent(Landroid/content/ContentResolver;JJLjava/lang/String;JI)Landroid/content/Intent;

    move-result-object v15

    .line 681
    .local v15, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherCallback:Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;

    move-object v2, v0

    if-eqz v2, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherCallback:Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;

    move-object v11, v0

    move-object v12, v7

    move-wide v13, v5

    move/from16 v16, p2

    invoke-interface/range {v11 .. v16}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;->switchTo(Ljava/lang/String;JLandroid/content/Intent;I)Z

    move-result v2

    if-nez v2, :cond_2

    .line 682
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    move-object v2, v0

    invoke-virtual {v2, v15}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 683
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mActivity:Landroid/app/Activity;

    move-object v2, v0

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 686
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/talk/util/ChatSwitcher;->close()V

    goto :goto_0
.end method
