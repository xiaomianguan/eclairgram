.class public Lcom/google/android/gtalkservice/AuthTokenFetcher;
.super Ljava/lang/Object;
.source "AuthTokenFetcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;
    }
.end annotation


# static fields
.field private static final WAKELOCK_KEY:Ljava/lang/String; = "GTALK_AUTH_TOKEN"


# instance fields
.field private mAuthTokenType:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher;->mContext:Landroid/content/Context;

    .line 53
    iput-object p2, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher;->mAuthTokenType:Ljava/lang/String;

    .line 55
    iget-object v1, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher;->mContext:Landroid/content/Context;

    const-string v2, "power"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 56
    .local v0, "pm":Landroid/os/PowerManager;
    const/4 v1, 0x1

    const-string v2, "GTALK_AUTH_TOKEN"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 57
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/gtalkservice/AuthTokenFetcher;)Landroid/os/PowerManager$WakeLock;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/AuthTokenFetcher;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/AuthTokenFetcher;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->fetch(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/AuthTokenFetcher;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/gtalkservice/AuthTokenFetcher;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/AuthTokenFetcher;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private fetch(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
    .locals 6
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    .prologue
    .line 124
    :try_start_0
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fetch: get auth token for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->log(Ljava/lang/String;)V

    .line 125
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    new-instance v3, Landroid/accounts/Account;

    const-string v4, "com.google"

    invoke-direct {v3, p1, v4}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher;->mAuthTokenType:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-virtual {v2, v3, v4, v5}, Landroid/accounts/AccountManager;->blockingGetAuthToken(Landroid/accounts/Account;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "authToken":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 130
    invoke-interface {p2, p1}, Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;->authFailed(Ljava/lang/String;)V

    .line 145
    .end local v0    # "authToken":Ljava/lang/String;
    :goto_0
    return-void

    .line 134
    .restart local v0    # "authToken":Ljava/lang/String;
    :cond_1
    invoke-interface {p2, p1, v0}, Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;->authTokenFetched(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/accounts/AuthenticatorException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/accounts/OperationCanceledException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 135
    .end local v0    # "authToken":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v1, v2

    .line 137
    .local v1, "e":Ljava/io/IOException;
    invoke-interface {p2, p1}, Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;->fetchAuthTokenLater(Ljava/lang/String;)V

    goto :goto_0

    .line 138
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v2

    move-object v1, v2

    .line 140
    .local v1, "e":Landroid/accounts/AuthenticatorException;
    invoke-interface {p2, p1}, Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;->fetchAuthTokenLater(Ljava/lang/String;)V

    goto :goto_0

    .line 141
    .end local v1    # "e":Landroid/accounts/AuthenticatorException;
    :catch_2
    move-exception v2

    move-object v1, v2

    .line 143
    .local v1, "e":Landroid/accounts/OperationCanceledException;
    invoke-interface {p2, p1}, Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;->fetchAuthTokenLater(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 148
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[AuthTokenFetcher] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    return-void
.end method


# virtual methods
.method public asyncFetch(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
    .locals 2
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    .prologue
    .line 60
    if-nez p2, :cond_0

    .line 61
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "fetch auth token missing callback"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_0
    if-nez p1, :cond_1

    .line 66
    const-string v0, "GTalkService"

    const-string v1, "fetch auth token error: no username!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :goto_0
    return-void

    .line 70
    :cond_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;-><init>(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public asyncRefreshAuthToken(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
    .locals 2
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "authToken"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    .prologue
    .line 85
    if-nez p3, :cond_0

    .line 86
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "refresh auth token missing callback"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_0
    if-nez p1, :cond_1

    .line 91
    const-string v0, "GTalkService"

    const-string v1, "refresh auth token error: no username!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    :goto_0
    return-void

    .line 95
    :cond_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;-><init>(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method
