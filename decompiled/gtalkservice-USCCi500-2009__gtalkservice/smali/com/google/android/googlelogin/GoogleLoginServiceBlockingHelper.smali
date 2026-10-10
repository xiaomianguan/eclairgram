.class public Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;
.super Ljava/lang/Object;
.source "GoogleLoginServiceBlockingHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GoogleLoginServiceBlockingHelper"


# instance fields
.field private final mBackoffFactor:D

.field private mBindWaitCondition:Ljava/util/concurrent/locks/Condition;

.field private final mContext:Landroid/content/Context;

.field private mDelay:I

.field private mGlsVerified:Z

.field private volatile mGoogleLoginService:Lcom/google/android/googleapps/IGoogleLoginService;

.field private mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

.field private final mMaxDelaySecs:I

.field private final mMinDelaySecs:I

.field private mServiceConnection:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginService:Lcom/google/android/googleapps/IGoogleLoginService;

    .line 53
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mBindWaitCondition:Ljava/util/concurrent/locks/Condition;

    .line 79
    const/4 v0, 0x5

    iput v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mMinDelaySecs:I

    .line 80
    const/16 v0, 0x12c

    iput v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mMaxDelaySecs:I

    .line 81
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    iput-wide v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mBackoffFactor:D

    .line 82
    iget v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mMinDelaySecs:I

    iput v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mDelay:I

    .line 83
    iput-object p1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mContext:Landroid/content/Context;

    .line 86
    const-string v0, "com.google.android.googleapps.GoogleLoginService"

    invoke-static {p1, v0}, Lcom/google/android/googlelogin/GoogleAppsVerifier;->isServiceAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;

    invoke-direct {v0, v2}, Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;-><init>(I)V

    throw v0

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 94
    :try_start_0
    new-instance v0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;

    invoke-direct {v0, p0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;-><init>(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)V

    iput-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 122
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/google/android/googlelogin/GoogleLoginServiceConstants;->SERVICE_INTENT:Landroid/content/Intent;

    iget-object v2, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 124
    new-instance v0, Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;-><init>(I)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 130
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Ljava/util/concurrent/locks/Lock;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method static synthetic access$102(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGlsVerified:Z

    return p1
.end method

.method static synthetic access$200(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$302(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;Lcom/google/android/googleapps/IGoogleLoginService;)Lcom/google/android/googleapps/IGoogleLoginService;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;
    .param p1, "x1"    # Lcom/google/android/googleapps/IGoogleLoginService;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginService:Lcom/google/android/googleapps/IGoogleLoginService;

    return-object p1
.end method

.method static synthetic access$400(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Ljava/util/concurrent/locks/Condition;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mBindWaitCondition:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method

.method private checkGoogleLoginServiceVerificationLocked()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;
        }
    .end annotation

    .prologue
    .line 202
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginService:Lcom/google/android/googleapps/IGoogleLoginService;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGlsVerified:Z

    if-nez v0, :cond_0

    .line 203
    new-instance v0, Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;-><init>(I)V

    throw v0

    .line 206
    :cond_0
    return-void
.end method

.method private delay()V
    .locals 4

    .prologue
    .line 155
    :try_start_0
    iget v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mDelay:I

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    :goto_0
    iget v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mDelay:I

    int-to-double v0, v0

    iget-wide v2, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mBackoffFactor:D

    mul-double/2addr v0, v2

    double-to-int v0, v0

    iput v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mDelay:I

    .line 160
    iget v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mDelay:I

    iget v1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mMaxDelaySecs:I

    if-le v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mMaxDelaySecs:I

    iput v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mDelay:I

    .line 161
    :cond_0
    return-void

    .line 156
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static getAndroidId(Landroid/content/Context;)J
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;
        }
    .end annotation

    .prologue
    .line 219
    new-instance v0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-direct {v0, p0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;-><init>(Landroid/content/Context;)V

    .line 221
    .local v0, "h":Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;
    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->getAndroidId()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 223
    invoke-virtual {v0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->close()V

    return-wide v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->close()V

    throw v1
.end method

.method private getLoginService()Lcom/google/android/googleapps/IGoogleLoginService;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;
        }
    .end annotation

    .prologue
    .line 178
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 179
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "calling GoogleLoginServiceBlockingHelper methods from your main thread can lead to deadlock"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 183
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 184
    :goto_0
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginService:Lcom/google/android/googleapps/IGoogleLoginService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    .line 186
    :try_start_1
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mBindWaitCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 187
    :catch_0
    move-exception v0

    goto :goto_0

    .line 192
    :cond_1
    :try_start_2
    invoke-direct {p0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->checkGoogleLoginServiceVerificationLocked()V

    .line 194
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginService:Lcom/google/android/googleapps/IGoogleLoginService;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 196
    iget-object v1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method private resetDelay()V
    .locals 1

    .prologue
    .line 167
    iget v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mMinDelaySecs:I

    iput v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mDelay:I

    .line 168
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 139
    :try_start_0
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mServiceConnection:Landroid/content/ServiceConnection;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 141
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 142
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginService:Lcom/google/android/googleapps/IGoogleLoginService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 147
    return-void

    .line 145
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->mGoogleLoginServiceLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getAndroidId()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/googlelogin/GoogleLoginServiceNotFoundException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-direct {p0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->resetDelay()V

    .line 240
    :goto_0
    invoke-direct {p0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->getLoginService()Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v1

    .line 242
    .local v1, "loginService":Lcom/google/android/googleapps/IGoogleLoginService;
    :try_start_0
    invoke-interface {v1}, Lcom/google/android/googleapps/IGoogleLoginService;->getAndroidId()J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    return-wide v2

    .line 243
    :catch_0
    move-exception v0

    .line 246
    .local v0, "e":Landroid/os/RemoteException;
    invoke-direct {p0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->delay()V

    goto :goto_0
.end method
