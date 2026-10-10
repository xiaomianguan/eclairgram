.class Lcom/google/android/gtalkservice/service/GTalkService$3;
.super Ljava/lang/Object;
.source "GTalkService.java"

# interfaces
.implements Landroid/content/ServiceConnection;


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

.field final synthetic val$alwaysSignIn:Z


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService;Z)V
    .locals 0

    .prologue
    .line 930
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    iput-boolean p2, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->val$alwaysSignIn:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 5
    .param p1, "className"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 915
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {p2}, Lcom/google/android/googleapps/IGoogleLoginService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkService;->setGls(Lcom/google/android/googleapps/IGoogleLoginService;)V

    .line 916
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GLS service connected, mGls="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2500(Lcom/google/android/gtalkservice/service/GTalkService;)Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 919
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    new-instance v1, Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->getGls()Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/googleapps/IGoogleLoginService;->getAndroidId()J

    move-result-wide v3

    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;J)V

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2602(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/PushMessagingRegistrar;)Lcom/google/android/gtalkservice/PushMessagingRegistrar;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 924
    :goto_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2700(Lcom/google/android/gtalkservice/service/GTalkService;)V

    .line 926
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2200(Lcom/google/android/gtalkservice/service/GTalkService;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 927
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    iget-boolean v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->val$alwaysSignIn:Z

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$700(Lcom/google/android/gtalkservice/service/GTalkService;Z)V

    .line 929
    :cond_1
    return-void

    .line 921
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "className"    # Landroid/content/ComponentName;

    .prologue
    .line 931
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    const-string v0, "GLS service disconnected"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 932
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$3;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkService;->setGls(Lcom/google/android/googleapps/IGoogleLoginService;)V

    .line 933
    return-void
.end method
