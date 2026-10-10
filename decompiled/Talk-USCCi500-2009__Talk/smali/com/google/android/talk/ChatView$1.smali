.class Lcom/google/android/talk/ChatView$1;
.super Landroid/os/Handler;
.source "ChatView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatView;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatView;)V
    .locals 0

    .prologue
    .line 223
    iput-object p1, p0, Lcom/google/android/talk/ChatView$1;->this$0:Lcom/google/android/talk/ChatView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 224
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 232
    :goto_0
    return-void

    .line 226
    :pswitch_0
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Lcom/google/android/talk/ChatView$1;->this$0:Lcom/google/android/talk/ChatView;

    const-string v1, "mHandler PICTURE_LOADED"

    invoke-static {v0, v1}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 229
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$1;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0, p1}, Lcom/google/android/talk/ChatView;->access$100(Lcom/google/android/talk/ChatView;Landroid/os/Message;)V

    goto :goto_0

    .line 224
    nop

    :pswitch_data_0
    .packed-switch 0x7b
        :pswitch_0
    .end packed-switch
.end method
