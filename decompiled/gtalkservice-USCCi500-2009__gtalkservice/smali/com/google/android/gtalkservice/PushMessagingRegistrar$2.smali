.class Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;
.super Ljava/lang/Object;
.source "PushMessagingRegistrar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/PushMessagingRegistrar;->asyncHandleRequest(Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

.field final synthetic val$request:Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)V
    .locals 0

    .prologue
    .line 399
    iput-object p1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    iput-object p2, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;->val$request:Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 401
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-static {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->access$300(Lcom/google/android/gtalkservice/PushMessagingRegistrar;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 402
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;->val$request:Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->access$400(Lcom/google/android/gtalkservice/PushMessagingRegistrar;Lcom/google/android/gtalkservice/PushMessagingRegistrar$Request;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 404
    iget-object v0, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-static {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->access$300(Lcom/google/android/gtalkservice/PushMessagingRegistrar;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 406
    return-void

    .line 404
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/PushMessagingRegistrar$2;->this$0:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-static {v1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->access$300(Lcom/google/android/gtalkservice/PushMessagingRegistrar;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    throw v0
.end method
