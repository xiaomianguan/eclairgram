.class public abstract Lorg/jivesoftware/smack/packet/IQ;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "IQ.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/packet/IQ$Type;
    }
.end annotation


# instance fields
.field private type:Lorg/jivesoftware/smack/packet/IQ$Type;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 51
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    .line 227
    return-void
.end method


# virtual methods
.method public abstract getChildElementXML()Ljava/lang/String;
.end method

.method protected getExtensionProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 4

    .prologue
    .line 206
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getChildElementXML()Ljava/lang/String;

    move-result-object v1

    .line 207
    .local v1, "xml":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 208
    const/4 v2, 0x0

    .line 214
    :goto_0
    return-object v2

    .line 210
    :cond_0
    new-instance v0, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v2, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->EXTENSION:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v0, v2}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 211
    .local v0, "extension":Lcom/google/common/io/protocol/ProtoBuf;
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 213
    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    move-object v2, v0

    .line 214
    goto :goto_0
.end method

.method public getType()Lorg/jivesoftware/smack/packet/IQ$Type;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    return-object v0
.end method

.method public setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V
    .locals 1
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/IQ$Type;

    .prologue
    .line 68
    if-nez p1, :cond_0

    .line 69
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    .line 74
    :goto_0
    return-void

    .line 72
    :cond_0
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    goto :goto_0
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 14

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x1

    const/4 v11, 0x2

    .line 147
    new-instance v4, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v9, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->IQ_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v4, v9}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 149
    .local v4, "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v2

    .line 150
    .local v2, "id":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 151
    invoke-virtual {v4, v13, v2}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 154
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getTo()Ljava/lang/String;

    move-result-object v8

    .line 155
    .local v8, "to":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 156
    const/4 v9, 0x5

    invoke-virtual {v4, v9, v8}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 159
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getFrom()Ljava/lang/String;

    move-result-object v1

    .line 160
    .local v1, "from":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 161
    const/4 v9, 0x4

    invoke-virtual {v4, v9, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 164
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getRmq2Id()Ljava/lang/String;

    move-result-object v5

    .line 165
    .local v5, "rmq2Id":Ljava/lang/String;
    if-eqz v5, :cond_7

    .line 166
    const/16 v9, 0x8

    invoke-virtual {v4, v9, v5}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 174
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getLastStreamId()I

    move-result v3

    .line 175
    .local v3, "lastStreamId":I
    const/4 v9, -0x1

    if-eq v3, v9, :cond_4

    .line 176
    const/16 v9, 0xa

    invoke-virtual {v4, v9, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 179
    :cond_4
    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 180
    const/4 v9, 0x0

    invoke-virtual {v4, v11, v9}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 193
    :cond_5
    :goto_1
    iget-object v9, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    sget-object v10, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v9, v10, :cond_6

    .line 194
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v0

    .line 195
    .local v0, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v0, :cond_6

    .line 196
    const/4 v9, 0x6

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/XMPPError;->toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 201
    .end local v0    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_6
    const/4 v9, 0x7

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getExtensionProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 202
    return-object v4

    .line 168
    .end local v3    # "lastStreamId":I
    :cond_7
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getRmqId()J

    move-result-wide v6

    .line 169
    .local v6, "rmqId":J
    const-wide/16 v9, -0x1

    cmp-long v9, v6, v9

    if-eqz v9, :cond_3

    .line 170
    invoke-virtual {v4, v12, v6, v7}, Lcom/google/common/io/protocol/ProtoBuf;->setLong(IJ)V

    goto :goto_0

    .line 182
    .end local v6    # "rmqId":J
    .restart local v3    # "lastStreamId":I
    :cond_8
    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 183
    invoke-virtual {v4, v11, v12}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto :goto_1

    .line 185
    :cond_9
    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 186
    invoke-virtual {v4, v11, v11}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto :goto_1

    .line 188
    :cond_a
    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 189
    invoke-virtual {v4, v11, v13}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto :goto_1
.end method

.method public toXML()Ljava/lang/String;
    .locals 15

    .prologue
    const/4 v14, -0x1

    const-string v13, "\" "

    .line 77
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 78
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v11, "<iq "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 80
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, "packetId":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getTo()Ljava/lang/String;

    move-result-object v10

    .line 82
    .local v10, "to":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getFrom()Ljava/lang/String;

    move-result-object v2

    .line 84
    .local v2, "from":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 85
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "id=\""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\" "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getRmqId()J

    move-result-wide v7

    .line 91
    .local v7, "rmqId":J
    const-wide/16 v11, -0x1

    cmp-long v11, v7, v11

    if-eqz v11, :cond_6

    .line 92
    const-string v11, "stanza-id"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "=\""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7, v8}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "\" "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 110
    :cond_1
    :goto_0
    if-eqz v10, :cond_2

    .line 111
    const-string v11, "to=\""

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-static {v10}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "\" "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 113
    :cond_2
    if-eqz v2, :cond_3

    .line 114
    const-string v11, "from=\""

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "\" "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 116
    :cond_3
    iget-object v11, p0, Lorg/jivesoftware/smack/packet/IQ;->type:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-nez v11, :cond_9

    .line 117
    const-string v11, "type=\"get\">"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    :goto_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getChildElementXML()Ljava/lang/String;

    move-result-object v5

    .line 124
    .local v5, "queryXML":Ljava/lang/String;
    if-eqz v5, :cond_4

    .line 125
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v1

    .line 129
    .local v1, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v1, :cond_5

    .line 130
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/XMPPError;->toXML()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 132
    :cond_5
    const-string v11, "</iq>"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    return-object v11

    .line 94
    .end local v1    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    .end local v5    # "queryXML":Ljava/lang/String;
    :cond_6
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getRmq2Id()Ljava/lang/String;

    move-result-object v6

    .line 95
    .local v6, "rmq2Id":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_7

    .line 96
    const-string v11, "persistent_id=\""

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "\" "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 99
    :cond_7
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getLastStreamId()I

    move-result v3

    .line 100
    .local v3, "lastStreamId":I
    if-eq v3, v14, :cond_8

    .line 101
    const-string v11, "last_stream_id=\""

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "\" "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 104
    :cond_8
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getStreamId()I

    move-result v9

    .line 105
    .local v9, "streamId":I
    if-eq v9, v14, :cond_1

    .line 106
    const-string v11, "stream_id=\""

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "\" "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_0

    .line 120
    .end local v3    # "lastStreamId":I
    .end local v6    # "rmq2Id":Ljava/lang/String;
    .end local v9    # "streamId":I
    :cond_9
    const-string v11, "type=\""

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "\">"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method
