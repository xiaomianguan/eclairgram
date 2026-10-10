.class Lcom/google/android/talk/TalkApp$1;
.super Ljava/lang/Object;
.source "TalkApp.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/TalkApp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/TalkApp;


# direct methods
.method constructor <init>(Lcom/google/android/talk/TalkApp;)V
    .locals 0

    .prologue
    .line 140
    iput-object p1, p0, Lcom/google/android/talk/TalkApp$1;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$1;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {p2}, Lcom/google/android/gtalkservice/IGTalkService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/TalkApp;->access$002(Lcom/google/android/talk/TalkApp;Lcom/google/android/gtalkservice/IGTalkService;)Lcom/google/android/gtalkservice/IGTalkService;

    .line 133
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$1;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$100(Lcom/google/android/talk/TalkApp;)I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "service connected: mService="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/TalkApp$1;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v1}, Lcom/google/android/talk/TalkApp;->access$000(Lcom/google/android/talk/TalkApp;)Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$200(Ljava/lang/String;)V

    .line 137
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$1;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$300(Lcom/google/android/talk/TalkApp;)V

    .line 138
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 141
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$1;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$100(Lcom/google/android/talk/TalkApp;)I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    const-string v0, "service disconnected..."

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$200(Ljava/lang/String;)V

    .line 142
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$1;->this$0:Lcom/google/android/talk/TalkApp;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/talk/TalkApp;->access$002(Lcom/google/android/talk/TalkApp;Lcom/google/android/gtalkservice/IGTalkService;)Lcom/google/android/gtalkservice/IGTalkService;

    .line 143
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$1;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$400(Lcom/google/android/talk/TalkApp;)V

    .line 144
    return-void
.end method
