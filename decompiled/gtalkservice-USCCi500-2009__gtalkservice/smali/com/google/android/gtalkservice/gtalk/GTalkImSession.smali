.class public Lcom/google/android/gtalkservice/gtalk/GTalkImSession;
.super Lcom/google/android/gtalkservice/ImSession;
.source "GTalkImSession.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/gtalk/GTalkImSession$1;
    }
.end annotation


# instance fields
.field private mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

.field private mSharedStatusPacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/GTalkConnectionContext;J)V
    .locals 0
    .param p1, "connectionContext"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .param p2, "serviceProviderId"    # J

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/ImSession;-><init>(Lcom/google/android/gtalkservice/GTalkConnectionContext;J)V

    .line 48
    return-void
.end method

.method private isLoginAttempted()Z
    .locals 2

    .prologue
    .line 174
    monitor-enter p0

    .line 175
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getIntendedPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v0

    .line 176
    .local v0, "available":Z
    if-eqz v0, :cond_0

    .line 177
    const/4 v1, 0x1

    monitor-exit p0

    .line 180
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    monitor-exit p0

    goto :goto_0

    .line 181
    .end local v0    # "available":Z
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 440
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GTalkImSession] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    return-void
.end method

.method private saveStatusList(Ljava/util/List;Lcom/google/android/gtalkservice/Presence;Lcom/google/android/gtalkservice/Presence$Show;)V
    .locals 4
    .param p2, "p"    # Lcom/google/android/gtalkservice/Presence;
    .param p3, "show"    # Lcom/google/android/gtalkservice/Presence$Show;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gtalkservice/Presence;",
            "Lcom/google/android/gtalkservice/Presence$Show;",
            ")V"
        }
    .end annotation

    .prologue
    .line 147
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p1, :cond_1

    .line 158
    :cond_0
    return-void

    .line 153
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 154
    .local v0, "count":I
    const/4 v3, 0x1

    sub-int v1, v0, v3

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_0

    .line 155
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 156
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {p2, p3, v2}, Lcom/google/android/gtalkservice/Presence;->setStatus(Lcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    .line 154
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method private translateSharedPresence(Lcom/google/android/gtalkservice/Presence;)Lcom/google/android/gtalkservice/extensions/SharedStatus;
    .locals 2
    .param p1, "p"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    .line 359
    new-instance v0, Lcom/google/android/gtalkservice/extensions/SharedStatus;

    invoke-direct {v0, p1}, Lcom/google/android/gtalkservice/extensions/SharedStatus;-><init>(Lcom/google/android/gtalkservice/Presence;)V

    .line 360
    .local v0, "ss":Lcom/google/android/gtalkservice/extensions/SharedStatus;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getUsername()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->setTo(Ljava/lang/String;)V

    .line 361
    return-object v0
.end method


# virtual methods
.method public addContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "groups"    # [Ljava/lang/String;

    .prologue
    .line 369
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/google/android/gtalkservice/RosterManager;->createContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 371
    return-void
.end method

.method public addGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 420
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 421
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->addGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V

    .line 422
    return-void
.end method

.method public blockContact(Ljava/lang/String;)V
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 385
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v0

    .line 386
    .local v0, "rosterMgr":Lcom/google/android/gtalkservice/RosterManager;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getAccountId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/android/gtalkservice/RosterManager;->blockContact(JLjava/lang/String;)V

    .line 387
    return-void
.end method

.method public clearContactFlags(Ljava/lang/String;)V
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 400
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v0

    .line 401
    .local v0, "rosterMgr":Lcom/google/android/gtalkservice/RosterManager;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getAccountId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/android/gtalkservice/RosterManager;->clearContactFlags(JLjava/lang/String;)V

    .line 402
    return-void
.end method

.method public closeAllChatSessions()V
    .locals 5

    .prologue
    .line 430
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 431
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getAccountId()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/gtalkservice/ChatMgr;->closeChatSessions(JJ)V

    .line 432
    return-void
.end method

.method public createGroupChatSession(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "contacts"    # [Ljava/lang/String;

    .prologue
    .line 405
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 406
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/ChatMgr;->createGroupChatSession(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    .line 407
    return-void
.end method

.method public declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "roomAddress"    # Ljava/lang/String;
    .param p2, "inviter"    # Ljava/lang/String;

    .prologue
    .line 415
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 416
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/ChatMgr;->declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    return-void
.end method

.method public editContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "groups"    # [Ljava/lang/String;

    .prologue
    .line 375
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/google/android/gtalkservice/RosterManager;->createContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 377
    return-void
.end method

.method public getAccountId()J
    .locals 2

    .prologue
    .line 161
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 170
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccount()Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hideContact(Ljava/lang/String;)V
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 395
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v0

    .line 396
    .local v0, "rosterMgr":Lcom/google/android/gtalkservice/RosterManager;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getAccountId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/android/gtalkservice/RosterManager;->hideContact(JLjava/lang/String;)V

    .line 397
    return-void
.end method

.method public hostSessionConnectionStateChanged(II)V
    .locals 0
    .param p1, "state"    # I
    .param p2, "error"    # I

    .prologue
    .line 366
    return-void
.end method

.method public initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 51
    if-eqz p1, :cond_1

    .line 52
    iget-object v0, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mSharedStatusPacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lcom/google/android/gtalkservice/extensions/SharedStatus;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mSharedStatusPacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mSharedStatusPacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 58
    :cond_1
    return-void
.end method

.method public joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "roomAddress"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;

    .prologue
    .line 410
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 411
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gtalkservice/ChatMgr;->joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    return-void
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 9
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "autoLogin"    # Z

    .prologue
    const/4 v8, 0x1

    .line 194
    const/4 v3, 0x0

    .line 197
    .local v3, "notifyConnState":Z
    monitor-enter p0

    .line 198
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v5

    new-instance v6, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;

    const/4 v7, 0x2

    invoke-direct {v6, v7}, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;-><init>(I)V

    invoke-virtual {v5, v6}, Lcom/google/android/gtalkservice/GTalkConnection;->addConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V

    .line 202
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->setLastLoginState(Z)V

    .line 203
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->setUsername(Ljava/lang/String;)V

    .line 208
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    .line 209
    .local v2, "hostConnection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v1

    .line 210
    .local v1, "connState":I
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v0

    .line 212
    .local v0, "connError":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "login: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", hostConn.connState = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v1}, Lcom/google/android/gtalkservice/ConnectionState;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", hostConn.error="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Lcom/google/android/gtalkservice/ConnectionError;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->log(Ljava/lang/String;)V

    .line 216
    const/4 v4, 0x0

    .line 218
    .local v4, "requestRoster":Z
    packed-switch v1, :pswitch_data_0

    .line 252
    :pswitch_0
    const/4 v4, 0x1

    .line 256
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnection;->sendHeartbeatToServer()V

    .line 261
    :cond_0
    :goto_0
    if-eqz v4, :cond_1

    .line 262
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnection;->requestRoster()V

    .line 264
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    if-eqz v3, :cond_2

    .line 270
    invoke-virtual {p0, v1, v0, v8}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->setConnectionStateAndError(IIZ)V

    .line 272
    :cond_2
    :goto_1
    return-void

    .line 220
    :pswitch_1
    const/4 v3, 0x1

    .line 222
    const/4 v5, 0x4

    if-eq v0, v5, :cond_3

    const/4 v5, 0x5

    if-ne v0, v5, :cond_0

    .line 224
    :cond_3
    :try_start_1
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnection;->requestToRefreshAutoToken()V

    goto :goto_0

    .line 264
    .end local v0    # "connError":I
    .end local v1    # "connState":I
    .end local v2    # "hostConnection":Lcom/google/android/gtalkservice/GTalkConnection;
    .end local v4    # "requestRoster":Z
    :catchall_0
    move-exception v5

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 231
    .restart local v0    # "connError":I
    .restart local v1    # "connState":I
    .restart local v2    # "hostConnection":Lcom/google/android/gtalkservice/GTalkConnection;
    .restart local v4    # "requestRoster":Z
    :pswitch_2
    if-ne v1, v8, :cond_5

    .line 232
    :try_start_2
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->connect()Z

    move-result v5

    if-nez v5, :cond_4

    .line 233
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v1

    .line 234
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v0

    .line 243
    :goto_2
    const/4 v3, 0x1

    .line 244
    const/4 v4, 0x1

    .line 245
    goto :goto_0

    .line 236
    :cond_4
    const/4 v1, 0x2

    .line 237
    const/4 v0, 0x0

    goto :goto_2

    .line 241
    :cond_5
    const/4 v0, 0x0

    goto :goto_2

    .line 248
    :pswitch_3
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v5, :cond_6

    const-string v5, "login: already ONLINE, no-op"

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->log(Ljava/lang/String;)V

    .line 249
    :cond_6
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 218
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public logout()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 278
    monitor-enter p0

    .line 279
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    new-instance v1, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->addConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V

    .line 283
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->setLastLoginState(Z)V

    .line 285
    invoke-direct {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->isLoginAttempted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 286
    const-string v0, "GTalkService"

    const-string v1, "[GTalkImSession] logout: not logged in"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    monitor-exit p0

    .line 302
    :goto_0
    return-void

    .line 289
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 291
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_1

    const-string v0, "logout: set unavailable presence"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->log(Ljava/lang/String;)V

    .line 292
    :cond_1
    new-instance v0, Lcom/google/android/gtalkservice/Presence;

    sget-object v1, Lcom/google/android/gtalkservice/Presence$Show;->AVAILABLE:Lcom/google/android/gtalkservice/Presence$Show;

    const/4 v2, 0x0

    invoke-direct {v0, v3, v1, v2}, Lcom/google/android/gtalkservice/Presence;-><init>(ZLcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->setAndSendPresence(Lcom/google/android/gtalkservice/Presence;)V

    .line 296
    iget-object v0, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    monitor-enter v0

    .line 297
    :try_start_1
    iget-object v1, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_2

    .line 298
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->setConnectionState(I)Z

    .line 300
    :cond_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 301
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->onLoggedOut()V

    goto :goto_0

    .line 289
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 300
    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1
.end method

.method protected onLoggedIn()V
    .locals 0

    .prologue
    .line 275
    return-void
.end method

.method protected onLoggedOut()V
    .locals 6

    .prologue
    .line 305
    invoke-super {p0}, Lcom/google/android/gtalkservice/ImSession;->onLoggedOut()V

    .line 307
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 308
    .local v0, "hostConnection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnectionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    .line 312
    .local v1, "hostContext":Lcom/google/android/gtalkservice/GTalkConnectionContext;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/RosterManager;->clearRosterFetchFlags()V

    .line 316
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getAccountId()J

    move-result-wide v3

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/google/android/gtalkservice/RosterListenerImpl;->clearStoredPresence(Landroid/content/ContentResolver;JLjava/lang/String;)V

    .line 322
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v2

    iget-wide v3, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mServiceProviderId:J

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->dismissNotifications(J)V

    .line 323
    return-void
.end method

.method public pinContact(Ljava/lang/String;)V
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 390
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v0

    .line 391
    .local v0, "rosterMgr":Lcom/google/android/gtalkservice/RosterManager;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getAccountId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/android/gtalkservice/RosterManager;->pinContact(JLjava/lang/String;)V

    .line 392
    return-void
.end method

.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 13
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    const/4 v12, 0x1

    .line 61
    instance-of v10, p1, Lcom/google/android/gtalkservice/extensions/SharedStatus;

    if-eqz v10, :cond_7

    .line 62
    move-object v0, p1

    check-cast v0, Lcom/google/android/gtalkservice/extensions/SharedStatus;

    move-object v5, v0

    .line 63
    .local v5, "sharedStatus":Lcom/google/android/gtalkservice/extensions/SharedStatus;
    new-instance v3, Lcom/google/android/gtalkservice/Presence;

    sget-object v10, Lcom/google/android/gtalkservice/Presence$Show;->NONE:Lcom/google/android/gtalkservice/Presence$Show;

    const/4 v11, 0x0

    invoke-direct {v3, v12, v10, v11}, Lcom/google/android/gtalkservice/Presence;-><init>(ZLcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    .line 65
    .local v3, "presence":Lcom/google/android/gtalkservice/Presence;
    const/4 v4, 0x0

    .line 72
    .local v4, "saveToDefault":Z
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->getStatusMax()I

    move-result v9

    .line 73
    .local v9, "statusMax":I
    if-eqz v9, :cond_8

    .line 74
    invoke-virtual {v3, v9}, Lcom/google/android/gtalkservice/Presence;->setStatusMax(I)V

    .line 75
    const/4 v4, 0x1

    .line 80
    :cond_0
    :goto_0
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->getStatusListMax()I

    move-result v8

    .line 81
    .local v8, "statusListMax":I
    if-eqz v8, :cond_9

    .line 82
    invoke-virtual {v3, v8}, Lcom/google/android/gtalkservice/Presence;->setStatusListMax(I)V

    .line 87
    :cond_1
    :goto_1
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->getStatusListContentsMax()I

    move-result v7

    .line 88
    .local v7, "statusListContentsMax":I
    if-eqz v7, :cond_a

    .line 89
    invoke-virtual {v3, v7}, Lcom/google/android/gtalkservice/Presence;->setStatusListContentsMax(I)V

    .line 94
    :cond_2
    :goto_2
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->hasStatusMinVersion()Z

    move-result v10

    if-eqz v10, :cond_c

    .line 95
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->getStatusMinVersion()I

    move-result v10

    const/4 v11, 0x2

    if-lt v10, v11, :cond_b

    move v10, v12

    :goto_3
    invoke-virtual {v3, v10}, Lcom/google/android/gtalkservice/Presence;->setAllowInvisibility(Z)V

    .line 101
    :cond_3
    :goto_4
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->getDefaultStatusList()Ljava/util/List;

    move-result-object v10

    sget-object v11, Lcom/google/android/gtalkservice/Presence$Show;->AVAILABLE:Lcom/google/android/gtalkservice/Presence$Show;

    invoke-direct {p0, v10, v3, v11}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->saveStatusList(Ljava/util/List;Lcom/google/android/gtalkservice/Presence;Lcom/google/android/gtalkservice/Presence$Show;)V

    .line 102
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->getDndStatusList()Ljava/util/List;

    move-result-object v10

    sget-object v11, Lcom/google/android/gtalkservice/Presence$Show;->DND:Lcom/google/android/gtalkservice/Presence$Show;

    invoke-direct {p0, v10, v3, v11}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->saveStatusList(Ljava/util/List;Lcom/google/android/gtalkservice/Presence;Lcom/google/android/gtalkservice/Presence$Show;)V

    .line 105
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->getShow()Ljava/lang/String;

    move-result-object v6

    .line 106
    .local v6, "show":Ljava/lang/String;
    if-eqz v6, :cond_d

    const-string v10, "dnd"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_d

    .line 107
    sget-object v10, Lcom/google/android/gtalkservice/Presence$Show;->DND:Lcom/google/android/gtalkservice/Presence$Show;

    invoke-virtual {v3, v10}, Lcom/google/android/gtalkservice/Presence;->setShow(Lcom/google/android/gtalkservice/Presence$Show;)V

    .line 112
    :goto_5
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->getStatus()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Lcom/google/android/gtalkservice/Presence;->setStatus(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->isInvisible()Z

    move-result v10

    invoke-virtual {v3, v10}, Lcom/google/android/gtalkservice/Presence;->setInvisible(Z)Z

    .line 116
    if-eqz v4, :cond_4

    .line 117
    new-instance v10, Lcom/google/android/gtalkservice/Presence;

    invoke-direct {v10, v3}, Lcom/google/android/gtalkservice/Presence;-><init>(Lcom/google/android/gtalkservice/Presence;)V

    iput-object v10, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

    .line 126
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getIntendedPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v1

    .line 127
    .local v1, "intendedPresence":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 128
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence;->getShow()Lcom/google/android/gtalkservice/Presence$Show;

    move-result-object v2

    .line 133
    .local v2, "oldShow":Lcom/google/android/gtalkservice/Presence$Show;
    sget-object v10, Lcom/google/android/gtalkservice/Presence$Show;->AWAY:Lcom/google/android/gtalkservice/Presence$Show;

    if-eq v2, v10, :cond_5

    sget-object v10, Lcom/google/android/gtalkservice/Presence$Show;->EXTENDED_AWAY:Lcom/google/android/gtalkservice/Presence$Show;

    if-ne v2, v10, :cond_e

    .line 134
    :cond_5
    sget-boolean v10, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v10, :cond_6

    .line 135
    const-string v10, "User is IDLE. stash the new shared presence away for later"

    invoke-direct {p0, v10}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->log(Ljava/lang/String;)V

    .line 137
    :cond_6
    invoke-virtual {p0, v3}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->setSharedPresence(Lcom/google/android/gtalkservice/Presence;)V

    .line 144
    .end local v1    # "intendedPresence":Lcom/google/android/gtalkservice/Presence;
    .end local v2    # "oldShow":Lcom/google/android/gtalkservice/Presence$Show;
    .end local v3    # "presence":Lcom/google/android/gtalkservice/Presence;
    .end local v4    # "saveToDefault":Z
    .end local v5    # "sharedStatus":Lcom/google/android/gtalkservice/extensions/SharedStatus;
    .end local v6    # "show":Ljava/lang/String;
    .end local v7    # "statusListContentsMax":I
    .end local v8    # "statusListMax":I
    .end local v9    # "statusMax":I
    :cond_7
    :goto_6
    return-void

    .line 76
    .restart local v3    # "presence":Lcom/google/android/gtalkservice/Presence;
    .restart local v4    # "saveToDefault":Z
    .restart local v5    # "sharedStatus":Lcom/google/android/gtalkservice/extensions/SharedStatus;
    .restart local v9    # "statusMax":I
    :cond_8
    iget-object v10, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

    if-eqz v10, :cond_0

    .line 77
    iget-object v10, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/Presence;->getStatusMax()I

    move-result v10

    invoke-virtual {v3, v10}, Lcom/google/android/gtalkservice/Presence;->setStatusMax(I)V

    goto/16 :goto_0

    .line 83
    .restart local v8    # "statusListMax":I
    :cond_9
    iget-object v10, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

    if-eqz v10, :cond_1

    .line 84
    iget-object v10, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/Presence;->getStatusListMax()I

    move-result v10

    invoke-virtual {v3, v10}, Lcom/google/android/gtalkservice/Presence;->setStatusListMax(I)V

    goto/16 :goto_1

    .line 90
    .restart local v7    # "statusListContentsMax":I
    :cond_a
    iget-object v10, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

    if-eqz v10, :cond_2

    .line 91
    iget-object v10, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/Presence;->getStatusListContentsMax()I

    move-result v10

    invoke-virtual {v3, v10}, Lcom/google/android/gtalkservice/Presence;->setStatusListContentsMax(I)V

    goto/16 :goto_2

    .line 95
    :cond_b
    const/4 v10, 0x0

    goto/16 :goto_3

    .line 97
    :cond_c
    iget-object v10, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

    if-eqz v10, :cond_3

    .line 98
    iget-object v10, p0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->mDefaultPresence:Lcom/google/android/gtalkservice/Presence;

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/Presence;->allowInvisibility()Z

    move-result v10

    invoke-virtual {v3, v10}, Lcom/google/android/gtalkservice/Presence;->setAllowInvisibility(Z)V

    goto/16 :goto_4

    .line 109
    .restart local v6    # "show":Ljava/lang/String;
    :cond_d
    sget-object v10, Lcom/google/android/gtalkservice/Presence$Show;->AVAILABLE:Lcom/google/android/gtalkservice/Presence$Show;

    invoke-virtual {v3, v10}, Lcom/google/android/gtalkservice/Presence;->setShow(Lcom/google/android/gtalkservice/Presence$Show;)V

    goto :goto_5

    .line 139
    .restart local v1    # "intendedPresence":Lcom/google/android/gtalkservice/Presence;
    .restart local v2    # "oldShow":Lcom/google/android/gtalkservice/Presence$Show;
    :cond_e
    invoke-virtual {p0, v3}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->setPresence(Lcom/google/android/gtalkservice/Presence;)Z

    .line 140
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnectionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterHandler()Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifySelfPresenceChanged()Z

    goto :goto_6
.end method

.method public pruneOldChatSessions(J)V
    .locals 3
    .param p1, "time"    # J

    .prologue
    .line 435
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 436
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getAccountId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/google/android/gtalkservice/ChatMgr;->closeChatSessions(JJ)V

    .line 437
    return-void
.end method

.method public removeContact(Ljava/lang/String;)V
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 380
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getAccountId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/android/gtalkservice/RosterManager;->removeContact(JLjava/lang/String;)V

    .line 382
    return-void
.end method

.method public removeGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 425
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 426
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->removeGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V

    .line 427
    return-void
.end method

.method protected translatePresence(Lcom/google/android/gtalkservice/Presence;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 4
    .param p1, "presence"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    .line 327
    const/4 v0, 0x0

    .line 332
    .local v0, "p":Lorg/jivesoftware/smack/packet/Packet;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 333
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->isInvisible()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 334
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->translateSharedPresence(Lcom/google/android/gtalkservice/Presence;)Lcom/google/android/gtalkservice/extensions/SharedStatus;

    move-result-object v0

    .line 350
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 351
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->translateXmppPresence(Lcom/google/android/gtalkservice/Presence;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    .line 354
    :cond_1
    return-object v0

    .line 336
    :cond_2
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->getShow()Lcom/google/android/gtalkservice/Presence$Show;

    move-result-object v1

    .line 338
    .local v1, "show":Lcom/google/android/gtalkservice/Presence$Show;
    sget-object v2, Lcom/google/android/gtalkservice/gtalk/GTalkImSession$1;->$SwitchMap$com$google$android$gtalkservice$Presence$Show:[I

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence$Show;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 341
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;->translateSharedPresence(Lcom/google/android/gtalkservice/Presence;)Lcom/google/android/gtalkservice/extensions/SharedStatus;

    move-result-object v0

    .line 342
    goto :goto_0

    .line 338
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
