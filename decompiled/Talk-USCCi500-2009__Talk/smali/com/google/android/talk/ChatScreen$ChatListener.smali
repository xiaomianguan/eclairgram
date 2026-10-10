.class Lcom/google/android/talk/ChatScreen$ChatListener;
.super Lcom/google/android/gtalkservice/IChatListener$Stub;
.source "ChatScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ChatListener"
.end annotation


# instance fields
.field private mAccountId:J

.field private mChatView:Lcom/google/android/talk/ChatView;

.field final synthetic this$0:Lcom/google/android/talk/ChatScreen;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ChatScreen;Lcom/google/android/talk/ChatView;J)V
    .locals 0
    .param p2, "cv"    # Lcom/google/android/talk/ChatView;
    .param p3, "accountId"    # J

    .prologue
    .line 1025
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$ChatListener;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IChatListener$Stub;-><init>()V

    .line 1026
    iput-wide p3, p0, Lcom/google/android/talk/ChatScreen$ChatListener;->mAccountId:J

    .line 1027
    iput-object p2, p0, Lcom/google/android/talk/ChatScreen$ChatListener;->mChatView:Lcom/google/android/talk/ChatView;

    .line 1028
    return-void
.end method

.method static synthetic access$2800(Lcom/google/android/talk/ChatScreen$ChatListener;)Lcom/google/android/talk/ChatView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/ChatScreen$ChatListener;

    .prologue
    .line 1021
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$ChatListener;->mChatView:Lcom/google/android/talk/ChatView;

    return-object v0
.end method


# virtual methods
.method public chatClosed(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 1036
    return-void
.end method

.method public chatRead(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 1037
    return-void
.end method

.method public convertedToGroupChat(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p1, "oldJid"    # Ljava/lang/String;
    .param p2, "groupChatRoom"    # Ljava/lang/String;
    .param p3, "groupId"    # J

    .prologue
    .line 1034
    return-void
.end method

.method public newMessageReceived(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/String;

    .prologue
    .line 1040
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$ChatListener;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->newMessageReceived()V

    .line 1041
    return-void
.end method

.method public participantJoined(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;

    .prologue
    .line 1044
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$ChatListener;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->getContact()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1045
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->access$300()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 1046
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ChatListener.participantJoined: nickname="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$400(Ljava/lang/String;)V

    .line 1048
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$ChatListener;->this$0:Lcom/google/android/talk/ChatScreen;

    new-instance v1, Lcom/google/android/talk/ChatScreen$ChatListener$1;

    invoke-direct {v1, p0}, Lcom/google/android/talk/ChatScreen$ChatListener$1;-><init>(Lcom/google/android/talk/ChatScreen$ChatListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatScreen;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1054
    :cond_1
    return-void
.end method

.method public participantLeft(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;

    .prologue
    .line 1057
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$ChatListener;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->getContact()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1058
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->access$300()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 1059
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ChatListener.participantLeft: nickname="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$400(Ljava/lang/String;)V

    .line 1061
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$ChatListener;->this$0:Lcom/google/android/talk/ChatScreen;

    new-instance v1, Lcom/google/android/talk/ChatScreen$ChatListener$2;

    invoke-direct {v1, p0}, Lcom/google/android/talk/ChatScreen$ChatListener$2;-><init>(Lcom/google/android/talk/ChatScreen$ChatListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatScreen;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1067
    :cond_1
    return-void
.end method
