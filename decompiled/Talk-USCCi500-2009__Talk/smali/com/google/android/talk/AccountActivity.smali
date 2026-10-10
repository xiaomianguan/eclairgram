.class public Lcom/google/android/talk/AccountActivity;
.super Landroid/app/Activity;
.source "AccountActivity.java"


# static fields
.field private static final ACCOUNT_PROJECTION:[Ljava/lang/String;

.field private static final GOOGLE_TALK_SERVICE:Ljava/lang/String; = "mail"

.field private static final REQUIRED_ACCOUNT_FEATURES:[Ljava/lang/String;


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mLogLevel:I

.field private mService:Lcom/google/android/gtalkservice/IGTalkService;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 41
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "account_id"

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/android/talk/AccountActivity;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    .line 48
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "legacy_hosted_or_google"

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/android/talk/AccountActivity;->REQUIRED_ACCOUNT_FEATURES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/AccountActivity;->mHandler:Landroid/os/Handler;

    .line 47
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/talk/AccountActivity;->mLogLevel:I

    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/AccountActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/AccountActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/google/android/talk/AccountActivity;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/talk/AccountActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/AccountActivity;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/google/android/talk/AccountActivity;->registerForServiceStateChanged()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/talk/AccountActivity;)Lcom/google/android/gtalkservice/IGTalkService;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/AccountActivity;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    return-object v0
.end method

.method static synthetic access$202(Lcom/google/android/talk/AccountActivity;Lcom/google/android/gtalkservice/IGTalkService;)Lcom/google/android/gtalkservice/IGTalkService;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/AccountActivity;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IGTalkService;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/google/android/talk/AccountActivity;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    return-object p1
.end method

.method static synthetic access$300(Lcom/google/android/talk/AccountActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/AccountActivity;

    .prologue
    .line 38
    iget v0, p0, Lcom/google/android/talk/AccountActivity;->mLogLevel:I

    return v0
.end method

.method static synthetic access$400(Lcom/google/android/talk/AccountActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/AccountActivity;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/google/android/talk/AccountActivity;->login()V

    return-void
.end method

.method private checkForAccount()V
    .locals 9

    .prologue
    const/4 v6, 0x0

    .line 61
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 62
    .local v5, "bundle":Landroid/os/Bundle;
    const-string v0, "optional_message"

    const v1, 0x7f06000f

    invoke-virtual {p0, v1}, Lcom/google/android/talk/AccountActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 63
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    const-string v1, "com.google"

    const-string v2, "mail"

    sget-object v3, Lcom/google/android/talk/AccountActivity;->REQUIRED_ACCOUNT_FEATURES:[Ljava/lang/String;

    new-instance v7, Lcom/google/android/talk/AccountActivity$1;

    invoke-direct {v7, p0}, Lcom/google/android/talk/AccountActivity$1;-><init>(Lcom/google/android/talk/AccountActivity;)V

    move-object v4, p0

    move-object v8, v6

    invoke-virtual/range {v0 .. v8}, Landroid/accounts/AccountManager;->getAuthTokenByFeatures(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/app/Activity;Landroid/os/Bundle;Landroid/os/Bundle;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    .line 89
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 158
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[AccountActivity] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 162
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[AccountActivity] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": empty cursor, possibly low memory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    return-void
.end method

.method private login()V
    .locals 11

    .prologue
    .line 122
    const-wide/16 v6, 0x0

    .line 123
    .local v6, "accountId":J
    invoke-virtual {p0}, Lcom/google/android/talk/AccountActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Im$Provider;->CONTENT_URI_WITH_ACCOUNT:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/AccountActivity;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    const-string v3, "providers.name=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v10, "GTalk"

    aput-object v10, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 129
    .local v8, "c":Landroid/database/Cursor;
    if-eqz v8, :cond_2

    .line 131
    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    const-string v0, "account_id"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v6

    .line 135
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 141
    :goto_0
    const-string v0, "talk"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "login: account="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/AccountActivity;->log(Ljava/lang/String;)V

    .line 145
    :cond_1
    const-wide/16 v0, 0x0

    cmp-long v0, v6, v0

    if-nez v0, :cond_3

    .line 146
    invoke-virtual {p0}, Lcom/google/android/talk/AccountActivity;->finish()V

    .line 155
    :goto_1
    return-void

    .line 135
    :catchall_0
    move-exception v0

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    throw v0

    .line 138
    :cond_2
    const-string v0, "login"

    invoke-direct {p0, v0}, Lcom/google/android/talk/AccountActivity;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0

    .line 150
    :cond_3
    new-instance v9, Landroid/content/Intent;

    const-class v0, Lcom/google/android/talk/SigningInActivity;

    invoke-direct {v9, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 151
    .local v9, "intent":Landroid/content/Intent;
    sget-object v0, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 153
    invoke-virtual {p0, v9}, Lcom/google/android/talk/AccountActivity;->startActivity(Landroid/content/Intent;)V

    .line 154
    invoke-virtual {p0}, Lcom/google/android/talk/AccountActivity;->finish()V

    goto :goto_1
.end method

.method private registerForServiceStateChanged()V
    .locals 3

    .prologue
    .line 92
    const-string v1, "talk"

    const/4 v2, 0x3

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    const-string v1, "registerForServiceStateChanged"

    invoke-direct {p0, v1}, Lcom/google/android/talk/AccountActivity;->log(Ljava/lang/String;)V

    .line 96
    :cond_0
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    .line 102
    .local v0, "app":Lcom/google/android/talk/TalkApp;
    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->rebindService()V

    .line 104
    iget-object v1, p0, Lcom/google/android/talk/AccountActivity;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/talk/AccountActivity$2;

    invoke-direct {v2, p0, v0}, Lcom/google/android/talk/AccountActivity$2;-><init>(Lcom/google/android/talk/AccountActivity;Lcom/google/android/talk/TalkApp;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/TalkApp;->addServiceStateChangedCallback(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 119
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 53
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v0

    iput v0, p0, Lcom/google/android/talk/AccountActivity;->mLogLevel:I

    .line 57
    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/google/android/talk/AccountActivity;->checkForAccount()V

    .line 58
    :cond_0
    return-void
.end method
