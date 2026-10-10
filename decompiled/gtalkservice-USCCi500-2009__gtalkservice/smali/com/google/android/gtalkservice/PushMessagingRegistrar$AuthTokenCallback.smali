.class Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;
.super Ljava/lang/Object;
.source "PushMessagingRegistrar.java"

# interfaces
.implements Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/PushMessagingRegistrar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AuthTokenCallback"
.end annotation


# instance fields
.field mInProgress:Z

.field final synthetic this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;)V
    .locals 0

    .prologue
    .line 113
    iput-object p1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;
    .param p1, "x1"    # Z

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->setInProgress(Z)V

    return-void
.end method

.method private setInProgress(Z)V
    .locals 1
    .param p1, "flag"    # Z

    .prologue
    .line 142
    monitor-enter p0

    .line 143
    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->mInProgress:Z

    .line 144
    monitor-exit p0

    .line 145
    return-void

    .line 144
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public authFailed(Ljava/lang/String;)V
    .locals 1
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 133
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    .line 134
    const-string v0, "AuthTokenCallback: authFailed!"

    invoke-static {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->access$000(Ljava/lang/String;)V

    .line 137
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->setInProgress(Z)V

    .line 138
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-static {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->access$100(Lcom/google/android/gtalkservice/PushMessagingRegistrar;)V

    .line 139
    return-void
.end method

.method public authTokenFetched(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "authToken"    # Ljava/lang/String;

    .prologue
    .line 117
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    .line 118
    const-string v0, "authToken fetched, proceed..."

    invoke-static {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->access$000(Ljava/lang/String;)V

    .line 121
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-virtual {v0, p2}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->setAuthToken(Ljava/lang/String;)V

    .line 122
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->setInProgress(Z)V

    .line 123
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->handlePendingRequests()V

    .line 124
    return-void
.end method

.method public fetchAuthTokenLater(Ljava/lang/String;)V
    .locals 1
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 127
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar$AuthTokenCallback;->setInProgress(Z)V

    .line 130
    return-void
.end method
