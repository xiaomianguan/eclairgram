.class Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen$GroupChatConverted;->convertedToGroupChat(Ljava/lang/String;Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/talk/ChatScreen$GroupChatConverted;

.field final synthetic val$groupChatRoom:Ljava/lang/String;

.field final synthetic val$oldJid:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen$GroupChatConverted;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1103
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;->this$1:Lcom/google/android/talk/ChatScreen$GroupChatConverted;

    iput-object p2, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;->val$oldJid:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;->val$groupChatRoom:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 1105
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;->this$1:Lcom/google/android/talk/ChatScreen$GroupChatConverted;

    iget-object v2, v2, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v2}, Lcom/google/android/talk/ChatScreen;->access$2300(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;->this$1:Lcom/google/android/talk/ChatScreen$GroupChatConverted;

    iget-wide v3, v3, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->mAccountId:J

    invoke-interface {v2, v3, v4}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    .line 1106
    .local v1, "imSession":Lcom/google/android/gtalkservice/IImSession;
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;->val$oldJid:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v0

    .line 1107
    .local v0, "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    invoke-interface {v0}, Lcom/google/android/gtalkservice/IChatSession;->leave()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1112
    .end local v0    # "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    .end local v1    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :goto_0
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;->this$1:Lcom/google/android/talk/ChatScreen$GroupChatConverted;

    iget-object v2, v2, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v3, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;->val$groupChatRoom:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/talk/ChatScreen$GroupChatConverted$1;->this$1:Lcom/google/android/talk/ChatScreen$GroupChatConverted;

    iget-wide v4, v4, Lcom/google/android/talk/ChatScreen$GroupChatConverted;->mAccountId:J

    invoke-static {v2, v3, v4, v5}, Lcom/google/android/talk/ChatScreen;->access$600(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;J)V

    .line 1113
    return-void

    .line 1108
    :catch_0
    move-exception v2

    goto :goto_0
.end method
