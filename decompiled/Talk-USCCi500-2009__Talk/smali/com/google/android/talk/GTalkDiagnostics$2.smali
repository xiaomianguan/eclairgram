.class Lcom/google/android/talk/GTalkDiagnostics$2;
.super Landroid/os/Handler;
.source "GTalkDiagnostics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/GTalkDiagnostics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/GTalkDiagnostics;


# direct methods
.method constructor <init>(Lcom/google/android/talk/GTalkDiagnostics;)V
    .locals 0

    .prologue
    .line 101
    iput-object p1, p0, Lcom/google/android/talk/GTalkDiagnostics$2;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/16 v3, 0x64

    const-string v2, "GTalkDiag"

    .line 102
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$2;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v1}, Lcom/google/android/talk/GTalkDiagnostics;->access$500(Lcom/google/android/talk/GTalkDiagnostics;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, p1, Landroid/os/Message;->what:I

    if-eq v1, v3, :cond_1

    .line 120
    :cond_0
    :goto_0
    return-void

    .line 106
    :cond_1
    const-string v1, "GTalkDiag"

    const/4 v1, 0x3

    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "GTalkDiag"

    const-string v1, "handle refresh event"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    :cond_2
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$2;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v1}, Lcom/google/android/talk/GTalkDiagnostics;->access$200(Lcom/google/android/talk/GTalkDiagnostics;)Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 109
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$2;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v1}, Lcom/google/android/talk/GTalkDiagnostics;->access$600(Lcom/google/android/talk/GTalkDiagnostics;)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    if-nez v1, :cond_3

    .line 110
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$2;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v1}, Lcom/google/android/talk/GTalkDiagnostics;->access$300(Lcom/google/android/talk/GTalkDiagnostics;)Z

    .line 113
    :cond_3
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$2;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/google/android/talk/GTalkDiagnostics;->access$000(Lcom/google/android/talk/GTalkDiagnostics;Z)V

    .line 114
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 115
    .local v0, "refresh":Landroid/os/Message;
    iput v3, v0, Landroid/os/Message;->what:I

    .line 116
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$2;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v1}, Lcom/google/android/talk/GTalkDiagnostics;->access$100(Lcom/google/android/talk/GTalkDiagnostics;)Landroid/os/Handler;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 118
    .end local v0    # "refresh":Landroid/os/Message;
    :cond_4
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$2;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v1}, Lcom/google/android/talk/GTalkDiagnostics;->access$700(Lcom/google/android/talk/GTalkDiagnostics;)V

    goto :goto_0
.end method
