.class final Lcom/google/android/talk/ChatView$ConnectionStateListener;
.super Lcom/google/android/gtalkservice/IConnectionStateListener$Stub;
.source "ChatView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ConnectionStateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatView;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ChatView;)V
    .locals 0

    .prologue
    .line 1806
    iput-object p1, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IConnectionStateListener$Stub;-><init>()V

    .line 1807
    return-void
.end method


# virtual methods
.method public connectionStateChanged(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V
    .locals 3
    .param p1, "state"    # Lcom/google/android/gtalkservice/ConnectionState;
    .param p2, "error"    # Lcom/google/android/gtalkservice/ConnectionError;

    .prologue
    .line 1810
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v0

    .line 1812
    .local v0, "connState":I
    packed-switch v0, :pswitch_data_0

    .line 1837
    :cond_0
    :goto_0
    :pswitch_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v1}, Lcom/google/android/talk/ChatView;->access$4700(Lcom/google/android/talk/ChatView;)Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/google/android/talk/ChatView$ConnectionStateListener$2;

    invoke-direct {v2, p0}, Lcom/google/android/talk/ChatView$ConnectionStateListener$2;-><init>(Lcom/google/android/talk/ChatView$ConnectionStateListener;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1846
    :goto_1
    return-void

    .line 1815
    :pswitch_1
    iget-object v1, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v1}, Lcom/google/android/talk/ChatView;->access$4700(Lcom/google/android/talk/ChatView;)Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/google/android/talk/ChatView$ConnectionStateListener$1;

    invoke-direct {v2, p0}, Lcom/google/android/talk/ChatView$ConnectionStateListener$1;-><init>(Lcom/google/android/talk/ChatView$ConnectionStateListener;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 1825
    :pswitch_2
    invoke-virtual {p2}, Lcom/google/android/gtalkservice/ConnectionError;->getError()I

    move-result v1

    const/16 v2, 0x9

    if-ne v1, v2, :cond_0

    .line 1826
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1827
    iget-object v1, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    const-string v2, "Session terminated, invalidate im sessions"

    invoke-static {v1, v2}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 1829
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v1}, Lcom/google/android/talk/ChatView;->access$4800(Lcom/google/android/talk/ChatView;)V

    .line 1830
    iget-object v1, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v1}, Lcom/google/android/talk/ChatView;->access$2300(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ChatScreen$ChatHost;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/talk/ChatScreen$ChatHost;->invalidateImSession()V

    .line 1831
    iget-object v1, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-virtual {v1}, Lcom/google/android/talk/ChatView;->addRemoteListeners()V

    goto :goto_0

    .line 1812
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
