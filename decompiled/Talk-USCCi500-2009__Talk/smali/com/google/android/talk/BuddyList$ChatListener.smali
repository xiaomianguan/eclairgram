.class Lcom/google/android/talk/BuddyList$ChatListener;
.super Lcom/google/android/gtalkservice/IChatListener$Stub;
.source "BuddyList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ChatListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyList;)V
    .locals 0

    .prologue
    .line 247
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IChatListener$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public chatClosed(Ljava/lang/String;)V
    .locals 3
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ChatListener.chatClosed from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 265
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->requeryCursor(Z)V

    .line 266
    return-void
.end method

.method public chatRead(Ljava/lang/String;)V
    .locals 3
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 259
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ChatListener.ChatRead from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->requeryCursor(Z)V

    .line 261
    return-void
.end method

.method public convertedToGroupChat(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p1, "oldFrom"    # Ljava/lang/String;
    .param p2, "room"    # Ljava/lang/String;
    .param p3, "groupId"    # J

    .prologue
    .line 269
    return-void
.end method

.method public newMessageReceived(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "messageBody"    # Ljava/lang/String;

    .prologue
    .line 249
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 250
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ChatListener.newMessageReceived from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 253
    :cond_0
    if-eqz p2, :cond_1

    .line 254
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ChatListener;->this$0:Lcom/google/android/talk/BuddyList;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->requeryCursor(Z)V

    .line 256
    :cond_1
    return-void
.end method

.method public participantJoined(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;

    .prologue
    .line 272
    return-void
.end method

.method public participantLeft(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;

    .prologue
    .line 275
    return-void
.end method
