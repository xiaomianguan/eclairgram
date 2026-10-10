.class Lcom/google/android/talk/ChatView$GroupChatInvitationListener;
.super Lcom/google/android/gtalkservice/IGroupChatInvitationListener$Stub;
.source "ChatView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GroupChatInvitationListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatView;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ChatView;)V
    .locals 0

    .prologue
    .line 642
    iput-object p1, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IGroupChatInvitationListener$Stub;-><init>()V

    .line 643
    return-void
.end method


# virtual methods
.method public onInvitationReceived(Lcom/google/android/gtalkservice/GroupChatInvitation;)Z
    .locals 6
    .param p1, "invitation"    # Lcom/google/android/gtalkservice/GroupChatInvitation;

    .prologue
    .line 646
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v1

    .line 648
    .local v1, "logModeDebug":Z
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-virtual {p1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getInviter()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/talk/ChatView;->access$2402(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;

    .line 649
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-virtual {p1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getRoomAddress()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/talk/ChatView;->access$2502(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;

    .line 650
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-virtual {p1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getPassword()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/talk/ChatView;->access$2602(Lcom/google/android/talk/ChatView;Ljava/lang/String;)Ljava/lang/String;

    .line 652
    if-eqz v1, :cond_0

    .line 653
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "received MUC invitation from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$2400(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", room="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$2500(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 655
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v2}, Lcom/google/android/talk/ChatView;->access$2700(Lcom/google/android/talk/ChatView;)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 656
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v2}, Lcom/google/android/talk/ChatView;->access$2400(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/talk/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 664
    .local v0, "bareJid":Ljava/lang/String;
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v2}, Lcom/google/android/talk/ChatView;->access$1100(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v2}, Lcom/google/android/talk/ChatView;->access$2500(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v3}, Lcom/google/android/talk/ChatView;->access$1100(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 665
    :cond_1
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    iget-object v3, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v3}, Lcom/google/android/talk/ChatView;->access$2400(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$2500(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v5}, Lcom/google/android/talk/ChatView;->access$2600(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/google/android/talk/ChatView;->access$2800(Lcom/google/android/talk/ChatView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 666
    const/4 v2, 0x1

    .line 674
    .end local v0    # "bareJid":Ljava/lang/String;
    :goto_0
    return v2

    .line 668
    .restart local v0    # "bareJid":Ljava/lang/String;
    :cond_2
    if-eqz v1, :cond_3

    .line 669
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "muc invitation received from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$2400(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 670
    iget-object v2, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$1100(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " != "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " or "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/ChatView$GroupChatInvitationListener;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v4}, Lcom/google/android/talk/ChatView;->access$2500(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 674
    .end local v0    # "bareJid":Ljava/lang/String;
    :cond_3
    const/4 v2, 0x0

    goto :goto_0
.end method
