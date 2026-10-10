.class public Lcom/google/android/talk/ChatView;
.super Landroid/widget/LinearLayout;
.source "ChatView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/ChatView$DeltaCursor;,
        Lcom/google/android/talk/ChatView$ConnectionStateListener;,
        Lcom/google/android/talk/ChatView$ChatAdapter;,
        Lcom/google/android/talk/ChatView$MessageItem;,
        Lcom/google/android/talk/ChatView$RequeryCallback;,
        Lcom/google/android/talk/ChatView$GroupChatInvitationListener;,
        Lcom/google/android/talk/ChatView$QueryHandler;
    }
.end annotation


# static fields
.field private static final CHAT_QUERY_TOKEN:I = 0xa

.field private static final CONTACT_ID_TOKEN:I = 0x14

.field private static final EMAIL_LOOKUP_CONTACT_ID_COLUMN_INDEX:I = 0x0

.field private static final EMAIL_LOOKUP_PROJECTION:[Ljava/lang/String;

.field private static final GROUP_CHAT_PREFIX:Ljava/lang/String; = "private-chat-"

.field private static final LIST_STATE_KEY:Ljava/lang/String; = "liststate"

.field private static final MESSAGE_PROJECTION:[Ljava/lang/String;

.field private static final MUC_APPROVAL_REQUESTED:Ljava/lang/String; = "mucrequest"

.field private static final SHOW_TIME_STAMP_INTERVAL:J = 0xea60L

.field private static SORT_ORDER:Ljava/lang/String;


# instance fields
.field private mAccountId:J

.field private mActivity:Landroid/app/Activity;

.field private mApp:Lcom/google/android/talk/TalkApp;

.field private mAvatar:Landroid/graphics/Bitmap;

.field private mBodyColumn:I

.field private mCachingStarted:Z

.field private mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

.field private mChatSession:Lcom/google/android/gtalkservice/IChatSession;

.field private mConnectionListener:Lcom/google/android/talk/ChatView$ConnectionStateListener;

.field private mContact:Ljava/lang/String;

.field private mContactId:J

.field private mContactInfoLoaded:Z

.field private mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

.field private mCustomPresence:Ljava/lang/String;

.field private mDateColumn:I

.field private mDeltaColumn:I

.field private mDismissNotificationWhenGainedFocus:Z

.field private mDisplaySentTimeColumn:I

.field private mErrorCodeColumn:I

.field private mGroupChat:Z

.field private mGroupChatApprovalRequested:Z

.field private final mGroupChatInvitationListener:Lcom/google/android/talk/ChatView$GroupChatInvitationListener;

.field private final mHandler:Landroid/os/Handler;

.field private mHistoryView:Landroid/widget/ListView;

.field private mHost:Lcom/google/android/talk/ChatScreen$ChatHost;

.field private mImSession:Lcom/google/android/gtalkservice/IImSession;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mInitialOtrCheckingDone:Z

.field private mIsOnline:Z

.field private mListState:Landroid/os/Parcelable;

.field private mMarkup:Lcom/google/android/talk/util/Markup;

.field private mMayHaveUnreadChat:Z

.field private mMucInviter:Ljava/lang/String;

.field private mMucPassword:Ljava/lang/String;

.field private mMucRoomAddress:Ljava/lang/String;

.field private mNickName:Ljava/lang/String;

.field private mNicknameColumn:I

.field private mOfflineTextColor:I

.field private mOnlineTextColor:I

.field private mPictureCache:Lcom/google/android/talk/PictureCache;

.field private mPresenceStatus:I

.field private mProviderId:J

.field private mQueryHandler:Lcom/google/android/talk/ChatView$QueryHandler;

.field private mQueryUri:Landroid/net/Uri;

.field private mRegistered:Z

.field private mRequeryCallback:Lcom/google/android/talk/ChatView$RequeryCallback;

.field private mResources:Landroid/content/res/Resources;

.field private mSessionInited:Z

.field private mStatusWarningView:Landroid/view/View;

.field private mTypeColumn:I

.field private mUrlList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mWarningIcon:Landroid/widget/ImageView;

.field private mWarningText:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 167
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "thread_id"

    aput-object v1, v0, v4

    const/4 v1, 0x2

    const-string v2, "nickname"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "body"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "date"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "type"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "err_code"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "err_msg"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "show_ts"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/ChatView;->MESSAGE_PROJECTION:[Ljava/lang/String;

    .line 179
    const-string v0, "date ASC"

    sput-object v0, Lcom/google/android/talk/ChatView;->SORT_ORDER:Ljava/lang/String;

    .line 193
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "contact_id"

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/android/talk/ChatView;->EMAIL_LOOKUP_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup$LayoutParams;Landroid/content/Intent;Landroid/database/Cursor;Landroid/os/Bundle;Lcom/google/android/talk/ChatScreen$ChatHost;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "lp"    # Landroid/view/ViewGroup$LayoutParams;
    .param p3, "intent"    # Landroid/content/Intent;
    .param p4, "cursor"    # Landroid/database/Cursor;
    .param p5, "savedState"    # Landroid/os/Bundle;
    .param p6, "host"    # Lcom/google/android/talk/ChatScreen$ChatHost;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 242
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 133
    iput-boolean v2, p0, Lcom/google/android/talk/ChatView;->mGroupChatApprovalRequested:Z

    .line 148
    new-instance v1, Lcom/google/android/talk/ChatView$ConnectionStateListener;

    invoke-direct {v1, p0}, Lcom/google/android/talk/ChatView$ConnectionStateListener;-><init>(Lcom/google/android/talk/ChatView;)V

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mConnectionListener:Lcom/google/android/talk/ChatView$ConnectionStateListener;

    .line 160
    iput-object v3, p0, Lcom/google/android/talk/ChatView;->mListState:Landroid/os/Parcelable;

    .line 188
    iput-boolean v2, p0, Lcom/google/android/talk/ChatView;->mCachingStarted:Z

    .line 221
    new-instance v1, Lcom/google/android/talk/ChatView$1;

    invoke-direct {v1, p0}, Lcom/google/android/talk/ChatView$1;-><init>(Lcom/google/android/talk/ChatView;)V

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mHandler:Landroid/os/Handler;

    .line 611
    new-instance v1, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;

    invoke-direct {v1, p0}, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;-><init>(Lcom/google/android/talk/ChatView;)V

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mGroupChatInvitationListener:Lcom/google/android/talk/ChatView$GroupChatInvitationListener;

    .line 693
    iput-object v3, p0, Lcom/google/android/talk/ChatView;->mRequeryCallback:Lcom/google/android/talk/ChatView$RequeryCallback;

    .line 245
    iput-object p6, p0, Lcom/google/android/talk/ChatView;->mHost:Lcom/google/android/talk/ChatScreen$ChatHost;

    .line 246
    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    move-object v1, v0

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mActivity:Landroid/app/Activity;

    .line 247
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mApp:Lcom/google/android/talk/TalkApp;

    .line 248
    new-instance v1, Lcom/google/android/talk/util/Markup;

    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/google/android/talk/util/Markup;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mMarkup:Lcom/google/android/talk/util/Markup;

    .line 249
    new-instance v1, Lcom/google/android/talk/ChatView$QueryHandler;

    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    invoke-direct {v1, p0, v2}, Lcom/google/android/talk/ChatView$QueryHandler;-><init>(Lcom/google/android/talk/ChatView;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mQueryHandler:Lcom/google/android/talk/ChatView$QueryHandler;

    .line 250
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mResources:Landroid/content/res/Resources;

    .line 251
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mResources:Landroid/content/res/Resources;

    const v2, 0x7f050005

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/ChatView;->mOnlineTextColor:I

    .line 252
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mResources:Landroid/content/res/Resources;

    const v2, 0x7f050006

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/ChatView;->mOfflineTextColor:I

    .line 254
    invoke-virtual {p0, p2}, Lcom/google/android/talk/ChatView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 256
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mInflater:Landroid/view/LayoutInflater;

    .line 257
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mInflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030008

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 259
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView;->setOrientation(I)V

    .line 262
    const v1, 0x7f0b001a

    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mHistoryView:Landroid/widget/ListView;

    .line 263
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mHistoryView:Landroid/widget/ListView;

    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 264
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mHistoryView:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 265
    const v1, 0x7f0b001b

    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mStatusWarningView:Landroid/view/View;

    .line 266
    const v1, 0x7f0b001c

    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mWarningIcon:Landroid/widget/ImageView;

    .line 267
    const v1, 0x7f0b001d

    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/google/android/talk/ChatView;->mWarningText:Landroid/widget/TextView;

    .line 269
    invoke-virtual {p0, p3, p4, p5}, Lcom/google/android/talk/ChatView;->initialize(Landroid/content/Intent;Landroid/database/Cursor;Landroid/os/Bundle;)V

    .line 270
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/talk/ChatView;Landroid/os/Message;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Landroid/os/Message;

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/google/android/talk/ChatView;->pictureLoaded(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/android/talk/ChatView;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-wide v0, p0, Lcom/google/android/talk/ChatView;->mContactId:J

    return-wide v0
.end method

.method static synthetic access$1002(Lcom/google/android/talk/ChatView;J)J
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # J

    .prologue
    .line 96
    iput-wide p1, p0, Lcom/google/android/talk/ChatView;->mContactId:J

    return-wide p1
.end method

.method static synthetic access$1100(Lcom/google/android/talk/ChatView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ChatView$QueryHandler;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mQueryHandler:Lcom/google/android/talk/ChatView$QueryHandler;

    return-object v0
.end method

.method static synthetic access$1300()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    sget-object v0, Lcom/google/android/talk/ChatView;->EMAIL_LOOKUP_PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/google/android/talk/ChatView;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget v0, p0, Lcom/google/android/talk/ChatView;->mNicknameColumn:I

    return v0
.end method

.method static synthetic access$1402(Lcom/google/android/talk/ChatView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/google/android/talk/ChatView;->mNicknameColumn:I

    return p1
.end method

.method static synthetic access$1500(Lcom/google/android/talk/ChatView;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget v0, p0, Lcom/google/android/talk/ChatView;->mBodyColumn:I

    return v0
.end method

.method static synthetic access$1502(Lcom/google/android/talk/ChatView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/google/android/talk/ChatView;->mBodyColumn:I

    return p1
.end method

.method static synthetic access$1600(Lcom/google/android/talk/ChatView;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget v0, p0, Lcom/google/android/talk/ChatView;->mDateColumn:I

    return v0
.end method

.method static synthetic access$1602(Lcom/google/android/talk/ChatView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/google/android/talk/ChatView;->mDateColumn:I

    return p1
.end method

.method static synthetic access$1700(Lcom/google/android/talk/ChatView;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget v0, p0, Lcom/google/android/talk/ChatView;->mTypeColumn:I

    return v0
.end method

.method static synthetic access$1702(Lcom/google/android/talk/ChatView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/google/android/talk/ChatView;->mTypeColumn:I

    return p1
.end method

.method static synthetic access$1800(Lcom/google/android/talk/ChatView;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget v0, p0, Lcom/google/android/talk/ChatView;->mDisplaySentTimeColumn:I

    return v0
.end method

.method static synthetic access$1802(Lcom/google/android/talk/ChatView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/google/android/talk/ChatView;->mDisplaySentTimeColumn:I

    return p1
.end method

.method static synthetic access$1900(Lcom/google/android/talk/ChatView;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget v0, p0, Lcom/google/android/talk/ChatView;->mErrorCodeColumn:I

    return v0
.end method

.method static synthetic access$1902(Lcom/google/android/talk/ChatView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/google/android/talk/ChatView;->mErrorCodeColumn:I

    return p1
.end method

.method static synthetic access$200(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ContactInfoQuery;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/google/android/talk/ChatView;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget v0, p0, Lcom/google/android/talk/ChatView;->mDeltaColumn:I

    return v0
.end method

.method static synthetic access$2002(Lcom/google/android/talk/ChatView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/google/android/talk/ChatView;->mDeltaColumn:I

    return p1
.end method

.method static synthetic access$2100(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ChatView$ChatAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/google/android/talk/ChatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->checkInitialOtrStatus()V

    return-void
.end method

.method static synthetic access$2300(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ChatScreen$ChatHost;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHost:Lcom/google/android/talk/ChatScreen$ChatHost;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/google/android/talk/ChatView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mMucInviter:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2402(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/google/android/talk/ChatView;->mMucInviter:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2500(Lcom/google/android/talk/ChatView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mMucRoomAddress:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2502(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/google/android/talk/ChatView;->mMucRoomAddress:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2600(Lcom/google/android/talk/ChatView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mMucPassword:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2602(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/google/android/talk/ChatView;->mMucPassword:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2700(Lcom/google/android/talk/ChatView;)Lcom/google/android/gtalkservice/IImSession;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/google/android/talk/ChatView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/talk/ChatView;->startGroupChatApproval(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/google/android/talk/ChatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->requeryForChatHistory()V

    return-void
.end method

.method static synthetic access$302(Lcom/google/android/talk/ChatView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Z

    .prologue
    .line 96
    iput-boolean p1, p0, Lcom/google/android/talk/ChatView;->mContactInfoLoaded:Z

    return p1
.end method

.method static synthetic access$3100(Lcom/google/android/talk/ChatView;)Landroid/view/LayoutInflater;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/google/android/talk/ChatView;)Landroid/content/res/Resources;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/google/android/talk/ChatView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/google/android/talk/ChatView;->mGroupChat:Z

    return v0
.end method

.method static synthetic access$3400(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/google/android/talk/ChatView;->getGroupchatShortname(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3500(Lcom/google/android/talk/ChatView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->getNickname()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3600(Lcom/google/android/talk/ChatView;J)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # J

    .prologue
    .line 96
    invoke-direct {p0, p1, p2}, Lcom/google/android/talk/ChatView;->scheduleRequery(J)V

    return-void
.end method

.method static synthetic access$3700(Lcom/google/android/talk/ChatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->cancelRequery()V

    return-void
.end method

.method static synthetic access$3800(Lcom/google/android/talk/ChatView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/google/android/talk/ChatView;->mIsOnline:Z

    return v0
.end method

.method static synthetic access$3802(Lcom/google/android/talk/ChatView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Z

    .prologue
    .line 96
    iput-boolean p1, p0, Lcom/google/android/talk/ChatView;->mIsOnline:Z

    return p1
.end method

.method static synthetic access$3900(Lcom/google/android/talk/ChatView;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget v0, p0, Lcom/google/android/talk/ChatView;->mOnlineTextColor:I

    return v0
.end method

.method static synthetic access$4000(Lcom/google/android/talk/ChatView;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget v0, p0, Lcom/google/android/talk/ChatView;->mOfflineTextColor:I

    return v0
.end method

.method static synthetic access$402(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/google/android/talk/ChatView;->mNickName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$4100(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/util/Markup;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mMarkup:Lcom/google/android/talk/util/Markup;

    return-object v0
.end method

.method static synthetic access$4200(Lcom/google/android/talk/ChatView;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$4300(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/PictureCache;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mPictureCache:Lcom/google/android/talk/PictureCache;

    return-object v0
.end method

.method static synthetic access$4400(Lcom/google/android/talk/ChatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->userActionDetected()V

    return-void
.end method

.method static synthetic access$4500(Lcom/google/android/talk/ChatView;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$4600(Lcom/google/android/talk/ChatView;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHistoryView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$4700(Lcom/google/android/talk/ChatView;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$4800(Lcom/google/android/talk/ChatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->removeRemoteListeners()V

    return-void
.end method

.method static synthetic access$502(Lcom/google/android/talk/ChatView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/google/android/talk/ChatView;->mPresenceStatus:I

    return p1
.end method

.method static synthetic access$602(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/google/android/talk/ChatView;->mCustomPresence:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$702(Lcom/google/android/talk/ChatView;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/google/android/talk/ChatView;->mAvatar:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$800(Lcom/google/android/talk/ChatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->updateWarningView()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/android/talk/ChatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->updateHost()V

    return-void
.end method

.method private addOffTheRecordStatusToMessageHistory()V
    .locals 5

    .prologue
    .line 518
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 519
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "body"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 520
    const-string v2, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 521
    const-string v2, "type"

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 528
    iget-wide v2, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-static {v2, v3, v4}, Landroid/provider/Im$Messages;->getOtrMessagesContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 529
    .local v0, "uri":Landroid/net/Uri;
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 530
    return-void
.end method

.method private cancelRequery()V
    .locals 2

    .prologue
    .line 733
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mRequeryCallback:Lcom/google/android/talk/ChatView$RequeryCallback;

    if-eqz v0, :cond_1

    .line 734
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "cancelRequery"

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 735
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mRequeryCallback:Lcom/google/android/talk/ChatView$RequeryCallback;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 736
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mRequeryCallback:Lcom/google/android/talk/ChatView$RequeryCallback;

    .line 738
    :cond_1
    return-void
.end method

.method private checkInitialOtrStatus()V
    .locals 5

    .prologue
    .line 581
    iget-boolean v2, p0, Lcom/google/android/talk/ChatView;->mInitialOtrCheckingDone:Z

    if-nez v2, :cond_0

    .line 582
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    if-nez v2, :cond_1

    .line 609
    :cond_0
    :goto_0
    return-void

    .line 586
    :cond_1
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

    invoke-virtual {v2}, Lcom/google/android/talk/ChatView$ChatAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 587
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 591
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/talk/ChatView;->mInitialOtrCheckingDone:Z

    .line 593
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-gtz v2, :cond_0

    .line 597
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 598
    const-string v2, "checkInitialOtrStatus: no chat history, check OTR status"

    invoke-direct {p0, v2}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 602
    :cond_2
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-interface {v2}, Lcom/google/android/gtalkservice/IChatSession;->isOffTheRecord()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 603
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->addOffTheRecordStatusToMessageHistory()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 605
    :catch_0
    move-exception v2

    move-object v1, v2

    .line 606
    .local v1, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isChatOffTheRecord caught "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private dismissChatNotification()V
    .locals 6

    .prologue
    const-string v5, "talk"

    .line 1619
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v2}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v1

    .line 1620
    .local v1, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-nez v1, :cond_0

    .line 1621
    const-string v2, "talk"

    const-string v2, "dismissChatNotification: no GTalkService object found!"

    invoke-static {v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1633
    :goto_0
    return-void

    .line 1626
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1627
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dismissChatNotification for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", provider="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lcom/google/android/talk/ChatView;->mProviderId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1629
    :cond_1
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    iget-wide v3, p0, Lcom/google/android/talk/ChatView;->mProviderId:J

    invoke-interface {v1, v2, v3, v4}, Lcom/google/android/gtalkservice/IGTalkService;->dismissNotificationFor(Ljava/lang/String;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1630
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1631
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    const-string v2, "dismissChatNotification: caught "

    invoke-static {v5, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private fixGroupchatNickname(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x40

    const/4 v2, -0x1

    .line 483
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ne v1, v2, :cond_0

    .line 484
    const/16 v1, 0x5f

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 485
    .local v0, "underscore":I
    if-le v0, v2, :cond_0

    .line 486
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 489
    .end local v0    # "underscore":I
    :cond_0
    return-object p1
.end method

.method private getGroupchatShortname(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "nickname"    # Ljava/lang/String;

    .prologue
    .line 496
    if-nez p1, :cond_0

    .line 497
    const/4 v1, 0x0

    .line 509
    :goto_0
    return-object v1

    .line 500
    :cond_0
    const/16 v1, 0x40

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 501
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 502
    const/16 v1, 0x5f

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 505
    :cond_1
    if-ltz v0, :cond_2

    .line 506
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_2
    move-object v1, p1

    .line 509
    goto :goto_0
.end method

.method private getNickname()Ljava/lang/String;
    .locals 2

    .prologue
    .line 760
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mNickName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 761
    iget-boolean v0, p0, Lcom/google/android/talk/ChatView;->mGroupChat:Z

    if-eqz v0, :cond_0

    .line 762
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mResources:Landroid/content/res/Resources;

    const v1, 0x7f060043

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 768
    :goto_0
    return-object v0

    .line 765
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/talk/StringUtils;->parseAbbreviatedAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 768
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mNickName:Ljava/lang/String;

    goto :goto_0
.end method

.method private gotoUrl(Landroid/net/Uri;)V
    .locals 3
    .param p1, "url"    # Landroid/net/Uri;

    .prologue
    .line 1724
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1725
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.android.browser.application_id"

    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1726
    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1727
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 1728
    return-void
.end method

.method private initAccountId(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedStates"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v2, 0x0

    const-string v4, "accountId"

    .line 1851
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "accountId"

    invoke-virtual {v0, v4, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    .line 1852
    iget-wide v0, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 1853
    const-string v0, "accountId"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    .line 1854
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initAccountId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1856
    :cond_0
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 397
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ChatView] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    return-void
.end method

.method private pictureLoaded(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 1260
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView$ChatAdapter;->notifyDataSetInvalidated()V

    .line 1261
    return-void
.end method

.method private removeRemoteListeners()V
    .locals 3

    .prologue
    .line 1447
    iget-boolean v1, p0, Lcom/google/android/talk/ChatView;->mRegistered:Z

    if-nez v1, :cond_1

    .line 1448
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1449
    const-string v1, "removeRemoteListeners: not registered, bail"

    invoke-direct {p0, v1}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1462
    :cond_0
    :goto_0
    return-void

    .line 1455
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    .line 1456
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mGroupChatInvitationListener:Lcom/google/android/talk/ChatView$GroupChatInvitationListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->removeGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V

    .line 1457
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/talk/ChatView;->mRegistered:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1459
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1460
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    const-string v2, "removeRemoteListeners caught "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private requeryForChatHistory()V
    .locals 2

    .prologue
    .line 712
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView$ChatAdapter;->showPlainText()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 713
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "defer requery cursor"

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 714
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatView$ChatAdapter;->setNeedRequeryCursor(Z)V

    .line 719
    :goto_0
    return-void

    .line 718
    :cond_1
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->startQueryForChatHistory()V

    goto :goto_0
.end method

.method private resolveChatUrlIntent(Landroid/content/Intent;Landroid/database/Cursor;)V
    .locals 13
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    const-wide/16 v11, 0x0

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, -0x1

    .line 1561
    const-string v7, "groupChat"

    invoke-virtual {p1, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 1562
    .local v4, "groupChat":I
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    invoke-static {v7}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    .line 1564
    .local v2, "contactId":J
    if-ne v4, v8, :cond_0

    .line 1565
    const-string v7, "type"

    invoke-interface {p2, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 1566
    .local v6, "typeColumn":I
    invoke-interface {p2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 1567
    .local v5, "type":I
    const/4 v7, 0x2

    if-ne v5, v7, :cond_2

    move v4, v10

    .line 1568
    :goto_0
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1569
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "resolveChatUrlIntent: contact type="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1574
    .end local v5    # "type":I
    .end local v6    # "typeColumn":I
    :cond_0
    const-string v7, "accountId"

    invoke-virtual {p1, v7, v11, v12}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 1575
    .local v0, "accountId":J
    const-string v7, "from"

    invoke-virtual {p1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    .line 1576
    const-string v7, "providerId"

    invoke-virtual {p1, v7, v11, v12}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v7

    iput-wide v7, p0, Lcom/google/android/talk/ChatView;->mProviderId:J

    .line 1578
    if-lez v4, :cond_3

    .line 1579
    iput-boolean v10, p0, Lcom/google/android/talk/ChatView;->mGroupChat:Z

    .line 1580
    iget-object v7, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    iput-object v7, p0, Lcom/google/android/talk/ChatView;->mMucRoomAddress:Ljava/lang/String;

    .line 1581
    invoke-static {v2, v3}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v7

    iput-object v7, p0, Lcom/google/android/talk/ChatView;->mQueryUri:Landroid/net/Uri;

    .line 1587
    :goto_1
    iget-object v7, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-static {v7}, Lcom/google/android/talk/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    .line 1589
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v7

    if-eqz v7, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "resolveChatUrlIntent: provider="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lcom/google/android/talk/ChatView;->mProviderId:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", account="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", contact="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", groupChat="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-boolean v8, p0, Lcom/google/android/talk/ChatView;->mGroupChat:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", queryUri="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/talk/ChatView;->mQueryUri:Landroid/net/Uri;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1592
    :cond_1
    return-void

    .end local v0    # "accountId":J
    .restart local v5    # "type":I
    .restart local v6    # "typeColumn":I
    :cond_2
    move v4, v9

    .line 1567
    goto/16 :goto_0

    .line 1583
    .end local v5    # "type":I
    .end local v6    # "typeColumn":I
    .restart local v0    # "accountId":J
    :cond_3
    iput-boolean v9, p0, Lcom/google/android/talk/ChatView;->mGroupChat:Z

    .line 1584
    iget-object v7, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-static {v0, v1, v7}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    iput-object v7, p0, Lcom/google/android/talk/ChatView;->mQueryUri:Landroid/net/Uri;

    goto :goto_1
.end method

.method private resolveIntent(Landroid/content/Intent;Landroid/database/Cursor;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1648
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 1649
    .local v1, "url":Landroid/net/Uri;
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 1651
    .local v0, "type":Ljava/lang/String;
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resolveIntent: url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1653
    :cond_0
    const-string v2, "vnd.android.cursor.item/gtalk-chats"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1654
    invoke-direct {p0, p1, p2}, Lcom/google/android/talk/ChatView;->resolveChatUrlIntent(Landroid/content/Intent;Landroid/database/Cursor;)V

    .line 1659
    :goto_0
    return-void

    .line 1656
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/talk/ChatView;->resolveMessageUrlIntent(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private resolveMessageUrlIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1595
    const-string v0, "is_muc"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/talk/ChatView;->mGroupChat:Z

    .line 1597
    const-string v0, "from"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    .line 1598
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mMucRoomAddress:Ljava/lang/String;

    .line 1599
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/talk/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    .line 1601
    const-string v0, "providerId"

    const-wide/16 v1, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/talk/ChatView;->mProviderId:J

    .line 1603
    const-string v0, "muc_inviter"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mMucInviter:Ljava/lang/String;

    .line 1604
    const-string v0, "muc_password"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mMucPassword:Ljava/lang/String;

    .line 1606
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mQueryUri:Landroid/net/Uri;

    .line 1608
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resolveMessageUrlIntent: queryUri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mQueryUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1616
    :cond_0
    return-void
.end method

.method private scheduleRequery(J)V
    .locals 2
    .param p1, "interval"    # J

    .prologue
    .line 722
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mRequeryCallback:Lcom/google/android/talk/ChatView$RequeryCallback;

    if-nez v0, :cond_1

    .line 723
    new-instance v0, Lcom/google/android/talk/ChatView$RequeryCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/talk/ChatView$RequeryCallback;-><init>(Lcom/google/android/talk/ChatView;Lcom/google/android/talk/ChatView$1;)V

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mRequeryCallback:Lcom/google/android/talk/ChatView$RequeryCallback;

    .line 728
    :goto_0
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "scheduleRequery"

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 729
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mRequeryCallback:Lcom/google/android/talk/ChatView$RequeryCallback;

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 730
    return-void

    .line 725
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mRequeryCallback:Lcom/google/android/talk/ChatView$RequeryCallback;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private startGroupChatApproval(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "inviter"    # Ljava/lang/String;
    .param p2, "room"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 615
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v1

    .line 617
    .local v1, "logModeDebug":Z
    if-eqz v1, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startGroupChatAppoval inviter="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", room = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 620
    :cond_0
    iget-boolean v2, p0, Lcom/google/android/talk/ChatView;->mGroupChatApprovalRequested:Z

    if-eqz v2, :cond_2

    .line 621
    if-eqz v1, :cond_1

    .line 622
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mGroupChatApprovalRequested="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/google/android/talk/ChatView;->mGroupChatApprovalRequested:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not starting another"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 636
    :cond_1
    :goto_0
    return-void

    .line 628
    :cond_2
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    const-class v3, Lcom/google/android/talk/GroupChatApproval;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 629
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "muc_inviter"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 630
    const-string v2, "approval"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 631
    const-string v2, "room"

    invoke-virtual {v0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 632
    const-string v2, "password"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 633
    const-string v2, "accountId"

    iget-wide v3, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 634
    iput-boolean v5, p0, Lcom/google/android/talk/ChatView;->mGroupChatApprovalRequested:Z

    .line 635
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2, v0, v5}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method private startQueryForChatHistory()V
    .locals 8

    .prologue
    const/16 v1, 0xa

    const/4 v2, 0x0

    .line 697
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mQueryHandler:Lcom/google/android/talk/ChatView$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatView$QueryHandler;->cancelOperation(I)V

    .line 699
    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mQueryUri:Landroid/net/Uri;

    .line 701
    .local v3, "uri":Landroid/net/Uri;
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startQueryForChatHistory: uri="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 703
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mQueryHandler:Lcom/google/android/talk/ChatView$QueryHandler;

    sget-object v4, Lcom/google/android/talk/ChatView;->MESSAGE_PROJECTION:[Ljava/lang/String;

    sget-object v7, Lcom/google/android/talk/ChatView;->SORT_ORDER:Ljava/lang/String;

    move-object v5, v2

    move-object v6, v2

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/talk/ChatView$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 709
    return-void
.end method

.method private updateHost()V
    .locals 1

    .prologue
    .line 401
    iget-boolean v0, p0, Lcom/google/android/talk/ChatView;->mContactInfoLoaded:Z

    if-eqz v0, :cond_0

    .line 402
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHost:Lcom/google/android/talk/ChatScreen$ChatHost;

    invoke-interface {v0, p0}, Lcom/google/android/talk/ChatScreen$ChatHost;->update(Landroid/view/View;)V

    .line 404
    :cond_0
    return-void
.end method

.method private updateWarningView()V
    .locals 8

    .prologue
    .line 1673
    const/16 v3, 0x8

    .line 1674
    .local v3, "visibility":I
    const/16 v0, 0x8

    .line 1675
    .local v0, "iconVisibility":I
    const/4 v1, 0x0

    .line 1677
    .local v1, "message":Ljava/lang/String;
    iget-boolean v4, p0, Lcom/google/android/talk/ChatView;->mContactInfoLoaded:Z

    if-eqz v4, :cond_0

    .line 1678
    iget-boolean v4, p0, Lcom/google/android/talk/ChatView;->mIsOnline:Z

    if-eqz v4, :cond_2

    .line 1679
    iget v4, p0, Lcom/google/android/talk/ChatView;->mPresenceStatus:I

    if-nez v4, :cond_0

    iget-boolean v4, p0, Lcom/google/android/talk/ChatView;->mGroupChat:Z

    if-nez v4, :cond_0

    .line 1680
    const/4 v3, 0x0

    .line 1682
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->getNickname()Ljava/lang/String;

    move-result-object v2

    .line 1683
    .local v2, "name":Ljava/lang/String;
    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mResources:Landroid/content/res/Resources;

    const v5, 0x7f06005a

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    const/4 v7, 0x1

    aput-object v2, v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1692
    .end local v2    # "name":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mStatusWarningView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1693
    if-nez v3, :cond_1

    .line 1694
    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mWarningIcon:Landroid/widget/ImageView;

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1695
    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mWarningText:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1697
    :cond_1
    return-void

    .line 1686
    :cond_2
    const/4 v3, 0x0

    .line 1687
    const/4 v0, 0x0

    .line 1688
    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mResources:Landroid/content/res/Resources;

    const v5, 0x7f060059

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private userActionDetected()V
    .locals 1

    .prologue
    .line 1264
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "user action detected..."

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1265
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/talk/ChatView;->handleUnreadMessages(Z)V

    .line 1266
    return-void
.end method


# virtual methods
.method public accountId()J
    .locals 2

    .prologue
    .line 393
    iget-wide v0, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    return-wide v0
.end method

.method public addRemoteListeners()V
    .locals 3

    .prologue
    .line 1429
    iget-boolean v1, p0, Lcom/google/android/talk/ChatView;->mRegistered:Z

    if-eqz v1, :cond_1

    .line 1430
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1431
    const-string v1, "addRemoteListeners: already registered, bail"

    invoke-direct {p0, v1}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1444
    :cond_0
    :goto_0
    return-void

    .line 1437
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    .line 1438
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mGroupChatInvitationListener:Lcom/google/android/talk/ChatView$GroupChatInvitationListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->addGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V

    .line 1439
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/talk/ChatView;->mRegistered:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1441
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1442
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    const-string v2, "addRemoteListeners caught "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public addToContacts()V
    .locals 2

    .prologue
    .line 389
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/google/android/talk/ChatScreen;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->addToContacts(Landroid/app/Activity;Ljava/lang/String;)V

    .line 390
    return-void
.end method

.method public bindContactHeaderWidget(Lcom/android/internal/widget/ContactHeaderWidget;)V
    .locals 10
    .param p1, "w"    # Lcom/android/internal/widget/ContactHeaderWidget;

    .prologue
    const/4 v9, 0x0

    .line 412
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView;->isGroupChat()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 416
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 417
    .local v4, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView;->getMucParticipants()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 418
    .local v3, "p":Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/google/android/talk/ChatView;->getGroupchatShortname(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 422
    .end local v3    # "p":Ljava/lang/String;
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 423
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    const/4 v6, 0x2

    sub-int/2addr v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 426
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5, v9}, Lcom/android/internal/widget/ContactHeaderWidget;->setDisplayName(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 427
    iget-object v5, p0, Lcom/google/android/talk/ChatView;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object p0, v5, Lcom/google/android/talk/TalkApp;->mGroupAvatar:Landroid/graphics/drawable/Drawable;

    .end local p0    # "this":Lcom/google/android/talk/ChatView;
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/android/internal/widget/ContactHeaderWidget;->setPhoto(Landroid/graphics/Bitmap;)V

    .line 428
    invoke-virtual {p1, v9}, Lcom/android/internal/widget/ContactHeaderWidget;->setSocialSnippet(Ljava/lang/CharSequence;)V

    .line 429
    const/4 v5, 0x5

    invoke-virtual {p1, v5}, Lcom/android/internal/widget/ContactHeaderWidget;->setPresence(I)V

    .line 430
    invoke-virtual {p1, v9}, Lcom/android/internal/widget/ContactHeaderWidget;->setContactUri(Landroid/net/Uri;)V

    .line 444
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v4    # "sb":Ljava/lang/StringBuilder;
    :goto_1
    return-void

    .line 432
    .restart local p0    # "this":Lcom/google/android/talk/ChatView;
    :cond_2
    iget-object v5, p0, Lcom/google/android/talk/ChatView;->mNickName:Ljava/lang/String;

    invoke-virtual {p1, v5, v9}, Lcom/android/internal/widget/ContactHeaderWidget;->setDisplayName(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 433
    iget-object v5, p0, Lcom/google/android/talk/ChatView;->mAvatar:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v5}, Lcom/android/internal/widget/ContactHeaderWidget;->setPhoto(Landroid/graphics/Bitmap;)V

    .line 434
    iget-object v5, p0, Lcom/google/android/talk/ChatView;->mCustomPresence:Ljava/lang/String;

    invoke-virtual {p1, v5}, Lcom/android/internal/widget/ContactHeaderWidget;->setSocialSnippet(Ljava/lang/CharSequence;)V

    .line 435
    iget v5, p0, Lcom/google/android/talk/ChatView;->mPresenceStatus:I

    invoke-virtual {p1, v5}, Lcom/android/internal/widget/ContactHeaderWidget;->setPresence(I)V

    .line 436
    invoke-virtual {p1, v9}, Lcom/android/internal/widget/ContactHeaderWidget;->setContactUri(Landroid/net/Uri;)V

    .line 438
    iget-wide v5, p0, Lcom/google/android/talk/ChatView;->mContactId:J

    const-wide/16 v7, -0x1

    cmp-long v5, v5, v7

    if-nez v5, :cond_3

    .line 439
    invoke-virtual {p1, v9}, Lcom/android/internal/widget/ContactHeaderWidget;->setContactUri(Landroid/net/Uri;)V

    goto :goto_1

    .line 441
    :cond_3
    sget-object v5, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v6, p0, Lcom/google/android/talk/ChatView;->mContactId:J

    invoke-static {v5, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/android/internal/widget/ContactHeaderWidget;->setContactUri(Landroid/net/Uri;)V

    goto :goto_1
.end method

.method public clearChat()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 2244
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mQueryUri:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2245
    return-void
.end method

.method public clearScrollingCache()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 208
    iget-boolean v0, p0, Lcom/google/android/talk/ChatView;->mCachingStarted:Z

    if-eqz v0, :cond_2

    .line 209
    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 210
    iget v0, p0, Lcom/google/android/talk/ChatView;->mPersistentDrawingCache:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    .line 211
    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView;->setChildrenDrawingCacheEnabled(Z)V

    .line 213
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView;->isAlwaysDrawnWithCacheEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 214
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView;->invalidate()V

    .line 216
    :cond_1
    iput-boolean v1, p0, Lcom/google/android/talk/ChatView;->mCachingStarted:Z

    .line 218
    :cond_2
    return-void
.end method

.method public createScrollingCache()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 200
    iget-boolean v0, p0, Lcom/google/android/talk/ChatView;->mCachingStarted:Z

    if-nez v0, :cond_0

    .line 201
    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 202
    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatView;->setChildrenDrawingCacheEnabled(Z)V

    .line 203
    iput-boolean v1, p0, Lcom/google/android/talk/ChatView;->mCachingStarted:Z

    .line 205
    :cond_0
    return-void
.end method

.method public focus()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 376
    iput-boolean v0, p0, Lcom/google/android/talk/ChatView;->mMayHaveUnreadChat:Z

    .line 380
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView;->addRemoteListeners()V

    .line 382
    invoke-virtual {p0, v0}, Lcom/google/android/talk/ChatView;->handleUnreadMessages(Z)V

    .line 383
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/talk/ChatView;->mDismissNotificationWhenGainedFocus:Z

    .line 385
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->updateHost()V

    .line 386
    return-void
.end method

.method public getAccountId()J
    .locals 2

    .prologue
    .line 372
    iget-wide v0, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    return-wide v0
.end method

.method public getContact()Ljava/lang/String;
    .locals 1

    .prologue
    .line 364
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    return-object v0
.end method

.method public getCursor()Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 683
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView$ChatAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public getMucParticipants()[Ljava/lang/String;
    .locals 13

    .prologue
    const-string v12, "private-chat-"

    const-string v11, " to muc participant set"

    .line 1371
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 1373
    .local v7, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v4

    .line 1376
    .local v4, "logModeDebug":Z
    :try_start_0
    iget-object v8, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-interface {v8}, Lcom/google/android/gtalkservice/IChatSession;->getParticipants()[Ljava/lang/String;

    move-result-object v6

    .line 1377
    .local v6, "participants":[Ljava/lang/String;
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v5, v0, v2

    .line 1378
    .local v5, "p":Ljava/lang/String;
    invoke-direct {p0, v5}, Lcom/google/android/talk/ChatView;->fixGroupchatNickname(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1379
    const-string v8, "private-chat-"

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 1380
    if-eqz v4, :cond_0

    .line 1381
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Adding ChatSession participant "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " to muc participant set"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1383
    :cond_0
    invoke-interface {v7, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1377
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1386
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "p":Ljava/lang/String;
    .end local v6    # "participants":[Ljava/lang/String;
    :catch_0
    move-exception v8

    move-object v1, v8

    .line 1387
    .local v1, "ex":Landroid/os/RemoteException;
    const-string v8, "talk"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "leaveChat: caught "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1391
    .end local v1    # "ex":Landroid/os/RemoteException;
    :cond_2
    iget-object v8, p0, Lcom/google/android/talk/ChatView;->mMucInviter:Ljava/lang/String;

    if-eqz v8, :cond_4

    .line 1392
    iget-object v8, p0, Lcom/google/android/talk/ChatView;->mMucInviter:Ljava/lang/String;

    const-string v9, "private-chat-"

    invoke-virtual {v8, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 1393
    if-eqz v4, :cond_3

    .line 1394
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Adding mMucInviter "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/google/android/talk/ChatView;->mMucInviter:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " to muc participant set"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1396
    :cond_3
    iget-object v8, p0, Lcom/google/android/talk/ChatView;->mMucInviter:Ljava/lang/String;

    invoke-static {v8}, Lcom/google/android/talk/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1401
    :cond_4
    iget-object v8, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    if-eqz v8, :cond_6

    .line 1402
    iget-object v8, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    const-string v9, "private-chat-"

    invoke-virtual {v8, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_6

    .line 1403
    if-eqz v4, :cond_5

    .line 1404
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Adding mContact "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " to muc participant set"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1406
    :cond_5
    iget-object v8, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-static {v8}, Lcom/google/android/talk/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1410
    :cond_6
    invoke-interface {v7}, Ljava/util/Set;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-interface {v7, v8}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/talk/ChatView;
    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method public getProviderId()J
    .locals 2

    .prologue
    .line 368
    iget-wide v0, p0, Lcom/google/android/talk/ChatView;->mProviderId:J

    return-wide v0
.end method

.method public getSession()Lcom/google/android/gtalkservice/IChatSession;
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    .prologue
    .line 447
    iget v0, p0, Lcom/google/android/talk/ChatView;->mPresenceStatus:I

    return v0
.end method

.method public goOffTheRecord(Z)V
    .locals 5
    .param p1, "flag"    # Z

    .prologue
    .line 1415
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1416
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1417
    iget-boolean v2, p0, Lcom/google/android/talk/ChatView;->mGroupChat:Z

    if-eqz v2, :cond_0

    .line 1419
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-interface {v2, v3, p1}, Lcom/google/android/gtalkservice/IImSession;->goOffRecordInRoom(Ljava/lang/String;Z)V

    .line 1426
    .end local v1    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_0
    return-void

    .line 1421
    .restart local v1    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v2, v1, p1}, Lcom/google/android/gtalkservice/IImSession;->goOffRecordWithContacts(Ljava/util/List;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1423
    .end local v1    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1424
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "goOffTheRecord caught "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public handleUnreadMessages(Z)V
    .locals 4
    .param p1, "forced"    # Z

    .prologue
    .line 741
    iget-boolean v1, p0, Lcom/google/android/talk/ChatView;->mMayHaveUnreadChat:Z

    if-nez v1, :cond_0

    if-nez p1, :cond_0

    .line 757
    :goto_0
    return-void

    .line 745
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->dismissChatNotification()V

    .line 749
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    if-eqz v1, :cond_1

    .line 750
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-interface {v1}, Lcom/google/android/gtalkservice/IChatSession;->markAsRead()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 756
    :cond_1
    :goto_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/talk/ChatView;->mMayHaveUnreadChat:Z

    goto :goto_0

    .line 752
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 753
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleUnreadMessages caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public initSession(Z)Z
    .locals 8
    .param p1, "force"    # Z

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    const-string v7, "talk"

    .line 1338
    iget-boolean v3, p0, Lcom/google/android/talk/ChatView;->mSessionInited:Z

    if-eqz v3, :cond_0

    if-nez p1, :cond_0

    move v3, v5

    .line 1365
    :goto_0
    return v3

    .line 1343
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v3}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v2

    .line 1344
    .local v2, "service":Lcom/google/android/gtalkservice/IGTalkService;
    iget-wide v3, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    invoke-interface {v2, v3, v4}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    .line 1346
    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v3, :cond_1

    .line 1347
    const-string v3, "talk"

    const-string v4, "initSession: mImSession is null, not ready"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v6

    .line 1348
    goto :goto_0

    .line 1351
    :cond_1
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v1

    .line 1352
    .local v1, "logModeVerbose":Z
    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-interface {v3, v4}, Lcom/google/android/gtalkservice/IImSession;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    .line 1353
    if-eqz v1, :cond_2

    .line 1354
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initSession: getChatSession returned "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1357
    :cond_2
    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    if-eqz v3, :cond_3

    .line 1358
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->checkInitialOtrStatus()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1364
    .end local v1    # "logModeVerbose":Z
    .end local v2    # "service":Lcom/google/android/gtalkservice/IGTalkService;
    :cond_3
    :goto_1
    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    if-eqz v3, :cond_4

    move v3, v5

    :goto_2
    iput-boolean v3, p0, Lcom/google/android/talk/ChatView;->mSessionInited:Z

    move v3, v5

    .line 1365
    goto :goto_0

    .line 1360
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 1361
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v3, "talk"

    const-string v3, "initSession: caught "

    invoke-static {v7, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .end local v0    # "ex":Landroid/os/RemoteException;
    :cond_4
    move v3, v6

    .line 1364
    goto :goto_2
.end method

.method public initialize(Landroid/content/Intent;Landroid/database/Cursor;Landroid/os/Bundle;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "savedState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v6, 0x1

    .line 274
    invoke-direct {p0, p1, p2}, Lcom/google/android/talk/ChatView;->resolveIntent(Landroid/content/Intent;Landroid/database/Cursor;)V

    .line 275
    invoke-direct {p0, p3}, Lcom/google/android/talk/ChatView;->initAccountId(Landroid/os/Bundle;)V

    .line 276
    iput-boolean v2, p0, Lcom/google/android/talk/ChatView;->mContactInfoLoaded:Z

    .line 277
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHost:Lcom/google/android/talk/ChatScreen$ChatHost;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/google/android/talk/ChatScreen$ChatHost;->getCachedContactId(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/talk/ChatView;->mContactId:J

    .line 279
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->updateHost()V

    .line 281
    new-instance v0, Lcom/google/android/talk/ChatView$ChatAdapter;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1, v3}, Lcom/google/android/talk/ChatView$ChatAdapter;-><init>(Lcom/google/android/talk/ChatView;Landroid/content/Context;Landroid/database/Cursor;)V

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

    .line 282
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHistoryView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 283
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHistoryView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mChatAdapter:Lcom/google/android/talk/ChatView$ChatAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 287
    iput-boolean v6, p0, Lcom/google/android/talk/ChatView;->mMayHaveUnreadChat:Z

    .line 289
    invoke-virtual {p0, v2}, Lcom/google/android/talk/ChatView;->initSession(Z)Z

    .line 291
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    iget-wide v1, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    invoke-static {v0, v1, v2, v6}, Lcom/google/android/talk/PictureCache;->getInstance(Ljava/lang/String;JZ)Lcom/google/android/talk/PictureCache;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mPictureCache:Lcom/google/android/talk/PictureCache;

    .line 293
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] initialize: query contact info and message history..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    :cond_0
    new-instance v5, Lcom/google/android/talk/ChatView$2;

    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mHandler:Landroid/os/Handler;

    invoke-direct {v5, p0, v0}, Lcom/google/android/talk/ChatView$2;-><init>(Lcom/google/android/talk/ChatView;Landroid/os/Handler;)V

    .line 311
    .local v5, "observer":Landroid/database/ContentObserver;
    new-instance v0, Lcom/google/android/talk/ContactInfoQuery;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    iget-wide v2, p0, Lcom/google/android/talk/ChatView;->mAccountId:J

    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mContact:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lcom/google/android/talk/ContactInfoQuery;-><init>(Landroid/content/Context;JLjava/lang/String;Landroid/database/ContentObserver;Z)V

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    .line 312
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    new-instance v1, Lcom/google/android/talk/ChatView$3;

    invoke-direct {v1, p0}, Lcom/google/android/talk/ChatView$3;-><init>(Lcom/google/android/talk/ChatView;)V

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ContactInfoQuery;->setContactInfoCallback(Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;)V

    .line 344
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    invoke-virtual {v0}, Lcom/google/android/talk/ContactInfoQuery;->startQueryForContactInfo()V

    .line 346
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->startQueryForChatHistory()V

    .line 348
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v0, :cond_1

    .line 350
    :try_start_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mConnectionListener:Lcom/google/android/talk/ChatView$ConnectionStateListener;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v1}, Lcom/google/android/gtalkservice/IImSession;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/ChatView$ConnectionStateListener;->connectionStateChanged(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V

    .line 351
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mConnectionListener:Lcom/google/android/talk/ChatView$ConnectionStateListener;

    invoke-interface {v0, v1}, Lcom/google/android/gtalkservice/IImSession;->addConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 356
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->updateWarningView()V

    .line 357
    return-void

    .line 352
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public isGroupChat()Z
    .locals 1

    .prologue
    .line 679
    iget-boolean v0, p0, Lcom/google/android/talk/ChatView;->mGroupChat:Z

    return v0
.end method

.method public isOffTheRecord()Z
    .locals 2

    .prologue
    .line 1540
    const/4 v0, 0x0

    .line 1541
    .local v0, "isOffTheRecord":Z
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    if-eqz v1, :cond_0

    .line 1543
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-interface {v1}, Lcom/google/android/gtalkservice/IChatSession;->isOffTheRecord()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1547
    :cond_0
    :goto_0
    return v0

    .line 1544
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public leaveChat()V
    .locals 4

    .prologue
    .line 1552
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    if-eqz v1, :cond_0

    .line 1553
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-interface {v1}, Lcom/google/android/gtalkservice/IChatSession;->leave()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1558
    :cond_0
    :goto_0
    return-void

    .line 1555
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1556
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "leaveChat: caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public newMessageReceived()V
    .locals 1

    .prologue
    .line 2248
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/talk/ChatView;->mMayHaveUnreadChat:Z

    .line 2249
    return-void
.end method

.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1859
    if-ltz p2, :cond_0

    .line 1860
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mUrlList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->gotoUrl(Landroid/net/Uri;)V

    .line 1862
    :cond_0
    return-void
.end method

.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 12
    .param p1, "parent"    # Landroid/widget/AdapterView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 1733
    instance-of v9, p2, Lcom/google/android/talk/ChatView$MessageItem;

    if-nez v9, :cond_0

    .line 1797
    :goto_0
    return-void

    .line 1737
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->userActionDetected()V

    .line 1739
    move-object v0, p2

    check-cast v0, Lcom/google/android/talk/ChatView$MessageItem;

    move-object v7, v0

    .line 1740
    .local v7, "m":Lcom/google/android/talk/ChatView$MessageItem;
    invoke-virtual {v7}, Lcom/google/android/talk/ChatView$MessageItem;->getMessageLinks()[Landroid/text/style/URLSpan;

    move-result-object v6

    .line 1742
    .local v6, "links":[Landroid/text/style/URLSpan;
    array-length v9, v6

    if-nez v9, :cond_1

    .line 1743
    const-string v9, "talk"

    const-string v10, "onItemClick no links"

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1745
    :cond_1
    array-length v9, v6

    const/4 v10, 0x1

    if-ne v9, v10, :cond_2

    .line 1747
    const/4 v9, 0x0

    aget-object v9, v6, v9

    invoke-virtual {v9}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/google/android/talk/ChatView;->gotoUrl(Landroid/net/Uri;)V

    goto :goto_0

    .line 1750
    :cond_2
    new-instance v9, Ljava/util/ArrayList;

    array-length v10, v6

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v9, p0, Lcom/google/android/talk/ChatView;->mUrlList:Ljava/util/ArrayList;

    .line 1752
    move-object v2, v6

    .local v2, "arr$":[Landroid/text/style/URLSpan;
    array-length v5, v2

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1
    if-ge v4, v5, :cond_3

    aget-object v8, v2, v4

    .line 1753
    .local v8, "u":Landroid/text/style/URLSpan;
    iget-object v9, p0, Lcom/google/android/talk/ChatView;->mUrlList:Ljava/util/ArrayList;

    invoke-virtual {v8}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1752
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1756
    .end local v8    # "u":Landroid/text/style/URLSpan;
    :cond_3
    new-instance v1, Lcom/google/android/talk/ChatView$4;

    iget-object v9, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    const v10, 0x1090011

    iget-object v11, p0, Lcom/google/android/talk/ChatView;->mUrlList:Ljava/util/ArrayList;

    invoke-direct {v1, p0, v9, v10, v11}, Lcom/google/android/talk/ChatView$4;-><init>(Lcom/google/android/talk/ChatView;Landroid/content/Context;ILjava/util/List;)V

    .line 1784
    .local v1, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v9, p0, Lcom/google/android/talk/ChatView;->mContext:Landroid/content/Context;

    invoke-direct {v3, v9}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1786
    .local v3, "b":Landroid/app/AlertDialog$Builder;
    const v9, 0x7f06005b

    invoke-virtual {v3, v9}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1787
    const/4 v9, 0x1

    invoke-virtual {v3, v9}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1788
    invoke-virtual {v3, v1, p0}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1790
    const v9, 0x7f060034

    new-instance v10, Lcom/google/android/talk/ChatView$5;

    invoke-direct {v10, p0}, Lcom/google/android/talk/ChatView$5;-><init>(Lcom/google/android/talk/ChatView;)V

    invoke-virtual {v3, v9, v10}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1796
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keycode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1701
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 1702
    const-string v0, "Back button pressed, finish activity"

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1703
    iget-object v0, p0, Lcom/google/android/talk/ChatView;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 1704
    const/4 v0, 0x1

    .line 1707
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onRestart()V
    .locals 2

    .prologue
    .line 1662
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    invoke-virtual {v1}, Lcom/google/android/talk/ContactInfoQuery;->startQueryForContactInfo()V

    .line 1664
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 1665
    .local v0, "cursor":Landroid/database/Cursor;
    if-nez v0, :cond_0

    .line 1666
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->startQueryForChatHistory()V

    .line 1670
    :goto_0
    return-void

    .line 1668
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->requeryForChatHistory()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 3

    .prologue
    .line 451
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    invoke-virtual {v1}, Lcom/google/android/talk/ContactInfoQuery;->cleanupContactInfoCursor()V

    .line 453
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 454
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 455
    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 458
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->cancelRequery()V

    .line 459
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView;->unfocus()V

    .line 461
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mConnectionListener:Lcom/google/android/talk/ChatView$ConnectionStateListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->removeConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 465
    :goto_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/talk/ChatView;->mSessionInited:Z

    .line 466
    return-void

    .line 462
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .param p1, "hasFocus"    # Z

    .prologue
    .line 1712
    if-eqz p1, :cond_0

    .line 1713
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView;->addRemoteListeners()V

    .line 1714
    iget-boolean v0, p0, Lcom/google/android/talk/ChatView;->mDismissNotificationWhenGainedFocus:Z

    invoke-virtual {p0, v0}, Lcom/google/android/talk/ChatView;->handleUnreadMessages(Z)V

    .line 1719
    :goto_0
    return-void

    .line 1716
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->removeRemoteListeners()V

    .line 1717
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/talk/ChatView;->mDismissNotificationWhenGainedFocus:Z

    goto :goto_0
.end method

.method public restoreState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 1527
    if-nez p1, :cond_1

    .line 1537
    :cond_0
    :goto_0
    return-void

    .line 1532
    :cond_1
    const-string v0, "liststate"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/ChatView;->mListState:Landroid/os/Parcelable;

    .line 1533
    const-string v0, "mucrequest"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/talk/ChatView;->mGroupChatApprovalRequested:Z

    .line 1534
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1535
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mGroupChatApprovalRequested="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/google/android/talk/ChatView;->mGroupChatApprovalRequested:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public restoreUnsentComposedMessage(Landroid/widget/TextView;)V
    .locals 4
    .param p1, "chatInputField"    # Landroid/widget/TextView;

    .prologue
    .line 1506
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    if-nez v2, :cond_0

    .line 1524
    :goto_0
    return-void

    .line 1508
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-interface {v2}, Lcom/google/android/gtalkservice/IChatSession;->getUnsentComposedMessage()Ljava/lang/String;

    move-result-object v1

    .line 1509
    .local v1, "unsentComposedMessage":Ljava/lang/String;
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1510
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "restoreUnsentComposedMessage to this: \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1512
    :cond_1
    if-eqz v1, :cond_2

    .line 1513
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1517
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lcom/google/android/gtalkservice/IChatSession;->saveUnsentComposedMessage(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1521
    .end local v1    # "unsentComposedMessage":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1522
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    const-string v3, "restoreUnsentComposedMessage: caught "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 1519
    .end local v0    # "ex":Landroid/os/RemoteException;
    .restart local v1    # "unsentComposedMessage":Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string v2, ""

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public saveState(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 1480
    if-nez p1, :cond_0

    .line 1503
    :goto_0
    return-void

    .line 1485
    :cond_0
    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mHistoryView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/talk/ChatView;->mListState:Landroid/os/Parcelable;

    .line 1486
    const-string v3, "liststate"

    iget-object v4, p0, Lcom/google/android/talk/ChatView;->mListState:Landroid/os/Parcelable;

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1489
    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v3, :cond_2

    .line 1491
    :try_start_0
    iget-object v3, p0, Lcom/google/android/talk/ChatView;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v3}, Lcom/google/android/gtalkservice/IImSession;->getAccountId()J

    move-result-wide v0

    .line 1493
    .local v0, "accountId":J
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1494
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onSaveInstanceState: store account id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1496
    :cond_1
    const-string v3, "accountId"

    invoke-virtual {p1, v3, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1502
    .end local v0    # "accountId":J
    :cond_2
    :goto_1
    const-string v3, "mucrequest"

    iget-boolean v4, p0, Lcom/google/android/talk/ChatView;->mGroupChatApprovalRequested:Z

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 1497
    :catch_0
    move-exception v3

    move-object v2, v3

    .line 1498
    .local v2, "ex":Landroid/os/RemoteException;
    const-string v3, "talk"

    const-string v4, "onSaveInstanceState: caught "

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public saveUnsentComposedMessage(Landroid/widget/TextView;)V
    .locals 4
    .param p1, "chatInputField"    # Landroid/widget/TextView;

    .prologue
    .line 1465
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 1467
    .local v1, "unsentComposedMessage":Ljava/lang/String;
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeVerbose()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1468
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "saveUnsentComposedMessage: \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/talk/ChatView;->log(Ljava/lang/String;)V

    .line 1470
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    if-eqz v2, :cond_1

    .line 1472
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-interface {v2, v1}, Lcom/google/android/gtalkservice/IChatSession;->saveUnsentComposedMessage(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1477
    :cond_1
    :goto_0
    return-void

    .line 1473
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1474
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    const-string v3, "saveUnsentComposedMessage: caught "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public sendMessage(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1636
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1645
    :goto_0
    return-void

    .line 1641
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-interface {v1, p1}, Lcom/google/android/gtalkservice/IChatSession;->sendChatMessage(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1642
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1643
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    const-string v2, "sendMessage: caught "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public unfocus()V
    .locals 1

    .prologue
    .line 472
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/talk/ChatView;->handleUnreadMessages(Z)V

    .line 473
    invoke-direct {p0}, Lcom/google/android/talk/ChatView;->removeRemoteListeners()V

    .line 474
    return-void
.end method
