.class public abstract Lorg/jivesoftware/smack/packet/Packet;
.super Ljava/lang/Object;
.source "Packet.java"


# static fields
.field public static final ID_NOT_AVAILABLE:Ljava/lang/String; = "ID_NOT_AVAILABLE"

.field public static final INVALID_RMQ_ID:J = -0x1L

.field public static final INVALID_STREAM_ID:I = -0x1

.field private static final LOG_TAG:Ljava/lang/String; = "Smack"

.field public static final RMQ_ID_NAME:Ljava/lang/String; = "stanza-id"

.field private static id:J

.field private static prefix:Ljava/lang/String;


# instance fields
.field private error:Lorg/jivesoftware/smack/packet/XMPPError;

.field private from:Ljava/lang/String;

.field private lastStreamId:I

.field private packetExtensions:Ljava/util/List;

.field private packetID:Ljava/lang/String;

.field private properties:Ljava/util/Map;

.field private rmq2Id:Ljava/lang/String;

.field private rmqId:J

.field private streamId:I

.field private to:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x7

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->randomString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/packet/Packet;->prefix:Ljava/lang/String;

    .line 76
    const-wide/16 v0, 0x0

    sput-wide v0, Lorg/jivesoftware/smack/packet/Packet;->id:J

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    .line 89
    iput-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    .line 90
    iput-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    .line 91
    iput-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    .line 92
    iput-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    .line 93
    iput-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 96
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/jivesoftware/smack/packet/Packet;->rmqId:J

    .line 99
    iput-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->rmq2Id:Ljava/lang/String;

    .line 102
    iput v3, p0, Lorg/jivesoftware/smack/packet/Packet;->lastStreamId:I

    .line 105
    iput v3, p0, Lorg/jivesoftware/smack/packet/Packet;->streamId:I

    return-void
.end method

.method private static declared-synchronized nextID()Ljava/lang/String;
    .locals 6

    .prologue
    .line 85
    const-class v0, Lorg/jivesoftware/smack/packet/Packet;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lorg/jivesoftware/smack/packet/Packet;->prefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-wide v2, Lorg/jivesoftware/smack/packet/Packet;->id:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    sput-wide v4, Lorg/jivesoftware/smack/packet/Packet;->id:J

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
.method public declared-synchronized addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V
    .locals 1
    .param p1, "extension"    # Lorg/jivesoftware/smack/packet/PacketExtension;

    .prologue
    .line 296
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    if-nez v0, :cond_0

    .line 297
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    .line 299
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 300
    monitor-exit p0

    return-void

    .line 296
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized addExtensionsToProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V
    .locals 4
    .param p1, "field"    # I
    .param p2, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;

    .prologue
    .line 555
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Packet;->getExtensions()Ljava/util/Iterator;

    move-result-object v2

    .line 556
    .local v2, "extensions":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 557
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 558
    .local v1, "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-interface {v1}, Lorg/jivesoftware/smack/packet/PacketExtension;->toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v0

    .line 559
    .local v0, "extPB":Lcom/google/common/io/protocol/ProtoBuf;
    if-eqz v0, :cond_0

    .line 560
    invoke-virtual {p2, p1, v0}, Lcom/google/common/io/protocol/ProtoBuf;->addProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 555
    .end local v0    # "extPB":Lcom/google/common/io/protocol/ProtoBuf;
    .end local v1    # "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    .end local v2    # "extensions":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 563
    .restart local v2    # "extensions":Ljava/util/Iterator;
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized deleteProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 402
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 406
    :goto_0
    monitor-exit p0

    return-void

    .line 405
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 402
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getError()Lorg/jivesoftware/smack/packet/XMPPError;
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    return-object v0
.end method

.method public declared-synchronized getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 4
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 278
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    move-object v2, v3

    .line 287
    :goto_0
    monitor-exit p0

    return-object v2

    .line 281
    :cond_1
    :try_start_1
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 282
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 283
    .local v0, "ext":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-interface {v0}, Lorg/jivesoftware/smack/packet/PacketExtension;->getElementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Lorg/jivesoftware/smack/packet/PacketExtension;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-eqz v2, :cond_2

    move-object v2, v0

    .line 284
    goto :goto_0

    .end local v0    # "ext":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_3
    move-object v2, v3

    .line 287
    goto :goto_0

    .line 278
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getExtensions()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 257
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    if-nez v0, :cond_0

    .line 258
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 260
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 257
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized getExtensionsXML()Ljava/lang/String;
    .locals 8

    .prologue
    const-string v6, "</value>"

    .line 481
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 483
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Packet;->getExtensions()Ljava/util/Iterator;

    move-result-object v2

    .line 484
    .local v2, "extensions":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 485
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 486
    .local v1, "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-interface {v1}, Lorg/jivesoftware/smack/packet/PacketExtension;->toXML()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 481
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v1    # "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    .end local v2    # "extensions":Ljava/util/Iterator;
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 489
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v2    # "extensions":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    iget-object v6, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    if-eqz v6, :cond_8

    iget-object v6, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_8

    .line 490
    const-string v6, "<properties xmlns=\"http://www.jivesoftware.com/xmlns/xmpp/properties\">"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 492
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Packet;->getPropertyNames()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 493
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 494
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lorg/jivesoftware/smack/packet/Packet;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 495
    .local v5, "value":Ljava/lang/Object;
    const-string v6, "<property>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 496
    const-string v6, "<name>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-static {v4}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "</name>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 497
    const-string v6, "<value type=\""

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 498
    instance-of v6, v5, Ljava/lang/Integer;

    if-eqz v6, :cond_2

    .line 499
    const-string v6, "integer\">"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "</value>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 546
    .end local v5    # "value":Ljava/lang/Object;
    :cond_1
    :goto_2
    const-string v6, "</property>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 501
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_2
    instance-of v6, v5, Ljava/lang/Long;

    if-eqz v6, :cond_3

    .line 502
    const-string v6, "long\">"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "</value>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 504
    :cond_3
    instance-of v6, v5, Ljava/lang/Float;

    if-eqz v6, :cond_4

    .line 505
    const-string v6, "float\">"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "</value>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 507
    :cond_4
    instance-of v6, v5, Ljava/lang/Double;

    if-eqz v6, :cond_5

    .line 508
    const-string v6, "double\">"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "</value>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 510
    :cond_5
    instance-of v6, v5, Ljava/lang/Boolean;

    if-eqz v6, :cond_6

    .line 511
    const-string v6, "boolean\">"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "</value>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 513
    :cond_6
    instance-of v6, v5, Ljava/lang/String;

    if-eqz v6, :cond_1

    .line 514
    const-string v6, "string\">"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 515
    check-cast v5, Ljava/lang/String;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-static {v5}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 516
    const-string v6, "</value>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 548
    .end local v4    # "name":Ljava/lang/String;
    :cond_7
    const-string v6, "</properties>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 550
    .end local v3    # "i":Ljava/util/Iterator;
    :cond_8
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v6

    monitor-exit p0

    return-object v6
.end method

.method public getFrom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    return-object v0
.end method

.method public getLastStreamId()I
    .locals 1

    .prologue
    .line 161
    iget v0, p0, Lorg/jivesoftware/smack/packet/Packet;->lastStreamId:I

    return v0
.end method

.method public getPacketID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 114
    const-string v0, "ID_NOT_AVAILABLE"

    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    const/4 v0, 0x0

    .line 121
    :goto_0
    return-object v0

    .line 118
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 119
    invoke-static {}, Lorg/jivesoftware/smack/packet/Packet;->nextID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    .line 121
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    goto :goto_0
.end method

.method public declared-synchronized getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 323
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 324
    const/4 v0, 0x0

    .line 326
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 323
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPropertyNames()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 414
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 415
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 417
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 414
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getRmq2Id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->rmq2Id:Ljava/lang/String;

    return-object v0
.end method

.method public getRmqId()J
    .locals 2

    .prologue
    .line 135
    iget-wide v0, p0, Lorg/jivesoftware/smack/packet/Packet;->rmqId:J

    return-wide v0
.end method

.method public getStreamId()I
    .locals 1

    .prologue
    .line 176
    iget v0, p0, Lorg/jivesoftware/smack/packet/Packet;->streamId:I

    return v0
.end method

.method public getTo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    return-object v0
.end method

.method protected redactString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "orig"    # Ljava/lang/String;

    .prologue
    .line 430
    if-nez p1, :cond_0

    .line 431
    const/4 v0, 0x0

    .line 433
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[REDACT("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public declared-synchronized removeExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V
    .locals 1
    .param p1, "extension"    # Lorg/jivesoftware/smack/packet/PacketExtension;

    .prologue
    .line 308
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 309
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->packetExtensions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 311
    :cond_0
    monitor-exit p0

    return-void

    .line 308
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public serializeAsProtoBuf(Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;)[B
    .locals 2
    .param p1, "serializer"    # Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 459
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Packet;->toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v0

    .line 460
    .local v0, "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-interface {p1, v0}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;->serialize(Lcom/google/common/io/protocol/ProtoBuf;)[B

    move-result-object v1

    return-object v1
.end method

.method public serializeAsXml()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 470
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public setError(Lorg/jivesoftware/smack/packet/XMPPError;)V
    .locals 0
    .param p1, "error"    # Lorg/jivesoftware/smack/packet/XMPPError;

    .prologue
    .line 248
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Packet;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 249
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 229
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Packet;->from:Ljava/lang/String;

    .line 230
    return-void
.end method

.method public setLastStreamId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 169
    iput p1, p0, Lorg/jivesoftware/smack/packet/Packet;->lastStreamId:I

    .line 170
    return-void
.end method

.method public setPacketID(Ljava/lang/String;)V
    .locals 0
    .param p1, "packetID"    # Ljava/lang/String;

    .prologue
    .line 131
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Packet;->packetID:Ljava/lang/String;

    .line 132
    return-void
.end method

.method public setProperty(Ljava/lang/String;D)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 366
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p2, p3}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smack/packet/Packet;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 367
    return-void
.end method

.method public setProperty(Ljava/lang/String;F)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # F

    .prologue
    .line 356
    new-instance v0, Ljava/lang/Float;

    invoke-direct {v0, p2}, Ljava/lang/Float;-><init>(F)V

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smack/packet/Packet;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 357
    return-void
.end method

.method public setProperty(Ljava/lang/String;I)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 336
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smack/packet/Packet;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 337
    return-void
.end method

.method public setProperty(Ljava/lang/String;J)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    .line 346
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p2, p3}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smack/packet/Packet;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 347
    return-void
.end method

.method public declared-synchronized setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 387
    monitor-enter p0

    :try_start_0
    instance-of v0, p2, Ljava/io/Serializable;

    if-nez v0, :cond_0

    .line 388
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Value must be serialiazble"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 387
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 390
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 391
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    .line 393
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Packet;->properties:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 394
    monitor-exit p0

    return-void
.end method

.method public setProperty(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 376
    new-instance v0, Ljava/lang/Boolean;

    invoke-direct {v0, p2}, Ljava/lang/Boolean;-><init>(Z)V

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smack/packet/Packet;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 377
    return-void
.end method

.method public setRmq2Id(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 154
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Packet;->rmq2Id:Ljava/lang/String;

    .line 155
    return-void
.end method

.method public setRmqId(J)V
    .locals 0
    .param p1, "id"    # J

    .prologue
    .line 139
    iput-wide p1, p0, Lorg/jivesoftware/smack/packet/Packet;->rmqId:J

    .line 140
    return-void
.end method

.method public setStreamId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 184
    iput p1, p0, Lorg/jivesoftware/smack/packet/Packet;->streamId:I

    .line 185
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 206
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Packet;->to:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public toLogString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 443
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
.end method

.method public abstract toXML()Ljava/lang/String;
.end method
