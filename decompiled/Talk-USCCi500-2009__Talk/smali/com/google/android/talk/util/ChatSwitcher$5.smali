.class Lcom/google/android/talk/util/ChatSwitcher$5;
.super Ljava/lang/Object;
.source "ChatSwitcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/util/ChatSwitcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/util/ChatSwitcher;


# direct methods
.method constructor <init>(Lcom/google/android/talk/util/ChatSwitcher;)V
    .locals 0

    .prologue
    .line 614
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher$5;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 615
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$5;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-static {v0}, Lcom/google/android/talk/util/ChatSwitcher;->access$100(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 624
    :goto_0
    return-void

    .line 619
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$5;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-virtual {v0}, Lcom/google/android/talk/util/ChatSwitcher;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 620
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$5;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-static {v0}, Lcom/google/android/talk/util/ChatSwitcher;->access$700(Lcom/google/android/talk/util/ChatSwitcher;)V

    .line 623
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$5;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-static {v0}, Lcom/google/android/talk/util/ChatSwitcher;->access$800(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/os/Handler;

    move-result-object v0

    const-wide/32 v1, 0xea60

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
