.class public Lcom/google/android/talk/SubscriptionScreen;
.super Landroid/app/Activity;
.source "SubscriptionScreen.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "talk"


# instance fields
.field private mApp:Lcom/google/android/talk/TalkApp;

.field private mDialog:Landroid/app/Dialog;

.field private mHandler:Landroid/os/Handler;

.field private mImSession:Lcom/google/android/gtalkservice/IImSession;

.field private mNickname:Ljava/lang/String;

.field private mService:Lcom/google/android/gtalkservice/IGTalkService;

.field private mUsername:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/SubscriptionScreen;)Lcom/google/android/gtalkservice/IImSession;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SubscriptionScreen;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/google/android/talk/SubscriptionScreen;->getImSession()Lcom/google/android/gtalkservice/IImSession;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/talk/SubscriptionScreen;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SubscriptionScreen;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mUsername:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/talk/SubscriptionScreen;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SubscriptionScreen;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mNickname:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/talk/SubscriptionScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SubscriptionScreen;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/google/android/talk/SubscriptionScreen;->serviceStateChanged()V

    return-void
.end method

.method private dismissSubscriptionNotifications(Lcom/google/android/gtalkservice/IGTalkService;)V
    .locals 4
    .param p1, "service"    # Lcom/google/android/gtalkservice/IGTalkService;

    .prologue
    .line 163
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/talk/SubscriptionScreen;->getImSession()Lcom/google/android/gtalkservice/IImSession;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gtalkservice/IImSession;->getServiceProviderId()J

    move-result-wide v0

    .line 164
    .local v0, "providerId":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 166
    invoke-interface {p1, v0, v1}, Lcom/google/android/gtalkservice/IGTalkService;->dismissNotifications(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    .end local v0    # "providerId":J
    :cond_0
    :goto_0
    return-void

    .line 168
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private getImSession()Lcom/google/android/gtalkservice/IImSession;
    .locals 2

    .prologue
    .line 143
    iget-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {p0}, Lcom/google/android/talk/SubscriptionScreen;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/TalkApp;->getImSessionFromActivityIntent(Landroid/content/Intent;)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    .line 146
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 174
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[SubscriptionScn] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    return-void
.end method

.method private makeDialog()Landroid/app/Dialog;
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 45
    const v3, 0x7f06005e

    invoke-virtual {p0, v3}, Lcom/google/android/talk/SubscriptionScreen;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-array v4, v7, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/android/talk/SubscriptionScreen;->mUsername:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 47
    .local v2, "s":Ljava/lang/String;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 48
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v3, 0x7f06005d

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 49
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 51
    new-instance v1, Lcom/google/android/talk/SubscriptionScreen$1;

    invoke-direct {v1, p0}, Lcom/google/android/talk/SubscriptionScreen$1;-><init>(Lcom/google/android/talk/SubscriptionScreen;)V

    .line 76
    .local v1, "listener":Landroid/content/DialogInterface$OnClickListener;
    const v3, 0x7f060071

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 77
    const v3, 0x7f060034

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 78
    const v3, 0x7f060072

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 80
    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 81
    new-instance v3, Lcom/google/android/talk/SubscriptionScreen$2;

    invoke-direct {v3, p0}, Lcom/google/android/talk/SubscriptionScreen$2;-><init>(Lcom/google/android/talk/SubscriptionScreen;)V

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 87
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    return-object v3
.end method

.method private registerForServiceStateChanged()V
    .locals 3

    .prologue
    .line 126
    iget-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/SubscriptionScreen;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/talk/SubscriptionScreen$3;

    invoke-direct {v2, p0}, Lcom/google/android/talk/SubscriptionScreen$3;-><init>(Lcom/google/android/talk/SubscriptionScreen;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/TalkApp;->addServiceStateChangedCallback(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 131
    return-void
.end method

.method private serviceStateChanged()V
    .locals 2

    .prologue
    .line 150
    iget-object v1, p0, Lcom/google/android/talk/SubscriptionScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    .line 152
    .local v0, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/talk/SubscriptionScreen;->getImSession()Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    if-nez v1, :cond_1

    .line 153
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/talk/SubscriptionScreen;->finish()V

    .line 159
    :goto_0
    return-void

    .line 157
    :cond_1
    iput-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    .line 158
    invoke-direct {p0, v0}, Lcom/google/android/talk/SubscriptionScreen;->dismissSubscriptionNotifications(Lcom/google/android/gtalkservice/IGTalkService;)V

    goto :goto_0
.end method

.method private unregisterForServiceStateChanged()V
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/SubscriptionScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/TalkApp;->removeServiceStateChangedCallback(Landroid/os/Handler;)V

    .line 135
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 91
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 93
    invoke-virtual {p0}, Lcom/google/android/talk/SubscriptionScreen;->resolveIntent()V

    .line 95
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mApp:Lcom/google/android/talk/TalkApp;

    .line 96
    invoke-direct {p0}, Lcom/google/android/talk/SubscriptionScreen;->registerForServiceStateChanged()V

    .line 98
    invoke-direct {p0}, Lcom/google/android/talk/SubscriptionScreen;->makeDialog()Landroid/app/Dialog;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mDialog:Landroid/app/Dialog;

    .line 99
    iget-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 100
    return-void
.end method

.method protected onRestart()V
    .locals 2

    .prologue
    .line 104
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 106
    iget-object v1, p0, Lcom/google/android/talk/SubscriptionScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    .line 107
    .local v0, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/talk/SubscriptionScreen;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eq v1, v0, :cond_1

    .line 108
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/SubscriptionScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->handleDisconnectedService()V

    .line 109
    invoke-direct {p0}, Lcom/google/android/talk/SubscriptionScreen;->registerForServiceStateChanged()V

    .line 114
    :goto_0
    iget-object v1, p0, Lcom/google/android/talk/SubscriptionScreen;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 115
    return-void

    .line 111
    :cond_1
    invoke-direct {p0}, Lcom/google/android/talk/SubscriptionScreen;->serviceStateChanged()V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 119
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 121
    invoke-direct {p0}, Lcom/google/android/talk/SubscriptionScreen;->unregisterForServiceStateChanged()V

    .line 122
    iget-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 123
    return-void
.end method

.method resolveIntent()V
    .locals 2

    .prologue
    .line 138
    invoke-virtual {p0}, Lcom/google/android/talk/SubscriptionScreen;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "from"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SubscriptionScreen;->mUsername:Ljava/lang/String;

    .line 140
    return-void
.end method
