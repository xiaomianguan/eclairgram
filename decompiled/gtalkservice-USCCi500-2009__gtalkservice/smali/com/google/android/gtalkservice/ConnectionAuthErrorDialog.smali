.class public Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;
.super Lcom/android/internal/app/AlertActivity;
.source "ConnectionAuthErrorDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private mAccountId:J

.field private mConnection:Landroid/content/ServiceConnection;

.field private mService:Lcom/google/android/gtalkservice/IGTalkService;

.field private mUsername:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/android/internal/app/AlertActivity;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    .line 48
    new-instance v0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog$1;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog$1;-><init>(Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mConnection:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic access$002(Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;Lcom/google/android/gtalkservice/IGTalkService;)Lcom/google/android/gtalkservice/IGTalkService;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IGTalkService;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    return-object p1
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->loginSession()V

    return-void
.end method

.method private bindService()V
    .locals 3

    .prologue
    .line 101
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/google/android/gtalkservice/IGTalkService;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 102
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mConnection:Landroid/content/ServiceConnection;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 103
    return-void
.end method

.method private loginSession()V
    .locals 6

    .prologue
    .line 107
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mAccountId:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mUsername:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 108
    iget-object v2, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    iget-wide v3, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mAccountId:J

    invoke-interface {v2, v3, v4}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v0

    .line 109
    .local v0, "imSession":Lcom/google/android/gtalkservice/IImSession;
    if-eqz v0, :cond_0

    .line 110
    iget-object v2, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mUsername:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v0, v2, v3, v4}, Lcom/google/android/gtalkservice/IImSession;->login(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .end local v0    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :cond_0
    :goto_0
    return-void

    .line 113
    :catch_0
    move-exception v2

    move-object v1, v2

    .line 114
    .local v1, "re":Landroid/os/RemoteException;
    const-string v2, "GTalkService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[ConnectionAuthErrorDialog] login failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 93
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 94
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->bindService()V

    .line 98
    :goto_0
    return-void

    .line 96
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->finish()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 61
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 64
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "accountId"

    const-wide/16 v3, -0x1

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mAccountId:J

    .line 65
    const-string v2, "username"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mUsername:Ljava/lang/String;

    .line 66
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    .line 67
    const-string v2, "GTalkService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[ConnectionAuthErrorDialog]: mAccountId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mAccountId:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "mUsername="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mUsername:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    .line 73
    .local v1, "p":Lcom/android/internal/app/AlertController$AlertParams;
    const v2, 0x1080027

    iput v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mIconId:I

    .line 74
    const v2, 0x7f050018

    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 75
    const v2, 0x7f050019

    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mMessage:Ljava/lang/CharSequence;

    .line 76
    const v2, 0x7f05001a

    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonText:Ljava/lang/CharSequence;

    .line 77
    iput-object p0, v1, Lcom/android/internal/app/AlertController$AlertParams;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 78
    const v2, 0x7f05001b

    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonText:Ljava/lang/CharSequence;

    .line 79
    iput-object p0, v1, Lcom/android/internal/app/AlertController$AlertParams;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    .line 80
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->setupAlert()V

    .line 81
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 85
    invoke-super {p0}, Lcom/android/internal/app/AlertActivity;->onStop()V

    .line 86
    iget-object v0, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->unbindService(Landroid/content/ServiceConnection;)V

    .line 88
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    .line 90
    :cond_0
    return-void
.end method
