.class Lcom/google/android/talk/ChatScreen$ChatListener$2;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen$ChatListener;->participantLeft(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/talk/ChatScreen$ChatListener;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen$ChatListener;)V
    .locals 0

    .prologue
    .line 1062
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$ChatListener$2;->this$1:Lcom/google/android/talk/ChatScreen$ChatListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1063
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$ChatListener$2;->this$1:Lcom/google/android/talk/ChatScreen$ChatListener;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$ChatListener;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$900(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/ChatScreen$ChatHost;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$ChatListener$2;->this$1:Lcom/google/android/talk/ChatScreen$ChatListener;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen$ChatListener;->access$2800(Lcom/google/android/talk/ChatScreen$ChatListener;)Lcom/google/android/talk/ChatView;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/talk/ChatScreen$ChatHost;->update(Landroid/view/View;)V

    .line 1064
    return-void
.end method
