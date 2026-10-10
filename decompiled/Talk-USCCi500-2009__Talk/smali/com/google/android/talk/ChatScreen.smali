.class public Lcom/google/android/talk/ChatScreen;
.super Landroid/app/Activity;
.source "ChatScreen.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/ChatScreen$ChatHost;,
        Lcom/google/android/talk/ChatScreen$GroupChatConverted;,
        Lcom/google/android/talk/ChatScreen$ChatListener;,
        Lcom/google/android/talk/ChatScreen$GalleryAdapter;,
        Lcom/google/android/talk/ChatScreen$ChatRunnable;
    }
.end annotation


# static fields
.field public static final APPROVAL:Ljava/lang/String; = "approval"

.field private static CHATS_PROJECTION:[Ljava/lang/String; = null

.field private static final COLUMN_CHAT_CONTACT_ID:I = 0x0

.field public static final GROUP_CHAT_APPROVAL:I = 0x1

.field public static final GROUP_CHAT_INVITEE:I = 0x2

.field private static final HINT_CLEAR_DELAY:I = 0x9c4

.field public static final INVITEE:Ljava/lang/String; = "invitee"

.field private static final LOG_TAG:Ljava/lang/String; = "talk"

.field public static final PASSWORD:Ljava/lang/String; = "password"

.field public static final ROOM:Ljava/lang/String; = "room"

.field private static sLogLevel:I


# instance fields
.field private mApp:Lcom/google/android/talk/TalkApp;

.field private mChatHost:Lcom/google/android/talk/ChatScreen$ChatHost;

.field private mChatInputField:Landroid/widget/EditText;

.field private mChatListener:Lcom/google/android/talk/ChatScreen$ChatListener;

.field private mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

.field private mClearRunnable:Ljava/lang/Runnable;

.field private mColorMaker:Lcom/google/android/talk/util/ChatColorMaker;

.field private mContactHeaderWidget:Lcom/android/internal/widget/ContactHeaderWidget;

.field private mContactIdMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mFromStatusBarNotify:Z

.field private mGallery:Lcom/google/android/talk/PageViewGroup;

.field mGridDrawable:Landroid/graphics/drawable/Drawable;

.field private final mHandler:Landroid/os/Handler;

.field private mInAnimation:Landroid/view/animation/Animation;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mInvitePending:Z

.field private mInviteRunnable:Ljava/lang/Runnable;

.field private mOtrMenuItem:Landroid/view/MenuItem;

.field private mOutAnimation:Landroid/view/animation/Animation;

.field private mQueryCompleteRunnable:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

.field private mSendButton:Landroid/widget/Button;

.field private mService:Lcom/google/android/gtalkservice/IGTalkService;

.field private mShowDashboardOnStart:Z

.field mSwitchChats:Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;

.field private mSwitchHint:Landroid/widget/TextView;

.field private mSwitchHintParent:Landroid/view/View;

.field private mViewContactMenuItem:Landroid/view/MenuItem;

.field private mWaitForServiceTasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 74
    sput v2, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    .line 76
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "contact_id"

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/android/talk/ChatScreen;->CHATS_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 71
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 85
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mHandler:Landroid/os/Handler;

    .line 110
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mInAnimation:Landroid/view/animation/Animation;

    .line 111
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, v2, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mOutAnimation:Landroid/view/animation/Animation;

    .line 126
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mContactIdMap:Ljava/util/HashMap;

    .line 132
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mWaitForServiceTasks:Ljava/util/List;

    .line 165
    new-instance v0, Lcom/google/android/talk/ChatScreen$1;

    invoke-direct {v0, p0}, Lcom/google/android/talk/ChatScreen$1;-><init>(Lcom/google/android/talk/ChatScreen;)V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mSwitchChats:Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;

    .line 186
    new-instance v0, Lcom/google/android/talk/ChatScreen$2;

    invoke-direct {v0, p0}, Lcom/google/android/talk/ChatScreen$2;-><init>(Lcom/google/android/talk/ChatScreen;)V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatHost:Lcom/google/android/talk/ChatScreen$ChatHost;

    .line 407
    new-instance v0, Lcom/google/android/talk/ChatScreen$3;

    invoke-direct {v0, p0}, Lcom/google/android/talk/ChatScreen$3;-><init>(Lcom/google/android/talk/ChatScreen;)V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mClearRunnable:Ljava/lang/Runnable;

    .line 514
    new-instance v0, Lcom/google/android/talk/ChatScreen$5;

    invoke-direct {v0, p0}, Lcom/google/android/talk/ChatScreen$5;-><init>(Lcom/google/android/talk/ChatScreen;)V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mQueryCompleteRunnable:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    .line 1526
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/ChatView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/PageViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IChatSession;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J
    .param p4, "x3"    # Z

    .prologue
    .line 71
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/talk/ChatScreen;->checkChatSession(Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100(Lcom/google/android/talk/ChatScreen;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/google/android/talk/ChatScreen;Lcom/google/android/talk/ChatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;
    .param p1, "x1"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/google/android/talk/ChatScreen;->setupChatListener(Lcom/google/android/talk/ChatView;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/android/talk/ChatScreen;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mInviteRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1302(Lcom/google/android/talk/ChatScreen;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen;->mInviteRunnable:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/google/android/talk/ChatScreen;Lcom/google/android/talk/ChatView;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;
    .param p1, "x1"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/google/android/talk/ChatScreen;->cancelChatListener(Lcom/google/android/talk/ChatView;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/android/talk/ChatScreen;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mSwitchHintParent:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/google/android/talk/ChatScreen;)Landroid/view/animation/Animation;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mOutAnimation:Landroid/view/animation/Animation;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/google/android/talk/ChatScreen;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mSwitchHint:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/google/android/talk/ChatScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->updateHintText()V

    return-void
.end method

.method static synthetic access$1900(Lcom/google/android/talk/ChatScreen;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mClearRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/util/ChatColorMaker;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mColorMaker:Lcom/google/android/talk/util/ChatColorMaker;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/google/android/talk/ChatScreen;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/google/android/talk/ChatScreen;)Landroid/view/animation/Animation;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mInAnimation:Landroid/view/animation/Animation;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/google/android/talk/ChatScreen;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mWaitForServiceTasks:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/gtalkservice/IGTalkService;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/google/android/talk/ChatScreen;Landroid/database/Cursor;Ljava/lang/String;J)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;
    .param p1, "x1"    # Landroid/database/Cursor;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # J

    .prologue
    .line 71
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/talk/ChatScreen;->pickChat(Landroid/database/Cursor;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$2500(Lcom/google/android/talk/ChatScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->sendMessage()V

    return-void
.end method

.method static synthetic access$2600(Lcom/google/android/talk/ChatScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->userActionDetected()V

    return-void
.end method

.method static synthetic access$2700(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;J)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J

    .prologue
    .line 71
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/talk/ChatScreen;->ensureChatInDb(Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$2900(Lcom/google/android/talk/ChatScreen;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-boolean v0, p0, Lcom/google/android/talk/ChatScreen;->mInvitePending:Z

    return v0
.end method

.method static synthetic access$2902(Lcom/google/android/talk/ChatScreen;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;
    .param p1, "x1"    # Z

    .prologue
    .line 71
    iput-boolean p1, p0, Lcom/google/android/talk/ChatScreen;->mInvitePending:Z

    return p1
.end method

.method static synthetic access$300()I
    .locals 1

    .prologue
    .line 71
    sget v0, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    return v0
.end method

.method static synthetic access$400(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-static {p0}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/talk/ChatScreen;Lcom/google/android/talk/ChatScreen$ChatRunnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;
    .param p1, "x1"    # Lcom/google/android/talk/ChatScreen$ChatRunnable;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/google/android/talk/ChatScreen;->foreachChat(Lcom/google/android/talk/ChatScreen$ChatRunnable;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;J)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J

    .prologue
    .line 71
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/talk/ChatScreen;->pickChat(Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/android/talk/ChatScreen;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mContactIdMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$800(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/util/ChatSwitcher;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    return-object v0
.end method

.method static synthetic access$900(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/ChatScreen$ChatHost;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatHost:Lcom/google/android/talk/ChatScreen$ChatHost;

    return-object v0
.end method

.method private cancelChatListener(Lcom/google/android/talk/ChatView;)V
    .locals 3
    .param p1, "cv"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 1140
    if-nez p1, :cond_1

    .line 1154
    :cond_0
    :goto_0
    return-void

    .line 1143
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/talk/ChatView;->getSession()Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v1

    .line 1144
    .local v1, "session":Lcom/google/android/gtalkservice/IChatSession;
    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mChatListener:Lcom/google/android/talk/ChatScreen$ChatListener;

    if-eqz v2, :cond_0

    .line 1148
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mChatListener:Lcom/google/android/talk/ChatScreen$ChatListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IChatSession;->removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 1149
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/talk/ChatScreen;->mChatListener:Lcom/google/android/talk/ChatScreen$ChatListener;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1150
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1152
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method private checkChatSession(Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IChatSession;
    .locals 9
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "accountId"    # J
    .param p4, "ensureChatsInDb"    # Z

    .prologue
    .line 683
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mWaitForServiceTasks:Ljava/util/List;

    monitor-enter v6

    .line 684
    :try_start_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-nez v0, :cond_0

    .line 685
    iget-object v7, p0, Lcom/google/android/talk/ChatScreen;->mWaitForServiceTasks:Ljava/util/List;

    new-instance v0, Lcom/google/android/talk/ChatScreen$11;

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/talk/ChatScreen$11;-><init>(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;JZ)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 694
    const/4 v0, 0x0

    monitor-exit v6

    .line 720
    :goto_0
    return-object v0

    .line 696
    :cond_0
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 700
    :try_start_1
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    invoke-interface {v0, p2, p3}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v8

    .line 701
    .local v8, "imSession":Lcom/google/android/gtalkservice/IImSession;
    invoke-interface {v8, p1}, Lcom/google/android/gtalkservice/IImSession;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v6

    .line 703
    .local v6, "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    if-nez v6, :cond_2

    .line 704
    invoke-interface {v8, p1}, Lcom/google/android/gtalkservice/IImSession;->createChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    :cond_1
    :goto_1
    move-object v0, v6

    .line 715
    goto :goto_0

    .line 696
    .end local v6    # "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    .end local v8    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 705
    .restart local v6    # "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    .restart local v8    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :cond_2
    if-eqz p4, :cond_1

    .line 709
    :try_start_3
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/android/talk/ChatScreen$12;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/talk/ChatScreen$12;-><init>(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;J)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 716
    .end local v6    # "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    .end local v8    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :catch_0
    move-exception v0

    move-object v7, v0

    .line 717
    .local v7, "e":Landroid/os/RemoteException;
    const-string v0, "talk"

    const-string v1, "createEmptyChatSession caught "

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 718
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->finish()V

    .line 720
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private createChatSwitcher()V
    .locals 8

    .prologue
    .line 561
    new-instance v0, Lcom/google/android/talk/util/ChatSwitcher;

    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v4, p0, Lcom/google/android/talk/ChatScreen;->mInflater:Landroid/view/LayoutInflater;

    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mSwitchChats:Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;

    new-instance v6, Lcom/google/android/talk/ChatScreen$6;

    invoke-direct {v6, p0}, Lcom/google/android/talk/ChatScreen$6;-><init>(Lcom/google/android/talk/ChatScreen;)V

    iget-object v7, p0, Lcom/google/android/talk/ChatScreen;->mQueryCompleteRunnable:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/talk/util/ChatSwitcher;-><init>(Landroid/app/Activity;Landroid/os/Handler;Lcom/google/android/talk/TalkApp;Landroid/view/LayoutInflater;Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;Ljava/lang/Runnable;Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    .line 575
    return-void
.end method

.method private dismissAllChatNotifications()V
    .locals 9

    .prologue
    const-string v8, "talk"

    .line 1242
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "providerId"

    const-wide/16 v6, 0x0

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    .line 1243
    .local v1, "providerId":J
    iget-object v4, p0, Lcom/google/android/talk/ChatScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v4}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v3

    .line 1244
    .local v3, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-nez v3, :cond_0

    .line 1245
    const-string v4, "talk"

    const-string v4, "dismissChatNotification: no GTalkService object found!"

    invoke-static {v8, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1257
    :goto_0
    return-void

    .line 1250
    :cond_0
    :try_start_0
    sget v4, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    const/4 v5, 0x1

    if-lt v4, v5, :cond_1

    .line 1251
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "dismissChatNotification for all, provider="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    .line 1253
    :cond_1
    invoke-interface {v3, v1, v2}, Lcom/google/android/gtalkservice/IGTalkService;->dismissNotifications(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1254
    :catch_0
    move-exception v4

    move-object v0, v4

    .line 1255
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v4, "talk"

    const-string v4, "dismissChatNotification: caught "

    invoke-static {v8, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private ensureChatInDb(Ljava/lang/String;J)V
    .locals 11
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "accountId"    # J

    .prologue
    .line 728
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 729
    .local v6, "buf":Ljava/lang/StringBuilder;
    const-string v1, "contact_id"

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 730
    const-string v1, " in (select _id from contacts where "

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 731
    const-string v1, "username"

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=? AND "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 732
    const-string v1, "account"

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=?)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 734
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 735
    .local v0, "resolver":Landroid/content/ContentResolver;
    sget-object v1, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/ChatScreen;->CHATS_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    .end local v6    # "buf":Ljava/lang/StringBuilder;
    aput-object v6, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 741
    .local v7, "c":Landroid/database/Cursor;
    const-wide/16 v8, 0x0

    .line 742
    .local v8, "contactId":J
    if-eqz v7, :cond_1

    .line 744
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 745
    const/4 v1, 0x0

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    int-to-long v8, v1

    .line 748
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 753
    :cond_1
    const-wide/16 v1, 0x0

    cmp-long v1, v8, v1

    if-nez v1, :cond_3

    .line 754
    invoke-static {v0, p1, p2, p3}, Lcom/google/android/talk/DatabaseUtils;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v8

    .line 756
    sget v1, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_2

    .line 757
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "### ensureChatInDb: create a chat for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", cid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    .line 759
    :cond_2
    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V

    .line 760
    .local v10, "values":Landroid/content/ContentValues;
    const-string v1, "contact_id"

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v10, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 761
    const-string v1, "last_message_date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v10, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 762
    const-string v1, "last_unread_message"

    const/4 p0, 0x0

    check-cast p0, Ljava/lang/String;

    .end local p0    # "this":Lcom/google/android/talk/ChatScreen;
    invoke-virtual {v10, v1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 764
    sget-object v1, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v10}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 766
    .end local v10    # "values":Landroid/content/ContentValues;
    :cond_3
    return-void

    .line 748
    .restart local p0    # "this":Lcom/google/android/talk/ChatScreen;
    :catchall_0
    move-exception v1

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private foreachChat(Lcom/google/android/talk/ChatScreen$ChatRunnable;)V
    .locals 1
    .param p1, "cr"    # Lcom/google/android/talk/ChatScreen$ChatRunnable;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v0, p1}, Lcom/google/android/talk/PageViewGroup;->foreachChat(Lcom/google/android/talk/ChatScreen$ChatRunnable;)V

    .line 149
    return-void
.end method

.method private getActiveChat()Lcom/google/android/talk/ChatView;
    .locals 2

    .prologue
    .line 135
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v1}, Lcom/google/android/talk/PageViewGroup;->getSelectedView()Landroid/view/View;

    move-result-object v0

    .line 136
    .local v0, "v":Landroid/view/View;
    instance-of v1, v0, Lcom/google/android/talk/ChatView;

    if-eqz v1, :cond_0

    .line 137
    check-cast v0, Lcom/google/android/talk/ChatView;

    .end local v0    # "v":Landroid/view/View;
    move-object v1, v0

    .line 139
    :goto_0
    return-object v1

    .restart local v0    # "v":Landroid/view/View;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getLogModeDebug()Z
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 1515
    sget v0, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    if-lt v0, v1, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getLogModeVerbose()Z
    .locals 2

    .prologue
    .line 1519
    sget v0, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 1523
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ChatScreen] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1524
    return-void
.end method

.method private makeObserver()Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;
    .locals 1

    .prologue
    .line 440
    new-instance v0, Lcom/google/android/talk/ChatScreen$4;

    invoke-direct {v0, p0}, Lcom/google/android/talk/ChatScreen$4;-><init>(Lcom/google/android/talk/ChatScreen;)V

    return-object v0
.end method

.method private onGroupChatApproval(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 1007
    if-nez p1, :cond_1

    .line 1008
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->finish()V

    .line 1019
    :cond_0
    :goto_0
    return-void

    .line 1012
    :cond_1
    const-string v2, "room"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1013
    .local v1, "room":Ljava/lang/String;
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v2, v2, Lcom/google/android/talk/TalkApp;->mGroupChatInvitations:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1014
    const-string v2, "approval"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1015
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 1016
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "from"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1017
    invoke-virtual {p0, v0}, Lcom/google/android/talk/ChatScreen;->setIntent(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private pickChat(Landroid/database/Cursor;Ljava/lang/String;J)V
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "targetContact"    # Ljava/lang/String;
    .param p3, "targetAccountId"    # J

    .prologue
    .line 487
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 488
    .local v1, "currentIntent":Landroid/content/Intent;
    const-string v4, "from"

    invoke-virtual {v1, v4, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 489
    const-string v4, "accountId"

    invoke-virtual {v1, v4, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 491
    const/4 v2, 0x0

    .line 492
    .local v2, "found":Z
    if-eqz p1, :cond_2

    .line 493
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 494
    .local v0, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_2

    .line 495
    invoke-interface {p1, v3}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 496
    iget-object v4, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    iget v4, v4, Lcom/google/android/talk/util/ChatSwitcher;->mAccountIdColumn:I

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    cmp-long v4, v4, p3

    if-eqz v4, :cond_1

    .line 494
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 499
    :cond_1
    iget-object v4, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    iget v4, v4, Lcom/google/android/talk/util/ChatSwitcher;->mUsernameColumn:I

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 504
    iget-object v4, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v4, v3}, Lcom/google/android/talk/PageViewGroup;->setSelection(I)V

    .line 505
    const/4 v2, 0x1

    .line 510
    .end local v0    # "count":I
    .end local v3    # "i":I
    :cond_2
    if-nez v2, :cond_3

    const/4 v4, 0x1

    :goto_1
    invoke-direct {p0, p2, p3, p4, v4}, Lcom/google/android/talk/ChatScreen;->checkChatSession(Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IChatSession;

    .line 511
    return-void

    .line 510
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private pickChat(Ljava/lang/String;J)V
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "accountId"    # J

    .prologue
    .line 475
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v2}, Lcom/google/android/talk/PageViewGroup;->getAdapter()Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v0

    check-cast v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    .line 476
    .local v0, "a":Lcom/google/android/talk/ChatScreen$GalleryAdapter;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v2

    move-object v1, v2

    .line 480
    .local v1, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-direct {p0, v1, p1, p2, p3}, Lcom/google/android/talk/ChatScreen;->pickChat(Landroid/database/Cursor;Ljava/lang/String;J)V

    .line 481
    return-void

    .line 476
    .end local v1    # "cursor":Landroid/database/Cursor;
    :cond_0
    const/4 v2, 0x0

    move-object v1, v2

    goto :goto_0
.end method

.method private resolveIntent()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 943
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 945
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "show_multiple"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/talk/ChatScreen;->mShowDashboardOnStart:Z

    .line 947
    const-string v1, "from_notify"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/talk/ChatScreen;->mFromStatusBarNotify:Z

    .line 950
    sget v1, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    .line 951
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resolveIntent: showMultiple="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/android/talk/ChatScreen;->mShowDashboardOnStart:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", fromNotify="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/android/talk/ChatScreen;->mFromStatusBarNotify:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    .line 954
    :cond_0
    return-void
.end method

.method private sendMessage()V
    .locals 5

    .prologue
    .line 769
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 770
    .local v0, "active":Lcom/google/android/talk/ChatView;
    if-nez v0, :cond_1

    .line 785
    :cond_0
    :goto_0
    return-void

    .line 773
    :cond_1
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/talk/ChatView;->sendMessage(Ljava/lang/String;)V

    .line 774
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-static {v3}, Landroid/text/method/TextKeyListener;->clear(Landroid/text/Editable;)V

    .line 775
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->requestFocus()Z

    .line 779
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 780
    .local v1, "config":Landroid/content/res/Configuration;
    iget v3, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 781
    const-string v3, "input_method"

    invoke-virtual {p0, v3}, Lcom/google/android/talk/ChatScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    .line 783
    .local v2, "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_0
.end method

.method private setOffTheRecordMenuItemState(Lcom/google/android/talk/ChatView;)V
    .locals 3
    .param p1, "cv"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 1336
    invoke-virtual {p1}, Lcom/google/android/talk/ChatView;->isOffTheRecord()Z

    move-result v0

    .line 1338
    .local v0, "isOffTheRecord":Z
    if-eqz v0, :cond_0

    .line 1339
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mOtrMenuItem:Landroid/view/MenuItem;

    const v2, 0x7f060036

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 1340
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mOtrMenuItem:Landroid/view/MenuItem;

    const v2, 0x7f020029

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 1346
    :goto_0
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mOtrMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 1347
    return-void

    .line 1342
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mOtrMenuItem:Landroid/view/MenuItem;

    const v2, 0x7f060035

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 1343
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mOtrMenuItem:Landroid/view/MenuItem;

    const v2, 0x7f020028

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    goto :goto_0
.end method

.method private setupChatListener(Lcom/google/android/talk/ChatView;)V
    .locals 8
    .param p1, "cv"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 1158
    if-nez p1, :cond_1

    .line 1173
    :cond_0
    :goto_0
    return-void

    .line 1161
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/talk/ChatView;->getSession()Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v3

    .line 1162
    .local v3, "session":Lcom/google/android/gtalkservice/IChatSession;
    if-eqz v3, :cond_0

    .line 1166
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "accountId"

    const-wide/16 v6, 0x0

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 1168
    .local v0, "accountId":J
    new-instance v4, Lcom/google/android/talk/ChatScreen$ChatListener;

    invoke-direct {v4, p0, p1, v0, v1}, Lcom/google/android/talk/ChatScreen$ChatListener;-><init>(Lcom/google/android/talk/ChatScreen;Lcom/google/android/talk/ChatView;J)V

    iput-object v4, p0, Lcom/google/android/talk/ChatScreen;->mChatListener:Lcom/google/android/talk/ChatScreen$ChatListener;

    .line 1169
    iget-object v4, p0, Lcom/google/android/talk/ChatScreen;->mChatListener:Lcom/google/android/talk/ChatScreen$ChatListener;

    invoke-interface {v3, v4}, Lcom/google/android/gtalkservice/IChatSession;->addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1170
    .end local v0    # "accountId":J
    :catch_0
    move-exception v4

    move-object v2, v4

    .line 1171
    .local v2, "ex":Landroid/os/RemoteException;
    const-string v4, "talk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "invite contact caught "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private showRosterScreen()V
    .locals 5

    .prologue
    .line 1434
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 1435
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-nez v0, :cond_0

    .line 1447
    :goto_0
    return-void

    .line 1438
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1439
    .local v1, "intent":Landroid/content/Intent;
    sget-object v2, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1440
    const-string v2, "com.android.im.category.GTALK"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1441
    const-string v2, "accountId"

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->accountId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1442
    const/high16 v2, 0x4000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1443
    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatScreen;->startActivity(Landroid/content/Intent;)V

    .line 1445
    const-string v2, "showRosterScreen"

    invoke-static {v2}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    .line 1446
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->finish()V

    goto :goto_0
.end method

.method private updateHintText()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 418
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v3}, Lcom/google/android/talk/PageViewGroup;->getSelectedItemPosition()I

    move-result v2

    .line 419
    .local v2, "itemPosition":I
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v3}, Lcom/google/android/talk/PageViewGroup;->getAdapter()Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v0

    .line 420
    .local v0, "a":Lcom/google/android/talk/PageViewGroup$Adapter;
    instance-of v3, v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    if-nez v3, :cond_0

    .line 432
    .end local v0    # "a":Lcom/google/android/talk/PageViewGroup$Adapter;
    :goto_0
    return-void

    .line 423
    .restart local v0    # "a":Lcom/google/android/talk/PageViewGroup$Adapter;
    :cond_0
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mSwitchHint:Landroid/widget/TextView;

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 424
    check-cast v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    .end local v0    # "a":Lcom/google/android/talk/PageViewGroup$Adapter;
    invoke-virtual {v0}, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    .line 425
    .local v1, "c":Landroid/database/Cursor;
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mSwitchHint:Landroid/widget/TextView;

    const v4, 0x7f0600a1

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    add-int/lit8 v7, v2, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/google/android/talk/ChatScreen;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 427
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mGridDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_1

    .line 428
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020019

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/talk/ChatScreen;->mGridDrawable:Landroid/graphics/drawable/Drawable;

    .line 430
    :cond_1
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mSwitchHint:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/google/android/talk/ChatScreen;->mGridDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v4, v8, v8, v8}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 431
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mSwitchHint:Landroid/widget/TextView;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    goto :goto_0
.end method

.method private userActionDetected()V
    .locals 2

    .prologue
    .line 1494
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 1495
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-eqz v0, :cond_0

    .line 1496
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatView;->handleUnreadMessages(Z)V

    .line 1498
    :cond_0
    return-void
.end method


# virtual methods
.method clearChat()V
    .locals 1

    .prologue
    .line 1461
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 1462
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-nez v0, :cond_0

    .line 1466
    :goto_0
    return-void

    .line 1465
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->clearChat()V

    goto :goto_0
.end method

.method leaveChat()V
    .locals 2

    .prologue
    .line 1450
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 1451
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-nez v0, :cond_0

    .line 1458
    :goto_0
    return-void

    .line 1454
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->leaveChat()V

    .line 1456
    const-string v1, "leaveChat"

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    .line 1457
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->finish()V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 11
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v10, 0x1

    .line 1183
    packed-switch p1, :pswitch_data_0

    .line 1228
    :cond_0
    :goto_0
    return-void

    .line 1186
    :pswitch_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 1187
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "invitee"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1188
    .local v5, "invitee":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 1189
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 1190
    .local v8, "sb":Ljava/lang/StringBuilder;
    new-instance v7, Ljava/util/Formatter;

    invoke-direct {v7, v8}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;)V

    .line 1191
    .local v7, "formatter":Ljava/util/Formatter;
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060046

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    .line 1192
    .local v6, "format":Ljava/lang/CharSequence;
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v10, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v1, v9

    invoke-virtual {v7, v0, v1}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 1193
    invoke-static {p0, v8, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1195
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "from"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1197
    .local v2, "contact":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "accountId"

    const-wide/16 v9, 0x0

    invoke-virtual {v0, v1, v9, v10}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    .line 1200
    .local v3, "accountId":J
    new-instance v0, Lcom/google/android/talk/ChatScreen$16;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/talk/ChatScreen$16;-><init>(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;JLjava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen;->mInviteRunnable:Ljava/lang/Runnable;

    goto :goto_0

    .line 1225
    .end local v2    # "contact":Ljava/lang/String;
    .end local v3    # "accountId":J
    .end local v5    # "invitee":Ljava/lang/String;
    .end local v6    # "format":Ljava/lang/CharSequence;
    .end local v7    # "formatter":Ljava/util/Formatter;
    .end local v8    # "sb":Ljava/lang/StringBuilder;
    :pswitch_1
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    :goto_1
    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatScreen;->onGroupChatApproval(Landroid/os/Bundle;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 1183
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 921
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 922
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-virtual {v0, p1}, Lcom/google/android/talk/util/ChatSwitcher;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 923
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedStates"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 580
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 582
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getWindow()Landroid/view/Window;

    move-result-object v4

    .line 584
    .local v4, "window":Landroid/view/Window;
    invoke-virtual {p0, v9}, Lcom/google/android/talk/ChatScreen;->requestWindowFeature(I)Z

    .line 585
    const v5, 0x7f030004

    invoke-virtual {p0, v5}, Lcom/google/android/talk/ChatScreen;->setContentView(I)V

    .line 589
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 591
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    iput-object v5, p0, Lcom/google/android/talk/ChatScreen;->mInflater:Landroid/view/LayoutInflater;

    .line 593
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v5

    sput v5, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    .line 594
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v5

    iput-object v5, p0, Lcom/google/android/talk/ChatScreen;->mApp:Lcom/google/android/talk/TalkApp;

    .line 596
    const v5, 0x7f0b000d

    invoke-virtual {p0, v5}, Lcom/google/android/talk/ChatScreen;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, p0, Lcom/google/android/talk/ChatScreen;->mSendButton:Landroid/widget/Button;

    .line 597
    const v5, 0x1020009

    invoke-virtual {p0, v5}, Lcom/google/android/talk/ChatScreen;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    .line 598
    new-instance v5, Lcom/google/android/talk/util/ChatColorMaker;

    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getLinkTextColors()Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v6

    invoke-direct {v5, v8, v6}, Lcom/google/android/talk/util/ChatColorMaker;-><init>(II)V

    iput-object v5, p0, Lcom/google/android/talk/ChatScreen;->mColorMaker:Lcom/google/android/talk/util/ChatColorMaker;

    .line 599
    const v5, 0x7f0b000f

    invoke-virtual {p0, v5}, Lcom/google/android/talk/ChatScreen;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/google/android/talk/ChatScreen;->mSwitchHint:Landroid/widget/TextView;

    .line 600
    const v5, 0x7f0b000e

    invoke-virtual {p0, v5}, Lcom/google/android/talk/ChatScreen;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/google/android/talk/ChatScreen;->mSwitchHintParent:Landroid/view/View;

    .line 601
    const v5, 0x7f0b000c

    invoke-virtual {p0, v5}, Lcom/google/android/talk/ChatScreen;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/google/android/talk/PageViewGroup;

    iput-object v5, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    .line 602
    const v5, 0x7f0b000a

    invoke-virtual {p0, v5}, Lcom/google/android/talk/ChatScreen;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/android/internal/widget/ContactHeaderWidget;

    iput-object v5, p0, Lcom/google/android/talk/ChatScreen;->mContactHeaderWidget:Lcom/android/internal/widget/ContactHeaderWidget;

    .line 604
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v5, v9}, Lcom/google/android/talk/PageViewGroup;->setAllowWrapping(Z)V

    .line 605
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->makeObserver()Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/android/talk/PageViewGroup;->setOnTouchCallback(Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;)V

    .line 606
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 610
    .local v1, "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->resolveIntent()V

    .line 612
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->createChatSwitcher()V

    .line 613
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->registerForServiceStateChanged()V

    .line 615
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mSendButton:Landroid/widget/Button;

    new-instance v6, Lcom/google/android/talk/ChatScreen$7;

    invoke-direct {v6, p0}, Lcom/google/android/talk/ChatScreen$7;-><init>(Lcom/google/android/talk/ChatScreen;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 625
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    new-instance v6, Lcom/google/android/talk/ChatScreen$8;

    invoke-direct {v6, p0}, Lcom/google/android/talk/ChatScreen$8;-><init>(Lcom/google/android/talk/ChatScreen;)V

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 638
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    new-instance v6, Lcom/google/android/talk/ChatScreen$9;

    invoke-direct {v6, p0}, Lcom/google/android/talk/ChatScreen$9;-><init>(Lcom/google/android/talk/ChatScreen;)V

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 647
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    new-instance v6, Lcom/google/android/talk/ChatScreen$10;

    invoke-direct {v6, p0}, Lcom/google/android/talk/ChatScreen$10;-><init>(Lcom/google/android/talk/ChatScreen;)V

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 658
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->requestFocus()Z

    .line 660
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    .line 661
    .local v3, "text":Ljava/lang/CharSequence;
    move-object v0, v3

    check-cast v0, Landroid/text/Spannable;

    move-object v2, v0

    .line 662
    .local v2, "span":Landroid/text/Spannable;
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v5

    const/16 v6, 0x12

    invoke-interface {v2, p0, v8, v5, v6}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 664
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1309
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 1311
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 1312
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v1, 0x7f0a0001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1314
    const v1, 0x7f0b0055

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/ChatScreen;->mOtrMenuItem:Landroid/view/MenuItem;

    .line 1315
    const v1, 0x7f0b005c

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/ChatScreen;->mViewContactMenuItem:Landroid/view/MenuItem;

    .line 1316
    const/4 v1, 0x1

    return v1
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 930
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 931
    new-instance v0, Lcom/google/android/talk/ChatScreen$15;

    invoke-direct {v0, p0}, Lcom/google/android/talk/ChatScreen$15;-><init>(Lcom/google/android/talk/ChatScreen;)V

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatScreen;->foreachChat(Lcom/google/android/talk/ChatScreen$ChatRunnable;)V

    .line 940
    return-void
.end method

.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keycode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 788
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 789
    .local v0, "id":I
    const v1, 0x1020009

    if-ne v0, v1, :cond_0

    .line 791
    const/16 v1, 0x42

    if-ne p2, v1, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_0

    .line 793
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 794
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->append(Ljava/lang/CharSequence;)V

    .line 795
    const/4 v1, 0x1

    .line 800
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1470
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-virtual {v0, p2}, Lcom/google/android/talk/util/ChatSwitcher;->onKey(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1471
    const/4 v0, 0x1

    .line 1490
    :goto_0
    return v0

    .line 1474
    :cond_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    .line 1475
    packed-switch p1, :pswitch_data_0

    .line 1490
    :cond_1
    :goto_1
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0

    .line 1482
    :pswitch_0
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->userActionDetected()V

    goto :goto_1

    .line 1475
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 959
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 960
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-virtual {v3}, Lcom/google/android/talk/util/ChatSwitcher;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 961
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-virtual {v3}, Lcom/google/android/talk/util/ChatSwitcher;->close()V

    .line 964
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/talk/ChatScreen;->setIntent(Landroid/content/Intent;)V

    .line 965
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->resolveIntent()V

    .line 967
    const-string v3, "accountId"

    const-wide/16 v4, 0x0

    invoke-virtual {p1, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 968
    .local v0, "accountId":J
    const-string v3, "from"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/talk/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 973
    .local v2, "contact":Ljava/lang/String;
    invoke-direct {p0, v2, v0, v1}, Lcom/google/android/talk/ChatScreen;->pickChat(Ljava/lang/String;J)V

    .line 974
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/google/android/talk/ChatScreen;->mFromStatusBarNotify:Z

    .line 975
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 10
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v7, 0x0

    const/4 v9, 0x1

    .line 1351
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    .line 1352
    .local v3, "id":I
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v2

    .line 1353
    .local v2, "cv":Lcom/google/android/talk/ChatView;
    if-nez v2, :cond_0

    move v6, v9

    .line 1430
    :goto_0
    return v6

    .line 1356
    :cond_0
    packed-switch v3, :pswitch_data_0

    move v6, v7

    .line 1430
    goto :goto_0

    .line 1358
    :pswitch_0
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mOtrMenuItem:Landroid/view/MenuItem;

    invoke-interface {v6}, Landroid/view/MenuItem;->isChecked()Z

    move-result v6

    if-nez v6, :cond_1

    move v1, v9

    .line 1359
    .local v1, "checked":Z
    :goto_1
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mOtrMenuItem:Landroid/view/MenuItem;

    invoke-interface {v6, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 1360
    invoke-virtual {v2, v1}, Lcom/google/android/talk/ChatView;->goOffTheRecord(Z)V

    move v6, v9

    .line 1361
    goto :goto_0

    .end local v1    # "checked":Z
    :cond_1
    move v1, v7

    .line 1358
    goto :goto_1

    .line 1363
    :pswitch_1
    sget v6, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    if-lt v6, v9, :cond_2

    const-string v6, "showInvitationView"

    invoke-static {v6}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    .line 1364
    :cond_2
    new-instance v4, Landroid/content/Intent;

    const-class v6, Lcom/google/android/talk/GroupChatInviteeList;

    invoke-direct {v4, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1366
    .local v4, "intent":Landroid/content/Intent;
    const-string v6, "accountId"

    invoke-virtual {v2}, Lcom/google/android/talk/ChatView;->getAccountId()J

    move-result-wide v7

    invoke-virtual {v4, v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1367
    const-string v6, "from"

    invoke-virtual {v2}, Lcom/google/android/talk/ChatView;->getMucParticipants()[Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 1369
    const/4 v6, 0x2

    invoke-virtual {p0, v4, v6}, Lcom/google/android/talk/ChatScreen;->startActivityForResult(Landroid/content/Intent;I)V

    move v6, v9

    .line 1370
    goto :goto_0

    .line 1372
    .end local v4    # "intent":Landroid/content/Intent;
    :pswitch_2
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->showRosterScreen()V

    move v6, v9

    .line 1373
    goto :goto_0

    .line 1376
    :pswitch_3
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->leaveChat()V

    move v6, v9

    .line 1377
    goto :goto_0

    .line 1380
    :pswitch_4
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->clearChat()V

    move v6, v9

    .line 1381
    goto :goto_0

    .line 1384
    :pswitch_5
    new-instance v6, Lcom/google/android/talk/ChatScreen$18;

    invoke-direct {v6, p0}, Lcom/google/android/talk/ChatScreen$18;-><init>(Lcom/google/android/talk/ChatScreen;)V

    invoke-static {p0, v6}, Lcom/google/android/talk/util/SmileyMenuHelper;->makeSmileyAlert(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    move-result-object v0

    .line 1391
    .local v0, "a":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    move v6, v9

    .line 1392
    goto :goto_0

    .line 1395
    .end local v0    # "a":Landroid/app/AlertDialog;
    :pswitch_6
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v6}, Lcom/google/android/talk/PageViewGroup;->getSelectedItemPosition()I

    move-result v6

    sub-int v5, v6, v9

    .line 1396
    .local v5, "newPos":I
    const/4 v6, -0x1

    if-ne v5, v6, :cond_3

    .line 1397
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v6}, Lcom/google/android/talk/PageViewGroup;->getCount()I

    move-result v6

    sub-int v5, v6, v9

    .line 1398
    :cond_3
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v6, v5}, Lcom/google/android/talk/PageViewGroup;->setSelection(I)V

    move v6, v9

    .line 1399
    goto :goto_0

    .line 1403
    .end local v5    # "newPos":I
    :pswitch_7
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v6}, Lcom/google/android/talk/PageViewGroup;->getSelectedItemPosition()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    iget-object v7, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v7}, Lcom/google/android/talk/PageViewGroup;->getCount()I

    move-result v7

    rem-int v5, v6, v7

    .line 1404
    .restart local v5    # "newPos":I
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v6, v5}, Lcom/google/android/talk/PageViewGroup;->setSelection(I)V

    move v6, v9

    .line 1405
    goto/16 :goto_0

    .line 1409
    .end local v5    # "newPos":I
    :pswitch_8
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/google/android/talk/ChatScreen;->toggleSwitcher(Landroid/view/View;)V

    move v6, v9

    .line 1410
    goto/16 :goto_0

    .line 1413
    :pswitch_9
    invoke-virtual {v2}, Lcom/google/android/talk/ChatView;->addToContacts()V

    move v6, v9

    .line 1414
    goto/16 :goto_0

    .line 1426
    :pswitch_a
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-interface {p1}, Landroid/view/MenuItem;->getAlphabeticShortcut()C

    move-result v7

    invoke-virtual {v6, v7}, Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V

    move v6, v9

    .line 1427
    goto/16 :goto_0

    .line 1356
    :pswitch_data_0
    .packed-switch 0x7f0b004b
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_0
        :pswitch_8
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_9
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 869
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 873
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mContactIdMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 878
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatScreen;->cancelChatListener(Lcom/google/android/talk/ChatView;)V

    .line 879
    return-void
.end method

.method public final onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 5
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1322
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 1324
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 1325
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-nez v0, :cond_0

    move v1, v3

    .line 1332
    :goto_0
    return v1

    .line 1329
    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatScreen;->setOffTheRecordMenuItemState(Lcom/google/android/talk/ChatView;)V

    .line 1330
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mViewContactMenuItem:Landroid/view/MenuItem;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->isGroupChat()Z

    move-result v2

    if-nez v2, :cond_1

    move v2, v4

    :goto_1
    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    move v1, v4

    .line 1332
    goto :goto_0

    :cond_1
    move v2, v3

    .line 1330
    goto :goto_1
.end method

.method protected onRestart()V
    .locals 3

    .prologue
    .line 820
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 822
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v1

    sput v1, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    .line 824
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    .line 825
    .local v0, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eq v1, v0, :cond_2

    .line 826
    :cond_0
    sget v1, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_1

    .line 827
    const-string v1, "onRestart: service disconnected..."

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    .line 831
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->handleDisconnectedService()V

    .line 832
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->registerForServiceStateChanged()V

    .line 842
    :goto_0
    new-instance v1, Lcom/google/android/talk/ChatScreen$14;

    invoke-direct {v1, p0}, Lcom/google/android/talk/ChatScreen$14;-><init>(Lcom/google/android/talk/ChatScreen;)V

    invoke-direct {p0, v1}, Lcom/google/android/talk/ChatScreen;->foreachChat(Lcom/google/android/talk/ChatScreen$ChatRunnable;)V

    .line 849
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mQueryCompleteRunnable:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    invoke-virtual {v1, v2}, Lcom/google/android/talk/util/ChatSwitcher;->requery(Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V

    .line 850
    return-void

    .line 839
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->serviceStateChanged()V

    goto :goto_0
.end method

.method protected final onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 996
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 998
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mColorMaker:Lcom/google/android/talk/util/ChatColorMaker;

    invoke-virtual {v1, p1}, Lcom/google/android/talk/util/ChatColorMaker;->thaw(Landroid/os/Bundle;)V

    .line 1000
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 1001
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-eqz v0, :cond_0

    .line 1002
    invoke-virtual {v0, p1}, Lcom/google/android/talk/ChatView;->restoreState(Landroid/os/Bundle;)V

    .line 1004
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 855
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 856
    iget-boolean v0, p0, Lcom/google/android/talk/ChatScreen;->mShowDashboardOnStart:Z

    if-eqz v0, :cond_1

    .line 857
    sget v0, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    const-string v0, "onResume: open chat switcher"

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    .line 858
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/util/ChatSwitcher;->open(Landroid/view/View;)V

    .line 859
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/talk/ChatScreen;->mShowDashboardOnStart:Z

    .line 864
    :cond_1
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/ChatScreen;->setupChatListener(Lcom/google/android/talk/ChatView;)V

    .line 865
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 982
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 984
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mColorMaker:Lcom/google/android/talk/util/ChatColorMaker;

    invoke-virtual {v1, p1}, Lcom/google/android/talk/util/ChatColorMaker;->freeze(Landroid/os/Bundle;)V

    .line 987
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 988
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-eqz v0, :cond_0

    .line 989
    invoke-virtual {v0, p1}, Lcom/google/android/talk/ChatView;->saveState(Landroid/os/Bundle;)V

    .line 991
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 884
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 889
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 890
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-eqz v0, :cond_0

    .line 891
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 892
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "from"

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->getContact()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 893
    const-string v2, "accountId"

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->getAccountId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 894
    invoke-virtual {p0, v1}, Lcom/google/android/talk/ChatScreen;->setIntent(Landroid/content/Intent;)V

    .line 898
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v2}, Lcom/google/android/talk/PageViewGroup;->clear()V

    .line 899
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v2, v5}, Lcom/google/android/talk/PageViewGroup;->setAdapter(Lcom/google/android/talk/PageViewGroup$Adapter;)V

    .line 902
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-virtual {v2}, Lcom/google/android/talk/util/ChatSwitcher;->closeCursor()V

    .line 908
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mGallery:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v2, v5}, Lcom/google/android/talk/PageViewGroup;->setAdapter(Lcom/google/android/talk/PageViewGroup$Adapter;)V

    .line 910
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->unregisterForServiceStateChanged()V

    .line 911
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3
    .param p1, "hasFocus"    # Z

    .prologue
    .line 1231
    sget v1, Lcom/google/android/talk/ChatScreen;->sLogLevel:I

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    .line 1232
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onWindowFocusChanged: hasFocus="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->log(Ljava/lang/String;)V

    .line 1235
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 1236
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-eqz v0, :cond_1

    .line 1237
    invoke-virtual {v0, p1}, Lcom/google/android/talk/ChatView;->onWindowFocusChanged(Z)V

    .line 1239
    :cond_1
    return-void
.end method

.method public registerForServiceStateChanged()V
    .locals 3

    .prologue
    .line 805
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/talk/ChatScreen$13;

    invoke-direct {v2, p0}, Lcom/google/android/talk/ChatScreen$13;-><init>(Lcom/google/android/talk/ChatScreen;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/TalkApp;->addServiceStateChangedCallback(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 810
    return-void
.end method

.method public serviceStateChanged()V
    .locals 6

    .prologue
    .line 1260
    iget-object v4, p0, Lcom/google/android/talk/ChatScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v4}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v2

    .line 1262
    .local v2, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v2, :cond_3

    .line 1267
    iget-object v4, p0, Lcom/google/android/talk/ChatScreen;->mWaitForServiceTasks:Ljava/util/List;

    monitor-enter v4

    .line 1269
    :try_start_0
    iput-object v2, p0, Lcom/google/android/talk/ChatScreen;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    .line 1271
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mWaitForServiceTasks:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Runnable;

    .line 1272
    .local v3, "task":Ljava/lang/Runnable;
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 1275
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "task":Ljava/lang/Runnable;
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 1274
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen;->mWaitForServiceTasks:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 1275
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1278
    new-instance v4, Lcom/google/android/talk/ChatScreen$17;

    invoke-direct {v4, p0}, Lcom/google/android/talk/ChatScreen$17;-><init>(Lcom/google/android/talk/ChatScreen;)V

    invoke-direct {p0, v4}, Lcom/google/android/talk/ChatScreen;->foreachChat(Lcom/google/android/talk/ChatScreen$ChatRunnable;)V

    .line 1292
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->getActiveChat()Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 1293
    .local v0, "activeChat":Lcom/google/android/talk/ChatView;
    if-eqz v0, :cond_1

    .line 1294
    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->addRemoteListeners()V

    .line 1295
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lcom/google/android/talk/ChatView;->handleUnreadMessages(Z)V

    .line 1298
    :cond_1
    iget-boolean v4, p0, Lcom/google/android/talk/ChatScreen;->mFromStatusBarNotify:Z

    if-eqz v4, :cond_2

    .line 1299
    invoke-direct {p0}, Lcom/google/android/talk/ChatScreen;->dismissAllChatNotifications()V

    .line 1305
    .end local v0    # "activeChat":Lcom/google/android/talk/ChatView;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    return-void

    .line 1302
    :cond_3
    const-string v4, "talk"

    const-string v5, "serviceStateChanged: service disconnected, finish!"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1303
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen;->finish()V

    goto :goto_1
.end method

.method public toggleSwitcher(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-virtual {v0}, Lcom/google/android/talk/util/ChatSwitcher;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-virtual {v0}, Lcom/google/android/talk/util/ChatSwitcher;->close()V

    .line 159
    :goto_0
    return-void

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 156
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mChatSwitcher:Lcom/google/android/talk/util/ChatSwitcher;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mChatInputField:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/util/ChatSwitcher;->open(Landroid/view/View;)V

    .line 157
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mClearRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public unregisterForServiceStateChanged()V
    .locals 2

    .prologue
    .line 813
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/TalkApp;->removeServiceStateChangedCallback(Landroid/os/Handler;)V

    .line 814
    return-void
.end method

.method public updateTitle(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 236
    instance-of v2, p1, Lcom/google/android/talk/ChatView;

    if-nez v2, :cond_0

    .line 241
    :goto_0
    return-void

    .line 239
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/google/android/talk/ChatView;

    move-object v1, v0

    .line 240
    .local v1, "cv":Lcom/google/android/talk/ChatView;
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen;->mContactHeaderWidget:Lcom/android/internal/widget/ContactHeaderWidget;

    invoke-virtual {v1, v2}, Lcom/google/android/talk/ChatView;->bindContactHeaderWidget(Lcom/android/internal/widget/ContactHeaderWidget;)V

    goto :goto_0
.end method
