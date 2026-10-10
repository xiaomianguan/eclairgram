.class Lcom/google/android/talk/ChatView$ConnectionStateListener$1;
.super Ljava/lang/Object;
.source "ChatView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatView$ConnectionStateListener;->connectionStateChanged(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/talk/ChatView$ConnectionStateListener;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatView$ConnectionStateListener;)V
    .locals 0

    .prologue
    .line 1816
    iput-object p1, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener$1;->this$1:Lcom/google/android/talk/ChatView$ConnectionStateListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1817
    iget-object v0, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener$1;->this$1:Lcom/google/android/talk/ChatView$ConnectionStateListener;

    iget-object v0, v0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/talk/ChatView;->access$3802(Lcom/google/android/talk/ChatView;Z)Z

    .line 1818
    iget-object v0, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener$1;->this$1:Lcom/google/android/talk/ChatView$ConnectionStateListener;

    iget-object v0, v0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0}, Lcom/google/android/talk/ChatView;->access$4600(Lcom/google/android/talk/ChatView;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->invalidateViews()V

    .line 1819
    iget-object v0, p0, Lcom/google/android/talk/ChatView$ConnectionStateListener$1;->this$1:Lcom/google/android/talk/ChatView$ConnectionStateListener;

    iget-object v0, v0, Lcom/google/android/talk/ChatView$ConnectionStateListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v0}, Lcom/google/android/talk/ChatView;->access$800(Lcom/google/android/talk/ChatView;)V

    .line 1820
    return-void
.end method
