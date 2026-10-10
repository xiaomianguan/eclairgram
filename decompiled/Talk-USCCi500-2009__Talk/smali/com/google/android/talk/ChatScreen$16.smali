.class Lcom/google/android/talk/ChatScreen$16;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatScreen;

.field final synthetic val$accountId:J

.field final synthetic val$contact:Ljava/lang/String;

.field final synthetic val$invitee:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .prologue
    .line 1201
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$16;->this$0:Lcom/google/android/talk/ChatScreen;

    iput-object p2, p0, Lcom/google/android/talk/ChatScreen$16;->val$contact:Ljava/lang/String;

    iput-wide p3, p0, Lcom/google/android/talk/ChatScreen$16;->val$accountId:J

    iput-object p5, p0, Lcom/google/android/talk/ChatScreen$16;->val$invitee:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 1202
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen$16;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v4, p0, Lcom/google/android/talk/ChatScreen$16;->val$contact:Ljava/lang/String;

    iget-wide v5, p0, Lcom/google/android/talk/ChatScreen$16;->val$accountId:J

    const/4 v7, 0x0

    invoke-static {v3, v4, v5, v6, v7}, Lcom/google/android/talk/ChatScreen;->access$1000(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v2

    .line 1204
    .local v2, "session":Lcom/google/android/gtalkservice/IChatSession;
    if-eqz v2, :cond_1

    .line 1209
    :try_start_0
    invoke-interface {v2}, Lcom/google/android/gtalkservice/IChatSession;->isGroupChat()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1210
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen$16;->this$0:Lcom/google/android/talk/ChatScreen;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/google/android/talk/ChatScreen;->access$2902(Lcom/google/android/talk/ChatScreen;Z)Z

    .line 1211
    new-instance v1, Lcom/google/android/talk/ChatScreen$GroupChatConverted;

    iget-object v3, p0, Lcom/google/android/talk/ChatScreen$16;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-wide v4, p0, Lcom/google/android/talk/ChatScreen$16;->val$accountId:J

    invoke-direct {v1, v3, v2, v4, v5}, Lcom/google/android/talk/ChatScreen$GroupChatConverted;-><init>(Lcom/google/android/talk/ChatScreen;Lcom/google/android/gtalkservice/IChatSession;J)V

    .line 1212
    .local v1, "listener":Lcom/google/android/talk/ChatScreen$GroupChatConverted;
    invoke-interface {v2, v1}, Lcom/google/android/gtalkservice/IChatSession;->addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 1214
    .end local v1    # "listener":Lcom/google/android/talk/ChatScreen$GroupChatConverted;
    :cond_0
    iget-object v3, p0, Lcom/google/android/talk/ChatScreen$16;->val$invitee:Ljava/lang/String;

    invoke-interface {v2, v3}, Lcom/google/android/gtalkservice/IChatSession;->inviteContact(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1219
    :cond_1
    :goto_0
    return-void

    .line 1215
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 1216
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method
