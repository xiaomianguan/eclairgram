.class public Lorg/jivesoftware/smack/GroupChat;
.super Ljava/lang/Object;
.source "GroupChat.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private connectionListeners:Ljava/util/List;

.field private joined:Z

.field private messageCollector:Lorg/jivesoftware/smack/PacketCollector;

.field private messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private nickname:Ljava/lang/String;

.field private participants:Ljava/util/List;

.field private presenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private room:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;)V
    .locals 4
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;
    .param p2, "room"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->nickname:Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/GroupChat;->joined:Z

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->participants:Ljava/util/List;

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->connectionListeners:Ljava/util/List;

    .line 67
    iput-object p1, p0, Lorg/jivesoftware/smack/GroupChat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 68
    iput-object p2, p0, Lorg/jivesoftware/smack/GroupChat;->room:Ljava/lang/String;

    .line 70
    new-instance v0, Lorg/jivesoftware/smack/filter/AndFilter;

    new-instance v1, Lorg/jivesoftware/smack/filter/FromContainsFilter;

    invoke-direct {v1, p2}, Lorg/jivesoftware/smack/filter/FromContainsFilter;-><init>(Ljava/lang/String;)V

    new-instance v2, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v3, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>(Lorg/jivesoftware/smack/filter/PacketFilter;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 72
    new-instance v0, Lorg/jivesoftware/smack/filter/AndFilter;

    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    new-instance v2, Lorg/jivesoftware/smack/GroupChat$1;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smack/GroupChat$1;-><init>(Lorg/jivesoftware/smack/GroupChat;)V

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>(Lorg/jivesoftware/smack/filter/PacketFilter;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 78
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    .line 80
    new-instance v0, Lorg/jivesoftware/smack/filter/AndFilter;

    new-instance v1, Lorg/jivesoftware/smack/filter/FromContainsFilter;

    invoke-direct {v1, p2}, Lorg/jivesoftware/smack/filter/FromContainsFilter;-><init>(Ljava/lang/String;)V

    new-instance v2, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v3, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>(Lorg/jivesoftware/smack/filter/PacketFilter;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->presenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 82
    new-instance v0, Lorg/jivesoftware/smack/GroupChat$2;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/GroupChat$2;-><init>(Lorg/jivesoftware/smack/GroupChat;)V

    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->presenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 100
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/GroupChat;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/GroupChat;

    .prologue
    .line 38
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->participants:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public addMessageListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 336
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, p1, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 337
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->connectionListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    return-void
.end method

.method public addParticipantListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 252
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->presenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, p1, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 253
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->connectionListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    return-void
.end method

.method public createMessage()Lorg/jivesoftware/smack/packet/Message;
    .locals 3

    .prologue
    .line 274
    new-instance v0, Lorg/jivesoftware/smack/packet/Message;

    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->room:Ljava/lang/String;

    sget-object v2, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$Type;)V

    return-object v0
.end method

.method public finalize()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 341
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 343
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    if-eqz v1, :cond_0

    .line 344
    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 347
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->connectionListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 348
    iget-object v2, p0, Lorg/jivesoftware/smack/GroupChat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/XMPPConnection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 351
    .end local v0    # "it":Ljava/util/Iterator;
    :catch_0
    move-exception v1

    .line 352
    :cond_1
    return-void
.end method

.method public getNickname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->nickname:Ljava/lang/String;

    return-object v0
.end method

.method public getParticipantCount()I
    .locals 2

    .prologue
    .line 221
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->participants:Ljava/util/List;

    monitor-enter v0

    .line 222
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->participants:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    monitor-exit v0

    return v1

    .line 223
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getParticipants()Ljava/util/Iterator;
    .locals 3

    .prologue
    .line 238
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->participants:Ljava/util/List;

    monitor-enter v0

    .line 239
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smack/GroupChat;->participants:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 240
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getRoom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->room:Ljava/lang/String;

    return-object v0
.end method

.method public isJoined()Z
    .locals 1

    .prologue
    .line 178
    iget-boolean v0, p0, Lorg/jivesoftware/smack/GroupChat;->joined:Z

    return v0
.end method

.method public declared-synchronized join(Ljava/lang/String;)V
    .locals 2
    .param p1, "nickname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 123
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0, p1, v0, v1}, Lorg/jivesoftware/smack/GroupChat;->join(Ljava/lang/String;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    monitor-exit p0

    return-void

    .line 123
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized join(Ljava/lang/String;J)V
    .locals 7
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "timeout"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const-string v4, "/"

    .line 139
    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    const-string v4, ""

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 140
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Nickname must not be null or blank."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 144
    :cond_1
    :try_start_1
    iget-boolean v4, p0, Lorg/jivesoftware/smack/GroupChat;->joined:Z

    if-eqz v4, :cond_2

    .line 145
    invoke-virtual {p0}, Lorg/jivesoftware/smack/GroupChat;->leave()V

    .line 149
    :cond_2
    new-instance v0, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v4, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v0, v4}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 150
    .local v0, "joinPresence":Lorg/jivesoftware/smack/packet/Presence;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lorg/jivesoftware/smack/GroupChat;->room:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 152
    new-instance v3, Lorg/jivesoftware/smack/filter/AndFilter;

    new-instance v4, Lorg/jivesoftware/smack/filter/FromContainsFilter;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/jivesoftware/smack/GroupChat;->room:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/FromContainsFilter;-><init>(Ljava/lang/String;)V

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v6, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-direct {v3, v4, v5}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>(Lorg/jivesoftware/smack/filter/PacketFilter;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 155
    .local v3, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v4, p0, Lorg/jivesoftware/smack/GroupChat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4, v3}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 157
    .local v2, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smack/GroupChat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 159
    invoke-virtual {v2, p2, p3}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/Presence;

    .line 160
    .local v1, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 161
    if-nez v1, :cond_3

    .line 162
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 164
    :cond_3
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 165
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 167
    :cond_4
    iput-object p1, p0, Lorg/jivesoftware/smack/GroupChat;->nickname:Ljava/lang/String;

    .line 168
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/jivesoftware/smack/GroupChat;->joined:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized leave()V
    .locals 3

    .prologue
    .line 186
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lorg/jivesoftware/smack/GroupChat;->joined:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 198
    :goto_0
    monitor-exit p0

    return-void

    .line 191
    :cond_0
    :try_start_1
    new-instance v0, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v1, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 192
    .local v0, "leavePresence":Lorg/jivesoftware/smack/packet/Presence;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/jivesoftware/smack/GroupChat;->room:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/GroupChat;->nickname:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 193
    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 195
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->participants:Ljava/util/List;

    .line 196
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->nickname:Ljava/lang/String;

    .line 197
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jivesoftware/smack/GroupChat;->joined:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 186
    .end local v0    # "leavePresence":Lorg/jivesoftware/smack/packet/Presence;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public nextMessage()Lorg/jivesoftware/smack/packet/Message;
    .locals 1

    .prologue
    .line 309
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->nextResult()Lorg/jivesoftware/smack/packet/Packet;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/GroupChat;
    check-cast p0, Lorg/jivesoftware/smack/packet/Message;

    return-object p0
.end method

.method public nextMessage(J)Lorg/jivesoftware/smack/packet/Message;
    .locals 1
    .param p1, "timeout"    # J

    .prologue
    .line 322
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v0, p1, p2}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/GroupChat;
    check-cast p0, Lorg/jivesoftware/smack/packet/Message;

    return-object p0
.end method

.method public pollMessage()Lorg/jivesoftware/smack/packet/Message;
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->pollResult()Lorg/jivesoftware/smack/packet/Packet;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/GroupChat;
    check-cast p0, Lorg/jivesoftware/smack/packet/Message;

    return-object p0
.end method

.method public sendMessage(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 263
    new-instance v0, Lorg/jivesoftware/smack/packet/Message;

    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->room:Ljava/lang/String;

    sget-object v2, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 264
    .local v0, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/packet/Message;->setBody(Ljava/lang/String;)V

    .line 265
    iget-object v1, p0, Lorg/jivesoftware/smack/GroupChat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 266
    return-void
.end method

.method public sendMessage(Lorg/jivesoftware/smack/packet/Message;)V
    .locals 1
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 284
    iget-object v0, p0, Lorg/jivesoftware/smack/GroupChat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 285
    return-void
.end method
