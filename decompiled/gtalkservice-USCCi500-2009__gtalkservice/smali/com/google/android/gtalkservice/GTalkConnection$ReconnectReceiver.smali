.class Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;
.super Landroid/content/BroadcastReceiver;
.source "GTalkConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/GTalkConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReconnectReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/GTalkConnection;


# direct methods
.method private constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 0

    .prologue
    .line 304
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 305
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;Lcom/google/android/gtalkservice/GTalkConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p2, "x1"    # Lcom/google/android/gtalkservice/GTalkConnection$1;

    .prologue
    .line 303
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 308
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->acquireSimpleWakeLock()V

    .line 311
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->isSessionOpen()Z

    move-result v0

    .line 312
    .local v0, "isSessionOpen":Z
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v1

    .line 314
    .local v1, "state":Lcom/google/android/gtalkservice/ConnectionState;
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v2, :cond_0

    .line 315
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reconnect alarm fired: session="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_1

    const-string v4, "open"

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", state="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->access$200(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V

    .line 321
    :cond_0
    if-eqz v0, :cond_2

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ConnectionState;->isPendingReconnect()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 322
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->connect()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 327
    :goto_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseSimpleWakeLock()V

    .line 329
    return-void

    .line 315
    :cond_1
    :try_start_1
    const-string v4, "closed"

    goto :goto_0

    .line 324
    :cond_2
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-static {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->access$900(Lcom/google/android/gtalkservice/GTalkConnection;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 327
    .end local v0    # "isSessionOpen":Z
    .end local v1    # "state":Lcom/google/android/gtalkservice/ConnectionState;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseSimpleWakeLock()V

    throw v2
.end method
