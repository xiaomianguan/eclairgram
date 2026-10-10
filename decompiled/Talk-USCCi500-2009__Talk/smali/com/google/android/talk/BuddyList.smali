.class public Lcom/google/android/talk/BuddyList;
.super Lcom/google/android/talk/RosterListActivity;
.source "BuddyList.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;
.implements Landroid/view/View$OnCreateContextMenuListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/BuddyList$7;,
        Lcom/google/android/talk/BuddyList$ClearStatusList;,
        Lcom/google/android/talk/BuddyList$StatusItem;,
        Lcom/google/android/talk/BuddyList$StatusTextAdapter;,
        Lcom/google/android/talk/BuddyList$QueryHandler;,
        Lcom/google/android/talk/BuddyList$ConnectionStateListener;,
        Lcom/google/android/talk/BuddyList$GroupChatInvitationListener;,
        Lcom/google/android/talk/BuddyList$RosterListener;,
        Lcom/google/android/talk/BuddyList$ChatListener;,
        Lcom/google/android/talk/BuddyList$ViewMode;
    }
.end annotation


# static fields
.field private static final ALL_CONTACTS_MINUS_HIDDEN_SELECTION_CLAUSE:Ljava/lang/String; = "account=%s AND type!=3 AND subscriptionType>=4 AND (type!=4 OR last_message_date!=0)"

.field private static final ALL_CONTACTS_SELECTION_CLAUSE:Ljava/lang/String; = "account=%s AND type!=3 AND subscriptionType>=4"

.field private static final AVAILABLE_OFFSET_STRING:Ljava/lang/String; = "+ "

.field private static final BUSY_OFFSET_STRING:Ljava/lang/String; = "- "

.field private static final COLUMN_SINGLE_CONTACT_USERNAME:I = 0x0

.field private static final GROUP_CHAT_INVITE:I = 0xc8

.field private static final LOG_TAG:Ljava/lang/String; = "talk"

.field protected static final MENU_ITEM_ADD_TO_CONTACTS:I = 0x8

.field protected static final MENU_ITEM_BLOCK_CONTACT:I = 0x2

.field protected static final MENU_ITEM_END_CONVERSATION:I = 0xb

.field protected static final MENU_ITEM_GOTO_URL:I = 0x64

.field protected static final MENU_ITEM_HIDE_CONTACT:I = 0x5

.field protected static final MENU_ITEM_JOIN_CONVERSATION:I = 0xa

.field protected static final MENU_ITEM_PIN_CONTACT:I = 0x3

.field protected static final MENU_ITEM_REMOVE_CONTACT:I = 0x1

.field protected static final MENU_ITEM_START_CONVERSATION:I = 0x9

.field protected static final MENU_ITEM_UNHIDE_CONTACT:I = 0x6

.field protected static final MENU_ITEM_UNPIN_CONTACT:I = 0x4

.field protected static final MENU_ITEM_USER_INFO:I = 0x7

.field private static final PICK_ICON_FROM_GALLERY_ID:I = 0x64

.field static final PROJECTION:[Ljava/lang/String;

.field static final PROJECTION_NOAVATAR:[Ljava/lang/String;

.field private static final QUERY_TOKEN:I = 0x1

.field private static final QUICK_CONTACTS_SELECTION_CLAUSE:Ljava/lang/String; = "account=%s AND type!=3 AND subscriptionType>=4 AND (qc=1 OR last_message_date!=0 OR subscriptionType=5)"

.field private static final SINGLE_CONTACT_USERNAME_PROJECTION:[Ljava/lang/String;

.field private static final TRACK_PERF:Z = false

.field private static final VIEW_MODE_KEY:Ljava/lang/String; = "gtalk-view-mode"


# instance fields
.field private mCachedStatusTextCancelEditRunnable:Ljava/lang/Runnable;

.field private final mChatListener:Lcom/google/android/talk/BuddyList$ChatListener;

.field private mColumnAccount:I

.field private mColumnContactId:I

.field private mColumnGroupChat:I

.field private mColumnNickname:I

.field private mColumnProvider:I

.field private mColumnSubscStatus:I

.field private mColumnSubscType:I

.field private mColumnType:I

.field private mColumnUsername:I

.field private mConnectionListener:Lcom/google/android/talk/BuddyList$ConnectionStateListener;

.field private mCustomStatusAdapter:Lcom/google/android/talk/BuddyList$StatusTextAdapter;

.field private mCustomStatusAlert:Landroid/content/DialogInterface;

.field private mCustomStatusView:Landroid/widget/EditText;

.field private mCustomStatusViewColor:I

.field private mCustomStatusViewEditColor:I

.field private mFilter:Landroid/content/IntentFilter;

.field private final mGroupChatInvitationListener:Lcom/google/android/talk/BuddyList$GroupChatInvitationListener;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mLogoutMenuItem:Landroid/view/MenuItem;

.field private mPendingUploadAvatar:Z

.field private mQueryHandler:Lcom/google/android/talk/BuddyList$QueryHandler;

.field private mQuickContactsMenuItem:Landroid/view/MenuItem;

.field mReplaceWithNothing:Landroid/text/style/ReplacementSpan;

.field private final mRosterListener:Lcom/google/android/talk/BuddyList$RosterListener;

.field private mSelfAvatarView:Landroid/widget/ImageView;

.field private mStatusButton:Landroid/widget/ImageButton;

.field private mStatusTextCancelEditRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const-string v5, "username"

    .line 121
    const/16 v0, 0x11

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "username"

    aput-object v5, v0, v4

    const-string v1, "nickname"

    aput-object v1, v0, v6

    const-string v1, "provider"

    aput-object v1, v0, v7

    const/4 v1, 0x4

    const-string v2, "account"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "type"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "subscriptionStatus"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "subscriptionType"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "qc"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "mode"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "status"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "client_type"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "groupchat"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "last_unread_message"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "last_message_date"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "avatars_hash"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "avatars_data"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/BuddyList;->PROJECTION:[Ljava/lang/String;

    .line 142
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "username"

    aput-object v5, v0, v4

    const-string v1, "nickname"

    aput-object v1, v0, v6

    const-string v1, "provider"

    aput-object v1, v0, v7

    const/4 v1, 0x4

    const-string v2, "account"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "type"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "subscriptionStatus"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "subscriptionType"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "qc"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "mode"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "status"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "client_type"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "groupchat"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "last_unread_message"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "last_message_date"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "avatars_hash"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/BuddyList;->PROJECTION_NOAVATAR:[Ljava/lang/String;

    .line 161
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "username"

    aput-object v5, v0, v3

    sput-object v0, Lcom/google/android/talk/BuddyList;->SINGLE_CONTACT_USERNAME_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/google/android/talk/RosterListActivity;-><init>()V

    .line 206
    new-instance v0, Lcom/google/android/talk/BuddyList$1;

    invoke-direct {v0, p0}, Lcom/google/android/talk/BuddyList$1;-><init>(Lcom/google/android/talk/BuddyList;)V

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mCachedStatusTextCancelEditRunnable:Ljava/lang/Runnable;

    .line 222
    new-instance v0, Lcom/google/android/talk/BuddyList$2;

    invoke-direct {v0, p0}, Lcom/google/android/talk/BuddyList$2;-><init>(Lcom/google/android/talk/BuddyList;)V

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 278
    new-instance v0, Lcom/google/android/talk/BuddyList$ChatListener;

    invoke-direct {v0, p0}, Lcom/google/android/talk/BuddyList$ChatListener;-><init>(Lcom/google/android/talk/BuddyList;)V

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mChatListener:Lcom/google/android/talk/BuddyList$ChatListener;

    .line 311
    new-instance v0, Lcom/google/android/talk/BuddyList$RosterListener;

    invoke-direct {v0, p0}, Lcom/google/android/talk/BuddyList$RosterListener;-><init>(Lcom/google/android/talk/BuddyList;)V

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mRosterListener:Lcom/google/android/talk/BuddyList$RosterListener;

    .line 332
    new-instance v0, Lcom/google/android/talk/BuddyList$GroupChatInvitationListener;

    invoke-direct {v0, p0}, Lcom/google/android/talk/BuddyList$GroupChatInvitationListener;-><init>(Lcom/google/android/talk/BuddyList;)V

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mGroupChatInvitationListener:Lcom/google/android/talk/BuddyList$GroupChatInvitationListener;

    .line 366
    new-instance v0, Lcom/google/android/talk/BuddyList$ConnectionStateListener;

    invoke-direct {v0, p0}, Lcom/google/android/talk/BuddyList$ConnectionStateListener;-><init>(Lcom/google/android/talk/BuddyList;)V

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mConnectionListener:Lcom/google/android/talk/BuddyList$ConnectionStateListener;

    .line 433
    new-instance v0, Lcom/google/android/talk/BuddyList$3;

    invoke-direct {v0, p0}, Lcom/google/android/talk/BuddyList$3;-><init>(Lcom/google/android/talk/BuddyList;)V

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mReplaceWithNothing:Landroid/text/style/ReplacementSpan;

    .line 1857
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/BuddyList;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1002(Lcom/google/android/talk/BuddyList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/google/android/talk/BuddyList;->mColumnProvider:I

    return p1
.end method

.method static synthetic access$1102(Lcom/google/android/talk/BuddyList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/google/android/talk/BuddyList;->mColumnAccount:I

    return p1
.end method

.method static synthetic access$1202(Lcom/google/android/talk/BuddyList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/google/android/talk/BuddyList;->mColumnType:I

    return p1
.end method

.method static synthetic access$1302(Lcom/google/android/talk/BuddyList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/google/android/talk/BuddyList;->mColumnSubscStatus:I

    return p1
.end method

.method static synthetic access$1402(Lcom/google/android/talk/BuddyList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/google/android/talk/BuddyList;->mColumnSubscType:I

    return p1
.end method

.method static synthetic access$1502(Lcom/google/android/talk/BuddyList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/google/android/talk/BuddyList;->mColumnGroupChat:I

    return p1
.end method

.method static synthetic access$1600(Lcom/google/android/talk/BuddyList;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;

    .prologue
    .line 91
    iget v0, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusViewEditColor:I

    return v0
.end method

.method static synthetic access$1700(Lcom/google/android/talk/BuddyList;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mStatusTextCancelEditRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1702(Lcom/google/android/talk/BuddyList;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/google/android/talk/BuddyList;->mStatusTextCancelEditRunnable:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$1800(Lcom/google/android/talk/BuddyList;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mCachedStatusTextCancelEditRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/google/android/talk/BuddyList;)Landroid/widget/ImageButton;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mStatusButton:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/talk/BuddyList;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->applyNewCustomStatusText()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/talk/BuddyList;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->updateSelfAvatar()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/android/talk/BuddyList;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # Z

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lcom/google/android/talk/BuddyList;->displayProgress(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/talk/BuddyList;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->updateStatusDisplay()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/android/talk/BuddyList;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # Z

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lcom/google/android/talk/BuddyList;->setIsOnline(Z)V

    return-void
.end method

.method static synthetic access$702(Lcom/google/android/talk/BuddyList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/google/android/talk/BuddyList;->mColumnContactId:I

    return p1
.end method

.method static synthetic access$802(Lcom/google/android/talk/BuddyList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/google/android/talk/BuddyList;->mColumnUsername:I

    return p1
.end method

.method static synthetic access$902(Lcom/google/android/talk/BuddyList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/BuddyList;
    .param p1, "x1"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/google/android/talk/BuddyList;->mColumnNickname:I

    return p1
.end method

.method public static addToContacts(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 1284
    if-eqz p1, :cond_0

    .line 1285
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.contacts.action.SHOW_OR_CREATE_CONTACT"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mailto:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1291
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "im_handle"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1292
    const-string v1, "im_protocol"

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1295
    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1297
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 1299
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method private applyNewCustomStatusText()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 1532
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    .line 1533
    .local v1, "e":Landroid/widget/EditText;
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1535
    .local v0, "customStatus":Ljava/lang/String;
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->clearFocus()V

    .line 1536
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/google/android/talk/BuddyList;->setCustomStatusText(Ljava/lang/String;)V

    .line 1539
    const-string v6, "input_method"

    invoke-virtual {p0, v6}, Lcom/google/android/talk/BuddyList;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    .line 1541
    .local v2, "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v6

    invoke-virtual {v2, v6, v8}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1544
    :try_start_0
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v6}, Lcom/google/android/gtalkservice/IImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v4

    .line 1545
    .local v4, "p":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Presence;->getStatus()Ljava/lang/String;

    move-result-object v3

    .line 1547
    .local v3, "oldStatus":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1548
    iget v6, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    if-lt v6, v7, :cond_0

    .line 1549
    const-string v6, "applyNewCustomStatusText: custom status didn\'t change, bail"

    invoke-direct {p0, v6}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 1579
    .end local v3    # "oldStatus":Ljava/lang/String;
    .end local v4    # "p":Lcom/google/android/gtalkservice/Presence;
    :cond_0
    :goto_0
    return-void

    .line 1554
    .restart local v3    # "oldStatus":Ljava/lang/String;
    .restart local v4    # "p":Lcom/google/android/gtalkservice/Presence;
    :cond_1
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Presence;->getShow()Lcom/google/android/gtalkservice/Presence$Show;

    move-result-object v5

    .line 1560
    .local v5, "show":Lcom/google/android/gtalkservice/Presence$Show;
    sget-object v6, Lcom/google/android/gtalkservice/Presence$Show;->NONE:Lcom/google/android/gtalkservice/Presence$Show;

    if-ne v5, v6, :cond_2

    .line 1561
    sget-object v5, Lcom/google/android/gtalkservice/Presence$Show;->AVAILABLE:Lcom/google/android/gtalkservice/Presence$Show;

    .line 1564
    :cond_2
    invoke-virtual {v4, v5, v0}, Lcom/google/android/gtalkservice/Presence;->setStatus(Lcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    .line 1566
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lcom/google/android/gtalkservice/Presence;->setAvailable(Z)V

    .line 1570
    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/google/android/gtalkservice/Presence;->setInvisible(Z)Z

    .line 1572
    iget v6, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    if-lt v6, v7, :cond_3

    .line 1573
    const-string v6, "applyNewCustomStatusText: set presence"

    invoke-direct {p0, v6}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 1575
    :cond_3
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v6, v4}, Lcom/google/android/gtalkservice/IImSession;->setPresence(Lcom/google/android/gtalkservice/Presence;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1576
    .end local v3    # "oldStatus":Ljava/lang/String;
    .end local v4    # "p":Lcom/google/android/gtalkservice/Presence;
    .end local v5    # "show":Lcom/google/android/gtalkservice/Presence$Show;
    :catch_0
    move-exception v6

    goto :goto_0
.end method

.method private blockContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;)V
    .locals 5
    .param p1, "info"    # Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .prologue
    const-string v4, "talk"

    .line 1191
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v2, :cond_0

    .line 1192
    const-string v2, "talk"

    const-string v2, "[BuddyList] blockContact: mImSession is null"

    invoke-static {v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1208
    :goto_0
    return-void

    .line 1196
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/talk/BuddyList;->getUsernameFromMenuInfo(Landroid/widget/AdapterView$AdapterContextMenuInfo;)Ljava/lang/String;

    move-result-object v1

    .line 1198
    .local v1, "username":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 1200
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v2, v1}, Lcom/google/android/gtalkservice/IImSession;->blockContact(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1207
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-wide v3, p1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->id:J

    invoke-static {v2, v3, v4}, Lcom/google/android/talk/DatabaseUtils;->removeChatsByContactId(Landroid/content/ContentResolver;J)I

    goto :goto_0

    .line 1201
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1202
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BuddyList] blockContact caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private closeAllChats()V
    .locals 4

    .prologue
    const-string v3, "talk"

    .line 1272
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    .line 1273
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v1}, Lcom/google/android/gtalkservice/IImSession;->closeAllChatSessions()V

    .line 1274
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyList;->requeryCursor(Z)V

    .line 1281
    :goto_0
    return-void

    .line 1276
    :cond_0
    const-string v1, "talk"

    const-string v2, "[BuddyList] closeAllChats: mImSession is null"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1278
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1279
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BuddyList] closeAllChats: caught "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private confirmRemoveSelectedContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;)V
    .locals 7
    .param p1, "info"    # Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .prologue
    .line 1145
    if-nez p1, :cond_1

    .line 1180
    :cond_0
    :goto_0
    return-void

    .line 1148
    :cond_1
    iget-wide v3, p1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->id:J

    invoke-static {p0, v3, v4}, Lcom/google/android/talk/BuddyList;->getUsernameForId(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    .line 1149
    .local v2, "username":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 1155
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1156
    .local v1, "sb":Ljava/lang/StringBuilder;
    new-instance v3, Ljava/util/Formatter;

    invoke-direct {v3, v1}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;)V

    const v4, 0x7f060029

    invoke-virtual {p0, v4}, Lcom/google/android/talk/BuddyList;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 1160
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1161
    .local v0, "dialog":Landroid/app/AlertDialog$Builder;
    const v3, 0x1080027

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 1162
    const v3, 0x7f06002a

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1163
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1164
    const v3, 0x104000a

    new-instance v4, Lcom/google/android/talk/BuddyList$6;

    invoke-direct {v4, p0, v2}, Lcom/google/android/talk/BuddyList$6;-><init>(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1178
    const/high16 v3, 0x1040000

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1179
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private dismissStatusbarNotifications(Lcom/google/android/gtalkservice/IGTalkService;)V
    .locals 5
    .param p1, "service"    # Lcom/google/android/gtalkservice/IGTalkService;

    .prologue
    .line 1011
    if-nez p1, :cond_1

    .line 1026
    :cond_0
    :goto_0
    return-void

    .line 1016
    :cond_1
    :try_start_0
    iget-object v3, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-wide v1, v3, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    .line 1017
    .local v1, "providerId":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_0

    .line 1018
    iget v3, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2

    .line 1019
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dismissStatusbarNotifications: provider="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 1021
    :cond_2
    invoke-interface {p1, v1, v2}, Lcom/google/android/gtalkservice/IGTalkService;->dismissNotifications(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1023
    .end local v1    # "providerId":J
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 1024
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v3, "talk"

    const-string v4, "dismissStatusbarNotifications caught "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private displayProgress(Z)V
    .locals 2
    .param p1, "flag"    # Z

    .prologue
    .line 1092
    const v1, 0x102000d

    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyList;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    .line 1093
    .local v0, "pb":Landroid/widget/ProgressBar;
    if-eqz p1, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 1094
    return-void

    .line 1093
    :cond_0
    const/16 v1, 0x8

    goto :goto_0
.end method

.method private displaySettings(Landroid/app/Activity;)V
    .locals 4
    .param p1, "parent"    # Landroid/app/Activity;

    .prologue
    .line 987
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/google/android/talk/PreferencesActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 989
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "providerId"

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-wide v2, v2, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 990
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 991
    return-void
.end method

.method private getStatusUrls(Ljava/lang/String;)[Landroid/text/style/URLSpan;
    .locals 4
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 745
    if-nez p1, :cond_0

    .line 746
    new-array v1, v3, [Landroid/text/style/URLSpan;

    .line 752
    .end local p0    # "this":Lcom/google/android/talk/BuddyList;
    :goto_0
    return-object v1

    .line 748
    .restart local p0    # "this":Lcom/google/android/talk/BuddyList;
    :cond_0
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 749
    .local v0, "spannable":Landroid/text/SpannableString;
    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/text/util/Linkify;->addLinks(Landroid/text/Spannable;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 750
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result v1

    const-class v2, Landroid/text/style/URLSpan;

    invoke-virtual {v0, v3, v1, v2}, Landroid/text/SpannableString;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/talk/BuddyList;
    check-cast p0, [Landroid/text/style/URLSpan;

    move-object v1, p0

    goto :goto_0

    .line 752
    .restart local p0    # "this":Lcom/google/android/talk/BuddyList;
    :cond_1
    new-array v1, v3, [Landroid/text/style/URLSpan;

    goto :goto_0
.end method

.method private static getUsernameForId(Landroid/content/Context;J)Ljava/lang/String;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # J

    .prologue
    const/4 v3, 0x0

    .line 1362
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI_CONTACTS_BY:Landroid/net/Uri;

    invoke-static {v1, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/google/android/talk/BuddyList;->SINGLE_CONTACT_USERNAME_PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1367
    .local v6, "c":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 1369
    .local v7, "username":Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 1371
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1372
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 1375
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1381
    :goto_0
    return-object v7

    .line 1375
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 1378
    :cond_1
    const-string v0, "getUsernameForId"

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getUsernameFromMenuInfo(Landroid/widget/AdapterView$AdapterContextMenuInfo;)Ljava/lang/String;
    .locals 2
    .param p1, "info"    # Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .prologue
    .line 1183
    if-nez p1, :cond_0

    .line 1184
    const/4 v0, 0x0

    .line 1187
    :goto_0
    return-object v0

    :cond_0
    iget-wide v0, p1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->id:J

    invoke-static {p0, v0, v1}, Lcom/google/android/talk/BuddyList;->getUsernameForId(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getViewMode()Lcom/google/android/talk/BuddyList$ViewMode;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 700
    invoke-virtual {p0, v3}, Lcom/google/android/talk/BuddyList;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 701
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string v2, "gtalk-view-mode"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 703
    .local v0, "mode":I
    if-nez v0, :cond_0

    .line 704
    sget-object v2, Lcom/google/android/talk/BuddyList$ViewMode;->QUICK_CONTACTS:Lcom/google/android/talk/BuddyList$ViewMode;

    .line 706
    :goto_0
    return-object v2

    :cond_0
    sget-object v2, Lcom/google/android/talk/BuddyList$ViewMode;->ALL:Lcom/google/android/talk/BuddyList$ViewMode;

    goto :goto_0
.end method

.method private hideContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;Z)V
    .locals 5
    .param p1, "info"    # Landroid/widget/AdapterView$AdapterContextMenuInfo;
    .param p2, "hide"    # Z

    .prologue
    const-string v4, "talk"

    .line 1234
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v2, :cond_1

    .line 1235
    const-string v2, "talk"

    const-string v2, "[BuddyList] hideContact: mImSession is null"

    invoke-static {v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1254
    :cond_0
    :goto_0
    return-void

    .line 1239
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/talk/BuddyList;->getUsernameFromMenuInfo(Landroid/widget/AdapterView$AdapterContextMenuInfo;)Ljava/lang/String;

    move-result-object v1

    .line 1241
    .local v1, "username":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1243
    if-eqz p2, :cond_2

    .line 1244
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v2, v1}, Lcom/google/android/gtalkservice/IImSession;->hideContact(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1248
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1249
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BuddyList] hideContact caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1246
    .end local v0    # "ex":Landroid/os/RemoteException;
    :cond_2
    :try_start_1
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v2, v1}, Lcom/google/android/gtalkservice/IImSession;->clearContactFlags(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private inviteFriend()V
    .locals 4

    .prologue
    .line 1138
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1139
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/google/android/talk/AddBuddyScreen;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1140
    const-string v1, "accountId"

    iget-wide v2, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1141
    invoke-virtual {p0, v0}, Lcom/google/android/talk/BuddyList;->startActivity(Landroid/content/Intent;)V

    .line 1142
    return-void
.end method

.method private isInvite(Landroid/database/Cursor;)Z
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 757
    iget v4, p0, Lcom/google/android/talk/BuddyList;->mColumnSubscStatus:I

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    int-to-long v0, v4

    .line 758
    .local v0, "subscriptionStatus":J
    iget v4, p0, Lcom/google/android/talk/BuddyList;->mColumnSubscType:I

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    int-to-long v2, v4

    .line 760
    .local v2, "subscriptionType":J
    const-wide/16 v4, 0x1

    cmp-long v4, v0, v4

    if-nez v4, :cond_0

    const-wide/16 v4, 0x5

    cmp-long v4, v2, v4

    if-nez v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private launchStatusUrl(Landroid/widget/AdapterView$AdapterContextMenuInfo;I)V
    .locals 6
    .param p1, "info"    # Landroid/widget/AdapterView$AdapterContextMenuInfo;
    .param p2, "which"    # I

    .prologue
    .line 1332
    if-nez p1, :cond_1

    .line 1344
    :cond_0
    :goto_0
    return-void

    .line 1334
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getListView()Landroid/widget/ListView;

    move-result-object v4

    iget v5, p1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 1335
    .local v0, "cursor":Landroid/database/Cursor;
    const-string v4, "status"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/talk/BuddyList;->getStatusUrls(Ljava/lang/String;)[Landroid/text/style/URLSpan;

    move-result-object v2

    .line 1338
    .local v2, "statusUrls":[Landroid/text/style/URLSpan;
    if-ltz p2, :cond_0

    array-length v4, v2

    if-ge p2, v4, :cond_0

    .line 1339
    aget-object v4, v2, p2

    invoke-virtual {v4}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 1340
    .local v3, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v1, v4, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1341
    .local v1, "intent":Landroid/content/Intent;
    const-string v4, "com.android.browser.application_id"

    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1342
    invoke-virtual {p0, v1}, Lcom/google/android/talk/BuddyList;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private leaveChat(Landroid/widget/AdapterView$AdapterContextMenuInfo;)V
    .locals 10
    .param p1, "info"    # Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .prologue
    const-string v9, "talk"

    .line 1302
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getListView()Landroid/widget/ListView;

    move-result-object v5

    iget v6, p1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/database/Cursor;

    .line 1303
    .local v2, "cursor":Landroid/database/Cursor;
    const-string v5, "username"

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1306
    .local v1, "contact":Ljava/lang/String;
    iget v5, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v6, 0x1

    if-lt v5, v6, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "leaveChat: for contact "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 1309
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/google/android/talk/BuddyList;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v5}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v5

    iget-wide v6, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-interface {v5, v6, v7}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v4

    .line 1311
    .local v4, "imSession":Lcom/google/android/gtalkservice/IImSession;
    if-eqz v4, :cond_3

    .line 1312
    invoke-interface {v4, v1}, Lcom/google/android/gtalkservice/IImSession;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v0

    .line 1313
    .local v0, "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    if-nez v0, :cond_1

    .line 1314
    iget-object v5, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v5, v1}, Lcom/google/android/gtalkservice/IImSession;->createChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v0

    .line 1316
    :cond_1
    if-eqz v0, :cond_2

    .line 1317
    invoke-interface {v0}, Lcom/google/android/gtalkservice/IChatSession;->leave()V

    .line 1318
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/google/android/talk/BuddyList;->requeryCursor(Z)V

    .line 1319
    iget-object v5, p0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v5}, Lcom/google/android/talk/RosterListAdapter;->notifyDataSetChanged()V

    .line 1329
    .end local v0    # "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    .end local v4    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :goto_0
    return-void

    .line 1321
    .restart local v0    # "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    .restart local v4    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :cond_2
    const-string v5, "talk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No ChatSession found for contact "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1326
    .end local v0    # "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    .end local v4    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :catch_0
    move-exception v5

    move-object v3, v5

    .line 1327
    .local v3, "ex":Landroid/os/RemoteException;
    const-string v5, "talk"

    const-string v5, "leaveChat: caught "

    invoke-static {v9, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 1324
    .end local v3    # "ex":Landroid/os/RemoteException;
    .restart local v4    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :cond_3
    :try_start_1
    const-string v5, "talk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No ImSession found for account id "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1452
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BuddyList."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1453
    return-void
.end method

.method private static logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p0, "function"    # Ljava/lang/String;

    .prologue
    .line 1456
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BuddyList] "

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

    .line 1457
    return-void
.end method

.method private logout()V
    .locals 4

    .prologue
    const-string v3, "talk"

    .line 1258
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    .line 1259
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v1}, Lcom/google/android/gtalkservice/IImSession;->logout()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1267
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->finish()V

    .line 1268
    return-void

    .line 1261
    :cond_0
    :try_start_1
    const-string v1, "talk"

    const-string v2, "[BuddyList] logout: mImSession is null"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1263
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1264
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BuddyList] logout: caught "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private makeCustomStatusMenuItem(Ljava/lang/String;IZ)Lcom/google/android/talk/BuddyList$StatusItem;
    .locals 6
    .param p1, "status"    # Ljava/lang/String;
    .param p2, "bitmapRes"    # I
    .param p3, "available"    # Z

    .prologue
    .line 1851
    if-eqz p3, :cond_0

    const-string v2, "+ "

    move-object v0, v2

    .line 1852
    .local v0, "offsetString":Ljava/lang/String;
    :goto_0
    new-instance v1, Landroid/text/SpannableString;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 1853
    .local v1, "s":Landroid/text/SpannableString;
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mReplaceWithNothing:Landroid/text/style/ReplacementSpan;

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/16 v5, 0x21

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 1854
    new-instance v2, Lcom/google/android/talk/BuddyList$StatusItem;

    invoke-direct {v2, p0, v1, p2}, Lcom/google/android/talk/BuddyList$StatusItem;-><init>(Lcom/google/android/talk/BuddyList;Landroid/text/SpannableString;I)V

    return-object v2

    .line 1851
    .end local v0    # "offsetString":Ljava/lang/String;
    .end local v1    # "s":Landroid/text/SpannableString;
    :cond_0
    const-string v2, "- "

    move-object v0, v2

    goto :goto_0
.end method

.method private makeStatusAdapter()Lcom/google/android/talk/BuddyList$StatusTextAdapter;
    .locals 15

    .prologue
    const v14, 0x109000a

    const/4 v13, 0x0

    .line 1606
    :try_start_0
    iget-object v10, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v10, :cond_0

    .line 1607
    const/4 v10, 0x0

    .line 1660
    :goto_0
    return-object v10

    .line 1610
    :cond_0
    iget-object v10, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v10}, Lcom/google/android/gtalkservice/IImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v8

    .line 1611
    .local v8, "p":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v8}, Lcom/google/android/gtalkservice/Presence;->getDefaultStatusList()Ljava/util/List;

    move-result-object v1

    .line 1612
    .local v1, "defaultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v8}, Lcom/google/android/gtalkservice/Presence;->getDndStatusList()Ljava/util/List;

    move-result-object v2

    .line 1613
    .local v2, "dndList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v11

    add-int v0, v10, v11

    .line 1619
    .local v0, "count":I
    if-lez v0, :cond_1

    add-int/lit8 v10, v0, 0x4

    :goto_1
    new-array v3, v10, [Ljava/lang/Object;

    .line 1620
    .local v3, "dropDownItems":[Ljava/lang/Object;
    const/4 v5, 0x0

    .line 1623
    .local v5, "i":I
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "i":I
    .local v6, "i":I
    const v10, 0x7f060001

    invoke-virtual {p0, v10}, Lcom/google/android/talk/BuddyList;->getString(I)Ljava/lang/String;

    move-result-object v10

    const v11, 0x108006b

    const/4 v12, 0x1

    invoke-direct {p0, v10, v11, v12}, Lcom/google/android/talk/BuddyList;->makeCustomStatusMenuItem(Ljava/lang/String;IZ)Lcom/google/android/talk/BuddyList$StatusItem;

    move-result-object v10

    aput-object v10, v3, v5

    .line 1628
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    const v10, 0x7f060002

    invoke-virtual {p0, v10}, Lcom/google/android/talk/BuddyList;->getString(I)Ljava/lang/String;

    move-result-object v10

    const v11, 0x1080068

    const/4 v12, 0x1

    invoke-direct {p0, v10, v11, v12}, Lcom/google/android/talk/BuddyList;->makeCustomStatusMenuItem(Ljava/lang/String;IZ)Lcom/google/android/talk/BuddyList$StatusItem;

    move-result-object v10

    aput-object v10, v3, v6

    .line 1633
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "i":I
    .restart local v6    # "i":I
    const v10, 0x7f060005

    invoke-virtual {p0, v10}, Lcom/google/android/talk/BuddyList;->getString(I)Ljava/lang/String;

    move-result-object v10

    const v11, 0x1080069

    const/4 v12, 0x1

    invoke-direct {p0, v10, v11, v12}, Lcom/google/android/talk/BuddyList;->makeCustomStatusMenuItem(Ljava/lang/String;IZ)Lcom/google/android/talk/BuddyList$StatusItem;

    move-result-object v10

    aput-object v10, v3, v5

    .line 1637
    if-lez v0, :cond_4

    .line 1638
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 1639
    .local v9, "s":Ljava/lang/String;
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    const v10, 0x108006b

    const/4 v11, 0x1

    invoke-direct {p0, v9, v10, v11}, Lcom/google/android/talk/BuddyList;->makeCustomStatusMenuItem(Ljava/lang/String;IZ)Lcom/google/android/talk/BuddyList$StatusItem;

    move-result-object v10

    aput-object v10, v3, v6

    move v6, v5

    .end local v5    # "i":I
    .restart local v6    # "i":I
    goto :goto_2

    .line 1619
    .end local v3    # "dropDownItems":[Ljava/lang/Object;
    .end local v6    # "i":I
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v9    # "s":Ljava/lang/String;
    :cond_1
    const/4 v10, 0x3

    goto :goto_1

    .line 1643
    .restart local v3    # "dropDownItems":[Ljava/lang/Object;
    .restart local v6    # "i":I
    .restart local v7    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 1644
    .restart local v9    # "s":Ljava/lang/String;
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    const v10, 0x1080068

    const/4 v11, 0x0

    invoke-direct {p0, v9, v10, v11}, Lcom/google/android/talk/BuddyList;->makeCustomStatusMenuItem(Ljava/lang/String;IZ)Lcom/google/android/talk/BuddyList$StatusItem;

    move-result-object v10

    aput-object v10, v3, v6

    move v6, v5

    .end local v5    # "i":I
    .restart local v6    # "i":I
    goto :goto_3

    .line 1648
    .end local v9    # "s":Ljava/lang/String;
    :cond_3
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "i":I
    .restart local v5    # "i":I
    new-instance v10, Lcom/google/android/talk/BuddyList$ClearStatusList;

    const v11, 0x7f06002e

    invoke-virtual {p0, v11}, Lcom/google/android/talk/BuddyList;->getText(I)Ljava/lang/CharSequence;

    move-result-object v11

    invoke-direct {v10, p0, v11}, Lcom/google/android/talk/BuddyList$ClearStatusList;-><init>(Lcom/google/android/talk/BuddyList;Ljava/lang/CharSequence;)V

    aput-object v10, v3, v6

    .line 1651
    .end local v7    # "i$":Ljava/util/Iterator;
    :goto_4
    new-instance v10, Lcom/google/android/talk/BuddyList$StatusTextAdapter;

    const v11, 0x109000a

    invoke-direct {v10, p0, p0, v11, v3}, Lcom/google/android/talk/BuddyList$StatusTextAdapter;-><init>(Lcom/google/android/talk/BuddyList;Landroid/content/Context;I[Ljava/lang/Object;)V

    iput-object v10, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAdapter:Lcom/google/android/talk/BuddyList$StatusTextAdapter;

    .line 1654
    iget-object v10, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAdapter:Lcom/google/android/talk/BuddyList$StatusTextAdapter;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1655
    .end local v0    # "count":I
    .end local v1    # "defaultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "dndList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "dropDownItems":[Ljava/lang/Object;
    .end local v5    # "i":I
    .end local v8    # "p":Lcom/google/android/gtalkservice/Presence;
    :catch_0
    move-exception v10

    move-object v4, v10

    .line 1656
    .local v4, "e":Landroid/os/RemoteException;
    new-array v3, v13, [Ljava/lang/Object;

    .line 1657
    .restart local v3    # "dropDownItems":[Ljava/lang/Object;
    new-instance v10, Lcom/google/android/talk/BuddyList$StatusTextAdapter;

    invoke-direct {v10, p0, p0, v14, v3}, Lcom/google/android/talk/BuddyList$StatusTextAdapter;-><init>(Lcom/google/android/talk/BuddyList;Landroid/content/Context;I[Ljava/lang/Object;)V

    iput-object v10, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAdapter:Lcom/google/android/talk/BuddyList$StatusTextAdapter;

    .line 1660
    iget-object v10, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAdapter:Lcom/google/android/talk/BuddyList$StatusTextAdapter;

    goto/16 :goto_0

    .end local v4    # "e":Landroid/os/RemoteException;
    .restart local v0    # "count":I
    .restart local v1    # "defaultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v2    # "dndList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v6    # "i":I
    .restart local v8    # "p":Lcom/google/android/gtalkservice/Presence;
    :cond_4
    move v5, v6

    .end local v6    # "i":I
    .restart local v5    # "i":I
    goto :goto_4
.end method

.method private pickAvatar()V
    .locals 5

    .prologue
    const/16 v4, 0x60

    const/4 v3, 0x1

    .line 1665
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1666
    .local v0, "i":Landroid/content/Intent;
    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1667
    const-string v1, "crop"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1668
    const-string v1, "return-data"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1669
    const-string v1, "outputX"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1670
    const-string v1, "outputY"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1671
    const-string v1, "aspectX"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1672
    const-string v1, "aspectY"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1673
    const/16 v1, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/google/android/talk/BuddyList;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1674
    return-void
.end method

.method private pinContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;Z)V
    .locals 5
    .param p1, "info"    # Landroid/widget/AdapterView$AdapterContextMenuInfo;
    .param p2, "pin"    # Z

    .prologue
    const-string v4, "talk"

    .line 1211
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v2, :cond_1

    .line 1212
    const-string v2, "talk"

    const-string v2, "[BuddyList] pinContact: mImSession is null"

    invoke-static {v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1231
    :cond_0
    :goto_0
    return-void

    .line 1216
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/talk/BuddyList;->getUsernameFromMenuInfo(Landroid/widget/AdapterView$AdapterContextMenuInfo;)Ljava/lang/String;

    move-result-object v1

    .line 1218
    .local v1, "username":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1220
    if-eqz p2, :cond_2

    .line 1221
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v2, v1}, Lcom/google/android/gtalkservice/IImSession;->pinContact(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1225
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1226
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BuddyList] pinContact caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1223
    .end local v0    # "ex":Landroid/os/RemoteException;
    :cond_2
    :try_start_1
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v2, v1}, Lcom/google/android/gtalkservice/IImSession;->clearContactFlags(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private registerForIntentBroadcast()V
    .locals 2

    .prologue
    .line 661
    iget v0, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const-string v0, "registerForIntentBroadcast"

    invoke-direct {p0, v0}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 663
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mFilter:Landroid/content/IntentFilter;

    .line 664
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.GTALK_AVATAR_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 665
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/talk/BuddyList;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 666
    return-void
.end method

.method private setCustomStatusText(Ljava/lang/String;)V
    .locals 2
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 1741
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1744
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    iget v1, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusViewColor:I

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 1745
    return-void
.end method

.method private setFocusableForView(Landroid/view/View;Z)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "visible"    # Z

    .prologue
    .line 1735
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 1736
    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 1737
    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusable(Z)V

    .line 1738
    return-void
.end method

.method private setIsOnline(Z)V
    .locals 2
    .param p1, "isOnline"    # Z

    .prologue
    .line 994
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    if-eqz v1, :cond_0

    .line 995
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getListView()Landroid/widget/ListView;

    move-result-object v0

    .line 997
    .local v0, "l":Landroid/widget/ListView;
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v1, p1}, Lcom/google/android/talk/RosterListAdapter;->setIsOnline(Z)V

    .line 998
    invoke-virtual {v0}, Landroid/widget/ListView;->invalidateViews()V

    .line 1001
    .end local v0    # "l":Landroid/widget/ListView;
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    if-eqz v1, :cond_1

    .line 1002
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 1005
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mStatusButton:Landroid/widget/ImageButton;

    if-eqz v1, :cond_2

    .line 1006
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mStatusButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1008
    :cond_2
    return-void
.end method

.method private setQuickContactsMenuItemState()V
    .locals 3

    .prologue
    .line 711
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mQuickContactsMenuItem:Landroid/view/MenuItem;

    if-eqz v1, :cond_0

    .line 712
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->getViewMode()Lcom/google/android/talk/BuddyList$ViewMode;

    move-result-object v1

    sget-object v2, Lcom/google/android/talk/BuddyList$ViewMode;->ALL:Lcom/google/android/talk/BuddyList$ViewMode;

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    move v0, v1

    .line 713
    .local v0, "showQC":Z
    :goto_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mQuickContactsMenuItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_2

    const v2, 0x7f060026

    :goto_1
    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 716
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mQuickContactsMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 718
    .end local v0    # "showQC":Z
    :cond_0
    return-void

    .line 712
    :cond_1
    const/4 v1, 0x0

    move v0, v1

    goto :goto_0

    .line 713
    .restart local v0    # "showQC":Z
    :cond_2
    const v2, 0x7f060027

    goto :goto_1
.end method

.method private setViewMode(Lcom/google/android/talk/BuddyList$ViewMode;)V
    .locals 4
    .param p1, "mode"    # Lcom/google/android/talk/BuddyList$ViewMode;

    .prologue
    const/4 v3, 0x0

    .line 688
    invoke-virtual {p0, v3}, Lcom/google/android/talk/BuddyList;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 690
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v1, "gtalk-view-mode"

    sget-object v2, Lcom/google/android/talk/BuddyList$ViewMode;->QUICK_CONTACTS:Lcom/google/android/talk/BuddyList$ViewMode;

    if-ne p1, v2, :cond_0

    move v2, v3

    :goto_0
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 695
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 696
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->setQuickContactsMenuItemState()V

    .line 697
    return-void

    .line 690
    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private showNoInvisibilityWarning()V
    .locals 2

    .prologue
    .line 1748
    const v0, 0x7f06002b

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1749
    return-void
.end method

.method private showQuickContacts(Z)V
    .locals 4
    .param p1, "showQC"    # Z

    .prologue
    .line 1121
    if-eqz p1, :cond_0

    sget-object v1, Lcom/google/android/talk/BuddyList$ViewMode;->ALL:Lcom/google/android/talk/BuddyList$ViewMode;

    :goto_0
    invoke-direct {p0, v1}, Lcom/google/android/talk/BuddyList;->setViewMode(Lcom/google/android/talk/BuddyList$ViewMode;)V

    .line 1122
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->prepareQueryParameters()V

    .line 1124
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mSelectionClause:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/talk/RosterListAdapter;->setUnfilteredSelectionClause(Ljava/lang/String;)V

    .line 1125
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v1}, Lcom/google/android/talk/RosterListAdapter;->resetQuerySelection()V

    .line 1126
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mProjection:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/talk/RosterListAdapter;->setQueryProjection([Ljava/lang/String;)V

    .line 1128
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getListView()Landroid/widget/ListView;

    move-result-object v0

    .line 1129
    .local v0, "listView":Landroid/widget/ListView;
    invoke-virtual {v0}, Landroid/widget/ListView;->hasTextFilter()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1131
    invoke-virtual {v0}, Landroid/widget/ListView;->clearTextFilter()V

    .line 1135
    :goto_1
    return-void

    .line 1121
    .end local v0    # "listView":Landroid/widget/ListView;
    :cond_0
    sget-object v1, Lcom/google/android/talk/BuddyList$ViewMode;->QUICK_CONTACTS:Lcom/google/android/talk/BuddyList$ViewMode;

    goto :goto_0

    .line 1133
    .restart local v0    # "listView":Landroid/widget/ListView;
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mProjection:[Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mSelectionClause:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/google/android/talk/BuddyList;->startQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1
.end method

.method private showSelectedContactInfo(Landroid/widget/AdapterView$AdapterContextMenuInfo;)V
    .locals 4
    .param p1, "info"    # Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .prologue
    .line 1347
    if-nez p1, :cond_0

    .line 1359
    :goto_0
    return-void

    .line 1351
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1353
    .local v0, "i":Landroid/content/Intent;
    const-class v1, Lcom/google/android/talk/BuddyInfo;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1354
    const-string v1, "userId"

    iget-wide v2, p1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->id:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1355
    const-string v1, "providerId"

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-wide v2, v2, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1356
    const-string v1, "accountId"

    iget-wide v2, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1358
    invoke-virtual {p0, v0}, Lcom/google/android/talk/BuddyList;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private showTermsAndPrivacy()V
    .locals 2

    .prologue
    .line 983
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/google/android/talk/TermsOfServiceActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/google/android/talk/BuddyList;->startActivity(Landroid/content/Intent;)V

    .line 984
    return-void
.end method

.method private unregisterForIntentBroadcast()V
    .locals 2

    .prologue
    .line 669
    iget v0, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const-string v0, "unregisterForIntentBroadcast"

    invoke-direct {p0, v0}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 670
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/google/android/talk/BuddyList;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 671
    return-void
.end method

.method private updatePresenceIndicator(I)V
    .locals 2
    .param p1, "availability"    # I

    .prologue
    .line 1774
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mStatusButton:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1, p1}, Lcom/google/android/talk/TalkApp;->getStatusIcon(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1775
    return-void
.end method

.method private updateSelfAvatar()V
    .locals 8

    .prologue
    .line 1753
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-object v1, v1, Lcom/google/android/talk/TalkApp$AccountInfo;->mUsername:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-wide v2, v2, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    iget-wide v4, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-static/range {v0 .. v5}, Lcom/google/android/talk/DatabaseUtils;->queryAvatarCursorForUser(Landroid/content/ContentResolver;Ljava/lang/String;JJ)Landroid/database/Cursor;

    move-result-object v6

    .line 1757
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-static {v6}, Lcom/google/android/talk/DatabaseUtils;->getAvatarFromOwnCursor(Landroid/database/Cursor;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v7

    .line 1759
    .local v7, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v7, :cond_0

    .line 1760
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getGenericAvatar()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 1765
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mSelfAvatarView:Landroid/widget/ImageView;

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1766
    :try_start_1
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mSelfAvatarView:Landroid/widget/ImageView;

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1767
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1769
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1771
    return-void

    .line 1767
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1769
    .end local v7    # "drawable":Landroid/graphics/drawable/Drawable;
    :catchall_1
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private updateStatusDisplay()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 1696
    :try_start_0
    iget-object v4, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v4, :cond_1

    .line 1697
    const-string v4, "talk"

    const-string v5, "updateStatusDisplay: mImSession is null, bail!"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1732
    :cond_0
    :goto_0
    return-void

    .line 1701
    :cond_1
    iget-object v4, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->isFocused()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1702
    iget v4, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 1703
    const-string v4, "updateStatusDisplay: focus on custom status textview, update later"

    invoke-direct {p0, v4}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1729
    :catch_0
    move-exception v4

    goto :goto_0

    .line 1708
    :cond_2
    iget-object v4, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v4}, Lcom/google/android/gtalkservice/IImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v2

    .line 1710
    .local v2, "p":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->isInvisible()Z

    move-result v1

    .line 1712
    .local v1, "isInvisible":Z
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->getShow()Lcom/google/android/gtalkservice/Presence$Show;

    move-result-object v4

    invoke-virtual {p0, v4, v1}, Lcom/google/android/talk/BuddyList;->translatePresence(Lcom/google/android/gtalkservice/Presence$Show;Z)I

    move-result v0

    .line 1713
    .local v0, "availability":I
    if-eqz v1, :cond_4

    const v4, 0x7f060005

    invoke-virtual {p0, v4}, Lcom/google/android/talk/BuddyList;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object v3, v4

    .line 1715
    .local v3, "status":Ljava/lang/String;
    :goto_1
    iget v4, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    if-lt v4, v6, :cond_3

    .line 1716
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updateStatusDisplay: avail="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", status="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 1719
    :cond_3
    invoke-direct {p0, v3}, Lcom/google/android/talk/BuddyList;->setCustomStatusText(Ljava/lang/String;)V

    .line 1721
    iget-object v4, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    if-nez v1, :cond_5

    move v5, v6

    :goto_2
    invoke-direct {p0, v4, v5}, Lcom/google/android/talk/BuddyList;->setFocusableForView(Landroid/view/View;Z)V

    .line 1723
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->getShow()Lcom/google/android/gtalkservice/Presence$Show;

    move-result-object v4

    invoke-virtual {p0, v4, v1}, Lcom/google/android/talk/BuddyList;->translatePresence(Lcom/google/android/gtalkservice/Presence$Show;Z)I

    move-result v4

    invoke-direct {p0, v4}, Lcom/google/android/talk/BuddyList;->updatePresenceIndicator(I)V

    .line 1725
    if-eqz v1, :cond_0

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->allowInvisibility()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1726
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->showNoInvisibilityWarning()V

    goto :goto_0

    .line 1713
    .end local v3    # "status":Ljava/lang/String;
    :cond_4
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->getStatus()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    move-object v3, v4

    goto :goto_1

    .line 1721
    .restart local v3    # "status":Ljava/lang/String;
    :cond_5
    const/4 v5, 0x0

    goto :goto_2
.end method

.method private uploadAvatar()Z
    .locals 3

    .prologue
    .line 674
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v1, :cond_0

    .line 675
    const/4 v1, 0x0

    .line 684
    :goto_0
    return v1

    .line 679
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v1}, Lcom/google/android/gtalkservice/IImSession;->uploadAvatarFromDb()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 684
    :goto_1
    const/4 v1, 0x1

    goto :goto_0

    .line 680
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 681
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    const-string v2, "upload avatar failed"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method protected addRemoteListeners()V
    .locals 3

    .prologue
    .line 1044
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    .line 1045
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mConnectionListener:Lcom/google/android/talk/BuddyList$ConnectionStateListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->addConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V

    .line 1046
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mRosterListener:Lcom/google/android/talk/BuddyList$RosterListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->addRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V

    .line 1047
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mChatListener:Lcom/google/android/talk/BuddyList$ChatListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 1048
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mGroupChatInvitationListener:Lcom/google/android/talk/BuddyList$GroupChatInvitationListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->addGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1054
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/talk/BuddyList;->dismissStatusbarNotifications(Lcom/google/android/gtalkservice/IGTalkService;)V

    .line 1055
    return-void

    .line 1050
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1051
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    const-string v2, "addRemoteListeners caught "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected initSession(Lcom/google/android/gtalkservice/IGTalkService;)Z
    .locals 7
    .param p1, "service"    # Lcom/google/android/gtalkservice/IGTalkService;

    .prologue
    .line 1071
    invoke-super {p0, p1}, Lcom/google/android/talk/RosterListActivity;->initSession(Lcom/google/android/gtalkservice/IGTalkService;)Z

    move-result v2

    .line 1073
    .local v2, "retVal":Z
    if-eqz v2, :cond_1

    .line 1076
    :try_start_0
    iget-object v4, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v4}, Lcom/google/android/gtalkservice/IImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v1

    .line 1077
    .local v1, "presence":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1078
    iget-object v4, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-object v3, v4, Lcom/google/android/talk/TalkApp$AccountInfo;->mUsername:Ljava/lang/String;

    .line 1079
    .local v3, "username":Ljava/lang/String;
    iget v4, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v5, 0x1

    if-lt v4, v5, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "login for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 1080
    :cond_0
    iget-object v4, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-interface {v4, v3, v5, v6}, Lcom/google/android/gtalkservice/IImSession;->login(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1087
    .end local v1    # "presence":Lcom/google/android/gtalkservice/Presence;
    .end local v3    # "username":Ljava/lang/String;
    :cond_1
    :goto_0
    return v2

    .line 1082
    :catch_0
    move-exception v4

    move-object v0, v4

    .line 1083
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v4, "talk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "initSession: caught "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected final onActivityResult(IILandroid/content/Intent;)V
    .locals 9
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x1

    .line 626
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 627
    sparse-switch p1, :sswitch_data_0

    .line 658
    :cond_0
    :goto_0
    return-void

    .line 629
    :sswitch_0
    const-string v0, "approval"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 630
    const-class v0, Lcom/google/android/talk/ChatScreen;

    invoke-virtual {p3, p0, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 631
    invoke-virtual {p0, p3}, Lcom/google/android/talk/BuddyList;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 635
    :sswitch_1
    iget v0, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    if-lt v0, v8, :cond_1

    .line 636
    const-string v0, "onActivityResult: PICK_ICON_FROM_GALLERY_ID"

    invoke-direct {p0, v0}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 638
    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v7

    .line 639
    .local v7, "extras":Landroid/os/Bundle;
    if-eqz v7, :cond_0

    .line 640
    const-string v0, "data"

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/graphics/Bitmap;

    .line 641
    .local v6, "avatar":Landroid/graphics/Bitmap;
    if-eqz v6, :cond_0

    .line 643
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-object v1, v1, Lcom/google/android/talk/TalkApp$AccountInfo;->mUsername:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-wide v2, v2, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    iget-wide v4, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-static/range {v0 .. v6}, Lcom/google/android/talk/DatabaseUtils;->saveAvatar(Landroid/content/ContentResolver;Ljava/lang/String;JJLandroid/graphics/Bitmap;)V

    .line 646
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->updateSelfAvatar()V

    .line 649
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->uploadAvatar()Z

    move-result v0

    if-nez v0, :cond_0

    .line 650
    iput-boolean v8, p0, Lcom/google/android/talk/BuddyList;->mPendingUploadAvatar:Z

    goto :goto_0

    .line 627
    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_1
        0xc8 -> :sswitch_0
    .end sparse-switch
.end method

.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 10
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const-string v6, ""

    .line 1460
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAlert:Landroid/content/DialogInterface;

    if-ne p1, v6, :cond_1

    .line 1462
    const/4 v4, 0x0

    .line 1463
    .local v4, "showInvisibleWarning":Z
    :try_start_0
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v6}, Lcom/google/android/gtalkservice/IImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v2

    .line 1465
    .local v2, "p":Lcom/google/android/gtalkservice/Presence;
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Lcom/google/android/gtalkservice/Presence;->setInvisible(Z)Z

    .line 1466
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lcom/google/android/gtalkservice/Presence;->setAvailable(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1468
    const/4 v6, 0x3

    if-ge p2, v6, :cond_3

    .line 1470
    packed-switch p2, :pswitch_data_0

    .line 1501
    :goto_0
    :try_start_1
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v6, v2}, Lcom/google/android/gtalkservice/IImSession;->setPresence(Lcom/google/android/gtalkservice/Presence;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1505
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->isInvisible()Z

    move-result v1

    .line 1506
    .local v1, "isInvisible":Z
    if-eqz v1, :cond_6

    const v6, 0x7f060005

    invoke-virtual {p0, v6}, Lcom/google/android/talk/BuddyList;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object v5, v6

    .line 1514
    .local v5, "statusText":Ljava/lang/String;
    :goto_2
    invoke-direct {p0, v5}, Lcom/google/android/talk/BuddyList;->setCustomStatusText(Ljava/lang/String;)V

    .line 1515
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->getShow()Lcom/google/android/gtalkservice/Presence$Show;

    move-result-object v6

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->isInvisible()Z

    move-result v7

    invoke-virtual {p0, v6, v7}, Lcom/google/android/talk/BuddyList;->translatePresence(Lcom/google/android/gtalkservice/Presence$Show;Z)I

    move-result v6

    invoke-direct {p0, v6}, Lcom/google/android/talk/BuddyList;->updatePresenceIndicator(I)V

    .line 1517
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    if-nez v1, :cond_7

    move v7, v9

    :goto_3
    invoke-direct {p0, v6, v7}, Lcom/google/android/talk/BuddyList;->setFocusableForView(Landroid/view/View;Z)V

    .line 1520
    if-eqz v4, :cond_0

    .line 1521
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->showNoInvisibilityWarning()V

    .line 1524
    :cond_0
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAlert:Landroid/content/DialogInterface;

    .line 1525
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAdapter:Lcom/google/android/talk/BuddyList$StatusTextAdapter;

    .line 1529
    .end local v1    # "isInvisible":Z
    .end local v2    # "p":Lcom/google/android/gtalkservice/Presence;
    .end local v4    # "showInvisibleWarning":Z
    .end local v5    # "statusText":Ljava/lang/String;
    :cond_1
    :goto_4
    return-void

    .line 1472
    .restart local v2    # "p":Lcom/google/android/gtalkservice/Presence;
    .restart local v4    # "showInvisibleWarning":Z
    :pswitch_0
    sget-object v6, Lcom/google/android/gtalkservice/Presence$Show;->AVAILABLE:Lcom/google/android/gtalkservice/Presence$Show;

    const-string v7, ""

    invoke-virtual {v2, v6, v7}, Lcom/google/android/gtalkservice/Presence;->setStatus(Lcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    goto :goto_0

    .line 1526
    .end local v2    # "p":Lcom/google/android/gtalkservice/Presence;
    :catch_0
    move-exception v6

    goto :goto_4

    .line 1476
    .restart local v2    # "p":Lcom/google/android/gtalkservice/Presence;
    :pswitch_1
    sget-object v6, Lcom/google/android/gtalkservice/Presence$Show;->DND:Lcom/google/android/gtalkservice/Presence$Show;

    const-string v7, ""

    invoke-virtual {v2, v6, v7}, Lcom/google/android/gtalkservice/Presence;->setStatus(Lcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    goto :goto_0

    .line 1480
    :pswitch_2
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lcom/google/android/gtalkservice/Presence;->setInvisible(Z)Z

    move-result v6

    if-nez v6, :cond_2

    move v4, v9

    :goto_5
    goto :goto_0

    :cond_2
    move v4, v8

    goto :goto_5

    .line 1483
    :cond_3
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAdapter:Lcom/google/android/talk/BuddyList$StatusTextAdapter;

    invoke-virtual {v6}, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->getCount()I

    move-result v6

    sub-int/2addr v6, v9

    if-ne p2, v6, :cond_4

    .line 1485
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->clearStatusLists()V

    goto :goto_0

    .line 1488
    :cond_4
    iget-object v6, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAdapter:Lcom/google/android/talk/BuddyList$StatusTextAdapter;

    invoke-virtual {v6, p2}, Lcom/google/android/talk/BuddyList$StatusTextAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1489
    .local v3, "s":Ljava/lang/String;
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1491
    .local v0, "c":C
    const/4 v6, 0x2

    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 1492
    const-string v6, "+ "

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v0, v6, :cond_5

    sget-object v6, Lcom/google/android/gtalkservice/Presence$Show;->AVAILABLE:Lcom/google/android/gtalkservice/Presence$Show;

    :goto_6
    invoke-virtual {v2, v6, v3}, Lcom/google/android/gtalkservice/Presence;->setStatus(Lcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_5
    sget-object v6, Lcom/google/android/gtalkservice/Presence$Show;->DND:Lcom/google/android/gtalkservice/Presence$Show;

    goto :goto_6

    .line 1506
    .end local v0    # "c":C
    .end local v3    # "s":Ljava/lang/String;
    .restart local v1    # "isInvisible":Z
    :cond_6
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Presence;->getStatus()Ljava/lang/String;
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v6

    move-object v5, v6

    goto :goto_2

    .restart local v5    # "statusText":Ljava/lang/String;
    :cond_7
    move v7, v8

    .line 1517
    goto :goto_3

    .line 1502
    .end local v1    # "isInvisible":Z
    .end local v5    # "statusText":Ljava/lang/String;
    :catch_1
    move-exception v6

    goto/16 :goto_1

    .line 1470
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1582
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    .line 1584
    .local v1, "id":I
    const v2, 0x7f0b0040

    if-ne v1, v2, :cond_1

    .line 1600
    :cond_0
    :goto_0
    return-void

    .line 1588
    :cond_1
    const v2, 0x7f0b0041

    if-ne v1, v2, :cond_2

    .line 1589
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1590
    .local v0, "b":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f060086

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1592
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1593
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->makeStatusAdapter()Lcom/google/android/talk/BuddyList$StatusTextAdapter;

    move-result-object v2

    invoke-virtual {v0, v2, p0}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1595
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/BuddyList;->mCustomStatusAlert:Landroid/content/DialogInterface;

    goto :goto_0

    .line 1596
    .end local v0    # "b":Landroid/app/AlertDialog$Builder;
    :cond_2
    const v2, 0x7f0b0003

    if-ne v1, v2, :cond_0

    .line 1598
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->pickAvatar()V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 603
    invoke-super {p0, p1}, Lcom/google/android/talk/RosterListActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 604
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 10
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/16 v1, 0x64

    const/4 v0, 0x0

    const/4 v9, 0x1

    .line 836
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v6

    check-cast v6, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 838
    .local v6, "info":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v7

    .line 840
    .local v7, "itemId":I
    packed-switch v7, :pswitch_data_0

    .line 884
    if-lt v7, v1, :cond_1

    .line 885
    sub-int v0, v7, v1

    invoke-direct {p0, v6, v0}, Lcom/google/android/talk/BuddyList;->launchStatusUrl(Landroid/widget/AdapterView$AdapterContextMenuInfo;I)V

    move v0, v9

    .line 890
    :goto_0
    return v0

    .line 842
    :pswitch_0
    if-nez v6, :cond_0

    move v0, v9

    .line 843
    goto :goto_0

    .line 845
    :cond_0
    iget-wide v0, v6, Landroid/widget/AdapterView$AdapterContextMenuInfo;->id:J

    invoke-static {p0, v0, v1}, Lcom/google/android/talk/BuddyList;->getUsernameForId(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v8

    .line 846
    .local v8, "username":Ljava/lang/String;
    invoke-static {p0, v8}, Lcom/google/android/talk/BuddyList;->addToContacts(Landroid/app/Activity;Ljava/lang/String;)V

    move v0, v9

    .line 847
    goto :goto_0

    .line 850
    .end local v8    # "username":Ljava/lang/String;
    :pswitch_1
    invoke-direct {p0, v6}, Lcom/google/android/talk/BuddyList;->confirmRemoveSelectedContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;)V

    move v0, v9

    .line 851
    goto :goto_0

    .line 854
    :pswitch_2
    invoke-direct {p0, v6}, Lcom/google/android/talk/BuddyList;->blockContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;)V

    move v0, v9

    .line 855
    goto :goto_0

    .line 858
    :pswitch_3
    invoke-direct {p0, v6, v9}, Lcom/google/android/talk/BuddyList;->hideContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;Z)V

    move v0, v9

    .line 859
    goto :goto_0

    .line 862
    :pswitch_4
    invoke-direct {p0, v6, v0}, Lcom/google/android/talk/BuddyList;->hideContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;Z)V

    move v0, v9

    .line 863
    goto :goto_0

    .line 866
    :pswitch_5
    invoke-direct {p0, v6, v9}, Lcom/google/android/talk/BuddyList;->pinContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;Z)V

    move v0, v9

    .line 867
    goto :goto_0

    .line 870
    :pswitch_6
    invoke-direct {p0, v6, v0}, Lcom/google/android/talk/BuddyList;->pinContact(Landroid/widget/AdapterView$AdapterContextMenuInfo;Z)V

    move v0, v9

    .line 871
    goto :goto_0

    .line 874
    :pswitch_7
    invoke-direct {p0, v6}, Lcom/google/android/talk/BuddyList;->showSelectedContactInfo(Landroid/widget/AdapterView$AdapterContextMenuInfo;)V

    move v0, v9

    .line 875
    goto :goto_0

    .line 878
    :pswitch_8
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getListView()Landroid/widget/ListView;

    move-result-object v2

    iget v3, v6, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    const-wide/16 v4, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/talk/BuddyList;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V

    move v0, v9

    .line 879
    goto :goto_0

    .line 881
    :pswitch_9
    invoke-direct {p0, v6}, Lcom/google/android/talk/BuddyList;->leaveChat(Landroid/widget/AdapterView$AdapterContextMenuInfo;)V

    move v0, v9

    .line 882
    goto :goto_0

    .line 890
    :cond_1
    invoke-super {p0, p1}, Lcom/google/android/talk/RosterListActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0

    .line 840
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_5
        :pswitch_6
        :pswitch_3
        :pswitch_4
        :pswitch_7
        :pswitch_0
        :pswitch_8
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 20
    .param p1, "savedStates"    # Landroid/os/Bundle;

    .prologue
    .line 454
    const/4 v5, 0x7

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->requestWindowFeature(I)Z

    .line 456
    invoke-super/range {p0 .. p1}, Lcom/google/android/talk/RosterListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 458
    invoke-static/range {p0 .. p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/BuddyList;->mApp:Lcom/google/android/talk/TalkApp;

    .line 460
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/talk/BuddyList;->initAccount(Landroid/os/Bundle;)V

    .line 462
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->getListView()Landroid/widget/ListView;

    move-result-object v16

    .line 465
    .local v16, "l":Landroid/widget/ListView;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->registerForContextMenu(Landroid/view/View;)V

    .line 467
    const/4 v5, 0x1

    move-object/from16 v0, v16

    move v1, v5

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setTextFilterEnabled(Z)V

    .line 469
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f030018

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v19

    .line 471
    .local v19, "v":Landroid/view/View;
    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 472
    const/4 v5, 0x1

    move-object/from16 v0, v16

    move v1, v5

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 474
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->registerForServiceStateChanged()V

    .line 477
    new-instance v5, Lcom/google/android/talk/RosterListAdapter;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    move-object v7, v0

    iget-wide v7, v7, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    move-wide v9, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mSelectionClause:Ljava/lang/String;

    move-object v12, v0

    const-string v11, "account=%s AND type!=3 AND subscriptionType>=4"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v11, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    sget-object v15, Lcom/google/android/talk/BuddyList;->PROJECTION:[Ljava/lang/String;

    move-object/from16 v11, p0

    invoke-direct/range {v5 .. v15}, Lcom/google/android/talk/RosterListAdapter;-><init>(Landroid/database/Cursor;JJLcom/google/android/talk/RosterListActivity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    .line 481
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    move-object v5, v0

    move-object/from16 v0, p0

    move-object v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 482
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    move-object v5, v0

    move-object/from16 v0, v16

    move-object v1, v5

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 485
    new-instance v5, Lcom/google/android/talk/BuddyList$QueryHandler;

    move-object v0, v5

    move-object/from16 v1, p0

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2}, Lcom/google/android/talk/BuddyList$QueryHandler;-><init>(Lcom/google/android/talk/BuddyList;Landroid/content/Context;)V

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/BuddyList;->mQueryHandler:Lcom/google/android/talk/BuddyList$QueryHandler;

    .line 492
    invoke-direct/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->getViewMode()Lcom/google/android/talk/BuddyList$ViewMode;

    move-result-object v5

    move-object/from16 v0, p0

    move-object v1, v5

    invoke-direct {v0, v1}, Lcom/google/android/talk/BuddyList;->setViewMode(Lcom/google/android/talk/BuddyList$ViewMode;)V

    .line 494
    invoke-direct/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->registerForIntentBroadcast()V

    .line 496
    const v5, 0x7f0b0003

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .end local p1    # "savedStates":Landroid/os/Bundle;
    check-cast p1, Landroid/widget/ImageView;

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/BuddyList;->mSelfAvatarView:Landroid/widget/ImageView;

    .line 497
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mSelfAvatarView:Landroid/widget/ImageView;

    move-object v5, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mApp:Lcom/google/android/talk/TalkApp;

    move-object v6, v0

    invoke-virtual {v6}, Lcom/google/android/talk/TalkApp;->getGenericAvatar()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 498
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mSelfAvatarView:Landroid/widget/ImageView;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 499
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mSelfAvatarView:Landroid/widget/ImageView;

    move-object v5, v0

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setFocusable(Z)V

    .line 500
    invoke-direct/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->updateSelfAvatar()V

    .line 502
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    .line 503
    .local v17, "resources":Landroid/content/res/Resources;
    const v5, 0x7f050007

    move-object/from16 v0, v17

    move v1, v5

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    move v0, v5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/talk/BuddyList;->mCustomStatusViewColor:I

    .line 504
    const v5, 0x7f050008

    move-object/from16 v0, v17

    move v1, v5

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    move v0, v5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/talk/BuddyList;->mCustomStatusViewEditColor:I

    .line 506
    const v5, 0x7f0b0040

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    .line 507
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 508
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    move-object v5, v0

    new-instance v6, Lcom/google/android/talk/BuddyList$4;

    move-object v0, v6

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/google/android/talk/BuddyList$4;-><init>(Lcom/google/android/talk/BuddyList;)V

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 541
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mCustomStatusView:Landroid/widget/EditText;

    move-object v5, v0

    new-instance v6, Lcom/google/android/talk/BuddyList$5;

    move-object v0, v6

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/google/android/talk/BuddyList$5;-><init>(Lcom/google/android/talk/BuddyList;)V

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 566
    const v5, 0x7f0b0041

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/BuddyList;->mStatusButton:Landroid/widget/ImageButton;

    .line 567
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mStatusButton:Landroid/widget/ImageButton;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 569
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->getWindow()Landroid/view/Window;

    move-result-object v5

    const/4 v6, 0x7

    const v7, 0x7f030009

    invoke-virtual {v5, v6, v7}, Landroid/view/Window;->setFeatureInt(II)V

    .line 570
    const v5, 0x7f0b001f

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    move-object/from16 v0, p1

    move-object v1, v5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 572
    const v5, 0x7f0b0020

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/TextView;

    .line 574
    .local v18, "rightText":Landroid/widget/TextView;
    const v5, -0x9090a

    move-object/from16 v0, v18

    move v1, v5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 575
    const v5, 0x3dcccccd    # 0.1f

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    const/high16 v8, -0x1000000

    move-object/from16 v0, v18

    move v1, v5

    move v2, v6

    move v3, v7

    move v4, v8

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 577
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    move-object v5, v0

    iget-object v5, v5, Lcom/google/android/talk/TalkApp$AccountInfo;->mUsername:Ljava/lang/String;

    move-object/from16 v0, v18

    move-object v1, v5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 580
    const/4 v5, 0x1

    move-object/from16 v0, p0

    move v1, v5

    invoke-direct {v0, v1}, Lcom/google/android/talk/BuddyList;->displayProgress(Z)V

    .line 581
    return-void
.end method

.method public final onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 20
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    .line 766
    move-object/from16 v0, p3

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    move-object v5, v0

    .line 769
    .local v5, "c":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    iget v13, v5, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    if-nez v13, :cond_1

    .line 832
    :cond_0
    :goto_0
    return-void

    .line 773
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/talk/BuddyList;->getListView()Landroid/widget/ListView;

    move-result-object v13

    iget v14, v5, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v13, v14}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/database/Cursor;

    .line 774
    .local v6, "cursor":Landroid/database/Cursor;
    move-object/from16 v0, p0

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/google/android/talk/BuddyList;->isInvite(Landroid/database/Cursor;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 778
    const-string v13, "last_message_date"

    invoke-interface {v6, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {v6, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 780
    .local v8, "lastMessageDate":J
    const-wide/16 v13, 0x0

    cmp-long v13, v8, v13

    if-eqz v13, :cond_2

    const/4 v13, 0x1

    move v10, v13

    .line 781
    .local v10, "showChat":Z
    :goto_1
    const-string v13, "status"

    invoke-interface {v6, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {v6, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    move-object v1, v13

    invoke-direct {v0, v1}, Lcom/google/android/talk/BuddyList;->getStatusUrls(Ljava/lang/String;)[Landroid/text/style/URLSpan;

    move-result-object v11

    .line 784
    .local v11, "statusUrls":[Landroid/text/style/URLSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mColumnNickname:I

    move v13, v0

    invoke-interface {v6, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    move-object v1, v13

    invoke-interface {v0, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 786
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mColumnType:I

    move v13, v0

    invoke-interface {v6, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 787
    .local v12, "type":I
    const/4 v13, 0x1

    if-eq v12, v13, :cond_0

    .line 792
    const/4 v13, 0x2

    if-ne v12, v13, :cond_3

    .line 793
    const/4 v13, 0x0

    const/16 v14, 0xa

    const/4 v15, 0x0

    const v16, 0x7f06001c

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 794
    const/4 v13, 0x0

    const/16 v14, 0xb

    const/4 v15, 0x0

    const v16, 0x7f06001d

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 813
    :goto_2
    const/4 v13, 0x2

    if-eq v12, v13, :cond_0

    .line 814
    const/4 v13, 0x0

    const/16 v14, 0x8

    const/4 v15, 0x0

    const v16, 0x7f060025

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v13

    const/16 v14, 0x40

    invoke-interface {v13, v14}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 818
    const/4 v13, 0x5

    if-ne v12, v13, :cond_6

    .line 819
    const/4 v13, 0x0

    const/4 v14, 0x4

    const/4 v15, 0x0

    const v16, 0x7f060018

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 825
    :goto_3
    const/4 v13, 0x4

    if-ne v12, v13, :cond_7

    .line 826
    const/4 v13, 0x0

    const/4 v14, 0x6

    const/4 v15, 0x0

    const v16, 0x7f06001a

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto/16 :goto_0

    .line 780
    .end local v10    # "showChat":Z
    .end local v11    # "statusUrls":[Landroid/text/style/URLSpan;
    .end local v12    # "type":I
    :cond_2
    const/4 v13, 0x0

    move v10, v13

    goto/16 :goto_1

    .line 795
    .restart local v10    # "showChat":Z
    .restart local v11    # "statusUrls":[Landroid/text/style/URLSpan;
    .restart local v12    # "type":I
    :cond_3
    if-eqz v10, :cond_4

    .line 796
    const/4 v13, 0x0

    const/16 v14, 0xa

    const/4 v15, 0x0

    const v16, 0x7f06001c

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 797
    const/4 v13, 0x0

    const/16 v14, 0xb

    const/4 v15, 0x0

    const v16, 0x7f06001d

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 798
    const/4 v13, 0x0

    const/4 v14, 0x7

    const/4 v15, 0x0

    const v16, 0x7f06001e

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 799
    const/4 v13, 0x0

    const/4 v14, 0x2

    const/4 v15, 0x0

    const v16, 0x7f060016

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto/16 :goto_2

    .line 801
    :cond_4
    const/4 v13, 0x0

    const/16 v14, 0x9

    const/4 v15, 0x0

    const v16, 0x7f06001b

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 802
    const/4 v13, 0x0

    const/4 v14, 0x7

    const/4 v15, 0x0

    const v16, 0x7f06001e

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 803
    array-length v13, v11

    if-lez v13, :cond_5

    .line 804
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    array-length v13, v11

    if-ge v7, v13, :cond_5

    .line 805
    const/4 v13, 0x0

    add-int/lit8 v14, v7, 0x64

    const/4 v15, 0x0

    const v16, 0x7f06001f

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v19, v11, v7

    invoke-virtual/range {v19 .. v19}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/BuddyList;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move-object/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 804
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 809
    .end local v7    # "i":I
    :cond_5
    const/4 v13, 0x0

    const/4 v14, 0x2

    const/4 v15, 0x0

    const v16, 0x7f060016

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 810
    const/4 v13, 0x0

    const/4 v14, 0x1

    const/4 v15, 0x0

    const v16, 0x7f060015

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto/16 :goto_2

    .line 821
    :cond_6
    const/4 v13, 0x0

    const/4 v14, 0x3

    const/4 v15, 0x0

    const v16, 0x7f060017

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto/16 :goto_3

    .line 828
    :cond_7
    const/4 v13, 0x0

    const/4 v14, 0x5

    const/4 v15, 0x0

    const v16, 0x7f060019

    move-object/from16 v0, p1

    move v1, v13

    move v2, v14

    move v3, v15

    move/from16 v4, v16

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    goto/16 :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 895
    invoke-super {p0, p1}, Lcom/google/android/talk/RosterListActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 897
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 898
    .local v0, "inflater":Landroid/view/MenuInflater;
    const/high16 v1, 0x7f0a0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 900
    const v1, 0x7f0b0042

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/BuddyList;->mQuickContactsMenuItem:Landroid/view/MenuItem;

    .line 901
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->setQuickContactsMenuItemState()V

    .line 903
    const v1, 0x7f0b0049

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/BuddyList;->mLogoutMenuItem:Landroid/view/MenuItem;

    .line 905
    const/4 v1, 0x1

    return v1
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p1, "parent"    # Landroid/widget/AdapterView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 1444
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 1445
    return-void
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 12
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 1388
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->getListView()Landroid/widget/ListView;

    move-result-object v10

    invoke-virtual {v10, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/database/Cursor;

    .line 1391
    .local v2, "c":Landroid/database/Cursor;
    if-nez v2, :cond_0

    .line 1440
    :goto_0
    return-void

    .line 1395
    :cond_0
    iget v10, p0, Lcom/google/android/talk/BuddyList;->mColumnUsername:I

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1396
    .local v3, "contact":Ljava/lang/String;
    iget v10, p0, Lcom/google/android/talk/BuddyList;->mColumnAccount:I

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 1399
    .local v0, "account":J
    invoke-direct {p0, v2}, Lcom/google/android/talk/BuddyList;->isInvite(Landroid/database/Cursor;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 1400
    new-instance v5, Landroid/content/Intent;

    const-string v10, "android.intent.action.GTALK_MANAGE_SUBSCRIPTION"

    sget-object v11, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v5, v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1402
    .local v5, "intent":Landroid/content/Intent;
    const-class v10, Lcom/google/android/talk/SubscriptionScreen;

    invoke-virtual {v5, p0, v10}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1403
    const-string v10, "from"

    invoke-virtual {v5, v10, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1404
    const-string v10, "accountId"

    invoke-virtual {v5, v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1439
    :cond_1
    invoke-virtual {p0, v5}, Lcom/google/android/talk/BuddyList;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1406
    .end local v5    # "intent":Landroid/content/Intent;
    :cond_2
    iget v10, p0, Lcom/google/android/talk/BuddyList;->mColumnProvider:I

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    .line 1407
    .local v7, "provider":J
    iget v10, p0, Lcom/google/android/talk/BuddyList;->mColumnGroupChat:I

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_3

    const/4 v10, 0x1

    move v4, v10

    .line 1410
    .local v4, "groupChat":Z
    :goto_1
    if-eqz v4, :cond_4

    .line 1411
    iget v10, p0, Lcom/google/android/talk/BuddyList;->mColumnContactId:I

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-static {v10, v11}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v9

    .line 1416
    .local v9, "uri":Landroid/net/Uri;
    :goto_2
    new-instance v5, Landroid/content/Intent;

    const-string v10, "android.intent.action.VIEW"

    invoke-direct {v5, v10, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1417
    .restart local v5    # "intent":Landroid/content/Intent;
    const-class v10, Lcom/google/android/talk/ChatScreen;

    invoke-virtual {v5, p0, v10}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1419
    const-string v10, "from"

    invoke-virtual {v5, v10, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1420
    const-string v10, "providerId"

    invoke-virtual {v5, v10, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1421
    const-string v10, "accountId"

    invoke-virtual {v5, v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1423
    if-eqz v4, :cond_1

    .line 1424
    iget-object v10, p0, Lcom/google/android/talk/BuddyList;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v10, v10, Lcom/google/android/talk/TalkApp;->mGroupChatInvitations:Ljava/util/HashMap;

    invoke-virtual {v10, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/gtalkservice/GroupChatInvitation;

    .line 1425
    .local v6, "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    const-string v10, "is_muc"

    const/4 v11, 0x1

    invoke-virtual {v5, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1426
    if-eqz v6, :cond_1

    .line 1427
    const-class v10, Lcom/google/android/talk/GroupChatApproval;

    invoke-virtual {v5, p0, v10}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1428
    const-string v10, "muc_inviter"

    invoke-virtual {v6}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getInviter()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1430
    const-string v10, "muc_password"

    invoke-virtual {v6}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getPassword()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1432
    const-string v10, "room"

    invoke-virtual {v6}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getRoomAddress()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1433
    const/16 v10, 0xc8

    invoke-virtual {p0, v5, v10}, Lcom/google/android/talk/BuddyList;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 1407
    .end local v4    # "groupChat":Z
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v6    # "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    .end local v9    # "uri":Landroid/net/Uri;
    :cond_3
    const/4 v10, 0x0

    move v4, v10

    goto :goto_1

    .line 1413
    .restart local v4    # "groupChat":Z
    :cond_4
    invoke-static {v0, v1, v3}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    .restart local v9    # "uri":Landroid/net/Uri;
    goto :goto_2
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 615
    invoke-super {p0, p1}, Lcom/google/android/talk/RosterListActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 618
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mList:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 619
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/talk/BuddyList;->mDontRestoreListViewState:Z

    .line 621
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/BuddyList;->dismissStatusbarNotifications(Lcom/google/android/gtalkservice/IGTalkService;)V

    .line 622
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .param p1, "parent"    # Landroid/widget/AdapterView;

    .prologue
    .line 1449
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v4, 0x1

    const-string v6, "providerId"

    const-string v5, "accountId"

    .line 920
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 973
    invoke-super {p0, p1}, Lcom/google/android/talk/RosterListActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    :goto_0
    return v2

    .line 922
    :pswitch_0
    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mQuickContactsMenuItem:Landroid/view/MenuItem;

    invoke-interface {v2}, Landroid/view/MenuItem;->isChecked()Z

    move-result v2

    if-nez v2, :cond_0

    move v1, v4

    .line 923
    .local v1, "showQC":Z
    :goto_1
    invoke-direct {p0, v1}, Lcom/google/android/talk/BuddyList;->showQuickContacts(Z)V

    move v2, v4

    .line 924
    goto :goto_0

    .line 922
    .end local v1    # "showQC":Z
    :cond_0
    const/4 v2, 0x0

    move v1, v2

    goto :goto_1

    .line 927
    :pswitch_1
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->inviteFriend()V

    move v2, v4

    .line 928
    goto :goto_0

    .line 931
    :pswitch_2
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 932
    .local v0, "intent":Landroid/content/Intent;
    const-class v2, Lcom/google/android/talk/BlockedList;

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 933
    const-string v2, "providerId"

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-wide v2, v2, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    invoke-virtual {v0, v6, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 935
    const-string v2, "accountId"

    iget-wide v2, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-virtual {v0, v5, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 936
    invoke-virtual {p0, v0}, Lcom/google/android/talk/BuddyList;->startActivity(Landroid/content/Intent;)V

    move v2, v4

    .line 937
    goto :goto_0

    .line 941
    .end local v0    # "intent":Landroid/content/Intent;
    :pswitch_3
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 942
    .restart local v0    # "intent":Landroid/content/Intent;
    const-class v2, Lcom/google/android/talk/InvitedUserList;

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 943
    const-string v2, "providerId"

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-wide v2, v2, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    invoke-virtual {v0, v6, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 945
    const-string v2, "accountId"

    iget-wide v2, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-virtual {v0, v5, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 946
    invoke-virtual {p0, v0}, Lcom/google/android/talk/BuddyList;->startActivity(Landroid/content/Intent;)V

    move v2, v4

    .line 947
    goto :goto_0

    .line 951
    .end local v0    # "intent":Landroid/content/Intent;
    :pswitch_4
    invoke-direct {p0, p0}, Lcom/google/android/talk/BuddyList;->displaySettings(Landroid/app/Activity;)V

    move v2, v4

    .line 952
    goto :goto_0

    .line 956
    :pswitch_5
    invoke-virtual {p0}, Lcom/google/android/talk/BuddyList;->onSearchRequested()Z

    move v2, v4

    .line 957
    goto :goto_0

    .line 961
    :pswitch_6
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->logout()V

    move v2, v4

    .line 962
    goto :goto_0

    .line 965
    :pswitch_7
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->closeAllChats()V

    move v2, v4

    .line 966
    goto :goto_0

    .line 969
    :pswitch_8
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->showTermsAndPrivacy()V

    move v2, v4

    .line 970
    goto :goto_0

    .line 920
    :pswitch_data_0
    .packed-switch 0x7f0b0042
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_5
        :pswitch_3
        :pswitch_7
        :pswitch_4
        :pswitch_6
        :pswitch_8
    .end packed-switch
.end method

.method public final onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v2, 0x1

    .line 910
    invoke-super {p0, p1}, Lcom/google/android/talk/RosterListActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 913
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mLogoutMenuItem:Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 915
    return v2

    .line 913
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onRestart()V
    .locals 0

    .prologue
    .line 585
    invoke-super {p0}, Lcom/google/android/talk/RosterListActivity;->onRestart()V

    .line 586
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->updateSelfAvatar()V

    .line 587
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->registerForIntentBroadcast()V

    .line 588
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 592
    invoke-super {p0}, Lcom/google/android/talk/RosterListActivity;->onResume()V

    .line 593
    return-void
.end method

.method public onSearchRequested()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 978
    invoke-virtual {p0, v1, v0, v1, v0}, Lcom/google/android/talk/BuddyList;->startSearch(Ljava/lang/String;ZLandroid/os/Bundle;Z)V

    .line 979
    const/4 v0, 0x1

    return v0
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 608
    invoke-super {p0}, Lcom/google/android/talk/RosterListActivity;->onStop()V

    .line 610
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->unregisterForIntentBroadcast()V

    .line 611
    return-void
.end method

.method protected prepareQueryParameters()V
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 723
    sget-object v0, Lcom/google/android/talk/BuddyList;->PROJECTION:[Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mProjection:[Ljava/lang/String;

    .line 725
    sget-object v0, Lcom/google/android/talk/BuddyList$7;->$SwitchMap$com$google$android$talk$BuddyList$ViewMode:[I

    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->getViewMode()Lcom/google/android/talk/BuddyList$ViewMode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/talk/BuddyList$ViewMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 733
    const-string v0, "account=%s AND type!=3 AND subscriptionType>=4 AND (type!=4 OR last_message_date!=0)"

    new-array v1, v2, [Ljava/lang/Object;

    iget-wide v2, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mSelectionClause:Ljava/lang/String;

    .line 739
    :goto_0
    iget v0, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 740
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "prepareQueryParameters: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mSelectionClause:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 742
    :cond_0
    return-void

    .line 727
    :pswitch_0
    const-string v0, "account=%s AND type!=3 AND subscriptionType>=4 AND (qc=1 OR last_message_date!=0 OR subscriptionType=5)"

    new-array v1, v2, [Ljava/lang/Object;

    iget-wide v2, p0, Lcom/google/android/talk/BuddyList;->mAccountId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/BuddyList;->mSelectionClause:Ljava/lang/String;

    goto :goto_0

    .line 725
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method protected removeRemoteListeners()V
    .locals 3

    .prologue
    .line 1059
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    .line 1060
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mConnectionListener:Lcom/google/android/talk/BuddyList$ConnectionStateListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->removeConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V

    .line 1061
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mRosterListener:Lcom/google/android/talk/BuddyList$RosterListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->removeRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V

    .line 1062
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mChatListener:Lcom/google/android/talk/BuddyList$ChatListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 1063
    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList;->mGroupChatInvitationListener:Lcom/google/android/talk/BuddyList$GroupChatInvitationListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->removeGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1068
    :cond_0
    :goto_0
    return-void

    .line 1065
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1066
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    const-string v2, "removeRemoteListeners caught "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected serviceStateChanged()V
    .locals 2

    .prologue
    .line 1029
    invoke-super {p0}, Lcom/google/android/talk/RosterListActivity;->serviceStateChanged()V

    .line 1032
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/BuddyList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/TalkApp;->asyncPruneOldChatsAndMessages(Lcom/google/android/gtalkservice/IImSession;)V

    .line 1034
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->updateStatusDisplay()V

    .line 1036
    iget-boolean v0, p0, Lcom/google/android/talk/BuddyList;->mPendingUploadAvatar:Z

    if-eqz v0, :cond_0

    .line 1037
    invoke-direct {p0}, Lcom/google/android/talk/BuddyList;->uploadAvatar()Z

    .line 1038
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/talk/BuddyList;->mPendingUploadAvatar:Z

    .line 1040
    :cond_0
    return-void
.end method

.method protected startQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 9
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selectionClause"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 1097
    iget v0, p0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    if-lt v0, v1, :cond_0

    .line 1098
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 1099
    .local v8, "sb":Ljava/lang/StringBuilder;
    const-string v0, "startQuery(): "

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1100
    const-string v0, "projection: "

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1101
    sget-object v0, Lcom/google/android/talk/BuddyList;->PROJECTION:[Ljava/lang/String;

    if-ne p1, v0, :cond_1

    const-string v0, "full"

    :goto_0
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1102
    const-string v0, ", "

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1103
    const-string v0, "selection: \'"

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1104
    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1105
    const-string v0, "\'"

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1106
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/BuddyList;->log(Ljava/lang/String;)V

    .line 1110
    .end local v8    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mQueryHandler:Lcom/google/android/talk/BuddyList$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList$QueryHandler;->cancelOperation(I)V

    .line 1112
    iget-object v0, p0, Lcom/google/android/talk/BuddyList;->mQueryHandler:Lcom/google/android/talk/BuddyList$QueryHandler;

    const/4 v2, 0x0

    sget-object v3, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const-string v7, "subscriptionType DESC, last_message_date DESC, mode DESC, nickname COLLATE UNICODE ASC"

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/talk/BuddyList$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 1118
    return-void

    .line 1101
    .restart local v8    # "sb":Ljava/lang/StringBuilder;
    :cond_1
    const-string v0, "no avatar"

    goto :goto_0
.end method

.method translatePresence(Lcom/google/android/gtalkservice/Presence$Show;Z)I
    .locals 2
    .param p1, "show"    # Lcom/google/android/gtalkservice/Presence$Show;
    .param p2, "isInvisible"    # Z

    .prologue
    .line 1677
    if-eqz p2, :cond_0

    .line 1678
    const/4 v0, 0x1

    .line 1690
    :goto_0
    return v0

    .line 1681
    :cond_0
    sget-object v0, Lcom/google/android/talk/BuddyList$7;->$SwitchMap$com$google$android$gtalkservice$Presence$Show:[I

    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence$Show;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 1690
    const/4 v0, 0x5

    goto :goto_0

    .line 1683
    :pswitch_0
    const/4 v0, 0x4

    goto :goto_0

    .line 1687
    :pswitch_1
    const/4 v0, 0x2

    goto :goto_0

    .line 1681
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
