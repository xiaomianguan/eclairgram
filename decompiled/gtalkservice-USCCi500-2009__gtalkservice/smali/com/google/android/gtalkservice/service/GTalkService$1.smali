.class Lcom/google/android/gtalkservice/service/GTalkService$1;
.super Landroid/os/Handler;
.source "GTalkService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/service/GTalkService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/service/GTalkService;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService;)V
    .locals 0

    .prologue
    .line 223
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 224
    iget v4, p1, Landroid/os/Message;->what:I

    sparse-switch v4, :sswitch_data_0

    .line 277
    .end local p0    # "this":Lcom/google/android/gtalkservice/service/GTalkService$1;
    :goto_0
    return-void

    .line 226
    .restart local p0    # "this":Lcom/google/android/gtalkservice/service/GTalkService$1;
    :sswitch_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$000(Lcom/google/android/gtalkservice/service/GTalkService;)V

    goto :goto_0

    .line 232
    :sswitch_1
    :try_start_0
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .end local p0    # "this":Lcom/google/android/gtalkservice/service/GTalkService$1;
    check-cast p0, Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->connectionEstablished()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 233
    :catch_0
    move-exception v4

    move-object v3, v4

    .line 234
    .local v3, "ex":Ljava/lang/IllegalStateException;
    const-string v4, "GTalkService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EVENT_CONNECTION_ESTABLISHED: caught "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 239
    .end local v3    # "ex":Ljava/lang/IllegalStateException;
    .restart local p0    # "this":Lcom/google/android/gtalkservice/service/GTalkService$1;
    :sswitch_2
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .end local p0    # "this":Lcom/google/android/gtalkservice/service/GTalkService$1;
    check-cast p0, Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-static {v4, p0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$100(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/GTalkConnection;)V

    goto :goto_0

    .line 243
    .restart local p0    # "this":Lcom/google/android/gtalkservice/service/GTalkService$1;
    :sswitch_3
    iget v0, p1, Landroid/os/Message;->arg2:I

    .line 244
    .local v0, "connectionId":I
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 245
    .local v2, "error":I
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .end local p0    # "this":Lcom/google/android/gtalkservice/service/GTalkService$1;
    check-cast p0, Lcom/google/android/gtalkservice/GTalkConnection;

    const/4 v4, 0x1

    invoke-virtual {p0, v0, v2, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->connectionClosed(IIZ)V

    goto :goto_0

    .line 249
    .end local v0    # "connectionId":I
    .end local v2    # "error":I
    .restart local p0    # "this":Lcom/google/android/gtalkservice/service/GTalkService$1;
    :sswitch_4
    monitor-enter p0

    .line 250
    :try_start_1
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$202(Lcom/google/android/gtalkservice/service/GTalkService;Z)Z

    .line 251
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$300(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/concurrent/locks/Lock;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 252
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$400(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 253
    .local v1, "connectionNum":I
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$300(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/concurrent/locks/Lock;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 254
    if-gtz v1, :cond_1

    .line 255
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    .line 256
    const-string v4, "EVENT_GSERVICES_CHANGED: no connection, create new ones"

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 258
    :cond_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$600(Lcom/google/android/gtalkservice/service/GTalkService;)Landroid/provider/Im$ProviderSettings$QueryMap;

    move-result-object v5

    invoke-virtual {v5}, Landroid/provider/Im$ProviderSettings$QueryMap;->getAutomaticallyConnectToGTalkServer()Z

    move-result v5

    invoke-static {v4, v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$700(Lcom/google/android/gtalkservice/service/GTalkService;Z)V

    .line 266
    :goto_1
    monitor-exit p0

    goto :goto_0

    .end local v1    # "connectionNum":I
    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 261
    .restart local v1    # "connectionNum":I
    :cond_1
    :try_start_2
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_2

    .line 262
    const-string v4, "EVENT_GSERVICES_CHANGED: reset current connections"

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 264
    :cond_2
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$1;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$800(Lcom/google/android/gtalkservice/service/GTalkService;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 270
    .end local v1    # "connectionNum":I
    :sswitch_5
    const-string v4, "received EVENT_CRASH_APP"

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 275
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4}, Ljava/lang/RuntimeException;-><init>()V

    throw v4

    .line 224
    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_0
        0xc8 -> :sswitch_1
        0x12c -> :sswitch_3
        0x190 -> :sswitch_2
        0x1f4 -> :sswitch_4
        0x3e8 -> :sswitch_5
    .end sparse-switch
.end method
