.class Lcom/google/android/talk/GTalkDiagnostics$1;
.super Ljava/lang/Object;
.source "GTalkDiagnostics.java"

# interfaces
.implements Landroid/content/ServiceConnection;


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
    .line 93
    iput-object p1, p0, Lcom/google/android/talk/GTalkDiagnostics$1;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    const-string v2, "GTalkDiag"

    .line 80
    const-string v1, "GTalkDiag"

    const/4 v1, 0x3

    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "GTalkDiag"

    const-string v1, "Connected to GTalkService."

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$1;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {p2}, Lcom/google/android/gtalkservice/IGTalkService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/talk/GTalkDiagnostics;->access$202(Lcom/google/android/talk/GTalkDiagnostics;Lcom/google/android/gtalkservice/IGTalkService;)Lcom/google/android/gtalkservice/IGTalkService;

    .line 83
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$1;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v1}, Lcom/google/android/talk/GTalkDiagnostics;->access$300(Lcom/google/android/talk/GTalkDiagnostics;)Z

    .line 84
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$1;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/google/android/talk/GTalkDiagnostics;->access$000(Lcom/google/android/talk/GTalkDiagnostics;Z)V

    .line 87
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 88
    .local v0, "refresh":Landroid/os/Message;
    const/16 v1, 0x64

    iput v1, v0, Landroid/os/Message;->what:I

    .line 89
    iget-object v1, p0, Lcom/google/android/talk/GTalkDiagnostics$1;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v1}, Lcom/google/android/talk/GTalkDiagnostics;->access$100(Lcom/google/android/talk/GTalkDiagnostics;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 91
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    const-string v1, "GTalkDiag"

    .line 94
    const-string v0, "GTalkDiag"

    const/4 v0, 0x3

    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "GTalkDiag"

    const-string v0, "Disconnected from GTalkService."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/GTalkDiagnostics$1;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v0}, Lcom/google/android/talk/GTalkDiagnostics;->access$400(Lcom/google/android/talk/GTalkDiagnostics;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f06008c

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 96
    iget-object v0, p0, Lcom/google/android/talk/GTalkDiagnostics$1;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/talk/GTalkDiagnostics;->access$202(Lcom/google/android/talk/GTalkDiagnostics;Lcom/google/android/gtalkservice/IGTalkService;)Lcom/google/android/gtalkservice/IGTalkService;

    .line 97
    return-void
.end method
