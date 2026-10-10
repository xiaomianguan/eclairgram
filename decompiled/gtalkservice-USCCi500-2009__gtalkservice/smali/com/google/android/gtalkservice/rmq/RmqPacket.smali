.class public Lcom/google/android/gtalkservice/rmq/RmqPacket;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "RmqPacket.java"


# instance fields
.field final mData:[B

.field mOriginalPacket:Lorg/jivesoftware/smack/packet/Packet;

.field final mProtobufTag:B


# direct methods
.method public constructor <init>(JB[B)V
    .locals 1
    .param p1, "rmqId"    # J
    .param p3, "tag"    # B
    .param p4, "data"    # [B

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 57
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gtalkservice/rmq/RmqPacket;->setRmqId(J)V

    .line 58
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/rmq/RmqPacket;->setRmq2Id(Ljava/lang/String;)V

    .line 60
    iput-byte p3, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mProtobufTag:B

    .line 61
    iput-object p4, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mData:[B

    .line 62
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/packet/Packet;JB[B)V
    .locals 0
    .param p1, "originalPacket"    # Lorg/jivesoftware/smack/packet/Packet;
    .param p2, "rmqId"    # J
    .param p4, "tag"    # B
    .param p5, "data"    # [B

    .prologue
    .line 51
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/google/android/gtalkservice/rmq/RmqPacket;-><init>(JB[B)V

    .line 52
    iput-object p1, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mOriginalPacket:Lorg/jivesoftware/smack/packet/Packet;

    .line 53
    return-void
.end method


# virtual methods
.method getData()[B
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mData:[B

    return-object v0
.end method

.method public getOriginalPacket()Lorg/jivesoftware/smack/packet/Packet;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mOriginalPacket:Lorg/jivesoftware/smack/packet/Packet;

    return-object v0
.end method

.method public getProtoBufTag()B
    .locals 1

    .prologue
    .line 65
    iget-byte v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mProtobufTag:B

    return v0
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
    .line 119
    iget-byte v1, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mProtobufTag:B

    if-nez v1, :cond_0

    .line 120
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mData:[B

    .line 128
    :goto_0
    return-object v1

    .line 123
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/rmq/RmqPacket;->toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v0

    .line 124
    .local v0, "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    if-nez v0, :cond_1

    .line 125
    const/4 v1, 0x0

    goto :goto_0

    .line 128
    :cond_1
    invoke-interface {p1, v0}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;->serialize(Lcom/google/common/io/protocol/ProtoBuf;)[B

    move-result-object v1

    goto :goto_0
.end method

.method public serializeAsXml()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 133
    const/4 v0, 0x0

    return-object v0
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 94
    iget-byte v5, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mProtobufTag:B

    if-nez v5, :cond_0

    move-object v5, v8

    .line 111
    :goto_0
    return-object v5

    .line 99
    :cond_0
    new-instance v0, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;-><init>()V

    .line 100
    .local v0, "config":Lcom/google/android/gtalkservice/proto/ProtoBufStreamConfiguration;
    iget-byte v5, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mProtobufTag:B

    invoke-interface {v0, v5}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamConfiguration;->getProtoBuf(B)Lcom/google/common/io/protocol/ProtoBufType;

    move-result-object v4

    .line 102
    .local v4, "type":Lcom/google/common/io/protocol/ProtoBufType;
    new-instance v3, Lcom/google/common/io/protocol/ProtoBuf;

    invoke-direct {v3, v4}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 103
    .local v3, "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    new-instance v1, Ljava/io/ByteArrayInputStream;

    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mData:[B

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mData:[B

    array-length v7, v7

    invoke-direct {v1, v5, v6, v7}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 106
    .local v1, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v3, v1}, Lcom/google/common/io/protocol/ProtoBuf;->parse(Ljava/io/InputStream;)Lcom/google/common/io/protocol/ProtoBuf;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v5, v3

    .line 111
    goto :goto_0

    .line 107
    :catch_0
    move-exception v2

    .local v2, "ioe":Ljava/io/IOException;
    move-object v5, v8

    .line 108
    goto :goto_0
.end method

.method public toXML()Ljava/lang/String;
    .locals 4

    .prologue
    const-string v3, "\" />"

    .line 77
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mOriginalPacket:Lorg/jivesoftware/smack/packet/Packet;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mOriginalPacket:Lorg/jivesoftware/smack/packet/Packet;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v0

    .line 84
    :goto_0
    return-object v0

    .line 81
    :cond_0
    iget-byte v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacket;->mProtobufTag:B

    if-nez v0, :cond_1

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<rmqPacket rmqId=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/rmq/RmqPacket;->getRmqId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\" />"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 84
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<rmqPacket persistentId=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/rmq/RmqPacket;->getRmqId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\" />"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
