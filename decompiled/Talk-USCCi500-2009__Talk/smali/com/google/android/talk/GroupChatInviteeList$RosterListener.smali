.class Lcom/google/android/talk/GroupChatInviteeList$RosterListener;
.super Lcom/google/android/gtalkservice/IRosterListener$Stub;
.source "GroupChatInviteeList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/GroupChatInviteeList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RosterListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/GroupChatInviteeList;


# direct methods
.method constructor <init>(Lcom/google/android/talk/GroupChatInviteeList;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/google/android/talk/GroupChatInviteeList$RosterListener;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IRosterListener$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public presenceChanged(Ljava/lang/String;)V
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$RosterListener;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    iget v0, v0, Lcom/google/android/talk/GroupChatInviteeList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 69
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$RosterListener;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RosterListener.presenceChanged for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/GroupChatInviteeList;->access$000(Lcom/google/android/talk/GroupChatInviteeList;Ljava/lang/String;)V

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$RosterListener;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/GroupChatInviteeList;->requeryCursor(Z)V

    .line 72
    return-void
.end method

.method public rosterChanged()V
    .locals 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$RosterListener;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/GroupChatInviteeList;->requeryCursor(Z)V

    .line 65
    return-void
.end method

.method public selfPresenceChanged()V
    .locals 0

    .prologue
    .line 75
    return-void
.end method
