.class Lcom/google/android/talk/ChatScreen$12;
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


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;J)V
    .locals 0

    .prologue
    .line 710
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$12;->this$0:Lcom/google/android/talk/ChatScreen;

    iput-object p2, p0, Lcom/google/android/talk/ChatScreen$12;->val$contact:Ljava/lang/String;

    iput-wide p3, p0, Lcom/google/android/talk/ChatScreen$12;->val$accountId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 711
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$12;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$12;->val$contact:Ljava/lang/String;

    iget-wide v2, p0, Lcom/google/android/talk/ChatScreen$12;->val$accountId:J

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/talk/ChatScreen;->access$2700(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;J)V

    .line 712
    return-void
.end method
