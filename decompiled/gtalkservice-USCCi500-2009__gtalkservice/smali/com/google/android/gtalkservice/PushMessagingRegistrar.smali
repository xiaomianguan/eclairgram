.class public Lcom/google/android/gtalkservice/PushMessagingRegistrar;
.super Ljava/lang/Object;
.source "PushMessagingRegistrar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;,
        Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;,
        Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;,
        Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;
    }
.end annotation


# static fields
.field private static final AUTH_TYPE:Ljava/lang/String; = "mail"

.field private static ERROR_PREFIX:Ljava/lang/String; = null

.field private static final GOOGLE_LOGIN_HEADER:Ljava/lang/String; = "GoogleLogin"

.field private static final LOCAL_DEBUG:Z = false

.field private static final PARAM_APPID:Ljava/lang/String; = "app"

.field private static final PARAM_DELETE:Ljava/lang/String; = "delete"

.field private static final PARAM_DEVICEID:Ljava/lang/String; = "device"

.field private static final PARAM_PERMISSION:Ljava/lang/String; = "permission"

.field private static final PARAM_SENDER:Ljava/lang/String; = "sender"

.field private static final REQ_AUTH_HEADER:Ljava/lang/String; = "Authorization"

.field private static final WAKELOCK_KEY:Ljava/lang/String; = "GOOGLE_PUSH_MESSAGING"


# instance fields
.field private mAndroidId:J

.field private mAuthToken:Ljava/lang/String;

.field private mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

.field private mAuthTokenFetcher:Lcom/google/android/gtalkservice/AuthTokenFetcher;

.field private mConnectivityManager:Landroid/net/ConnectivityManager;

.field private mHttpClient:Lcom/google/android/net/GoogleHttpClient;

.field private mRequestQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;",
            ">;"
        }
    .end annotation
.end field

.field private mService:Lcom/google/android/gtalkservice/service/GTalkService;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 98
    const-string v0, "Error="

    sput-object v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->ERROR_PREFIX:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService;J)V
    .locals 5
    .param p1, "service"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p2, "androidId"    # J

    .prologue
    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    new-instance v1, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    invoke-direct {v1, p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;-><init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    .line 188
    iput-object p1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    .line 189
    iput-wide p2, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAndroidId:J

    .line 190
    new-instance v1, Lcom/google/android/gtalkservice/AuthTokenFetcher;

    const-string v2, "mail"

    invoke-direct {v1, p1, v2}, Lcom/google/android/gtalkservice/AuthTokenFetcher;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenFetcher:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    .line 191
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mRequestQueue:Ljava/util/List;

    .line 192
    new-instance v1, Lcom/google/android/net/GoogleHttpClient;

    iget-object v2, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->getUserAgent()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/net/GoogleHttpClient;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mHttpClient:Lcom/google/android/net/GoogleHttpClient;

    .line 194
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    iput-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 197
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    const-string v2, "power"

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 198
    .local v0, "pm":Landroid/os/PowerManager;
    const/4 v1, 0x1

    const-string v2, "GOOGLE_PUSH_MESSAGING"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 199
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-static {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/PushMessagingRegistrar;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->handleAuthFailed()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/gtalkservice/PushMessagingRegistrar;)Landroid/os/PowerManager$WakeLock;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->handleRequest(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)Z

    move-result v0

    return v0
.end method

.method private addRequestToQueue(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V
    .locals 2
    .param p1, "request"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;

    .prologue
    .line 231
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mRequestQueue:Ljava/util/List;

    monitor-enter v0

    .line 232
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mRequestQueue:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    monitor-exit v0

    .line 234
    return-void

    .line 233
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private asyncHandleRequest(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V
    .locals 2
    .param p1, "request"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;

    .prologue
    .line 396
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "asyncHandleRequest "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 398
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;-><init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 408
    return-void
.end method

.method private fetchAuthToken(Ljava/lang/String;)V
    .locals 3
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 257
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    monitor-enter v0

    .line 258
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    iget-boolean v1, v1, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->mInProgress:Z

    if-eqz v1, :cond_0

    .line 259
    monitor-exit v0

    .line 268
    :goto_0
    return-void

    .line 262
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->access$200(Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;Z)V

    .line 263
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 265
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_1

    const-string v0, "fetchAuthToken"

    invoke-static {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 267
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenFetcher:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->asyncFetch(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V

    goto :goto_0

    .line 263
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private getUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "push_messaging_registration_url"

    invoke-static {v0, v1}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getUserAgent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 210
    const-string v0, "AndroidPushMessaging/1.0"

    return-object v0
.end method

.method private handleAuthFailed()V
    .locals 3

    .prologue
    .line 309
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 312
    :goto_0
    invoke-direct {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->nextRequest()Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 313
    .local v0, "request":Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
    if-nez v0, :cond_0

    .line 322
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 324
    return-void

    .line 317
    :cond_0
    :try_start_1
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleAuthFailed for request "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 318
    :cond_1
    iget-object v1, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;->mSubscription:Ljava/lang/String;

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError;->AUTHENTICATION_FAILED:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual {v2}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 322
    .end local v0    # "request":Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    throw v1
.end method

.method private handleRequest(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)Z
    .locals 7
    .param p1, "request"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;

    .prologue
    const/4 v6, 0x0

    const-string v5, "[PushMsgReg] handleRequest caught "

    const-string v4, "GTalkService"

    .line 359
    :try_start_0
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleRequest "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 361
    :cond_0
    instance-of v2, p1, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;

    if-eqz v2, :cond_1

    .line 362
    move-object v0, p1

    check-cast v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;

    move-object v2, v0

    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->register(Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;)V

    .line 392
    :goto_0
    const/4 v2, 0x1

    :goto_1
    return v2

    .line 364
    :cond_1
    move-object v0, p1

    check-cast v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;

    move-object v2, v0

    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->unregister(Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;)V
    :try_end_0
    .catch Lorg/apache/http/auth/AuthenticationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 366
    :catch_0
    move-exception v2

    move-object v1, v2

    .line 367
    .local v1, "ex":Lorg/apache/http/auth/AuthenticationException;
    const-string v2, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[PushMsgReg] handleRequest caught "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->addRequestToQueue(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V

    .line 371
    invoke-direct {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->refreshAuthToken()V

    move v2, v6

    .line 372
    goto :goto_1

    .line 373
    .end local v1    # "ex":Lorg/apache/http/auth/AuthenticationException;
    :catch_1
    move-exception v2

    move-object v1, v2

    .line 374
    .local v1, "ex":Ljava/io/IOException;
    const-string v2, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[PushMsgReg] handleRequest caught "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    invoke-direct {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->isNetworkAvailable()Z

    move-result v2

    if-nez v2, :cond_3

    .line 379
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_2

    const-string v2, "handleRequest: network not available"

    invoke-static {v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 381
    :cond_2
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->addRequestToQueue(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V

    move v2, v6

    .line 382
    goto :goto_1

    .line 384
    :cond_3
    iget-object v2, p1, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;->mSubscription:Ljava/lang/String;

    sget-object v3, Lcom/google/android/datamessaging/DataMessagingError;->REQUEST_TIMED_OUT:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual {v3}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 387
    .end local v1    # "ex":Ljava/io/IOException;
    :catch_2
    move-exception v2

    move-object v1, v2

    .line 388
    .local v1, "ex":Ljava/lang/Exception;
    const-string v2, "GTalkService"

    const-string v2, "[PushMsgReg] handleRequest caught "

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 389
    iget-object v2, p1, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;->mSubscription:Ljava/lang/String;

    sget-object v3, Lcom/google/android/datamessaging/DataMessagingError;->GENERIC_ERROR:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual {v3}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private isAuthenticationError(I)Z
    .locals 1
    .param p1, "statusCode"    # I

    .prologue
    .line 643
    const/16 v0, 0x193

    if-ne p1, v0, :cond_0

    .line 644
    const/4 v0, 0x1

    .line 647
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isNetworkAvailable()Z
    .locals 7

    .prologue
    .line 237
    iget-object v5, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v5}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v4

    .line 238
    .local v4, "networks":[Landroid/net/NetworkInfo;
    move-object v0, v4

    .local v0, "arr$":[Landroid/net/NetworkInfo;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 239
    .local v3, "network":Landroid/net/NetworkInfo;
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v5

    sget-object v6, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v5, v6, :cond_0

    .line 240
    const/4 v5, 0x1

    .line 244
    .end local v3    # "network":Landroid/net/NetworkInfo;
    :goto_1
    return v5

    .line 238
    .restart local v3    # "network":Landroid/net/NetworkInfo;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 244
    .end local v3    # "network":Landroid/net/NetworkInfo;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private static log(Ljava/lang/String;)V
    .locals 4
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 694
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[PushMsgRegistrar."

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

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 695
    return-void
.end method

.method private nextRequest()Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
    .locals 3

    .prologue
    .line 298
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mRequestQueue:Ljava/util/List;

    monitor-enter v0

    .line 299
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mRequestQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 300
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mRequestQueue:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/gtalkservice/PushMessagingRegistrar;
    check-cast p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;

    monitor-exit v0

    move-object v0, p0

    .line 302
    :goto_0
    return-object v0

    .restart local p0    # "this":Lcom/google/android/gtalkservice/PushMessagingRegistrar;
    :cond_0
    const/4 v1, 0x0

    monitor-exit v0

    move-object v0, v1

    goto :goto_0

    .line 304
    .end local p0    # "this":Lcom/google/android/gtalkservice/PushMessagingRegistrar;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private parseHttpResponseError(I)Ljava/lang/String;
    .locals 1
    .param p1, "statusCode"    # I

    .prologue
    .line 664
    const/16 v0, 0xc8

    if-ne p1, v0, :cond_0

    .line 665
    const/4 v0, 0x0

    .line 670
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/google/android/datamessaging/DataMessagingError;->SERVICE_NOT_AVAILABLE:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual {v0}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private parseServerError(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 651
    const/4 v0, 0x0

    .line 653
    .local v0, "error":Ljava/lang/String;
    if-eqz p1, :cond_0

    sget-object v1, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->ERROR_PREFIX:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 654
    sget-object v1, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->ERROR_PREFIX:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 655
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 656
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 660
    :cond_0
    return-object v0
.end method

.method private refreshAuthToken()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 271
    iget-object v2, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    monitor-enter v2

    .line 272
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    iget-boolean v3, v3, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->mInProgress:Z

    if-eqz v3, :cond_0

    .line 273
    monitor-exit v2

    .line 295
    :goto_0
    return-void

    .line 276
    :cond_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->access$200(Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;Z)V

    .line 277
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 279
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_1

    const-string v2, "refreshAuthToken"

    invoke-static {v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 281
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    .line 284
    .local v1, "authToken":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->setAuthToken(Ljava/lang/String;)V

    .line 286
    iget-object v2, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v2, v5}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryAccount(Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 288
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    if-nez v0, :cond_2

    .line 289
    const-string v2, "GTalkService"

    const-string v3, "asyncFetchAuthToken: get account failed!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 277
    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    .end local v1    # "authToken":Ljava/lang/String;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 293
    .restart local v0    # "account":Lcom/google/android/gtalkservice/Account;
    .restart local v1    # "authToken":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenFetcher:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthTokenCallback:Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;

    invoke-virtual {v2, v3, v1, v4}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->asyncRefreshAuthToken(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V

    goto :goto_0
.end method

.method private registrationRemoved(Ljava/lang/String;)V
    .locals 3
    .param p1, "subscription"    # Ljava/lang/String;

    .prologue
    .line 681
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.push_message_reg_result"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 682
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 683
    const-string v1, "android.intent.extra.push_message_removed_reg"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 684
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v1, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->sendBroadcast(Landroid/content/Intent;)V

    .line 685
    return-void
.end method

.method private registrationSucceeded(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "subscription"    # Ljava/lang/String;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    .line 674
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.push_message_reg_result"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 675
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 676
    const-string v1, "android.intent.extra.push_message_reg_token"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 677
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v1, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->sendBroadcast(Landroid/content/Intent;)V

    .line 678
    return-void
.end method

.method private requestFailed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "subscription"    # Ljava/lang/String;
    .param p2, "error"    # Ljava/lang/String;

    .prologue
    .line 688
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {p1, p2}, Lcom/google/android/datamessaging/DataMessagingService;->createPushMessagingRegistrationErrorIntent(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkService;->sendBroadcast(Landroid/content/Intent;)V

    .line 691
    return-void
.end method


# virtual methods
.method public cleanup()V
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mHttpClient:Lcom/google/android/net/GoogleHttpClient;

    invoke-virtual {v0}, Lcom/google/android/net/GoogleHttpClient;->close()V

    .line 207
    return-void
.end method

.method public fetchAuthTokenAndHandleRequest(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V
    .locals 3
    .param p1, "request"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;

    .prologue
    .line 451
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 452
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryAccount(Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 454
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    if-nez v0, :cond_0

    .line 455
    const-string v1, "GTalkService"

    const-string v2, "fetchAuthTokenAndHandleRequest: get account failed!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    iget-object v1, p1, Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;->mSubscription:Ljava/lang/String;

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError;->ACCOUNT_MISSING:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual {v2}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    :goto_0
    return-void

    .line 460
    .restart local v0    # "account":Lcom/google/android/gtalkservice/Account;
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->addRequestToQueue(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V

    .line 461
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->fetchAuthToken(Ljava/lang/String;)V

    goto :goto_0

    .line 466
    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->asyncHandleRequest(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V

    goto :goto_0
.end method

.method public getAndroidId()J
    .locals 2

    .prologue
    .line 227
    iget-wide v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAndroidId:J

    return-wide v0
.end method

.method public getAuthToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthToken:Ljava/lang/String;

    return-object v0
.end method

.method public handlePendingRequests()V
    .locals 3

    .prologue
    .line 337
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    const-string v1, "handlePendingRequests"

    invoke-static {v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 340
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 343
    :cond_1
    invoke-direct {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->nextRequest()Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 344
    .local v0, "request":Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
    if-nez v0, :cond_2

    .line 353
    :goto_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 355
    return-void

    .line 348
    :cond_2
    :try_start_1
    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->handleRequest(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 353
    .end local v0    # "request":Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    throw v1
.end method

.method public makeRegisterRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "subscription"    # Ljava/lang/String;
    .param p3, "devId"    # Ljava/lang/String;
    .param p4, "permission"    # Ljava/lang/String;
    .param p5, "extraParams"    # Ljava/util/Map;

    .prologue
    .line 249
    new-instance v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;-><init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method

.method public makeUnregisterRequest(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "subscription"    # Ljava/lang/String;

    .prologue
    .line 253
    new-instance v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;-><init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public networkRecovered()V
    .locals 2

    .prologue
    .line 327
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    const-string v0, "networkRecovered "

    invoke-static {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 329
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/android/gtalkservice/PushMessagingRegistrar$1;

    invoke-direct {v1, p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$1;-><init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 334
    return-void
.end method

.method public register(Landroid/app/PendingIntent;Ljava/lang/String;Ljava/util/Map;)V
    .locals 9
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p2, "developerId"    # Ljava/lang/String;
    .param p3, "extraParams"    # Ljava/util/Map;

    .prologue
    .line 422
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v6

    .line 425
    .local v6, "origId":J
    :try_start_0
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getTargetPackage()Ljava/lang/String;

    move-result-object v2

    .line 426
    .local v2, "subscription":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".permission.receive_push_messages"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 427
    .local v4, "permission":Ljava/lang/String;
    invoke-direct {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->getUrl()Ljava/lang/String;

    move-result-object v1

    move-object v0, p0

    move-object v3, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->makeRegisterRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;

    move-result-object v8

    .line 430
    .local v8, "request":Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;
    invoke-virtual {p0, v8}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->fetchAuthTokenAndHandleRequest(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 432
    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 434
    return-void

    .line 432
    .end local v2    # "subscription":Ljava/lang/String;
    .end local v4    # "permission":Ljava/lang/String;
    .end local v8    # "request":Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;
    :catchall_0
    move-exception v0

    invoke-static {v6, v7}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v0
.end method

.method public register(Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;)V
    .locals 26
    .param p1, "request"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 471
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->getAuthToken()Ljava/lang/String;

    move-result-object v5

    .line 472
    .local v5, "authToken":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->getAndroidId()J

    move-result-wide v3

    .line 473
    .local v3, "androidId":J
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;->mUrl:Ljava/lang/String;

    move-object/from16 v21, v0

    .line 474
    .local v21, "url":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;->mSubscription:Ljava/lang/String;

    move-object/from16 v19, v0

    .line 475
    .local v19, "subscription":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;->mDeveloperId:Ljava/lang/String;

    move-object v7, v0

    .line 476
    .local v7, "developerId":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;->mPermission:Ljava/lang/String;

    move-object v14, v0

    .line 477
    .local v14, "permission":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$RegisterRequest;->mExtraParams:Ljava/util/Map;

    move-object v10, v0

    .line 479
    .local v10, "extraParams":Ljava/util/Map;
    sget-boolean v23, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v23, :cond_0

    .line 480
    const-string v23, "register:"

    invoke-static/range {v23 .. v23}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 481
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "  url="

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 484
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "  app="

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 485
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "  permission="

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object v1, v14

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 486
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "  sender="

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object v1, v7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 489
    :cond_0
    invoke-static/range {v21 .. v21}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_1

    .line 490
    const-string v23, "GTalkService"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "register: invalid url "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    sget-object v23, Lcom/google/android/datamessaging/DataMessagingError;->BAD_REQUEST:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual/range {v23 .. v23}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    :goto_0
    return-void

    .line 495
    :cond_1
    new-instance v15, Lorg/apache/http/client/methods/HttpPost;

    move-object v0, v15

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 497
    .local v15, "post":Lorg/apache/http/client/methods/HttpPost;
    const-string v23, "Authorization"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "GoogleLogin auth="

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object v0, v15

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 500
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 501
    .local v13, "params":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    new-instance v23, Lorg/apache/http/message/BasicNameValuePair;

    const-string v24, "app"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v13

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 502
    new-instance v23, Lorg/apache/http/message/BasicNameValuePair;

    const-string v24, "sender"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object v2, v7

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v13

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 503
    new-instance v23, Lorg/apache/http/message/BasicNameValuePair;

    const-string v24, "device"

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v23 .. v25}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v13

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 504
    new-instance v23, Lorg/apache/http/message/BasicNameValuePair;

    const-string v24, "permission"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object v2, v14

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v13

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 506
    if-eqz v10, :cond_2

    .line 507
    invoke-interface {v10}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 508
    .local v11, "itor":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_2

    .line 509
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 510
    .local v12, "key":Ljava/lang/String;
    invoke-interface {v10, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    .line 511
    .local v22, "value":Ljava/lang/String;
    new-instance v23, Lorg/apache/http/message/BasicNameValuePair;

    move-object/from16 v0, v23

    move-object v1, v12

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v13

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 515
    .end local v11    # "itor":Ljava/util/Iterator;
    .end local v12    # "key":Ljava/lang/String;
    .end local v22    # "value":Ljava/lang/String;
    :cond_2
    const/16 v16, 0x0

    .line 517
    .local v16, "reqEntity":Lorg/apache/http/HttpEntity;
    :try_start_0
    new-instance v16, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    .end local v16    # "reqEntity":Lorg/apache/http/HttpEntity;
    move-object/from16 v0, v16

    move-object v1, v13

    invoke-direct {v0, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 523
    .restart local v16    # "reqEntity":Lorg/apache/http/HttpEntity;
    invoke-virtual/range {v15 .. v16}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 525
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mHttpClient:Lcom/google/android/net/GoogleHttpClient;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object v1, v15

    invoke-virtual {v0, v1}, Lcom/google/android/net/GoogleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v17

    .line 526
    .local v17, "response":Lorg/apache/http/HttpResponse;
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v18

    .line 528
    .local v18, "statusCode":I
    const/16 v23, 0xc8

    move/from16 v0, v18

    move/from16 v1, v23

    if-eq v0, v1, :cond_4

    .line 529
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "register: http error "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 531
    const/16 v23, 0x194

    move/from16 v0, v18

    move/from16 v1, v23

    if-ne v0, v1, :cond_3

    .line 532
    new-instance v23, Ljava/io/IOException;

    invoke-direct/range {v23 .. v23}, Ljava/io/IOException;-><init>()V

    throw v23

    .line 518
    .end local v16    # "reqEntity":Lorg/apache/http/HttpEntity;
    .end local v17    # "response":Lorg/apache/http/HttpResponse;
    .end local v18    # "statusCode":I
    :catch_0
    move-exception v23

    move-object/from16 v8, v23

    .line 519
    .local v8, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v23, Lcom/google/android/datamessaging/DataMessagingError;->INVALID_PARAMETERS:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual/range {v23 .. v23}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 535
    .end local v8    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v16    # "reqEntity":Lorg/apache/http/HttpEntity;
    .restart local v17    # "response":Lorg/apache/http/HttpResponse;
    .restart local v18    # "statusCode":I
    :cond_3
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->isAuthenticationError(I)Z

    move-result v23

    if-eqz v23, :cond_4

    .line 536
    new-instance v23, Lorg/apache/http/auth/AuthenticationException;

    invoke-direct/range {v23 .. v23}, Lorg/apache/http/auth/AuthenticationException;-><init>()V

    throw v23

    .line 540
    :cond_4
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v23

    const-string v24, "UTF-8"

    invoke-static/range {v23 .. v24}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 543
    .local v6, "body":Ljava/lang/String;
    const-string v23, "token="

    move-object v0, v6

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_6

    .line 544
    const-string v23, "\n"

    move-object v0, v6

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_5

    .line 545
    const/16 v23, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v24

    const/16 v25, 0x1

    sub-int v24, v24, v25

    move-object v0, v6

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 549
    :cond_5
    const-string v23, "="

    move-object v0, v6

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v23

    const/16 v24, 0x1

    aget-object v20, v23, v24

    .line 550
    .local v20, "token":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->registrationSucceeded(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 555
    .end local v20    # "token":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->parseServerError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 557
    .local v9, "error":Ljava/lang/String;
    if-nez v9, :cond_7

    .line 558
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->parseHttpResponseError(I)Ljava/lang/String;

    move-result-object v9

    .line 559
    if-nez v9, :cond_7

    .line 560
    sget-object v23, Lcom/google/android/datamessaging/DataMessagingError;->SERVER_ERROR:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual/range {v23 .. v23}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v9

    .line 564
    :cond_7
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object v2, v9

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public setAuthToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "authToken"    # Ljava/lang/String;

    .prologue
    .line 223
    iput-object p1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mAuthToken:Ljava/lang/String;

    .line 224
    return-void
.end method

.method public unregister(Landroid/app/PendingIntent;)V
    .locals 5
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 438
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 441
    .local v0, "origId":J
    :try_start_0
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getTargetPackage()Ljava/lang/String;

    move-result-object v3

    .line 442
    .local v3, "subscription":Ljava/lang/String;
    invoke-direct {p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v3}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->makeUnregisterRequest(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;

    move-result-object v2

    .line 444
    .local v2, "request":Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->fetchAuthTokenAndHandleRequest(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 446
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 448
    return-void

    .line 446
    .end local v2    # "request":Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;
    .end local v3    # "subscription":Ljava/lang/String;
    :catchall_0
    move-exception v4

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v4
.end method

.method public unregister(Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;)V
    .locals 19
    .param p1, "request"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 570
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->getAuthToken()Ljava/lang/String;

    move-result-object v5

    .line 571
    .local v5, "authToken":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->getAndroidId()J

    move-result-wide v3

    .line 572
    .local v3, "androidId":J
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;->mUrl:Ljava/lang/String;

    move-object v15, v0

    .line 573
    .local v15, "url":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$UnregisterRequest;->mSubscription:Ljava/lang/String;

    move-object v14, v0

    .line 575
    .local v14, "subscription":Ljava/lang/String;
    sget-boolean v16, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v16, :cond_0

    .line 576
    const-string v16, "unregister:"

    invoke-static/range {v16 .. v16}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 577
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "  url="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v15

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 580
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "  subscription="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v14

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 583
    :cond_0
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v16

    if-eqz v16, :cond_1

    .line 584
    const-string v16, "GTalkService"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "unregister: invalid url "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object v1, v15

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    sget-object v16, Lcom/google/android/datamessaging/DataMessagingError;->BAD_REQUEST:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object v1, v14

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 640
    :goto_0
    return-void

    .line 589
    :cond_1
    new-instance v10, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v10, v15}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 591
    .local v10, "post":Lorg/apache/http/client/methods/HttpPost;
    const-string v16, "Authorization"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "GoogleLogin auth="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object v0, v10

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 594
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 595
    .local v9, "params":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    new-instance v16, Lorg/apache/http/message/BasicNameValuePair;

    const-string v17, "app"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object v2, v14

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v9

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 596
    new-instance v16, Lorg/apache/http/message/BasicNameValuePair;

    const-string v17, "device"

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v16 .. v18}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v9

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 597
    new-instance v16, Lorg/apache/http/message/BasicNameValuePair;

    const-string v17, "delete"

    const-string v18, "true"

    invoke-direct/range {v16 .. v18}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v9

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 599
    const/4 v11, 0x0

    .line 601
    .local v11, "reqEntity":Lorg/apache/http/HttpEntity;
    :try_start_0
    new-instance v11, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    .end local v11    # "reqEntity":Lorg/apache/http/HttpEntity;
    invoke-direct {v11, v9}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 607
    .restart local v11    # "reqEntity":Lorg/apache/http/HttpEntity;
    invoke-virtual {v10, v11}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 608
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->mHttpClient:Lcom/google/android/net/GoogleHttpClient;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    move-object v1, v10

    invoke-virtual {v0, v1}, Lcom/google/android/net/GoogleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v12

    .line 609
    .local v12, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v12}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    .line 611
    .local v13, "statusCode":I
    const/16 v16, 0xc8

    move v0, v13

    move/from16 v1, v16

    if-eq v0, v1, :cond_3

    .line 612
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "unregister: http error "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move v1, v13

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->log(Ljava/lang/String;)V

    .line 614
    const/16 v16, 0x194

    move v0, v13

    move/from16 v1, v16

    if-ne v0, v1, :cond_2

    .line 615
    new-instance v16, Ljava/io/IOException;

    invoke-direct/range {v16 .. v16}, Ljava/io/IOException;-><init>()V

    throw v16

    .line 602
    .end local v11    # "reqEntity":Lorg/apache/http/HttpEntity;
    .end local v12    # "response":Lorg/apache/http/HttpResponse;
    .end local v13    # "statusCode":I
    :catch_0
    move-exception v16

    move-object/from16 v7, v16

    .line 603
    .local v7, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v16, Lcom/google/android/datamessaging/DataMessagingError;->INVALID_PARAMETERS:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual/range {v16 .. v16}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object v1, v14

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 618
    .end local v7    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v11    # "reqEntity":Lorg/apache/http/HttpEntity;
    .restart local v12    # "response":Lorg/apache/http/HttpResponse;
    .restart local v13    # "statusCode":I
    :cond_2
    move-object/from16 v0, p0

    move v1, v13

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->isAuthenticationError(I)Z

    move-result v16

    if-eqz v16, :cond_3

    .line 619
    new-instance v16, Lorg/apache/http/auth/AuthenticationException;

    invoke-direct/range {v16 .. v16}, Lorg/apache/http/auth/AuthenticationException;-><init>()V

    throw v16

    .line 623
    :cond_3
    invoke-interface {v12}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v16

    const-string v17, "UTF-8"

    invoke-static/range {v16 .. v17}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 629
    .local v6, "body":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->parseServerError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 631
    .local v8, "error":Ljava/lang/String;
    if-nez v8, :cond_4

    .line 632
    move-object/from16 v0, p0

    move v1, v13

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->parseHttpResponseError(I)Ljava/lang/String;

    move-result-object v8

    .line 635
    :cond_4
    if-eqz v8, :cond_5

    .line 636
    move-object/from16 v0, p0

    move-object v1, v14

    move-object v2, v8

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 638
    :cond_5
    move-object/from16 v0, p0

    move-object v1, v14

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->registrationRemoved(Ljava/lang/String;)V

    goto/16 :goto_0
.end method
