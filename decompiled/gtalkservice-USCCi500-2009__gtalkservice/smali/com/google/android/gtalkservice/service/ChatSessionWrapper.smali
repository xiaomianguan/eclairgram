.class public Lcom/google/android/gtalkservice/service/ChatSessionWrapper;
.super Lcom/google/android/gtalkservice/IChatSession$Stub;
.source "ChatSessionWrapper.java"


# instance fields
.field private mChatSession:Lcom/google/android/gtalkservice/ChatSession;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/ChatSession;)V
    .locals 0
    .param p1, "chatSession"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/google/android/gtalkservice/IChatSession$Stub;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    .line 33
    return-void
.end method


# virtual methods
.method public addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatSession;->addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 73
    return-void
.end method

.method public getParticipants()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 45
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/ChatSession;->getParticipants()Ljava/util/List;

    move-result-object v0

    .line 46
    .local v0, "participants":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/String;

    .line 47
    .local v1, "retVal":[Ljava/lang/String;
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "retVal":[Ljava/lang/String;
    check-cast v1, [Ljava/lang/String;

    .line 48
    .restart local v1    # "retVal":[Ljava/lang/String;
    return-object v1
.end method

.method public getUnsentComposedMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->getUnsentComposedMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public inviteContact(Ljava/lang/String;)V
    .locals 1
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatSession;->inviteContact(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public isGroupChat()Z
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->isGroupChat()Z

    move-result v0

    return v0
.end method

.method public isOffTheRecord()Z
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->isOffTheRecord()Z

    move-result v0

    return v0
.end method

.method public leave()V
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->leave()V

    .line 57
    return-void
.end method

.method public markAsRead()V
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->markAsRead()V

    .line 41
    return-void
.end method

.method public removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatSession;->removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 77
    return-void
.end method

.method public saveUnsentComposedMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "unsentMessage"    # Ljava/lang/String;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatSession;->saveUnsentComposedMessage(Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public sendChatMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;->mChatSession:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatSession;->sendChatMessage(Ljava/lang/String;)V

    .line 61
    return-void
.end method
