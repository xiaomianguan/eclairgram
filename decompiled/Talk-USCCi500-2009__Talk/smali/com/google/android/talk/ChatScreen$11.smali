.class Lcom/google/android/talk/ChatScreen$11;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->checkChatSession(Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IChatSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatScreen;

.field final synthetic val$accountId:J

.field final synthetic val$contact:Ljava/lang/String;

.field final synthetic val$ensureChatsInDb:Z


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;JZ)V
    .locals 0

    .prologue
    .line 686
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$11;->this$0:Lcom/google/android/talk/ChatScreen;

    iput-object p2, p0, Lcom/google/android/talk/ChatScreen$11;->val$contact:Ljava/lang/String;

    iput-wide p3, p0, Lcom/google/android/talk/ChatScreen$11;->val$accountId:J

    iput-boolean p5, p0, Lcom/google/android/talk/ChatScreen$11;->val$ensureChatsInDb:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 687
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->access$300()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 688
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "wait for service task: createEmptyChatSession for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$11;->val$contact:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$400(Ljava/lang/String;)V

    .line 691
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$11;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$11;->val$contact:Ljava/lang/String;

    iget-wide v2, p0, Lcom/google/android/talk/ChatScreen$11;->val$accountId:J

    iget-boolean v4, p0, Lcom/google/android/talk/ChatScreen$11;->val$ensureChatsInDb:Z

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/talk/ChatScreen;->access$1000(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IChatSession;

    .line 692
    return-void
.end method
