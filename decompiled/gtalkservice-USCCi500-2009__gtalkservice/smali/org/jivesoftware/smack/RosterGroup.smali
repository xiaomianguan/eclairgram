.class public Lorg/jivesoftware/smack/RosterGroup;
.super Ljava/lang/Object;
.source "RosterGroup.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private entries:Ljava/util/List;

.field private name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/jivesoftware/smack/RosterGroup;->name:Ljava/lang/String;

    .line 50
    iput-object p2, p0, Lorg/jivesoftware/smack/RosterGroup;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    .line 52
    return-void
.end method


# virtual methods
.method public addEntry(Lorg/jivesoftware/smack/RosterEntry;)V
    .locals 8
    .param p1, "entry"    # Lorg/jivesoftware/smack/RosterEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 164
    const/4 v0, 0x0

    .line 166
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    monitor-enter v4

    .line 167
    :try_start_0
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 168
    new-instance v2, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 169
    .local v2, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v5}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 170
    invoke-static {p1}, Lorg/jivesoftware/smack/RosterEntry;->toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    move-result-object v1

    .line 171
    .local v1, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->addGroupName(Ljava/lang/String;)V

    .line 172
    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 174
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 176
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v5, v2}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 178
    .end local v1    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v2    # "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    :cond_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    if-eqz v0, :cond_3

    .line 180
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 181
    .local v3, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 182
    if-nez v3, :cond_1

    .line 183
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string v5, "No response from the server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 178
    .end local v3    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 186
    .restart local v3    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :cond_1
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v4, v5, :cond_2

    .line 187
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 190
    :cond_2
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/RosterGroup;->addEntryLocal(Lorg/jivesoftware/smack/RosterEntry;)V

    .line 192
    .end local v3    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :cond_3
    return-void
.end method

.method addEntryLocal(Lorg/jivesoftware/smack/RosterEntry;)V
    .locals 2
    .param p1, "entry"    # Lorg/jivesoftware/smack/RosterEntry;

    .prologue
    .line 238
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    monitor-enter v0

    .line 239
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 240
    iget-object v1, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    monitor-exit v0

    .line 242
    return-void

    .line 241
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 153
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/RosterGroup;->getEntry(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public contains(Lorg/jivesoftware/smack/RosterEntry;)Z
    .locals 2
    .param p1, "entry"    # Lorg/jivesoftware/smack/RosterEntry;

    .prologue
    .line 141
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    monitor-enter v0

    .line 142
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    monitor-exit v0

    return v1

    .line 143
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getEntries()Ljava/util/Iterator;
    .locals 3

    .prologue
    .line 103
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    monitor-enter v0

    .line 104
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 105
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getEntry(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterEntry;
    .locals 6
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 116
    if-nez p1, :cond_0

    move-object v3, v5

    .line 131
    :goto_0
    return-object v3

    .line 121
    :cond_0
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 122
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 123
    .local v2, "userLowerCase":Ljava/lang/String;
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    monitor-enter v3

    .line 124
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 125
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    .line 126
    .local v0, "entry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 127
    monitor-exit v3

    move-object v3, v0

    goto :goto_0

    .line 130
    .end local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    :cond_2
    monitor-exit v3

    move-object v3, v5

    .line 131
    goto :goto_0

    .line 130
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public getEntryCount()I
    .locals 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    monitor-enter v0

    .line 93
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    monitor-exit v0

    return v1

    .line 94
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterGroup;->name:Ljava/lang/String;

    return-object v0
.end method

.method public removeEntry(Lorg/jivesoftware/smack/RosterEntry;)V
    .locals 8
    .param p1, "entry"    # Lorg/jivesoftware/smack/RosterEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 203
    const/4 v0, 0x0

    .line 208
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    monitor-enter v4

    .line 209
    :try_start_0
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 210
    new-instance v2, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 211
    .local v2, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v5}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 212
    invoke-static {p1}, Lorg/jivesoftware/smack/RosterEntry;->toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    move-result-object v1

    .line 213
    .local v1, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->removeGroupName(Ljava/lang/String;)V

    .line 214
    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 216
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 218
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v5, v2}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 220
    .end local v1    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v2    # "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    :cond_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 221
    if-eqz v0, :cond_3

    .line 222
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 223
    .local v3, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 224
    if-nez v3, :cond_1

    .line 225
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string v5, "No response from the server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 220
    .end local v3    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 228
    .restart local v3    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :cond_1
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v4, v5, :cond_2

    .line 229
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 232
    :cond_2
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/RosterGroup;->removeEntryLocal(Lorg/jivesoftware/smack/RosterEntry;)V

    .line 234
    .end local v3    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :cond_3
    return-void
.end method

.method removeEntryLocal(Lorg/jivesoftware/smack/RosterEntry;)V
    .locals 2
    .param p1, "entry"    # Lorg/jivesoftware/smack/RosterEntry;

    .prologue
    .line 246
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    monitor-enter v0

    .line 247
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 248
    iget-object v1, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 250
    :cond_0
    monitor-exit v0

    .line 251
    return-void

    .line 250
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setName(Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 72
    iget-object v4, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    monitor-enter v4

    .line 73
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 74
    new-instance v3, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v3}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 75
    .local v3, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 76
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->entries:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    .line 77
    .local v0, "entry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-static {v0}, Lorg/jivesoftware/smack/RosterEntry;->toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    move-result-object v2

    .line 78
    .local v2, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->name:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->removeGroupName(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->addGroupName(Ljava/lang/String;)V

    .line 80
    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 81
    iget-object v5, p0, Lorg/jivesoftware/smack/RosterGroup;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v5, v3}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 83
    .end local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v2    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v3    # "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    :cond_0
    monitor-exit v4

    .line 84
    return-void

    .line 83
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method
