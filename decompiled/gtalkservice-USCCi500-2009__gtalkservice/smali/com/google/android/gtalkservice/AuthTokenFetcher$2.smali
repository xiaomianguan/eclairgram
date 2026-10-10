.class Lcom/google/android/gtalkservice/AuthTokenFetcher$2;
.super Ljava/lang/Object;
.source "AuthTokenFetcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/AuthTokenFetcher;->asyncRefreshAuthToken(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

.field final synthetic val$authToken:Ljava/lang/String;

.field final synthetic val$callback:Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

.field final synthetic val$username:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
    .locals 0

    .prologue
    .line 96
    iput-object p1, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    iput-object p2, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->val$username:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->val$authToken:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->val$callback:Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 98
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-static {v0}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$000(Lcom/google/android/gtalkservice/AuthTokenFetcher;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 100
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "asyncRefreshAuthToken: inval old and async-fetch new token for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->val$username:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$200(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;)V

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->val$authToken:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 106
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-static {v0}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$300(Lcom/google/android/gtalkservice/AuthTokenFetcher;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    const-string v1, "com.google"

    iget-object v2, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->val$authToken:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/accounts/AccountManager;->invalidateAuthToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    iget-object v1, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->val$username:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->val$callback:Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    invoke-static {v0, v1, v2}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$100(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-static {v0}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$000(Lcom/google/android/gtalkservice/AuthTokenFetcher;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 117
    return-void

    .line 110
    :cond_2
    :try_start_1
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    const-string v1, "asyncRefreshAuthToken: auth token is already empty."

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$200(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 115
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$2;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-static {v1}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$000(Lcom/google/android/gtalkservice/AuthTokenFetcher;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    throw v0
.end method
