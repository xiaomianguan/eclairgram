.class Lcom/google/android/gtalkservice/ChatMgr$4;
.super Ljava/lang/Object;
.source "ChatMgr.java"

# interfaces
.implements Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/ChatMgr;->notifyGroupChatInvitation(Lcom/google/android/gtalkservice/GroupChatInvitation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable",
        "<",
        "Lcom/google/android/gtalkservice/IGroupChatInvitationListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/ChatMgr;

.field final synthetic val$invitation:Lcom/google/android/gtalkservice/GroupChatInvitation;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/ChatMgr;Lcom/google/android/gtalkservice/GroupChatInvitation;)V
    .locals 0

    .prologue
    .line 849
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatMgr$4;->this$0:Lcom/google/android/gtalkservice/ChatMgr;

    iput-object p2, p0, Lcom/google/android/gtalkservice/ChatMgr$4;->val$invitation:Lcom/google/android/gtalkservice/GroupChatInvitation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)Z
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 850
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr$4;->this$0:Lcom/google/android/gtalkservice/ChatMgr;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr$4;->val$invitation:Lcom/google/android/gtalkservice/GroupChatInvitation;

    invoke-static {v0, p1, v1}, Lcom/google/android/gtalkservice/ChatMgr;->access$100(Lcom/google/android/gtalkservice/ChatMgr;Lcom/google/android/gtalkservice/IGroupChatInvitationListener;Lcom/google/android/gtalkservice/GroupChatInvitation;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 849
    check-cast p1, Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr$4;->call(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)Z

    move-result v0

    return v0
.end method
