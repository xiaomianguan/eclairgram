.class Lcom/google/android/gtalkservice/service/GTalkService$2;
.super Ljava/lang/Object;
.source "GTalkService.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/service/GTalkService;->onCreate()V
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
    .line 868
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService$2;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 5
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 869
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$2;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2400(Lcom/google/android/gtalkservice/service/GTalkService;)Z

    move-result v2

    .line 870
    .local v2, "oldValue":Z
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$2;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$2;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$600(Lcom/google/android/gtalkservice/service/GTalkService;)Landroid/provider/Im$ProviderSettings$QueryMap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/provider/Im$ProviderSettings$QueryMap;->getShowMobileIndicator()Z

    move-result v4

    invoke-static {v3, v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2402(Lcom/google/android/gtalkservice/service/GTalkService;Z)Z

    .line 871
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$2;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2400(Lcom/google/android/gtalkservice/service/GTalkService;)Z

    move-result v3

    if-eq v2, v3, :cond_1

    .line 872
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    const-string v3, "show mobile indicator setting changed"

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 873
    :cond_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$2;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryConnection()Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 875
    .local v0, "connWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    if-eqz v0, :cond_1

    .line 876
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    .line 877
    .local v1, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/ImSession;->sendPresenceCapability()V

    .line 880
    .end local v0    # "connWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v1    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    :cond_1
    return-void
.end method
