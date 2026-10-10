.class Lcom/google/android/talk/ChatScreen$GroupChatConverted;
.super Lcom/google/android/gtalkservice/IChatListener$Stub;
.source "ChatScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GroupChatConverted"
.end annotation


# instance fields
.field mAccountId:J

.field mChatSession:Lcom/google/android/gtalkservice/IChatSession;

.field final synthetic this$0:Lcom/google/android/talk/ChatScreen;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ChatScreen;Lcom/google/android/gtalkservice/IChatSession;J)V
    .locals 0
    .param p2, "session"    # Lcom/google/android/gtalkservice/IChatSession;
    .param p3, "accountId"    # J

    .prologue
    .line 1088
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IChatListener$Stub;-><init>()V

    .line 1089
    iput-object p2, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    .line 1090
    iput-wide p3, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->mAccountId:J

    .line 1091
    return-void
.end method


# virtual methods
.method public chatClosed(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 1124
    return-void
.end method

.method public chatRead(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 1125
    return-void
.end method

.method public convertedToGroupChat(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2
    .param p1, "oldJid"    # Ljava/lang/String;
    .param p2, "groupChatRoom"    # Ljava/lang/String;
    .param p3, "groupId"    # J

    .prologue
    .line 1101
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$2900(Lcom/google/android/talk/ChatScreen;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1102
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->this$0:Lcom/google/android/talk/ChatScreen;

    new-instance v1, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;-><init>(Lcom/google/android/talk/ChatScreen$GroupChatConverted;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatScreen;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1115
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->this$0:Lcom/google/android/talk/ChatScreen;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/talk/ChatScreen;->access$2902(Lcom/google/android/talk/ChatScreen;Z)Z

    .line 1117
    :try_start_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->mChatSession:Lcom/google/android/gtalkservice/IChatSession;

    invoke-interface {v0, p0}, Lcom/google/android/gtalkservice/IChatSession;->removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1122
    :cond_0
    :goto_0
    return-void

    .line 1118
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public newMessageReceived(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/String;

    .prologue
    .line 1128
    return-void
.end method

.method public participantJoined(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;

    .prologue
    .line 1131
    return-void
.end method

.method public participantLeft(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;

    .prologue
    .line 1134
    return-void
.end method
