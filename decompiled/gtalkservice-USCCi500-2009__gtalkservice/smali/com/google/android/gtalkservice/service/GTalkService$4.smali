.class Lcom/google/android/gtalkservice/service/GTalkService$4;
.super Ljava/lang/Object;
.source "GTalkService.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/service/GTalkService;->initGservicesQueryMap()V
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
    .line 1150
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService$4;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 4
    .param p1, "o"    # Ljava/util/Observable;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 1151
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    const-string v0, "Gservices settings changed"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 1152
    :cond_0
    monitor-enter p0

    .line 1153
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$4;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$200(Lcom/google/android/gtalkservice/service/GTalkService;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1154
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$4;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2800(Lcom/google/android/gtalkservice/service/GTalkService;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$4;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2800(Lcom/google/android/gtalkservice/service/GTalkService;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x1f4

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1158
    :cond_1
    monitor-exit p0

    .line 1159
    return-void

    .line 1158
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
