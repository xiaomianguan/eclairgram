.class public Lorg/jivesoftware/smack/packet/Message;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "Message.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/packet/Message$Type;
    }
.end annotation


# instance fields
.field private body:Ljava/lang/String;

.field private hasNoSave:Z

.field private isIncoming:Z

.field private isRead:Z

.field private noSave:Z

.field private subject:Ljava/lang/String;

.field private thread:Ljava/lang/String;

.field private timestamp:J

.field private type:Lorg/jivesoftware/smack/packet/Message$Type;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 74
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 57
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 58
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    .line 59
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    .line 60
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/packet/Message;->isIncoming:Z

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 83
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 57
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 58
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    .line 59
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    .line 60
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    .line 84
    if-nez p1, :cond_0

    .line 85
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parameter cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_0
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/packet/Message;->isIncoming:Z

    .line 89
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$Type;)V
    .locals 2
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "type"    # Lorg/jivesoftware/smack/packet/Message$Type;

    .prologue
    const/4 v1, 0x0

    .line 97
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 57
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 58
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    .line 59
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    .line 60
    iput-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    .line 98
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 99
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parameters cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_1
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 102
    iput-object p2, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 103
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/packet/Message;->isIncoming:Z

    .line 104
    return-void
.end method


# virtual methods
.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    return-object v0
.end method

.method public getIsIncoming()Z
    .locals 1

    .prologue
    .line 107
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/Message;->isIncoming:Z

    return v0
.end method

.method public getNoSave()Z
    .locals 1

    .prologue
    .line 115
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/Message;->noSave:Z

    return v0
.end method

.method public getSubject()Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    return-object v0
.end method

.method public getThread()Ljava/lang/String;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 224
    iget-wide v0, p0, Lorg/jivesoftware/smack/packet/Message;->timestamp:J

    return-wide v0
.end method

.method public getType()Lorg/jivesoftware/smack/packet/Message$Type;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    return-object v0
.end method

.method public hasNoSave()Z
    .locals 1

    .prologue
    .line 123
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/Message;->hasNoSave:Z

    return v0
.end method

.method public isRead()Z
    .locals 1

    .prologue
    .line 131
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/Message;->isRead:Z

    return v0
.end method

.method public setBody(Ljava/lang/String;)V
    .locals 0
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 194
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    .line 195
    return-void
.end method

.method public setHasNoSave(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/Message;->hasNoSave:Z

    .line 128
    return-void
.end method

.method public setIsIncoming(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 111
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/Message;->isIncoming:Z

    .line 112
    return-void
.end method

.method public setIsRead(Z)V
    .locals 0
    .param p1, "read"    # Z

    .prologue
    .line 135
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/Message;->isRead:Z

    .line 136
    return-void
.end method

.method public setNoSave(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 119
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/Message;->noSave:Z

    .line 120
    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .locals 0
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    .line 177
    return-void
.end method

.method public setThread(Ljava/lang/String;)V
    .locals 0
    .param p1, "thread"    # Ljava/lang/String;

    .prologue
    .line 214
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    .line 215
    return-void
.end method

.method public setTimestamp(J)V
    .locals 0
    .param p1, "timestamp"    # J

    .prologue
    .line 233
    iput-wide p1, p0, Lorg/jivesoftware/smack/packet/Message;->timestamp:J

    .line 234
    return-void
.end method

.method public setType(Lorg/jivesoftware/smack/packet/Message$Type;)V
    .locals 2
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/Message$Type;

    .prologue
    .line 153
    if-nez p1, :cond_0

    .line 154
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Type cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_0
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 157
    return-void
.end method

.method public toLogString()Ljava/lang/String;
    .locals 15

    .prologue
    const/4 v13, -0x1

    const/16 v12, 0x20

    const-string v14, "\""

    .line 319
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 320
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v10, "<message"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 322
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getPacketID()Ljava/lang/String;

    move-result-object v4

    .line 323
    .local v4, "packetId":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getTo()Ljava/lang/String;

    move-result-object v9

    .line 324
    .local v9, "to":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v2

    .line 325
    .local v2, "from":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getRmqId()J

    move-result-wide v6

    .line 326
    .local v6, "rmqId":J
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getRmq2Id()Ljava/lang/String;

    move-result-object v5

    .line 327
    .local v5, "rmq2Id":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getLastStreamId()I

    move-result v3

    .line 328
    .local v3, "lastStreamId":I
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getStreamId()I

    move-result v8

    .line 330
    .local v8, "streamId":I
    if-eqz v4, :cond_0

    .line 331
    const-string v10, " id=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 334
    :cond_0
    const-wide/16 v10, -0x1

    cmp-long v10, v6, v10

    if-eqz v10, :cond_1

    .line 335
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

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

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 338
    :cond_1
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 339
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "persistent_id=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 342
    :cond_2
    if-eq v3, v13, :cond_3

    .line 343
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "last_stream_id=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 347
    :cond_3
    if-eq v8, v13, :cond_4

    .line 348
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "stream_id=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 351
    :cond_4
    if-eqz v9, :cond_5

    .line 352
    const-string v10, " to=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {v9}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 354
    :cond_5
    if-eqz v2, :cond_6

    .line 355
    const-string v10, " from=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 358
    :cond_6
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    sget-object v11, Lorg/jivesoftware/smack/packet/Message$Type;->NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;

    if-eq v10, v11, :cond_7

    .line 359
    const-string v10, " type=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 362
    :cond_7
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getTimestamp()J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-lez v10, :cond_8

    .line 363
    const-string v10, " timestamp=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getTimestamp()J

    move-result-wide v11

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 366
    :cond_8
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->isRead()Z

    move-result v10

    if-eqz v10, :cond_9

    .line 367
    const-string v10, " read=\"true\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 370
    :cond_9
    const-string v10, ">"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 372
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    if-eqz v10, :cond_a

    .line 373
    const-string v10, "<subject>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    invoke-virtual {p0, v11}, Lorg/jivesoftware/smack/packet/Message;->redactString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "</subject>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 375
    :cond_a
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    if-eqz v10, :cond_b

    .line 376
    const-string v10, "<body>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    invoke-virtual {p0, v11}, Lorg/jivesoftware/smack/packet/Message;->redactString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "</body>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 378
    :cond_b
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    if-eqz v10, :cond_c

    .line 379
    const-string v10, "<thread>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    invoke-virtual {p0, v11}, Lorg/jivesoftware/smack/packet/Message;->redactString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "</thread>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 382
    :cond_c
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    sget-object v11, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v10, v11, :cond_d

    .line 383
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v1

    .line 384
    .local v1, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v1, :cond_d

    .line 385
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/XMPPError;->toXML()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 389
    .end local v1    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_d
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->hasNoSave()Z

    move-result v10

    if-eqz v10, :cond_e

    .line 390
    const-string v10, "<x xmlns=\"google:nosave\" value=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getNoSave()Z

    move-result v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\">"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 395
    :cond_e
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getExtensionsXML()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 396
    const-string v10, "</message>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 397
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 15

    .prologue
    const/4 v14, 0x4

    const/4 v13, 0x3

    const/4 v12, 0x1

    const/4 v11, 0x2

    .line 401
    new-instance v4, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v9, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->MESSAGE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v4, v9}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 403
    .local v4, "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getPacketID()Ljava/lang/String;

    move-result-object v2

    .line 404
    .local v2, "id":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    const-string v9, "ID_NOT_AVAILABLE"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 405
    invoke-virtual {v4, v13, v2}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 408
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getTo()Ljava/lang/String;

    move-result-object v8

    .line 409
    .local v8, "to":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 410
    const/4 v9, 0x5

    invoke-virtual {v4, v9, v8}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 413
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v1

    .line 414
    .local v1, "from":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 415
    invoke-virtual {v4, v14, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 418
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getRmq2Id()Ljava/lang/String;

    move-result-object v5

    .line 419
    .local v5, "rmq2Id":Ljava/lang/String;
    if-eqz v5, :cond_9

    .line 420
    const/16 v9, 0xd

    invoke-virtual {v4, v9, v5}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 428
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getLastStreamId()I

    move-result v3

    .line 429
    .local v3, "lastStreamId":I
    const/4 v9, -0x1

    if-eq v3, v9, :cond_4

    .line 430
    const/16 v9, 0xf

    invoke-virtual {v4, v9, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 433
    :cond_4
    sget-object v9, Lorg/jivesoftware/smack/packet/Message$Type;->CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 434
    invoke-virtual {v4, v11, v12}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 450
    :goto_1
    iget-object v9, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_5

    .line 451
    const/4 v9, 0x6

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 454
    :cond_5
    iget-object v9, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 455
    const/4 v9, 0x7

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 458
    :cond_6
    iget-object v9, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_7

    .line 459
    const/16 v9, 0x8

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 464
    :cond_7
    iget-object v9, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    sget-object v10, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v9, v10, :cond_8

    .line 465
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v0

    .line 466
    .local v0, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v0, :cond_8

    .line 467
    const/16 v9, 0x9

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/XMPPError;->toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Lcom/google/common/io/protocol/ProtoBuf;->setProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 477
    .end local v0    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_8
    const/16 v9, 0xa

    invoke-virtual {p0, v9, v4}, Lorg/jivesoftware/smack/packet/Message;->addExtensionsToProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 478
    return-object v4

    .line 422
    .end local v3    # "lastStreamId":I
    :cond_9
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getRmqId()J

    move-result-wide v6

    .line 423
    .local v6, "rmqId":J
    const-wide/16 v9, -0x1

    cmp-long v9, v6, v9

    if-eqz v9, :cond_3

    .line 424
    invoke-virtual {v4, v12, v6, v7}, Lcom/google/common/io/protocol/ProtoBuf;->setLong(IJ)V

    goto :goto_0

    .line 436
    .end local v6    # "rmqId":J
    .restart local v3    # "lastStreamId":I
    :cond_a
    sget-object v9, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 437
    invoke-virtual {v4, v11, v11}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto :goto_1

    .line 439
    :cond_b
    sget-object v9, Lorg/jivesoftware/smack/packet/Message$Type;->HEADLINE:Lorg/jivesoftware/smack/packet/Message$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 440
    invoke-virtual {v4, v11, v13}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto :goto_1

    .line 442
    :cond_c
    sget-object v9, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 443
    invoke-virtual {v4, v11, v14}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto :goto_1

    .line 446
    :cond_d
    const/4 v9, 0x0

    invoke-virtual {v4, v11, v9}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_1
.end method

.method public toXML()Ljava/lang/String;
    .locals 15

    .prologue
    const/4 v13, -0x1

    const/16 v12, 0x20

    const-string v14, "\""

    .line 237
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 238
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v10, "<message"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 240
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getPacketID()Ljava/lang/String;

    move-result-object v4

    .line 241
    .local v4, "packetId":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getTo()Ljava/lang/String;

    move-result-object v9

    .line 242
    .local v9, "to":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v2

    .line 243
    .local v2, "from":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getRmqId()J

    move-result-wide v6

    .line 244
    .local v6, "rmqId":J
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getRmq2Id()Ljava/lang/String;

    move-result-object v5

    .line 245
    .local v5, "rmq2Id":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getLastStreamId()I

    move-result v3

    .line 246
    .local v3, "lastStreamId":I
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getStreamId()I

    move-result v8

    .line 248
    .local v8, "streamId":I
    if-eqz v4, :cond_0

    .line 249
    const-string v10, " id=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 252
    :cond_0
    const-wide/16 v10, -0x1

    cmp-long v10, v6, v10

    if-eqz v10, :cond_1

    .line 253
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

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

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 256
    :cond_1
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 257
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "persistent_id=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 260
    :cond_2
    if-eq v3, v13, :cond_3

    .line 261
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "last_stream_id=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 265
    :cond_3
    if-eq v8, v13, :cond_4

    .line 266
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "stream_id=\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 269
    :cond_4
    if-eqz v9, :cond_5

    .line 270
    const-string v10, " to=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {v9}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 272
    :cond_5
    if-eqz v2, :cond_6

    .line 273
    const-string v10, " from=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 276
    :cond_6
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    sget-object v11, Lorg/jivesoftware/smack/packet/Message$Type;->NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;

    if-eq v10, v11, :cond_7

    .line 277
    const-string v10, " type=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 280
    :cond_7
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getTimestamp()J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-lez v10, :cond_8

    .line 281
    const-string v10, " timestamp=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getTimestamp()J

    move-result-wide v11

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\""

    invoke-virtual {v10, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 284
    :cond_8
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->isRead()Z

    move-result v10

    if-eqz v10, :cond_9

    .line 285
    const-string v10, " read=\"true\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 288
    :cond_9
    const-string v10, ">"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 290
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    if-eqz v10, :cond_a

    .line 291
    const-string v10, "<subject>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Message;->subject:Ljava/lang/String;

    invoke-static {v11}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "</subject>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 293
    :cond_a
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    if-eqz v10, :cond_b

    .line 294
    const-string v10, "<body>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Message;->body:Ljava/lang/String;

    invoke-static {v11}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "</body>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 296
    :cond_b
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    if-eqz v10, :cond_c

    .line 297
    const-string v10, "<thread>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "</thread>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 300
    :cond_c
    iget-object v10, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    sget-object v11, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v10, v11, :cond_d

    .line 301
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v1

    .line 302
    .local v1, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v1, :cond_d

    .line 303
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/XMPPError;->toXML()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 307
    .end local v1    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_d
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->hasNoSave()Z

    move-result v10

    if-eqz v10, :cond_e

    .line 308
    const-string v10, "<x xmlns=\"google:nosave\" value=\""

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getNoSave()Z

    move-result v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\">"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 313
    :cond_e
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getExtensionsXML()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 314
    const-string v10, "</message>"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 315
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method
