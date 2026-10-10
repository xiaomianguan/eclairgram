.class public Lorg/jivesoftware/smack/Chat;
.super Ljava/lang/Object;
.source "Chat.java"


# static fields
.field private static id:J

.field private static prefix:Ljava/lang/String;


# instance fields
.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private listeners:Ljava/util/Set;

.field private messageCollector:Lorg/jivesoftware/smack/PacketCollector;

.field private messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private participant:Ljava/lang/String;

.field private threadID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 46
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->randomString(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/Chat;->prefix:Ljava/lang/String;

    .line 52
    const-wide/16 v0, 0x0

    sput-wide v0, Lorg/jivesoftware/smack/Chat;->id:J

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;
    .param p2, "participant"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-static {}, Lorg/jivesoftware/smack/Chat;->nextID()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/jivesoftware/smack/Chat;-><init>(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;
    .param p2, "participant"    # Ljava/lang/String;
    .param p3, "threadID"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/Chat;->listeners:Ljava/util/Set;

    .line 90
    iput-object p1, p0, Lorg/jivesoftware/smack/Chat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 91
    iput-object p2, p0, Lorg/jivesoftware/smack/Chat;->participant:Ljava/lang/String;

    .line 92
    iput-object p3, p0, Lorg/jivesoftware/smack/Chat;->threadID:Ljava/lang/String;

    .line 96
    iget-object v0, p1, Lorg/jivesoftware/smack/XMPPConnection;->chats:Ljava/util/Map;

    invoke-static {p2}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    new-instance v0, Lorg/jivesoftware/smack/filter/ThreadFilter;

    invoke-direct {v0, p3}, Lorg/jivesoftware/smack/filter/ThreadFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/Chat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 102
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/Chat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    .line 103
    return-void
.end method

.method private static declared-synchronized nextID()Ljava/lang/String;
    .locals 6

    .prologue
    .line 61
    const-class v0, Lorg/jivesoftware/smack/Chat;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lorg/jivesoftware/smack/Chat;->prefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-wide v2, Lorg/jivesoftware/smack/Chat;->id:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    sput-wide v4, Lorg/jivesoftware/smack/Chat;->id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public addMessageListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 3
    .param p1, "listener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 221
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v1, p0, Lorg/jivesoftware/smack/Chat;->messageFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, p1, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 224
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->listeners:Ljava/util/Set;

    monitor-enter v0

    .line 225
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/Chat;->listeners:Ljava/util/Set;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 226
    monitor-exit v0

    .line 227
    return-void

    .line 226
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public createMessage()Lorg/jivesoftware/smack/packet/Message;
    .locals 3

    .prologue
    .line 153
    new-instance v0, Lorg/jivesoftware/smack/packet/Message;

    iget-object v1, p0, Lorg/jivesoftware/smack/Chat;->participant:Ljava/lang/String;

    sget-object v2, Lorg/jivesoftware/smack/packet/Message$Type;->CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 154
    .local v0, "message":Lorg/jivesoftware/smack/packet/Message;
    iget-object v1, p0, Lorg/jivesoftware/smack/Chat;->threadID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/Message;->setThread(Ljava/lang/String;)V

    .line 155
    return-object v0
.end method

.method deliver(Lorg/jivesoftware/smack/packet/Message;)V
    .locals 5
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    .line 241
    iget-object v3, p0, Lorg/jivesoftware/smack/Chat;->threadID:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lorg/jivesoftware/smack/packet/Message;->setThread(Ljava/lang/String;)V

    .line 243
    iget-object v3, p0, Lorg/jivesoftware/smack/Chat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/PacketCollector;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 244
    iget-object v3, p0, Lorg/jivesoftware/smack/Chat;->listeners:Ljava/util/Set;

    monitor-enter v3

    .line 245
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/Chat;->listeners:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 246
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 248
    .local v2, "listenerRef":Ljava/lang/ref/WeakReference;
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/PacketListener;

    .local v1, "listener":Lorg/jivesoftware/smack/PacketListener;
    if-eqz v1, :cond_0

    .line 249
    invoke-interface {v1, p1}, Lorg/jivesoftware/smack/PacketListener;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0

    .line 256
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/jivesoftware/smack/PacketListener;
    .end local v2    # "listenerRef":Ljava/lang/ref/WeakReference;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 253
    .restart local v0    # "i":Ljava/util/Iterator;
    .restart local v1    # "listener":Lorg/jivesoftware/smack/PacketListener;
    .restart local v2    # "listenerRef":Ljava/lang/ref/WeakReference;
    :cond_0
    :try_start_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 256
    .end local v1    # "listener":Lorg/jivesoftware/smack/PacketListener;
    .end local v2    # "listenerRef":Ljava/lang/ref/WeakReference;
    :cond_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 257
    return-void
.end method

.method public finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 260
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 262
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    if-eqz v0, :cond_0

    .line 263
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    :cond_0
    :goto_0
    return-void

    .line 266
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public getParticipant()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->participant:Ljava/lang/String;

    return-object v0
.end method

.method public getThreadID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->threadID:Ljava/lang/String;

    return-object v0
.end method

.method public nextMessage()Lorg/jivesoftware/smack/packet/Message;
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->nextResult()Lorg/jivesoftware/smack/packet/Packet;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/Chat;
    check-cast p0, Lorg/jivesoftware/smack/packet/Message;

    return-object p0
.end method

.method public nextMessage(J)Lorg/jivesoftware/smack/packet/Message;
    .locals 1
    .param p1, "timeout"    # J

    .prologue
    .line 211
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v0, p1, p2}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/Chat;
    check-cast p0, Lorg/jivesoftware/smack/packet/Message;

    return-object p0
.end method

.method public pollMessage()Lorg/jivesoftware/smack/packet/Message;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->messageCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->pollResult()Lorg/jivesoftware/smack/packet/Packet;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/Chat;
    check-cast p0, Lorg/jivesoftware/smack/packet/Message;

    return-object p0
.end method

.method public sendMessage(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Chat;->createMessage()Lorg/jivesoftware/smack/packet/Message;

    move-result-object v0

    .line 140
    .local v0, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/packet/Message;->setBody(Ljava/lang/String;)V

    .line 141
    iget-object v1, p0, Lorg/jivesoftware/smack/Chat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 142
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
    .line 170
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->participant:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 171
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/packet/Message;->setType(Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 172
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->threadID:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/packet/Message;->setThread(Ljava/lang/String;)V

    .line 173
    iget-object v0, p0, Lorg/jivesoftware/smack/Chat;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 174
    return-void
.end method
