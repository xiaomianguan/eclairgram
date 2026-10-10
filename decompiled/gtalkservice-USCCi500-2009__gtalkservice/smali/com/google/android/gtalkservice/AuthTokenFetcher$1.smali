.class Lcom/google/android/gtalkservice/AuthTokenFetcher$1;
.super Ljava/lang/Object;
.source "AuthTokenFetcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/AuthTokenFetcher;->asyncFetch(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

.field final synthetic val$callback:Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

.field final synthetic val$username:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    iput-object p2, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;->val$username:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;->val$callback:Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 73
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-static {v0}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$000(Lcom/google/android/gtalkservice/AuthTokenFetcher;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 74
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    iget-object v1, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;->val$username:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;->val$callback:Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    invoke-static {v0, v1, v2}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$100(Lcom/google/android/gtalkservice/AuthTokenFetcher;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    iget-object v0, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-static {v0}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$000(Lcom/google/android/gtalkservice/AuthTokenFetcher;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 78
    return-void

    .line 76
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/AuthTokenFetcher$1;->this$0:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-static {v1}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->access$000(Lcom/google/android/gtalkservice/AuthTokenFetcher;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    throw v0
.end method
