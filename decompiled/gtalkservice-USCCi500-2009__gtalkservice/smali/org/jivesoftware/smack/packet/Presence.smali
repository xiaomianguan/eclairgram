.class public Lorg/jivesoftware/smack/packet/Presence;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "Presence.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/packet/Presence$ClientType;,
        Lorg/jivesoftware/smack/packet/Presence$Mode;,
        Lorg/jivesoftware/smack/packet/Presence$Type;
    }
.end annotation


# static fields
.field public static final NO_PRIORITY:I


# instance fields
.field private avatarHash:Ljava/lang/String;

.field private clientType:Lorg/jivesoftware/smack/packet/Presence$ClientType;

.field private mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

.field private priority:I

.field private status:Ljava/lang/String;

.field private type:Lorg/jivesoftware/smack/packet/Presence$Type;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V
    .locals 2
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/Presence$Type;

    .prologue
    const/4 v1, 0x0

    .line 80
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 67
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    .line 68
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    .line 69
    const/4 v0, 0x0

    iput v0, p0, Lorg/jivesoftware/smack/packet/Presence;->priority:I

    .line 70
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Mode;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Mode;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 71
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->clientType:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    .line 72
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->avatarHash:Ljava/lang/String;

    .line 81
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    .line 82
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/packet/Presence$Type;Ljava/lang/String;ILorg/jivesoftware/smack/packet/Presence$Mode;)V
    .locals 2
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/Presence$Type;
    .param p2, "status"    # Ljava/lang/String;
    .param p3, "priority"    # I
    .param p4, "mode"    # Lorg/jivesoftware/smack/packet/Presence$Mode;

    .prologue
    const/4 v1, 0x0

    .line 92
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 67
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    .line 68
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    .line 69
    const/4 v0, 0x0

    iput v0, p0, Lorg/jivesoftware/smack/packet/Presence;->priority:I

    .line 70
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Mode;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Mode;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 71
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->clientType:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    .line 72
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->avatarHash:Ljava/lang/String;

    .line 93
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    .line 94
    iput-object p2, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    .line 95
    iput p3, p0, Lorg/jivesoftware/smack/packet/Presence;->priority:I

    .line 96
    iput-object p4, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 97
    return-void
.end method


# virtual methods
.method public getAvatarHash()Ljava/lang/String;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Presence;->avatarHash:Ljava/lang/String;

    return-object v0
.end method

.method public getClientType()Lorg/jivesoftware/smack/packet/Presence$ClientType;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Presence;->clientType:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    return-object v0
.end method

.method public getMode()Lorg/jivesoftware/smack/packet/Presence$Mode;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    return-object v0
.end method

.method public getPriority()I
    .locals 1

    .prologue
    .line 144
    iget v0, p0, Lorg/jivesoftware/smack/packet/Presence;->priority:I

    return v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lorg/jivesoftware/smack/packet/Presence$Type;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    return-object v0
.end method

.method public setAvatarHash(Ljava/lang/String;)V
    .locals 0
    .param p1, "hash"    # Ljava/lang/String;

    .prologue
    .line 193
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Presence;->avatarHash:Ljava/lang/String;

    .line 194
    return-void
.end method

.method public setClientType(Lorg/jivesoftware/smack/packet/Presence$ClientType;)V
    .locals 0
    .param p1, "clientType"    # Lorg/jivesoftware/smack/packet/Presence$ClientType;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Presence;->clientType:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    .line 186
    return-void
.end method

.method public setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V
    .locals 0
    .param p1, "mode"    # Lorg/jivesoftware/smack/packet/Presence$Mode;

    .prologue
    .line 177
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 178
    return-void
.end method

.method public setPriority(I)V
    .locals 3
    .param p1, "priority"    # I

    .prologue
    .line 154
    const/16 v0, -0x80

    if-lt p1, v0, :cond_0

    const/16 v0, 0x80

    if-le p1, v0, :cond_1

    .line 155
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Priority value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not valid. Valid range is -128 through 128."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 158
    :cond_1
    iput p1, p0, Lorg/jivesoftware/smack/packet/Presence;->priority:I

    .line 159
    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 135
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    .line 136
    return-void
.end method

.method public setType(Lorg/jivesoftware/smack/packet/Presence$Type;)V
    .locals 0
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/Presence$Type;

    .prologue
    .line 114
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    .line 115
    return-void
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 11

    .prologue
    .line 273
    new-instance v4, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v9, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->PRESENCE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v4, v9}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 275
    .local v4, "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getPacketID()Ljava/lang/String;

    move-result-object v2

    .line 276
    .local v2, "id":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    const-string v9, "ID_NOT_AVAILABLE"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 277
    const/4 v9, 0x3

    invoke-virtual {v4, v9, v2}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 280
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getTo()Ljava/lang/String;

    move-result-object v8

    .line 281
    .local v8, "to":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 282
    const/4 v9, 0x5

    invoke-virtual {v4, v9, v8}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 285
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v1

    .line 286
    .local v1, "from":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 287
    const/4 v9, 0x4

    invoke-virtual {v4, v9, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 290
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getRmq2Id()Ljava/lang/String;

    move-result-object v5

    .line 291
    .local v5, "rmq2Id":Ljava/lang/String;
    if-eqz v5, :cond_a

    .line 292
    const/16 v9, 0xd

    invoke-virtual {v4, v9, v5}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 300
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getLastStreamId()I

    move-result v3

    .line 301
    .local v3, "lastStreamId":I
    const/4 v9, -0x1

    if-eq v3, v9, :cond_4

    .line 302
    const/16 v9, 0xf

    invoke-virtual {v4, v9, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 307
    :cond_4
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 308
    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 330
    :cond_5
    :goto_1
    iget-object v9, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 331
    const/4 v9, 0x7

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 334
    :cond_6
    iget v9, p0, Lorg/jivesoftware/smack/packet/Presence;->priority:I

    if-eqz v9, :cond_7

    .line 335
    const/16 v9, 0x8

    iget v10, p0, Lorg/jivesoftware/smack/packet/Presence;->priority:I

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 338
    :cond_7
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Mode;->AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 339
    const/4 v9, 0x6

    const/4 v10, 0x0

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 361
    :cond_8
    :goto_2
    iget-object v9, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    sget-object v10, Lorg/jivesoftware/smack/packet/Presence$Type;->ERROR:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v9, v10, :cond_9

    .line 362
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v0

    .line 363
    .local v0, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v0, :cond_9

    .line 364
    const/16 v9, 0x9

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/XMPPError;->toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 370
    .end local v0    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_9
    const/16 v9, 0xa

    invoke-virtual {p0, v9, v4}, Lorg/jivesoftware/smack/packet/Presence;->addExtensionsToProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 371
    return-object v4

    .line 294
    .end local v3    # "lastStreamId":I
    :cond_a
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getRmqId()J

    move-result-wide v6

    .line 295
    .local v6, "rmqId":J
    const-wide/16 v9, -0x1

    cmp-long v9, v6, v9

    if-eqz v9, :cond_3

    .line 296
    const/4 v9, 0x1

    invoke-virtual {v4, v9, v6, v7}, Lcom/google/common/io/protocol/ProtoBuf;->setLong(IJ)V

    goto :goto_0

    .line 310
    .end local v6    # "rmqId":J
    .restart local v3    # "lastStreamId":I
    :cond_b
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->PROBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 311
    const/4 v9, 0x2

    const/4 v10, 0x5

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto :goto_1

    .line 313
    :cond_c
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 314
    const/4 v9, 0x2

    const/4 v10, 0x1

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto :goto_1

    .line 316
    :cond_d
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 317
    const/4 v9, 0x2

    const/4 v10, 0x2

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_1

    .line 319
    :cond_e
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_f

    .line 320
    const/4 v9, 0x2

    const/4 v10, 0x3

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_1

    .line 322
    :cond_f
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_10

    .line 323
    const/4 v9, 0x2

    const/4 v10, 0x4

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_1

    .line 325
    :cond_10
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->ERROR:Lorg/jivesoftware/smack/packet/Presence$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 326
    const/4 v9, 0x2

    const/4 v10, 0x6

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_1

    .line 341
    :cond_11
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Mode;->CHAT:Lorg/jivesoftware/smack/packet/Presence$Mode;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 342
    const/4 v9, 0x6

    const/4 v10, 0x1

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_2

    .line 344
    :cond_12
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Mode;->EXTENDED_AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_13

    .line 345
    const/4 v9, 0x6

    const/4 v10, 0x3

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_2

    .line 347
    :cond_13
    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Mode;->DO_NOT_DISTURB:Lorg/jivesoftware/smack/packet/Presence$Mode;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 348
    const/4 v9, 0x6

    const/4 v10, 0x2

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_2
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 375
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 376
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 377
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v1, v2, :cond_1

    .line 378
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-eqz v1, :cond_0

    .line 379
    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 381
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 382
    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 385
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Presence;->clientType:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    if-eqz v1, :cond_2

    .line 386
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Presence;->clientType:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 388
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toXML()Ljava/lang/String;
    .locals 15

    .prologue
    const/4 v14, -0x1

    const/16 v13, 0x20

    const-string v12, "\""

    .line 197
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 198
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v10, "<presence"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 200
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getPacketID()Ljava/lang/String;

    move-result-object v4

    .line 201
    .local v4, "packetId":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getTo()Ljava/lang/String;

    move-result-object v9

    .line 202
    .local v9, "to":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v2

    .line 203
    .local v2, "from":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getRmqId()J

    move-result-wide v6

    .line 204
    .local v6, "rmqId":J
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getRmq2Id()Ljava/lang/String;

    move-result-object v5

    .line 205
    .local v5, "rmq2Id":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getLastStreamId()I

    move-result v3

    .line 206
    .local v3, "lastStreamId":I
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getStreamId()I

    move-result v8

    .line 208
    .local v8, "streamId":I
    if-eqz v4, :cond_0

    .line 209
    const-string v10, " id=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 212
    :cond_0
    const-wide/16 v10, -0x1

    cmp-long v10, v6, v10

    if-eqz v10, :cond_1

    .line 213
    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "stanza-id"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v6, v7}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 216
    :cond_1
    if-eqz v5, :cond_2

    .line 217
    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "persistent_id=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 220
    :cond_2
    if-eq v3, v14, :cond_3

    .line 221
    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "last_stream_id=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 224
    :cond_3
    if-eq v8, v14, :cond_4

    .line 225
    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "stream_id=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 228
    :cond_4
    if-eqz v9, :cond_5

    .line 229
    const-string v10, " to=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {v9}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 231
    :cond_5
    if-eqz v2, :cond_6

    .line 232
    const-string v10, " from=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 234
    :cond_6
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    sget-object v11, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-eq v10, v11, :cond_7

    .line 235
    const-string v10, " type=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Presence;->type:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 238
    :cond_7
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->clientType:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    if-eqz v10, :cond_8

    .line 239
    const-string v10, " client-type=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 240
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->clientType:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 241
    const-string v10, "\""

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 243
    :cond_8
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->avatarHash:Ljava/lang/String;

    if-eqz v10, :cond_9

    .line 244
    const-string v10, " hash=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 245
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->avatarHash:Ljava/lang/String;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 246
    const-string v10, "\""

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 248
    :cond_9
    const-string v10, ">"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 249
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    if-eqz v10, :cond_a

    .line 250
    const-string v10, "<status>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Presence;->status:Ljava/lang/String;

    invoke-static {v11}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "</status>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 252
    :cond_a
    iget v10, p0, Lorg/jivesoftware/smack/packet/Presence;->priority:I

    if-eqz v10, :cond_b

    .line 253
    const-string v10, "<priority>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget v11, p0, Lorg/jivesoftware/smack/packet/Presence;->priority:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "</priority>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 255
    :cond_b
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-eqz v10, :cond_c

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    sget-object v11, Lorg/jivesoftware/smack/packet/Presence$Mode;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-eq v10, v11, :cond_c

    .line 256
    const-string v10, "<show>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Presence;->mode:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "</show>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 259
    :cond_c
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getExtensionsXML()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 262
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Presence;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v1

    .line 263
    .local v1, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v1, :cond_d

    .line 264
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/XMPPError;->toXML()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 267
    :cond_d
    const-string v10, "</presence>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 269
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method
