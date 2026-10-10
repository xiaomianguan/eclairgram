.class Lcom/google/android/talk/ChatScreen$6;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->createChatSwitcher()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatScreen;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen;)V
    .locals 0

    .prologue
    .line 568
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$6;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 569
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$6;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$2000(Lcom/google/android/talk/ChatScreen;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$6;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$1900(Lcom/google/android/talk/ChatScreen;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x9c4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 570
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$6;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$1800(Lcom/google/android/talk/ChatScreen;)V

    .line 571
    return-void
.end method
