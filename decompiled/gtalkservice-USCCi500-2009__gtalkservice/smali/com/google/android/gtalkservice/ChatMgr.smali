.class public Lcom/google/android/gtalkservice/ChatMgr;
.super Ljava/lang/Object;
.source "ChatMgr.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# static fields
.field private static final DBG:Z = false

.field private static final DEFAULT_USE_BARE_JID_TIMEOUT_MS:J = 0x927c0L


# instance fields
.field public mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gtalkservice/RemoteListenerCallback",
            "<",
            "Lcom/google/android/gtalkservice/IChatListener;",
            ">;"
        }
    .end annotation
.end field

.field private mChatListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/IChatListener;",
            ">;"
        }
    .end annotation
.end field

.field private mChatSessions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gtalkservice/ChatSession;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

.field private mGroupChatInvitationListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gtalkservice/RemoteListenerCallback",
            "<",
            "Lcom/google/android/gtalkservice/IGroupChatInvitationListener;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupChatInvitationListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/IGroupChatInvitationListener;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupChatInvitations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gtalkservice/GroupChatInvitation;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mPendingGroupChatConversions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gtalkservice/ChatSession;",
            ">;"
        }
    .end annotation
.end field

.field private mPendingGroupChatRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mResolver:Landroid/content/ContentResolver;

.field private mUseBareJidTimeoutMs:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    .line 67
    new-instance v0, Lcom/google/android/gtalkservice/RemoteListenerCallback;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/RemoteListenerCallback;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListeners:Ljava/util/ArrayList;

    .line 73
    new-instance v0, Lcom/google/android/gtalkservice/RemoteListenerCallback;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/RemoteListenerCallback;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatRequests:Ljava/util/Map;

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatConversions:Ljava/util/Map;

    .line 86
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/gtalkservice/ChatMgr;Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatMgr;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->tryRemoveChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/ChatMgr;Lcom/google/android/gtalkservice/IGroupChatInvitationListener;Lcom/google/android/gtalkservice/GroupChatInvitation;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatMgr;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;
    .param p2, "x2"    # Lcom/google/android/gtalkservice/GroupChatInvitation;

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/ChatMgr;->notifyGroupChatinvitation(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;Lcom/google/android/gtalkservice/GroupChatInvitation;)Z

    move-result v0

    return v0
.end method

.method private addChatSession(Ljava/lang/String;Lcom/google/android/gtalkservice/ChatSession;)V
    .locals 2
    .param p1, "toAddress"    # Ljava/lang/String;
    .param p2, "chatSession"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    monitor-enter v0

    .line 134
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    monitor-exit v0

    .line 136
    return-void

    .line 135
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private addGroupChatInvitation(Ljava/lang/String;Lcom/google/android/gtalkservice/GroupChatInvitation;)V
    .locals 2
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "invitation"    # Lcom/google/android/gtalkservice/GroupChatInvitation;

    .prologue
    .line 286
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    monitor-enter v0

    .line 287
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    monitor-exit v0

    .line 289
    return-void

    .line 288
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private addGroupChatSession(Lcom/google/android/gtalkservice/ChatSession;)V
    .locals 1
    .param p1, "chatSession"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 252
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/ChatSession;->getToAddress()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->addChatSession(Ljava/lang/String;Lcom/google/android/gtalkservice/ChatSession;)V

    .line 253
    return-void
.end method

.method private checkConvertExistingChatSession(Ljava/lang/String;)V
    .locals 3
    .param p1, "room"    # Ljava/lang/String;

    .prologue
    .line 388
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->getGroupChatInvitation(Ljava/lang/String;)Lcom/google/android/gtalkservice/GroupChatInvitation;

    move-result-object v1

    .line 389
    .local v1, "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    if-nez v1, :cond_1

    .line 402
    :cond_0
    :goto_0
    return-void

    .line 393
    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getInviter()Ljava/lang/String;

    move-result-object v2

    .line 394
    .local v2, "inviter":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/ChatMgr;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v0

    .line 395
    .local v0, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    if-eqz v0, :cond_0

    .line 401
    invoke-direct {p0, p1, v0}, Lcom/google/android/gtalkservice/ChatMgr;->prepareConvertToGroupChat(Ljava/lang/String;Lcom/google/android/gtalkservice/ChatSession;)V

    goto :goto_0
.end method

.method private closeAllChatSessions()V
    .locals 4

    .prologue
    .line 162
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    monitor-enter v2

    .line 163
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 164
    .local v1, "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/android/gtalkservice/ChatSession;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 165
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/ChatSession;

    .line 166
    .local v0, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/google/android/gtalkservice/ChatSession;->closeChat(Z)V

    goto :goto_0

    .line 170
    .end local v0    # "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    .end local v1    # "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/android/gtalkservice/ChatSession;>;"
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 169
    .restart local v1    # "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/android/gtalkservice/ChatSession;>;"
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 170
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 171
    return-void
.end method

.method private createGroupChatRoomName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 382
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "private-chat-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 383
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@groupchat.google.com"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private createGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)Lcom/google/android/gtalkservice/ChatSession;
    .locals 15
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "room"    # Ljava/lang/String;
    .param p3, "myNickname"    # Ljava/lang/String;
    .param p4, "groupChatNickname"    # Ljava/lang/String;
    .param p5, "password"    # Ljava/lang/String;
    .param p6, "providerId"    # J
    .param p8, "accountId"    # J

    .prologue
    .line 242
    new-instance v2, Lcom/google/android/gtalkservice/ChatSession;

    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatMgr;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatMgr;->mResolver:Landroid/content/ContentResolver;

    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v6

    move-object v3, p0

    move-wide/from16 v7, p6

    move-wide/from16 v9, p8

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p5

    invoke-direct/range {v2 .. v14}, Lcom/google/android/gtalkservice/ChatSession;-><init>(Lcom/google/android/gtalkservice/ChatMgr;Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnection;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .local v2, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    move-object v0, v2

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/ChatSession;->setGroupChatNickname(Ljava/lang/String;)V

    .line 247
    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/ChatMgr;->addGroupChatSession(Lcom/google/android/gtalkservice/ChatSession;)V

    .line 248
    return-object v2
.end method

.method private doHandleInvitation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "inviter"    # Ljava/lang/String;
    .param p3, "reason"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;

    .prologue
    .line 899
    const-string v4, "GTalkService"

    const/4 v5, 0x3

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_1

    .line 906
    :goto_0
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/gtalkservice/ChatMgr;->getGroupChatInvitation(Ljava/lang/String;)Lcom/google/android/gtalkservice/GroupChatInvitation;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 963
    :cond_0
    :goto_1
    return-void

    .line 900
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "got muc invite from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", room="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", reason="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 911
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatRequests:Ljava/util/Map;

    move-object v4, v0

    monitor-enter v4

    .line 912
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatRequests:Ljava/util/Map;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 914
    monitor-exit v4

    goto :goto_1

    .line 916
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    :cond_3
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 918
    invoke-direct/range {p0 .. p1}, Lcom/google/android/gtalkservice/ChatMgr;->getGroupChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v15

    .line 919
    .local v15, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    if-nez v15, :cond_0

    .line 925
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v15

    .line 926
    if-nez v15, :cond_6

    .line 928
    const-string v4, "GTalkService"

    const/4 v5, 0x3

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_5

    .line 931
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v4, v0

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v14

    .line 933
    .local v14, "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v4, v0

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v5

    .line 934
    .local v5, "username":Ljava/lang/String;
    iget-wide v10, v14, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    iget-wide v12, v14, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move-object v7, v5

    move-object/from16 v8, p2

    move-object/from16 v9, p4

    invoke-direct/range {v4 .. v13}, Lcom/google/android/gtalkservice/ChatMgr;->createGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v15

    .line 958
    .end local v5    # "username":Ljava/lang/String;
    .end local v14    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    :cond_4
    :goto_3
    new-instance v6, Lcom/google/android/gtalkservice/GroupChatInvitation;

    invoke-virtual {v15}, Lcom/google/android/gtalkservice/ChatSession;->getGroupContactId()J

    move-result-wide v11

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    invoke-direct/range {v6 .. v12}, Lcom/google/android/gtalkservice/GroupChatInvitation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 961
    .local v6, "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v6

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/ChatMgr;->addGroupChatInvitation(Ljava/lang/String;Lcom/google/android/gtalkservice/GroupChatInvitation;)V

    .line 962
    move-object/from16 v0, p0

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->notifyGroupChatInvitation(Lcom/google/android/gtalkservice/GroupChatInvitation;)V

    goto/16 :goto_1

    .line 929
    .end local v6    # "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    :cond_5
    const-string v4, "doHandleInvitation: create the group chat session"

    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 943
    :cond_6
    const-string v4, "GTalkService"

    const/4 v5, 0x3

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_7

    .line 946
    :goto_4
    move-object/from16 v0, p0

    move-object v1, v15

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->removeChatSession(Lcom/google/android/gtalkservice/ChatSession;)V

    .line 947
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v4, v0

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->pickNicknameUsingConvention(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v0, v15

    move-object/from16 v1, p1

    move-object v2, v4

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/ChatSession;->convertToGroupChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v16

    .line 952
    .local v16, "notifyRunnable":Ljava/lang/Runnable;
    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->addGroupChatSession(Lcom/google/android/gtalkservice/ChatSession;)V

    .line 953
    if-eqz v16, :cond_4

    .line 954
    invoke-interface/range {v16 .. v16}, Ljava/lang/Runnable;->run()V

    goto :goto_3

    .line 944
    .end local v16    # "notifyRunnable":Ljava/lang/Runnable;
    :cond_7
    const-string v4, "doHandleInvitation: convert to group chat session"

    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    goto :goto_4
.end method

.method private getGroupChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;
    .locals 1
    .param p1, "room"    # Ljava/lang/String;

    .prologue
    .line 256
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->internalGetChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v0

    return-object v0
.end method

.method private handleErrorMessage(Lorg/jivesoftware/smack/packet/Message;)V
    .locals 15
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    .line 511
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v7

    .line 512
    .local v7, "from":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getPacketID()Ljava/lang/String;

    move-result-object v8

    .line 514
    .local v8, "packetId":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_0

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 515
    :cond_0
    sget-boolean v13, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v13, :cond_1

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "handleErrorMessage: from="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", has no packet id, bail"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {p0, v13}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    .line 556
    :cond_1
    :goto_0
    return-void

    .line 519
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    .line 520
    .local v6, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    invoke-virtual {v6}, Lorg/jivesoftware/smack/packet/XMPPError;->getCode()I

    move-result v3

    .line 521
    .local v3, "code":I
    invoke-virtual {v6}, Lorg/jivesoftware/smack/packet/XMPPError;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 523
    .local v5, "errMsg":Ljava/lang/String;
    sget-boolean v13, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v13, :cond_3

    .line 524
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "ERROR Message: from="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", packetId="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", code="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", errMsg="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {p0, v13}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    .line 528
    :cond_3
    invoke-virtual {p0, v7}, Lcom/google/android/gtalkservice/ChatMgr;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v2

    .line 529
    .local v2, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    if-eqz v2, :cond_1

    .line 537
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/ChatSession;->isGroupChat()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 538
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/ChatSession;->getGroupContactId()J

    move-result-wide v13

    invoke-static {v13, v14}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v11

    .line 547
    .local v11, "uri":Landroid/net/Uri;
    :goto_1
    const-string v9, "packet_id=?"

    .line 548
    .local v9, "selection":Ljava/lang/String;
    const/4 v13, 0x1

    new-array v10, v13, [Ljava/lang/String;

    const/4 v13, 0x0

    aput-object v8, v10, v13

    .line 549
    .local v10, "selectionArgs":[Ljava/lang/String;
    new-instance v12, Landroid/content/ContentValues;

    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    .line 550
    .local v12, "values":Landroid/content/ContentValues;
    const-string v13, "err_code"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 551
    const-string v13, "err_msg"

    invoke-virtual {v12, v13, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    iget-object v13, p0, Lcom/google/android/gtalkservice/ChatMgr;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v13, v11, v12, v9, v10}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v13

    if-nez v13, :cond_1

    goto :goto_0

    .line 540
    .end local v9    # "selection":Ljava/lang/String;
    .end local v10    # "selectionArgs":[Ljava/lang/String;
    .end local v11    # "uri":Landroid/net/Uri;
    .end local v12    # "values":Landroid/content/ContentValues;
    :cond_4
    invoke-static {v7}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 541
    .local v1, "bareJid":Ljava/lang/String;
    iget-object v13, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v13}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v4

    .line 542
    .local v4, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-static {v4}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v0

    .line 544
    .local v0, "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    iget-wide v13, v0, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    invoke-static {v13, v14, v1}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    .restart local v11    # "uri":Landroid/net/Uri;
    goto :goto_1
.end method

.method private handleGroupChatInvitation(Lorg/jivesoftware/smack/packet/Message;)Z
    .locals 5
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    .line 572
    const-string v1, "x"

    const-string v2, "http://jabber.org/protocol/muc#user"

    invoke-virtual {p1, v1, v2}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/MUCUser;

    .line 578
    .local v0, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getInvite()Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 579
    const-string v1, "GTalkService"

    const/4 v2, 0x3

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 580
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleGroupChatInvitation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    .line 583
    :cond_0
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getInvite()Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getInvite()Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;->getReason()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getPassword()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/google/android/gtalkservice/ChatMgr;->doHandleInvitation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 586
    const/4 v1, 0x1

    .line 589
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private handleGroupChatPresence(Lorg/jivesoftware/smack/packet/Presence;)Z
    .locals 21
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 967
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v15

    .line 969
    .local v15, "from":Ljava/lang/String;
    invoke-static {v15}, Lcom/google/android/gtalkservice/XmppUtils;->isGroupChat(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 970
    const/4 v3, 0x0

    .line 1054
    :goto_0
    return v3

    .line 973
    :cond_0
    const-string v3, "GTalkService"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 974
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleGroupChatPresence from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object v1, v3

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    .line 979
    :cond_1
    const/16 v3, 0x2f

    invoke-virtual {v15, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v19

    .line 980
    .local v19, "slash":I
    if-gtz v19, :cond_2

    .line 981
    const-string v3, "GTalkService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleGroupChatPresence: invalid from address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 982
    const/4 v3, 0x0

    goto :goto_0

    .line 985
    :cond_2
    const/4 v3, 0x0

    move-object v0, v15

    move v1, v3

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 986
    .local v5, "room":Ljava/lang/String;
    add-int/lit8 v3, v19, 0x1

    invoke-virtual {v15, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 987
    .local v6, "nickname":Ljava/lang/String;
    invoke-static {v6}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 988
    const/16 v16, 0x0

    .line 989
    .local v16, "isPendingGroupChat":Z
    const/4 v8, 0x0

    .line 991
    .local v8, "groupChatPassword":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatRequests:Ljava/util/Map;

    move-object v3, v0

    monitor-enter v3

    .line 992
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatRequests:Ljava/util/Map;

    move-object v4, v0

    invoke-interface {v4, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 993
    .local v20, "value":Ljava/lang/String;
    if-eqz v20, :cond_3

    .line 994
    const/16 v16, 0x1

    .line 995
    move-object/from16 v8, v20

    .line 996
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatRequests:Ljava/util/Map;

    move-object v4, v0

    invoke-interface {v4, v15}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 998
    :cond_3
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1000
    if-eqz v16, :cond_8

    .line 1004
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatConversions:Ljava/util/Map;

    move-object v3, v0

    monitor-enter v3

    .line 1005
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatConversions:Ljava/util/Map;

    move-object v4, v0

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/android/gtalkservice/ChatSession;

    .line 1006
    .local v14, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1008
    if-eqz v14, :cond_6

    .line 1009
    const-string v3, "GTalkService"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-nez v3, :cond_5

    .line 1012
    :goto_1
    move-object/from16 v0, p0

    move-object v1, v14

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->removeChatSession(Lcom/google/android/gtalkservice/ChatSession;)V

    .line 1013
    invoke-virtual {v14, v5, v6, v8}, Lcom/google/android/gtalkservice/ChatSession;->convertToGroupChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v17

    .line 1016
    .local v17, "notifyRunnable":Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatConversions:Ljava/util/Map;

    move-object v3, v0

    monitor-enter v3

    .line 1017
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatConversions:Ljava/util/Map;

    move-object v4, v0

    invoke-interface {v4, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1018
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 1020
    move-object/from16 v0, p0

    move-object v1, v14

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->addGroupChatSession(Lcom/google/android/gtalkservice/ChatSession;)V

    .line 1021
    if-eqz v17, :cond_4

    .line 1022
    invoke-interface/range {v17 .. v17}, Ljava/lang/Runnable;->run()V

    .line 1042
    .end local v17    # "notifyRunnable":Ljava/lang/Runnable;
    :cond_4
    :goto_2
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 998
    .end local v14    # "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    .end local v20    # "value":Ljava/lang/String;
    :catchall_0
    move-exception v4

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v4

    .line 1006
    .restart local v20    # "value":Ljava/lang/String;
    :catchall_1
    move-exception v4

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v4

    .line 1010
    .restart local v14    # "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    :cond_5
    const-string v3, "found pending muc request, convert old chat session to group chat."

    move-object/from16 v0, p0

    move-object v1, v3

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 1018
    .restart local v17    # "notifyRunnable":Ljava/lang/Runnable;
    :catchall_2
    move-exception v4

    :try_start_5
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v4

    .line 1025
    .end local v17    # "notifyRunnable":Ljava/lang/Runnable;
    :cond_6
    const-string v3, "GTalkService"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-nez v3, :cond_7

    .line 1029
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v3, v0

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v13

    .line 1032
    .local v13, "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v3, v0

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v4

    iget-wide v9, v13, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    iget-wide v11, v13, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    move-object/from16 v3, p0

    move-object v7, v6

    invoke-direct/range {v3 .. v12}, Lcom/google/android/gtalkservice/ChatMgr;->createGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)Lcom/google/android/gtalkservice/ChatSession;

    goto :goto_2

    .line 1026
    .end local v13    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    :cond_7
    const-string v3, "found pending muc request, create new group chat session."

    move-object/from16 v0, p0

    move-object v1, v3

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    goto :goto_3

    .line 1045
    .end local v14    # "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    :cond_8
    move-object/from16 v0, p0

    move-object v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v18

    .line 1047
    .local v18, "session":Lcom/google/android/gtalkservice/ChatSession;
    if-nez v18, :cond_9

    .line 1048
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleGroupChatPresence: drop stale presence update from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object v1, v3

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    .line 1049
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 1052
    :cond_9
    move-object/from16 v0, v18

    move-object v1, v6

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/ChatSession;->groupChatParticipantPresenceChanged(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V

    .line 1054
    const/4 v3, 0x1

    goto/16 :goto_0
.end method

.method private internalGetChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;
    .locals 2
    .param p1, "toAddr"    # Ljava/lang/String;

    .prologue
    .line 139
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    monitor-enter v0

    .line 140
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/gtalkservice/ChatMgr;
    check-cast p0, Lcom/google/android/gtalkservice/ChatSession;

    monitor-exit v0

    return-object p0

    .line 141
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isDataMessagePacket(Lorg/jivesoftware/smack/packet/Message;)Z
    .locals 3
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    .line 559
    const-string v1, "data"

    const-string v2, "google:mobile:data"

    invoke-virtual {p1, v1, v2}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    .line 563
    .local v0, "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/google/android/gtalkservice/extensions/DataMessageExtension;

    if-eqz v1, :cond_0

    .line 564
    const/4 v1, 0x1

    .line 567
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isGroupChatInvitation(Lorg/jivesoftware/smack/packet/Message;)Z
    .locals 3
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    .line 646
    const-string v1, "x"

    const-string v2, "http://jabber.org/protocol/muc#user"

    invoke-virtual {p1, v1, v2}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/MUCUser;

    .line 649
    .local v0, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getInvite()Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1082
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ChatMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1083
    return-void
.end method

.method private notifyGroupChatInvitation(Lcom/google/android/gtalkservice/GroupChatInvitation;)V
    .locals 7
    .param p1, "invitation"    # Lcom/google/android/gtalkservice/GroupChatInvitation;

    .prologue
    .line 847
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListeners:Ljava/util/ArrayList;

    new-instance v3, Lcom/google/android/gtalkservice/ChatMgr$4;

    invoke-direct {v3, p0, p1}, Lcom/google/android/gtalkservice/ChatMgr$4;-><init>(Lcom/google/android/gtalkservice/ChatMgr;Lcom/google/android/gtalkservice/GroupChatInvitation;)V

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    .line 855
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v0

    .line 857
    .local v0, "notifier":Lcom/google/android/gtalkservice/service/StatusBarNotifier;
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v6

    .line 860
    .local v6, "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    iget-wide v2, v6, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    iget-wide v4, v6, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->notifyGroupChatInvitation(Lcom/google/android/gtalkservice/GroupChatInvitation;JJ)V

    .line 865
    return-void
.end method

.method private notifyGroupChatinvitation(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;Lcom/google/android/gtalkservice/GroupChatInvitation;)Z
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;
    .param p2, "invitation"    # Lcom/google/android/gtalkservice/GroupChatInvitation;

    .prologue
    .line 883
    :try_start_0
    invoke-interface {p1, p2}, Lcom/google/android/gtalkservice/IGroupChatInvitationListener;->onInvitationReceived(Lcom/google/android/gtalkservice/GroupChatInvitation;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-eqz v1, :cond_0

    .line 884
    const/4 v1, 0x1

    .line 895
    :goto_0
    return v1

    .line 886
    :catch_0
    move-exception v0

    .line 889
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[ChatMgr] notifyGroupChatInvitation caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing listener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 892
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->tryRemoveGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V

    .line 895
    .end local v0    # "ex":Landroid/os/RemoteException;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private pickNicknameUsingConvention(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 314
    const/16 v1, 0x40

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 315
    .local v0, "atSign":I
    if-ltz v0, :cond_0

    .line 316
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 319
    :cond_0
    return-object p1
.end method

.method private prepareConvertToGroupChat(Ljava/lang/String;Lcom/google/android/gtalkservice/ChatSession;)V
    .locals 2
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "chatSession"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 408
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatConversions:Ljava/util/Map;

    monitor-enter v0

    .line 409
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatConversions:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    monitor-exit v0

    .line 411
    return-void

    .line 410
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private processIncomingMessage(Lorg/jivesoftware/smack/packet/Message;)V
    .locals 14
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    .line 601
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v2

    .line 602
    .local v2, "from":Ljava/lang/String;
    const/4 v11, 0x0

    .line 603
    .local v11, "nickname":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getType()Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v10

    .line 605
    .local v10, "messageType":Lorg/jivesoftware/smack/packet/Message$Type;
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v10, v0, :cond_0

    .line 606
    const/16 v0, 0x2f

    invoke-virtual {v2, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v13

    .line 607
    .local v13, "slash":I
    if-ltz v13, :cond_0

    .line 608
    add-int/lit8 v0, v13, 0x1

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    .line 609
    const/4 v0, 0x0

    invoke-virtual {v2, v0, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 613
    .end local v13    # "slash":I
    :cond_0
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/ChatMgr;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v12

    .line 615
    .local v12, "session":Lcom/google/android/gtalkservice/ChatSession;
    if-nez v12, :cond_3

    .line 616
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getType()Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v0

    sget-object v1, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v0, v1, :cond_2

    .line 617
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "processIncomingMessage: cannot find group chat session for "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 643
    :cond_1
    :goto_0
    return-void

    .line 622
    :cond_2
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->isGroupChatInvitation(Lorg/jivesoftware/smack/packet/Message;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 628
    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 629
    .local v8, "bareJid":Ljava/lang/String;
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v9

    .line 630
    .local v9, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-static {v9}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v7

    .line 632
    .local v7, "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    iget-object v1, v7, Lcom/google/android/gtalkservice/ImAccountInfo;->username:Ljava/lang/String;

    iget-wide v3, v7, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    iget-wide v5, v7, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gtalkservice/ChatMgr;->createChatSession(Ljava/lang/String;Ljava/lang/String;JJ)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v12

    .line 638
    .end local v7    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    .end local v8    # "bareJid":Ljava/lang/String;
    .end local v9    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    :cond_3
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v10, v0, :cond_4

    .line 639
    invoke-virtual {v12, p1, v2, v11}, Lcom/google/android/gtalkservice/ChatSession;->onReceiveGroupMessage(Lorg/jivesoftware/smack/packet/Message;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 641
    :cond_4
    invoke-virtual {v12, p1}, Lcom/google/android/gtalkservice/ChatSession;->onReceiveMessage(Lorg/jivesoftware/smack/packet/Message;)V

    goto :goto_0
.end method

.method private processPresence(Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 0
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 430
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->handleGroupChatPresence(Lorg/jivesoftware/smack/packet/Presence;)Z

    .line 431
    return-void
.end method

.method private removeChatNotification(JLjava/lang/String;)V
    .locals 2
    .param p1, "providerId"    # J
    .param p3, "from"    # Ljava/lang/String;

    .prologue
    .line 763
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v0

    .line 764
    .local v0, "notifier":Lcom/google/android/gtalkservice/service/StatusBarNotifier;
    invoke-virtual {v0, p3, p1, p2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->removeChatNotificationFor(Ljava/lang/String;J)V

    .line 765
    return-void
.end method

.method private removeGroupChatInvitation(Ljava/lang/String;)V
    .locals 2
    .param p1, "room"    # Ljava/lang/String;

    .prologue
    .line 292
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    monitor-enter v0

    .line 293
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    monitor-exit v0

    .line 295
    return-void

    .line 294
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private removeOldGroupchatsFromDb()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    const-string v7, "=1"

    .line 1060
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    const-string v4, "removeOldGroupchatsFromDb"

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    .line 1062
    :cond_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatMgr;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 1063
    .local v3, "resolver":Landroid/content/ContentResolver;
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountId(Lcom/google/android/gtalkservice/GTalkConnection;)J

    move-result-wide v0

    .line 1066
    .local v0, "accountId":J
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1067
    .local v2, "buf":Ljava/lang/StringBuilder;
    const-string v4, "is_muc"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "=1"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1069
    invoke-static {v0, v1}, Landroid/provider/Im$Messages;->getContentUriByAccount(J)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1073
    const/4 v4, 0x0

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 1074
    const-string v4, "groupchat"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "=1"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1075
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v0, v1, v4, v6}, Lcom/google/android/gtalkservice/DatabaseHelper;->clearChatsForAccount(Landroid/content/ContentResolver;JLjava/lang/String;[Ljava/lang/String;)V

    .line 1078
    invoke-static {v3, v0, v1}, Lcom/google/android/gtalkservice/DatabaseHelper;->deleteGroupchatContacts(Landroid/content/ContentResolver;J)V

    .line 1079
    return-void
.end method

.method private tryRemoveChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 769
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 770
    :try_start_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 771
    monitor-exit v1

    .line 775
    :goto_0
    return-void

    .line 771
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 772
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 773
    .local v0, "ex":Ljava/lang/Exception;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "tryRemoveChatListener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private tryRemoveGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 869
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListeners:Ljava/util/ArrayList;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 870
    :try_start_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 871
    monitor-exit v1

    .line 875
    :goto_0
    return-void

    .line 871
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 872
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 873
    .local v0, "ex":Ljava/lang/Exception;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "removeGroupInvitationListener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " call "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public addGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    .locals 13
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 788
    iget-object v10, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListeners:Ljava/util/ArrayList;

    monitor-enter v10

    .line 789
    :try_start_0
    iget-object v11, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListeners:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .line 790
    .local v8, "remoteListener":Lcom/google/android/gtalkservice/IGroupChatInvitationListener;
    invoke-interface {v8}, Lcom/google/android/gtalkservice/IGroupChatInvitationListener;->asBinder()Landroid/os/IBinder;

    move-result-object v11

    invoke-interface {p1}, Lcom/google/android/gtalkservice/IGroupChatInvitationListener;->asBinder()Landroid/os/IBinder;

    move-result-object v12

    if-ne v11, v12, :cond_0

    .line 792
    monitor-exit v10

    .line 829
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v8    # "remoteListener":Lcom/google/android/gtalkservice/IGroupChatInvitationListener;
    :cond_1
    :goto_0
    return-void

    .line 796
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    iget-object v11, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListeners:Ljava/util/ArrayList;

    invoke-virtual {v11, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 797
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 801
    const/4 v7, 0x0

    .line 802
    .local v7, "oneInvitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    const/4 v5, 0x0

    .line 804
    .local v5, "invitationsCopy":[Lcom/google/android/gtalkservice/GroupChatInvitation;
    iget-object v11, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    monitor-enter v11

    .line 807
    :try_start_1
    iget-object v10, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    invoke-interface {v10}, Ljava/util/Map;->size()I

    move-result v9

    .line 809
    .local v9, "size":I
    if-nez v9, :cond_3

    .line 810
    monitor-exit v11

    goto :goto_0

    .line 820
    .end local v9    # "size":I
    :catchall_0
    move-exception v10

    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v10

    .line 797
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "invitationsCopy":[Lcom/google/android/gtalkservice/GroupChatInvitation;
    .end local v7    # "oneInvitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    :catchall_1
    move-exception v11

    :try_start_2
    monitor-exit v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v11

    .line 813
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "invitationsCopy":[Lcom/google/android/gtalkservice/GroupChatInvitation;
    .restart local v7    # "oneInvitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    .restart local v9    # "size":I
    :cond_3
    :try_start_3
    iget-object v10, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    invoke-interface {v10}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    .line 815
    .local v2, "c":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/android/gtalkservice/GroupChatInvitation;>;"
    const/4 v10, 0x1

    if-ne v9, v10, :cond_4

    .line 816
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lcom/google/android/gtalkservice/GroupChatInvitation;

    move-object v7, v0

    .line 820
    :goto_1
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 822
    if-eqz v7, :cond_5

    .line 823
    invoke-direct {p0, p1, v7}, Lcom/google/android/gtalkservice/ChatMgr;->notifyGroupChatinvitation(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;Lcom/google/android/gtalkservice/GroupChatInvitation;)Z

    goto :goto_0

    .line 818
    :cond_4
    :try_start_4
    new-array v10, v9, [Lcom/google/android/gtalkservice/GroupChatInvitation;

    invoke-interface {v2, v10}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, [Lcom/google/android/gtalkservice/GroupChatInvitation;

    move-object v5, v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 825
    :cond_5
    move-object v1, v5

    .local v1, "arr$":[Lcom/google/android/gtalkservice/GroupChatInvitation;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_2
    if-ge v3, v6, :cond_1

    aget-object v4, v1, v3

    .line 826
    .local v4, "invitation":Lcom/google/android/gtalkservice/GroupChatInvitation;
    invoke-direct {p0, p1, v4}, Lcom/google/android/gtalkservice/ChatMgr;->notifyGroupChatinvitation(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;Lcom/google/android/gtalkservice/GroupChatInvitation;)Z

    .line 825
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method public addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 5
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 653
    invoke-interface {p1}, Lcom/google/android/gtalkservice/IChatListener;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    .line 655
    .local v0, "binder":Landroid/os/IBinder;
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    monitor-enter v3

    .line 657
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/IChatListener;

    .line 658
    .local v1, "cl":Lcom/google/android/gtalkservice/IChatListener;
    invoke-interface {v1}, Lcom/google/android/gtalkservice/IChatListener;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-ne v4, v0, :cond_0

    .line 659
    monitor-exit v3

    .line 665
    .end local v1    # "cl":Lcom/google/android/gtalkservice/IChatListener;
    :goto_0
    return-void

    .line 663
    :cond_1
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 664
    monitor-exit v3

    goto :goto_0

    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public closeChatSessions(JJ)V
    .locals 10
    .param p1, "accountId"    # J
    .param p3, "time"    # J

    .prologue
    const-wide/16 v8, 0x0

    .line 182
    const-string v5, "GTalkService"

    const/4 v6, 0x3

    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 183
    cmp-long v5, p3, v8

    if-lez v5, :cond_3

    .line 184
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "closeChatSessions: prune chats before "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    .line 189
    :cond_0
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 190
    .local v2, "chatsToClose":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gtalkservice/ChatSession;>;"
    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    monitor-enter v5

    .line 191
    :try_start_0
    iget-object v6, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 192
    .local v4, "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/android/gtalkservice/ChatSession;>;"
    :cond_1
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 193
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/ChatSession;

    .line 195
    .local v1, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v6

    cmp-long v6, v6, p1

    if-nez v6, :cond_1

    .line 199
    cmp-long v6, p3, v8

    if-lez v6, :cond_2

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ChatSession;->getLastMessageTimestamp()J

    move-result-wide v6

    cmp-long v6, v6, p3

    if-gez v6, :cond_1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ChatSession;->hasUnreadMessage()Z

    move-result v6

    if-nez v6, :cond_1

    .line 202
    :cond_2
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ChatSession;->prepareToClose()V

    .line 203
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 206
    .end local v1    # "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    .end local v4    # "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/android/gtalkservice/ChatSession;>;"
    :catchall_0
    move-exception v6

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    .line 186
    .end local v2    # "chatsToClose":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gtalkservice/ChatSession;>;"
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "closeChatSessions: close all chats for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 206
    .restart local v2    # "chatsToClose":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gtalkservice/ChatSession;>;"
    .restart local v4    # "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/android/gtalkservice/ChatSession;>;"
    :cond_4
    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 207
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/ChatSession;

    .line 208
    .local v0, "chat":Lcom/google/android/gtalkservice/ChatSession;
    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/ChatMgr;->removeChatSession(Lcom/google/android/gtalkservice/ChatSession;)V

    goto :goto_2

    .line 210
    .end local v0    # "chat":Lcom/google/android/gtalkservice/ChatSession;
    :cond_5
    cmp-long v5, p3, v8

    if-lez v5, :cond_6

    .line 211
    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatMgr;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v5, p1, p2, p3, p4}, Lcom/google/android/gtalkservice/DatabaseHelper;->pruneChats(Landroid/content/ContentResolver;JJ)V

    .line 212
    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGtalkProviderId()J

    move-result-wide v5

    const/4 v7, 0x0

    invoke-virtual {p0, v5, v6, v7}, Lcom/google/android/gtalkservice/ChatMgr;->notifyChatClosed(JLjava/lang/String;)V

    .line 216
    :goto_3
    return-void

    .line 214
    :cond_6
    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatMgr;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v5, p1, p2}, Lcom/google/android/gtalkservice/DatabaseHelper;->clearAllChats(Landroid/content/ContentResolver;J)V

    goto :goto_3
.end method

.method convertToGroupChatSession(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "chatSession"    # Lcom/google/android/gtalkservice/ChatSession;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "invitees"    # [Ljava/lang/String;

    .prologue
    .line 281
    invoke-virtual {p0, p2, p3}, Lcom/google/android/gtalkservice/ChatMgr;->createGroupChatSession(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 282
    .local v0, "room":Ljava/lang/String;
    invoke-direct {p0, v0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->prepareConvertToGroupChat(Ljava/lang/String;Lcom/google/android/gtalkservice/ChatSession;)V

    .line 283
    return-void
.end method

.method public createChatSession(Ljava/lang/String;Ljava/lang/String;JJ)Lcom/google/android/gtalkservice/ChatSession;
    .locals 11
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "contact"    # Ljava/lang/String;
    .param p3, "providerId"    # J
    .param p5, "accountId"    # J

    .prologue
    .line 222
    new-instance v0, Lcom/google/android/gtalkservice/ChatSession;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatMgr;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v4

    move-object v1, p0

    move-wide v5, p3

    move-wide/from16 v7, p5

    move-object v9, p1

    move-object v10, p2

    invoke-direct/range {v0 .. v10}, Lcom/google/android/gtalkservice/ChatSession;-><init>(Lcom/google/android/gtalkservice/ChatMgr;Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnection;JJLjava/lang/String;Ljava/lang/String;)V

    .line 227
    .local v0, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->getToAddress()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/google/android/gtalkservice/ChatMgr;->addChatSession(Ljava/lang/String;Lcom/google/android/gtalkservice/ChatSession;)V

    .line 230
    return-object v0
.end method

.method public createGroupChatSession(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "invitees"    # [Ljava/lang/String;

    .prologue
    .line 261
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatMgr;->createGroupChatRoomName()Ljava/lang/String;

    move-result-object v4

    .line 262
    .local v4, "room":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {p0, v4, p1, v5}, Lcom/google/android/gtalkservice/ChatMgr;->joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v2, v0, v1

    .line 266
    .local v2, "invitee":Ljava/lang/String;
    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v5

    const-string v6, ""

    invoke-static {v5, v4, v2, v6}, Lcom/google/android/gtalkservice/XmppUtils;->sendGroupChatInvitationTo(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 274
    .end local v2    # "invitee":Ljava/lang/String;
    :cond_0
    return-object v4
.end method

.method public declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "inviter"    # Ljava/lang/String;

    .prologue
    .line 304
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->removeGroupChatInvitation(Ljava/lang/String;)V

    .line 305
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->getGroupChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v0

    .line 306
    .local v0, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    if-eqz v0, :cond_0

    .line 307
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/ChatSession;->declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->leave()V

    .line 310
    :cond_0
    return-void
.end method

.method public getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;
    .locals 1
    .param p1, "jid"    # Ljava/lang/String;

    .prologue
    .line 234
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatMgr;->internalGetChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v0

    return-object v0
.end method

.method getGroupChatInvitation(Ljava/lang/String;)Lcom/google/android/gtalkservice/GroupChatInvitation;
    .locals 2
    .param p1, "room"    # Ljava/lang/String;

    .prologue
    .line 298
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    monitor-enter v0

    .line 299
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitations:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/gtalkservice/ChatMgr;
    check-cast p0, Lcom/google/android/gtalkservice/GroupChatInvitation;

    monitor-exit v0

    return-object p0

    .line 300
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getUserBareJidTimeout()J
    .locals 2

    .prologue
    .line 125
    iget-wide v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mUseBareJidTimeoutMs:J

    return-wide v0
.end method

.method public init(Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resolver"    # Landroid/content/ContentResolver;
    .param p3, "mc"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .param p4, "handler"    # Landroid/os/Handler;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mContext:Landroid/content/Context;

    .line 91
    iput-object p3, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .line 92
    iput-object p2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mResolver:Landroid/content/ContentResolver;

    .line 93
    iput-object p4, p0, Lcom/google/android/gtalkservice/ChatMgr;->mHandler:Landroid/os/Handler;

    .line 95
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatMgr;->removeOldGroupchatsFromDb()V

    .line 96
    return-void
.end method

.method initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 9
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 99
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v5, :cond_0

    const-string v5, "initConnection: set up message packet listeners"

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    .line 101
    :cond_0
    new-instance v4, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v5, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 102
    .local v4, "presenceFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-virtual {p1, p0, v4}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 104
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v5, Lorg/jivesoftware/smack/packet/BatchPresence;

    invoke-direct {v0, v5}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 105
    .local v0, "batchPresenceFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-virtual {p1, p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 107
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v5, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v3, v5}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 109
    .local v3, "messageFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-virtual {p1, p0, v3}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 111
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v5, Lcom/google/android/gtalkservice/extensions/ChatClosed;

    invoke-direct {v1, v5}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 112
    .local v1, "chatClosedFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-virtual {p1, p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 114
    new-instance v2, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v5, Lcom/google/android/gtalkservice/extensions/ChatRead;

    invoke-direct {v2, v5}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 115
    .local v2, "chatReadFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-virtual {p1, p0, v2}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 119
    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatMgr;->mResolver:Landroid/content/ContentResolver;

    const-string v6, "gtalk_use_barejid_timeout_ms"

    const-wide/32 v7, 0x927c0

    invoke-static {v5, v6, v7, v8}, Landroid/provider/Settings$Gservices;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v5

    iput-wide v5, p0, Lcom/google/android/gtalkservice/ChatMgr;->mUseBareJidTimeoutMs:J

    .line 122
    return-void
.end method

.method public joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;

    .prologue
    const-string v10, "GTalkService"

    .line 323
    iget-object v7, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v7}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 325
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 326
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/ChatMgr;->pickNicknameUsingConvention(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 331
    :cond_0
    const-string v7, "GTalkService"

    const/4 v7, 0x3

    invoke-static {v10, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 332
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "joinGroupChatSession: room="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", nick="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/ChatMgr;->log(Ljava/lang/String;)V

    .line 336
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->getGroupChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v4

    .line 337
    .local v4, "session":Lcom/google/android/gtalkservice/ChatSession;
    if-eqz v4, :cond_2

    .line 338
    invoke-virtual {v4, p2}, Lcom/google/android/gtalkservice/ChatSession;->setMyGroupChatNickname(Ljava/lang/String;)V

    .line 343
    :cond_2
    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v7, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v7}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 345
    .local v2, "joinPresence":Lorg/jivesoftware/smack/packet/Presence;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 346
    .local v5, "toBuf":Ljava/lang/StringBuilder;
    const/16 v7, 0x2f

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 349
    .local v6, "toStr":Ljava/lang/String;
    invoke-virtual {v2, v6}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 352
    new-instance v3, Lorg/jivesoftware/smackx/packet/MUCInitialPresence;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence;-><init>()V

    .line 353
    .local v3, "mucInitialPresence":Lorg/jivesoftware/smackx/packet/MUCInitialPresence;
    if-eqz p3, :cond_3

    .line 354
    invoke-virtual {v3, p3}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence;->setPassword(Ljava/lang/String;)V

    .line 358
    :cond_3
    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 361
    :try_start_0
    invoke-virtual {v0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z

    .line 364
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->getGroupChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v7

    if-nez v7, :cond_4

    .line 365
    iget-object v7, p0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatRequests:Ljava/util/Map;

    monitor-enter v7
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 369
    :try_start_1
    iget-object v8, p0, Lcom/google/android/gtalkservice/ChatMgr;->mPendingGroupChatRequests:Ljava/util/Map;

    if-eqz p3, :cond_5

    move-object v9, p3

    :goto_0
    invoke-interface {v8, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 371
    :try_start_2
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->checkConvertExistingChatSession(Ljava/lang/String;)V

    .line 373
    :cond_4
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->removeGroupChatInvitation(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0

    .line 379
    :goto_1
    return-void

    .line 369
    :cond_5
    :try_start_3
    const-string v9, ""

    goto :goto_0

    .line 370
    :catchall_0
    move-exception v8

    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v8
    :try_end_4
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_0

    .line 374
    :catch_0
    move-exception v7

    move-object v1, v7

    .line 375
    .local v1, "ex":Ljava/lang/IllegalStateException;
    const-string v7, "GTalkService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "joinGroupChatSession caught "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v10, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method notifyChat(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 691
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    new-instance v3, Lcom/google/android/gtalkservice/ChatMgr$1;

    invoke-direct {v3, p0, p1, p2}, Lcom/google/android/gtalkservice/ChatMgr$1;-><init>(Lcom/google/android/gtalkservice/ChatMgr;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    move-result v0

    .line 708
    .local v0, "notified":Z
    return-void
.end method

.method notifyChatClosed(JLjava/lang/String;)V
    .locals 3
    .param p1, "providerId"    # J
    .param p3, "from"    # Ljava/lang/String;

    .prologue
    .line 742
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    new-instance v2, Lcom/google/android/gtalkservice/ChatMgr$3;

    invoke-direct {v2, p0, p3}, Lcom/google/android/gtalkservice/ChatMgr$3;-><init>(Lcom/google/android/gtalkservice/ChatMgr;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    .line 759
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/ChatMgr;->removeChatNotification(JLjava/lang/String;)V

    .line 760
    return-void
.end method

.method notifyChatRead(JLjava/lang/String;)V
    .locals 3
    .param p1, "providerId"    # J
    .param p3, "from"    # Ljava/lang/String;

    .prologue
    .line 716
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    new-instance v2, Lcom/google/android/gtalkservice/ChatMgr$2;

    invoke-direct {v2, p0, p3}, Lcom/google/android/gtalkservice/ChatMgr$2;-><init>(Lcom/google/android/gtalkservice/ChatMgr;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    .line 733
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/ChatMgr;->removeChatNotification(JLjava/lang/String;)V

    .line 734
    return-void
.end method

.method public onLogout(J)V
    .locals 1
    .param p1, "accountId"    # J

    .prologue
    .line 593
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatMgr;->closeAllChatSessions()V

    .line 594
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatMgr;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v0, p1, p2}, Lcom/google/android/gtalkservice/DatabaseHelper;->clearAllChatsForAccount(Landroid/content/ContentResolver;J)V

    .line 598
    return-void
.end method

.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 15
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    const-string v14, "GTalkService"

    .line 436
    move-object/from16 v0, p1

    instance-of v0, v0, Lorg/jivesoftware/smack/packet/Presence;

    move v12, v0

    if-eqz v12, :cond_1

    .line 437
    move-object/from16 v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/Presence;

    move-object v9, v0

    .line 438
    .local v9, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-direct {p0, v9}, Lcom/google/android/gtalkservice/ChatMgr;->processPresence(Lorg/jivesoftware/smack/packet/Presence;)V

    .line 508
    .end local v9    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_0
    :goto_0
    return-void

    .line 439
    :cond_1
    move-object/from16 v0, p1

    instance-of v0, v0, Lorg/jivesoftware/smack/packet/BatchPresence;

    move v12, v0

    if-eqz v12, :cond_2

    .line 440
    move-object/from16 v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/BatchPresence;

    move-object v1, v0

    .line 441
    .local v1, "batchPresence":Lorg/jivesoftware/smack/packet/BatchPresence;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/BatchPresence;->getPresenceStanzaList()Ljava/util/ArrayList;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/jivesoftware/smack/packet/Presence;

    .line 442
    .restart local v9    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-direct {p0, v9}, Lcom/google/android/gtalkservice/ChatMgr;->processPresence(Lorg/jivesoftware/smack/packet/Presence;)V

    goto :goto_1

    .line 444
    .end local v1    # "batchPresence":Lorg/jivesoftware/smack/packet/BatchPresence;
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_2
    move-object/from16 v0, p1

    instance-of v0, v0, Lorg/jivesoftware/smack/packet/Message;

    move v12, v0

    if-eqz v12, :cond_6

    .line 446
    move-object/from16 v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/Message;

    move-object v7, v0

    .line 447
    .local v7, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v7}, Lorg/jivesoftware/smack/packet/Message;->getType()Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v8

    .line 452
    .local v8, "messageType":Lorg/jivesoftware/smack/packet/Message$Type;
    sget-object v12, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v8, v12, :cond_3

    .line 453
    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/ChatMgr;->handleErrorMessage(Lorg/jivesoftware/smack/packet/Message;)V

    goto :goto_0

    .line 457
    :cond_3
    sget-object v12, Lorg/jivesoftware/smack/packet/Message$Type;->HEADLINE:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v8, v12, :cond_4

    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/ChatMgr;->isDataMessagePacket(Lorg/jivesoftware/smack/packet/Message;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 462
    :cond_4
    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/ChatMgr;->handleGroupChatInvitation(Lorg/jivesoftware/smack/packet/Message;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 467
    iget-object v12, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v12}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/android/gtalkservice/GTalkConnection;->getServerAddress()Ljava/lang/String;

    move-result-object v5

    .line 468
    .local v5, "host":Ljava/lang/String;
    if-eqz v5, :cond_5

    invoke-virtual {v7}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 472
    :cond_5
    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/ChatMgr;->processIncomingMessage(Lorg/jivesoftware/smack/packet/Message;)V

    goto :goto_0

    .line 474
    .end local v5    # "host":Ljava/lang/String;
    .end local v7    # "message":Lorg/jivesoftware/smack/packet/Message;
    .end local v8    # "messageType":Lorg/jivesoftware/smack/packet/Message$Type;
    :cond_6
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/google/android/gtalkservice/extensions/ChatClosed;

    move v12, v0

    if-eqz v12, :cond_8

    .line 475
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    .line 476
    .local v4, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v4, :cond_7

    .line 477
    const-string v12, "GTalkService"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "doProcessPacket: received ChatClosed, error="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v14, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 481
    :cond_7
    move-object/from16 v0, p1

    check-cast v0, Lcom/google/android/gtalkservice/extensions/ChatClosed;

    move-object v2, v0

    .line 482
    .local v2, "chatClosed":Lcom/google/android/gtalkservice/extensions/ChatClosed;
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/extensions/ChatClosed;->getUser()Ljava/lang/String;

    move-result-object v11

    .line 485
    .local v11, "user":Ljava/lang/String;
    invoke-virtual {p0, v11}, Lcom/google/android/gtalkservice/ChatMgr;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v3

    .line 486
    .local v3, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    if-eqz v3, :cond_0

    .line 487
    const/4 v12, 0x1

    invoke-virtual {v3, v12}, Lcom/google/android/gtalkservice/ChatSession;->closeChat(Z)V

    .line 488
    invoke-virtual {v3, v11}, Lcom/google/android/gtalkservice/ChatSession;->notifyChatClosed(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 491
    .end local v2    # "chatClosed":Lcom/google/android/gtalkservice/extensions/ChatClosed;
    .end local v3    # "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    .end local v4    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    .end local v11    # "user":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p1

    instance-of v0, v0, Lcom/google/android/gtalkservice/extensions/ChatRead;

    move v12, v0

    if-eqz v12, :cond_0

    .line 492
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    .line 493
    .restart local v4    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v4, :cond_9

    .line 494
    const-string v12, "GTalkService"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "doProcessPacket: received ChatRead, error="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v14, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 498
    :cond_9
    move-object/from16 v0, p1

    check-cast v0, Lcom/google/android/gtalkservice/extensions/ChatRead;

    move-object v10, v0

    .line 499
    .local v10, "read":Lcom/google/android/gtalkservice/extensions/ChatRead;
    invoke-virtual {v10}, Lcom/google/android/gtalkservice/extensions/ChatRead;->getUser()Ljava/lang/String;

    move-result-object v11

    .line 502
    .restart local v11    # "user":Ljava/lang/String;
    invoke-virtual {p0, v11}, Lcom/google/android/gtalkservice/ChatMgr;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v3

    .line 503
    .restart local v3    # "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    if-eqz v3, :cond_0

    .line 504
    const/4 v12, 0x0

    invoke-virtual {v3, v12}, Lcom/google/android/gtalkservice/ChatSession;->markAsRead(Z)V

    .line 505
    invoke-virtual {v3, v11}, Lcom/google/android/gtalkservice/ChatSession;->notifyChatRead(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method rejoinRoomsForGroupChats()V
    .locals 6

    .prologue
    .line 416
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    monitor-enter v2

    .line 417
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 418
    .local v1, "keys":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 419
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/ChatSession;

    .line 420
    .local v0, "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->isGroupChat()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 421
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->getToAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->getGroupChatNickname()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ChatSession;->getGroupChatPassword()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v4, v5}, Lcom/google/android/gtalkservice/ChatMgr;->joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 426
    .end local v0    # "chatSession":Lcom/google/android/gtalkservice/ChatSession;
    .end local v1    # "keys":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v1    # "keys":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 427
    return-void
.end method

.method removeChatSession(Lcom/google/android/gtalkservice/ChatSession;)V
    .locals 5
    .param p1, "session"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 146
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/ChatSession;->getToAddress()Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "toAddress":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/ChatSession;->isGroupChat()Z

    move-result v1

    if-nez v1, :cond_0

    .line 149
    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    monitor-enter v1

    .line 155
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatSessions:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    .line 156
    const-string v2, "GTalkService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "removeChatSession: failed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    :cond_1
    monitor-exit v1

    .line 159
    return-void

    .line 158
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public removeGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 838
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .line 839
    .local v1, "remoteListener":Lcom/google/android/gtalkservice/IGroupChatInvitationListener;
    invoke-interface {v1}, Lcom/google/android/gtalkservice/IGroupChatInvitationListener;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-interface {p1}, Lcom/google/android/gtalkservice/IGroupChatInvitationListener;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    if-ne v2, v3, :cond_0

    .line 840
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatMgr;->mGroupChatInvitationListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 844
    .end local v1    # "remoteListener":Lcom/google/android/gtalkservice/IGroupChatInvitationListener;
    :cond_1
    return-void
.end method

.method public removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 5
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 668
    invoke-interface {p1}, Lcom/google/android/gtalkservice/IChatListener;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    .line 670
    .local v0, "binder":Landroid/os/IBinder;
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    monitor-enter v3

    .line 671
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/IChatListener;

    .line 672
    .local v1, "cl":Lcom/google/android/gtalkservice/IChatListener;
    invoke-interface {v1}, Lcom/google/android/gtalkservice/IChatListener;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-ne v4, v0, :cond_0

    .line 673
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 674
    monitor-exit v3

    .line 678
    .end local v1    # "cl":Lcom/google/android/gtalkservice/IChatListener;
    :goto_0
    return-void

    .line 677
    :cond_1
    monitor-exit v3

    goto :goto_0

    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method
