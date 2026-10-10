.class Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;
.super Landroid/os/Handler;
.source "GTalkConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/GTalkConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WorkerHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/GTalkConnection;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 264
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 265
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 266
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 269
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 271
    :sswitch_0
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    const-string v1, "(WORKER THREAD) connect"

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->access$200(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V

    .line 272
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-static {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->access$300(Lcom/google/android/gtalkservice/GTalkConnection;)V

    goto :goto_0

    .line 276
    :sswitch_1
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    const-string v1, "(WORKER THREAD) logout"

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->access$200(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V

    .line 277
    :cond_2
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-static {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->access$400(Lcom/google/android/gtalkservice/GTalkConnection;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-static {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->access$500(Lcom/google/android/gtalkservice/GTalkConnection;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/RosterListenerImpl;->clearStoredPresence(Landroid/content/ContentResolver;JLjava/lang/String;)V

    .line 279
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-static {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->access$600(Lcom/google/android/gtalkservice/GTalkConnection;)V

    goto :goto_0

    .line 283
    :sswitch_2
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_3

    .line 284
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(WORKER THREAD) close connection: error="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/ConnectionError;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->access$200(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V

    .line 287
    :cond_3
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 288
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->access$700(Lcom/google/android/gtalkservice/GTalkConnection;Z)V

    goto :goto_0

    .line 293
    :sswitch_3
    const-string v0, "GTalkService"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 294
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    const-string v1, "(WORKER THREAD) update account status"

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->access$800(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V

    .line 297
    :cond_4
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->updateAccountStatus()V

    goto/16 :goto_0

    .line 269
    nop

    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_0
        0xc8 -> :sswitch_1
        0x12c -> :sswitch_2
        0x190 -> :sswitch_3
    .end sparse-switch
.end method
