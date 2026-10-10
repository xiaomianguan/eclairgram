.class Lcom/google/android/talk/TalkApp$GTalkConnectionListener;
.super Lcom/google/android/gtalkservice/IGTalkConnectionListener$Stub;
.source "TalkApp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/TalkApp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GTalkConnectionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/TalkApp;


# direct methods
.method private constructor <init>(Lcom/google/android/talk/TalkApp;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lcom/google/android/talk/TalkApp$GTalkConnectionListener;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IGTalkConnectionListener$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/talk/TalkApp;Lcom/google/android/talk/TalkApp$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/talk/TalkApp;
    .param p2, "x1"    # Lcom/google/android/talk/TalkApp$1;

    .prologue
    .line 147
    invoke-direct {p0, p1}, Lcom/google/android/talk/TalkApp$GTalkConnectionListener;-><init>(Lcom/google/android/talk/TalkApp;)V

    return-void
.end method


# virtual methods
.method public onConnectionCreated(Lcom/google/android/gtalkservice/IGTalkConnection;)V
    .locals 2
    .param p1, "conn"    # Lcom/google/android/gtalkservice/IGTalkConnection;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$GTalkConnectionListener;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$100(Lcom/google/android/talk/TalkApp;)I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 150
    const-string v0, "GTalkConnectionListener: service created"

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$200(Ljava/lang/String;)V

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$GTalkConnectionListener;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$400(Lcom/google/android/talk/TalkApp;)V

    .line 154
    return-void
.end method

.method public onConnectionCreationFailed(Ljava/lang/String;)V
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$GTalkConnectionListener;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$100(Lcom/google/android/talk/TalkApp;)I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 158
    const-string v0, "GTalkConnectionListener: service creation failed"

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$200(Ljava/lang/String;)V

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$GTalkConnectionListener;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->access$400(Lcom/google/android/talk/TalkApp;)V

    .line 161
    return-void
.end method
