.class Lorg/jivesoftware/smack/PacketWriter;
.super Ljava/lang/Object;
.source "PacketWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;,
        Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;,
        Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Smack/Packet"


# instance fields
.field private final closeBytes:[B

.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private done:Z

.field private final heartbeatAckBytes:[B

.field private final heartbeatPingBytes:[B

.field private interceptorDeleted:Z

.field private final interceptors:Ljava/util/List;

.field private lastActive:J

.field private final listeners:Ljava/util/List;

.field private listenersDeleted:Z

.field private final queue:Ljava/util/LinkedList;

.field private final serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

.field private writer:Ljava/io/OutputStream;

.field private writerThread:Ljava/lang/Thread;


# direct methods
.method protected constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 10
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    const/4 v5, 0x0

    const-string v9, "Cannot serialize heartbeat -- should not happen!"

    const-string v8, "Cannot serialize close."

    const-string v7, "Cannot serialize close -- should not happen!"

    const-string v6, "Smack/Packet"

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-boolean v5, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    .line 70
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    .line 71
    iput-boolean v5, p0, Lorg/jivesoftware/smack/PacketWriter;->listenersDeleted:Z

    .line 78
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/jivesoftware/smack/PacketWriter;->lastActive:J

    .line 85
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    .line 89
    iput-boolean v5, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptorDeleted:Z

    .line 97
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 98
    iget-object v3, p1, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/OutputStream;

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    .line 99
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    .line 101
    iget-boolean v3, p1, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    if-eqz v3, :cond_0

    .line 102
    new-instance v3, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializerImpl;

    new-instance v4, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;

    invoke-direct {v4}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;-><init>()V

    invoke-direct {v3, v4}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializerImpl;-><init>(Lcom/google/android/gtalkservice/proto/ProtoBufStreamConfiguration;)V

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    .line 104
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    new-instance v4, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v5, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_PING:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v4, v5}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    invoke-interface {v3, v4}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;->serialize(Lcom/google/common/io/protocol/ProtoBuf;)[B

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->heartbeatPingBytes:[B
    :try_end_0
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 114
    :try_start_1
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    new-instance v4, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v5, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_ACK:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v4, v5}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    invoke-interface {v3, v4}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;->serialize(Lcom/google/common/io/protocol/ProtoBuf;)[B

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->heartbeatAckBytes:[B
    :try_end_1
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 124
    :try_start_2
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    new-instance v4, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v5, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->CLOSE:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v4, v5}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    invoke-interface {v3, v4}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;->serialize(Lcom/google/common/io/protocol/ProtoBuf;)[B

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->closeBytes:[B
    :try_end_2
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5

    .line 156
    :goto_0
    new-instance v3, Lorg/jivesoftware/smack/PacketWriter$1;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smack/PacketWriter$1;-><init>(Lorg/jivesoftware/smack/PacketWriter;)V

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writerThread:Ljava/lang/Thread;

    .line 162
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writerThread:Ljava/lang/Thread;

    const-string v4, "Smack Packet Writer"

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 163
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writerThread:Ljava/lang/Thread;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 164
    return-void

    .line 106
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 107
    .local v1, "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    const-string v3, "Smack/Packet"

    const-string v3, "Cannot serialize heartbeat ping -- should not happen!"

    invoke-static {v6, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 108
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot serialize heartbeat ping."

    invoke-direct {v3, v4, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 109
    .end local v1    # "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    :catch_1
    move-exception v3

    move-object v0, v3

    .line 110
    .local v0, "ioe":Ljava/io/IOException;
    const-string v3, "Smack/Packet"

    const-string v3, "Cannot serialize heartbeat -- should not happen!"

    invoke-static {v6, v9, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 111
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot serialize heartbeat ping."

    invoke-direct {v3, v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 116
    .end local v0    # "ioe":Ljava/io/IOException;
    :catch_2
    move-exception v3

    move-object v1, v3

    .line 117
    .restart local v1    # "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    const-string v3, "Smack/Packet"

    const-string v3, "Cannot serialize heartbeat ack -- should not happen!"

    invoke-static {v6, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 118
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot serialize heartbeat ack."

    invoke-direct {v3, v4, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 119
    .end local v1    # "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    :catch_3
    move-exception v3

    move-object v0, v3

    .line 120
    .restart local v0    # "ioe":Ljava/io/IOException;
    const-string v3, "Smack/Packet"

    const-string v3, "Cannot serialize heartbeat -- should not happen!"

    invoke-static {v6, v9, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 121
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot serialize heartbeat ack."

    invoke-direct {v3, v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 126
    .end local v0    # "ioe":Ljava/io/IOException;
    :catch_4
    move-exception v3

    move-object v1, v3

    .line 127
    .restart local v1    # "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    const-string v3, "Smack/Packet"

    const-string v3, "Cannot serialize close -- should not happen!"

    invoke-static {v6, v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 128
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot serialize close."

    invoke-direct {v3, v8, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 129
    .end local v1    # "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    :catch_5
    move-exception v3

    move-object v0, v3

    .line 130
    .restart local v0    # "ioe":Ljava/io/IOException;
    const-string v3, "Smack/Packet"

    const-string v3, "Cannot serialize close -- should not happen!"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot serialize close."

    invoke-direct {v3, v8, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 135
    .end local v0    # "ioe":Ljava/io/IOException;
    :cond_0
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    .line 141
    :try_start_3
    const-string v3, "<iq type=\'set\' id=\'ping\'><ping/></iq>"

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->heartbeatPingBytes:[B

    .line 142
    const-string v3, "<iq type=\'set\' id=\'ack\'><ack/></iq>"

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->heartbeatAckBytes:[B
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_7

    .line 149
    :try_start_4
    const-string v3, "</stream:stream>"

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->closeBytes:[B
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_6

    goto/16 :goto_0

    .line 150
    :catch_6
    move-exception v3

    move-object v2, v3

    .line 151
    .local v2, "uee":Ljava/io/UnsupportedEncodingException;
    const-string v3, "Smack/Packet"

    const-string v3, "Cannot serialize close -- should not happen!"

    invoke-static {v6, v7, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 152
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot serialize close."

    invoke-direct {v3, v8, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 144
    .end local v2    # "uee":Ljava/io/UnsupportedEncodingException;
    :catch_7
    move-exception v3

    move-object v2, v3

    .line 145
    .restart local v2    # "uee":Ljava/io/UnsupportedEncodingException;
    const-string v3, "Smack/Packet"

    const-string v3, "Cannot serialize heartbeat -- should not happen!"

    invoke-static {v6, v9, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 146
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot serialize heartbeat."

    invoke-direct {v3, v4, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/PacketWriter;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketWriter;

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketWriter;->writePackets()V

    return-void
.end method

.method static synthetic access$300(Lorg/jivesoftware/smack/PacketWriter;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketWriter;

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    return v0
.end method

.method private nextPacket()Lorg/jivesoftware/smack/packet/Packet;
    .locals 4

    .prologue
    .line 392
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    monitor-enter v0

    .line 393
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 395
    :try_start_1
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 397
    :catch_0
    move-exception v1

    goto :goto_0

    .line 401
    :cond_0
    :try_start_2
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 402
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/PacketWriter;
    check-cast p0, Lorg/jivesoftware/smack/packet/Packet;

    monitor-exit v0

    move-object v0, p0

    .line 405
    :goto_1
    return-object v0

    .restart local p0    # "this":Lorg/jivesoftware/smack/PacketWriter;
    :cond_1
    const/4 v1, 0x0

    monitor-exit v0

    move-object v0, v1

    goto :goto_1

    .line 407
    .end local p0    # "this":Lorg/jivesoftware/smack/PacketWriter;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private processInterceptors(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 6
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 506
    if-eqz p1, :cond_4

    .line 510
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    monitor-enter v3

    .line 511
    :try_start_0
    iget-boolean v4, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptorDeleted:Z

    if-eqz v4, :cond_2

    .line 512
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int v0, v4, v5

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 513
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_0

    .line 514
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 512
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 517
    :cond_1
    const/4 v4, 0x0

    iput-boolean v4, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptorDeleted:Z

    .line 519
    .end local v0    # "i":I
    :cond_2
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 521
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 522
    .local v2, "size":I
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    if-ge v0, v2, :cond_4

    .line 523
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;

    .line 524
    .local v1, "interceptorWrapper":Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;
    if-eqz v1, :cond_3

    .line 525
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->notifyListener(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 522
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 519
    .end local v0    # "i":I
    .end local v1    # "interceptorWrapper":Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;
    .end local v2    # "size":I
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 529
    :cond_4
    return-void
.end method

.method private processListeners(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 6
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 477
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    monitor-enter v3

    .line 478
    :try_start_0
    iget-boolean v4, p0, Lorg/jivesoftware/smack/PacketWriter;->listenersDeleted:Z

    if-eqz v4, :cond_2

    .line 479
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int v0, v4, v5

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 480
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_0

    .line 481
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 479
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 484
    :cond_1
    const/4 v4, 0x0

    iput-boolean v4, p0, Lorg/jivesoftware/smack/PacketWriter;->listenersDeleted:Z

    .line 486
    .end local v0    # "i":I
    :cond_2
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 488
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 489
    .local v2, "size":I
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    if-ge v0, v2, :cond_4

    .line 490
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;

    .line 491
    .local v1, "listenerWrapper":Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;
    if-eqz v1, :cond_3

    .line 492
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->notifyListener(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 489
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 486
    .end local v0    # "i":I
    .end local v1    # "listenerWrapper":Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;
    .end local v2    # "size":I
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 495
    .restart local v0    # "i":I
    .restart local v2    # "size":I
    :cond_4
    return-void
.end method

.method private writePackets()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const-string v5, "Smack/Packet"

    .line 413
    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 415
    :cond_0
    :goto_0
    iget-boolean v5, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    if-nez v5, :cond_6

    .line 416
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketWriter;->nextPacket()Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    .line 417
    .local v2, "packet":Lorg/jivesoftware/smack/packet/Packet;
    if-eqz v2, :cond_0

    .line 419
    const-string v5, "Smack/Packet"

    const/4 v6, 0x3

    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 420
    const-string v5, "Smack/Packet"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[WRITE] "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->toLogString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    :cond_1
    const/4 v0, 0x0

    .line 425
    .local v0, "bytes":[B
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-boolean v5, v5, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    if-eqz v5, :cond_5

    .line 426
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/XMPPConnection;->getRmq2Manager()Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    move-result-object v4

    .line 427
    .local v4, "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    if-eqz v4, :cond_2

    .line 428
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketWriter;->serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    invoke-virtual {v4, v5, v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->serializePacketAsProtoBuf(Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;Lorg/jivesoftware/smack/packet/Packet;)[B

    move-result-object v0

    .line 434
    :cond_2
    if-nez v0, :cond_3

    .line 435
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketWriter;->serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    invoke-virtual {v2, v5}, Lorg/jivesoftware/smack/packet/Packet;->serializeAsProtoBuf(Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;)[B

    move-result-object v0

    .line 441
    .end local v4    # "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    :cond_3
    :goto_1
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    monitor-enter v5
    :try_end_0
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 442
    :try_start_1
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v6, v0}, Ljava/io/OutputStream;->write([B)V

    .line 443
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v6}, Ljava/io/OutputStream;->flush()V

    .line 444
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iput-wide v6, p0, Lorg/jivesoftware/smack/PacketWriter;->lastActive:J

    .line 445
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPConnection;->markPacketTransmission()V

    .line 446
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 448
    :try_start_2
    array-length v5, v0

    int-to-long v5, v5

    const/4 v7, 0x0

    invoke-static {v2, v5, v6, v7}, Lcom/google/android/gtalkservice/usagegauge/UsageGauge;->update(Lorg/jivesoftware/smack/packet/Packet;JZ)V
    :try_end_2
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 453
    .end local v0    # "bytes":[B
    .end local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :catch_0
    move-exception v5

    move-object v3, v5

    .line 455
    .local v3, "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    iget-boolean v5, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    if-nez v5, :cond_4

    .line 456
    iput-boolean v8, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    .line 458
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v5, v5, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v5, v3}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    .line 467
    .end local v3    # "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    :cond_4
    :goto_2
    return-void

    .line 438
    .restart local v0    # "bytes":[B
    .restart local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :cond_5
    :try_start_3
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->serializeAsXml()[B
    :try_end_3
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v0

    goto :goto_1

    .line 446
    :catchall_0
    move-exception v6

    :try_start_4
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v6
    :try_end_5
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 461
    .end local v0    # "bytes":[B
    .end local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :catch_1
    move-exception v5

    move-object v1, v5

    .line 462
    .local v1, "ioe":Ljava/io/IOException;
    iget-boolean v5, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    if-nez v5, :cond_4

    .line 463
    iput-boolean v8, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    .line 464
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v5, v5, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v5, v1}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_2

    .line 451
    .end local v1    # "ioe":Ljava/io/IOException;
    :cond_6
    :try_start_6
    invoke-virtual {p0}, Lorg/jivesoftware/smack/PacketWriter;->closeStream()V
    :try_end_6
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_2
.end method


# virtual methods
.method public addPacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 3
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 325
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    monitor-enter v0

    .line 326
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    new-instance v2, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;

    invoke-direct {v2, p1, p2}, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;-><init>(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    monitor-exit v0

    .line 328
    return-void

    .line 327
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 3
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 280
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    monitor-enter v0

    .line 281
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    new-instance v2, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;

    invoke-direct {v2, p1, p2}, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;-><init>(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 282
    monitor-exit v0

    .line 283
    return-void

    .line 282
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method closeStream()V
    .locals 3

    .prologue
    .line 578
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 579
    :try_start_1
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->closeBytes:[B

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 580
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 581
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 587
    :try_start_2
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 593
    :goto_0
    return-void

    .line 581
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 583
    :catch_0
    move-exception v0

    .line 587
    :try_start_5
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_0

    .line 589
    :catch_1
    move-exception v0

    goto :goto_0

    .line 586
    :catchall_1
    move-exception v0

    .line 587
    :try_start_6
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 591
    :goto_1
    throw v0

    .line 589
    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v0

    goto :goto_0
.end method

.method dump(Ljava/io/PrintWriter;)V
    .locals 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 745
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    monitor-enter v0

    .line 746
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queue size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 747
    monitor-exit v0

    .line 748
    return-void

    .line 747
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getLastActive()J
    .locals 2

    .prologue
    .line 637
    iget-wide v0, p0, Lorg/jivesoftware/smack/PacketWriter;->lastActive:J

    return-wide v0
.end method

.method public getPacketListenerCount()I
    .locals 2

    .prologue
    .line 310
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    monitor-enter v0

    .line 311
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    monitor-exit v0

    return v1

    .line 312
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public maybeSendHeartbeat(I)V
    .locals 12
    .param p1, "delay"    # I

    .prologue
    const-string v11, "Unable to write heartbeat:"

    const-string v10, "Smack/Packet"

    .line 204
    if-lez p1, :cond_0

    .line 205
    iget-wide v6, p0, Lorg/jivesoftware/smack/PacketWriter;->lastActive:J

    iget-object v8, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v8}, Lorg/jivesoftware/smack/XMPPConnection;->getLastActivityFromServerTime()J

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 206
    .local v1, "last":J
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v6, v1

    int-to-long v8, p1

    cmp-long v6, v6, v8

    if-gez v6, :cond_0

    .line 238
    .end local v1    # "last":J
    :goto_0
    return-void

    .line 211
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iput-wide v6, p0, Lorg/jivesoftware/smack/PacketWriter;->lastActive:J

    .line 212
    const-string v6, "Smack/Packet"

    const/4 v6, 0x3

    invoke-static {v10, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 213
    const-string v6, "Smack/Packet"

    const-string v6, "PacketWriter sending heartbeat"

    invoke-static {v10, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    :cond_1
    :try_start_0
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPConnection;->getRmq2Manager()Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    move-result-object v5

    .line 220
    .local v5, "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    if-eqz v5, :cond_2

    .line 221
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketWriter;->serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    new-instance v7, Lorg/jivesoftware/smack/packet/HeartbeatPing;

    invoke-direct {v7}, Lorg/jivesoftware/smack/packet/HeartbeatPing;-><init>()V

    invoke-virtual {v5, v6, v7}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->serializePacketAsProtoBuf(Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;Lorg/jivesoftware/smack/packet/Packet;)[B

    move-result-object v4

    .line 226
    .local v4, "pingBytes":[B
    :goto_1
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    monitor-enter v6
    :try_end_0
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 227
    :try_start_1
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v7, v4}, Ljava/io/OutputStream;->write([B)V

    .line 228
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v7}, Ljava/io/OutputStream;->flush()V

    .line 229
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 230
    :try_start_2
    array-length v6, v4

    int-to-long v6, v6

    const/4 v8, 0x0

    invoke-static {v6, v7, v8}, Lcom/google/android/gtalkservice/usagegauge/UsageGauge;->updateHeartbeat(JZ)V
    :try_end_2
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 231
    .end local v4    # "pingBytes":[B
    .end local v5    # "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    :catch_0
    move-exception v6

    move-object v3, v6

    .line 232
    .local v3, "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    const-string v6, "Smack/Packet"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to write heartbeat:"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v10, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v6, v6, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v6, v3}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 223
    .end local v3    # "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    .restart local v5    # "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    :cond_2
    :try_start_3
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->heartbeatPingBytes:[B
    :try_end_3
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .restart local v4    # "pingBytes":[B
    goto :goto_1

    .line 229
    :catchall_0
    move-exception v7

    :try_start_4
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v7
    :try_end_5
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 234
    .end local v4    # "pingBytes":[B
    .end local v5    # "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    :catch_1
    move-exception v6

    move-object v0, v6

    .line 235
    .local v0, "e":Ljava/io/IOException;
    const-string v6, "Smack/Packet"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to write heartbeat:"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v10, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v6, v6, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v6, v0}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto/16 :goto_0
.end method

.method openStream()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-string v4, "Smack/Packet"

    .line 539
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-boolean v2, v2, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    if-eqz v2, :cond_0

    .line 544
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    monitor-enter v2

    .line 545
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write(I)V

    .line 546
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 547
    monitor-exit v2

    .line 573
    :goto_0
    return-void

    .line 547
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 550
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 551
    .local v1, "stream":Ljava/lang/StringBuffer;
    const-string v2, "<stream:stream"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 552
    const-string v2, " to=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v3, v3, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 553
    const-string v2, " xmlns=\"jabber:client\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 554
    const-string v2, " xmlns:stream=\"http://etherx.jabber.org/streams\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 555
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    instance-of v2, v2, Lorg/jivesoftware/smack/SSLXMPPConnection;

    if-eqz v2, :cond_2

    .line 557
    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 563
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 565
    .local v0, "openStreamStr":Ljava/lang/String;
    const-string v2, "Smack/Packet"

    const/4 v2, 0x3

    invoke-static {v4, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 566
    const-string v2, "Smack/Packet"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[WRITE] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    :cond_1
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/PacketWriter;->write(Ljava/lang/String;)V

    .line 570
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    monitor-enter v2

    .line 571
    :try_start_1
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 572
    monitor-exit v2

    goto :goto_0

    :catchall_1
    move-exception v3

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v3

    .line 560
    .end local v0    # "openStreamStr":Ljava/lang/String;
    :cond_2
    const-string v2, " version=\"1.0\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method public removePacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V
    .locals 5
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;

    .prologue
    .line 336
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    monitor-enter v2

    .line 337
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 338
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;

    .line 339
    .local v1, "wrapper":Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;
    if-eqz v1, :cond_0

    invoke-static {v1}, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->access$200(Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;)Lorg/jivesoftware/smack/PacketInterceptor;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 340
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptors:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v3, v0, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 343
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/jivesoftware/smack/PacketWriter;->interceptorDeleted:Z

    .line 337
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 346
    .end local v1    # "wrapper":Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;
    :cond_1
    monitor-exit v2

    .line 347
    return-void

    .line 346
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 5
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 291
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    monitor-enter v2

    .line 292
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 293
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;

    .line 294
    .local v1, "wrapper":Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;
    if-eqz v1, :cond_0

    invoke-static {v1}, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->access$100(Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;)Lorg/jivesoftware/smack/PacketListener;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 295
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->listeners:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v3, v0, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 298
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/jivesoftware/smack/PacketWriter;->listenersDeleted:Z

    .line 292
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 301
    .end local v1    # "wrapper":Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;
    :cond_1
    monitor-exit v2

    .line 302
    return-void

    .line 301
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method requestStreamCompression()V
    .locals 3

    .prologue
    .line 601
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-boolean v1, v1, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    if-eqz v1, :cond_0

    .line 615
    :goto_0
    return-void

    .line 606
    :cond_0
    :try_start_0
    const-string v1, "<compress xmlns=\'http://jabber.org/protocol/compress\'>"

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/PacketWriter;->write(Ljava/lang/String;)V

    .line 607
    const-string v1, "<method>zlib</method></compress>"

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/PacketWriter;->write(Ljava/lang/String;)V

    .line 608
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    monitor-enter v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 609
    :try_start_1
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 610
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 612
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 613
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v1, v1, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public sendHeartbeatAck()V
    .locals 9

    .prologue
    const-string v8, "Unable to write heartbeat ack:"

    const-string v7, "Smack/Packet"

    .line 247
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getRmq2Manager()Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    move-result-object v3

    .line 248
    .local v3, "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    if-eqz v3, :cond_0

    .line 249
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->serializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    new-instance v5, Lorg/jivesoftware/smack/packet/HeartbeatAck;

    invoke-direct {v5}, Lorg/jivesoftware/smack/packet/HeartbeatAck;-><init>()V

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->serializePacketAsProtoBuf(Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;Lorg/jivesoftware/smack/packet/Packet;)[B

    move-result-object v0

    .line 253
    .local v0, "ackBytes":[B
    :goto_0
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    monitor-enter v4
    :try_end_0
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 254
    :try_start_1
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v5, v0}, Ljava/io/OutputStream;->write([B)V

    .line 255
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V

    .line 256
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 257
    :try_start_2
    array-length v4, v0

    int-to-long v4, v4

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Lcom/google/android/gtalkservice/usagegauge/UsageGauge;->updateHeartbeat(JZ)V

    .line 265
    .end local v0    # "ackBytes":[B
    .end local v3    # "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    :goto_1
    return-void

    .line 251
    .restart local v3    # "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->heartbeatAckBytes:[B
    :try_end_2
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .restart local v0    # "ackBytes":[B
    goto :goto_0

    .line 256
    :catchall_0
    move-exception v5

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v5
    :try_end_4
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 258
    .end local v0    # "ackBytes":[B
    .end local v3    # "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    :catch_0
    move-exception v4

    move-object v2, v4

    .line 259
    .local v2, "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    const-string v4, "Smack/Packet"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to write heartbeat ack:"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v4, v4, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_1

    .line 261
    .end local v2    # "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    :catch_1
    move-exception v4

    move-object v1, v4

    .line 262
    .local v1, "e":Ljava/io/IOException;
    const-string v4, "Smack/Packet"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to write heartbeat ack:"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v4, v4, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_1
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 172
    iget-boolean v0, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    if-nez v0, :cond_0

    .line 175
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketWriter;->processInterceptors(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 177
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    monitor-enter v0

    .line 178
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 179
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 180
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketWriter;->processListeners(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 186
    :cond_0
    return-void

    .line 180
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method sendStartTLS()V
    .locals 3

    .prologue
    .line 618
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-boolean v1, v1, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    if-eqz v1, :cond_0

    .line 631
    :goto_0
    return-void

    .line 623
    :cond_0
    :try_start_0
    const-string v1, "<starttls xmlns=\"urn:ietf:params:xml:ns:xmpp-tls\"/>"

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/PacketWriter;->write(Ljava/lang/String;)V

    .line 624
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    monitor-enter v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 625
    :try_start_1
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 626
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 628
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 629
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v1, v1, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method setOutputStream(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 375
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    .line 376
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 383
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    .line 384
    return-void
.end method

.method startKeepAliveProcess()V
    .locals 3

    .prologue
    .line 366
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getKeepAliveInterval()I

    move-result v0

    .line 367
    .local v0, "keepAliveInterval":I
    if-lez v0, :cond_0

    .line 368
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;

    invoke-direct {v2, p0, v0}, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;-><init>(Lorg/jivesoftware/smack/PacketWriter;I)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 369
    .local v1, "keepAliveThread":Ljava/lang/Thread;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 370
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 372
    .end local v1    # "keepAliveThread":Ljava/lang/Thread;
    :cond_0
    return-void
.end method

.method public startup()V
    .locals 1

    .prologue
    .line 355
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 356
    return-void
.end method

.method write(Ljava/lang/String;)V
    .locals 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 191
    .local v0, "utfBytes":[B
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    monitor-enter v1

    .line 192
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/OutputStream;

    invoke-virtual {v2, v0}, Ljava/io/OutputStream;->write([B)V

    .line 193
    monitor-exit v1

    .line 194
    return-void

    .line 193
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
