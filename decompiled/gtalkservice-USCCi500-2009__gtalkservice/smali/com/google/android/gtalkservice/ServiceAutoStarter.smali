.class public Lcom/google/android/gtalkservice/ServiceAutoStarter;
.super Landroid/content/BroadcastReceiver;
.source "ServiceAutoStarter.java"


# static fields
.field private static volatile sBootFlag:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/gtalkservice/ServiceAutoStarter;->sBootFlag:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static clearBootFlag()V
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/gtalkservice/ServiceAutoStarter;->sBootFlag:Z

    .line 78
    return-void
.end method

.method public static getBootFlag()Z
    .locals 1

    .prologue
    .line 73
    sget-boolean v0, Lcom/google/android/gtalkservice/ServiceAutoStarter;->sBootFlag:Z

    return v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 81
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ServiceAutoStarter] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 56
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "action":Ljava/lang/String;
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 68
    :cond_0
    const-string v1, "--- start GTalk service ---"

    invoke-static {v1}, Lcom/google/android/gtalkservice/ServiceAutoStarter;->log(Ljava/lang/String;)V

    .line 69
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/google/android/gtalkservice/IGTalkService;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 70
    :goto_0
    return-void

    .line 60
    :cond_1
    const-string v1, "android.accounts.LOGIN_ACCOUNTS_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 62
    const-string v1, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 63
    const-string v1, "--- received boot intent broadcast"

    invoke-static {v1}, Lcom/google/android/gtalkservice/ServiceAutoStarter;->log(Ljava/lang/String;)V

    .line 64
    const/4 v1, 0x1

    sput-boolean v1, Lcom/google/android/gtalkservice/ServiceAutoStarter;->sBootFlag:Z

    goto :goto_0
.end method
