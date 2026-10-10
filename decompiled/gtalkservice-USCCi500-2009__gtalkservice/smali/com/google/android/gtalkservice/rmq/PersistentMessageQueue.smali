.class public Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;
.super Ljava/lang/Object;
.source "PersistentMessageQueue.java"

# interfaces
.implements Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;


# instance fields
.field private RMQ_PROJECTION:[Ljava/lang/String;

.field private mResolver:Landroid/content/ContentResolver;

.field private mRmqId:J


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;)V
    .locals 3
    .param p1, "resolver"    # Landroid/content/ContentResolver;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "rmq_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "data"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "type"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->RMQ_PROJECTION:[Ljava/lang/String;

    .line 45
    iput-object p1, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mResolver:Landroid/content/ContentResolver;

    .line 46
    invoke-direct {p0}, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->initializeRmqId()V

    .line 47
    return-void
.end method

.method private initializeRmqId()V
    .locals 4

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v0}, Landroid/provider/Im$OutgoingRmq;->queryHighestRmqId(Landroid/content/ContentResolver;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mRmqId:J

    .line 56
    iget-wide v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mRmqId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 57
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v0, :cond_0

    .line 58
    const-string v0, "initializeRmqId: nothing in OutgoingRmq table, query lastRmqId table"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->log(Ljava/lang/String;)V

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v0}, Landroid/provider/Im$LastRmqId;->queryLastRmqId(Landroid/content/ContentResolver;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mRmqId:J

    .line 63
    :cond_1
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initializeRmqId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mRmqId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->log(Ljava/lang/String;)V

    .line 64
    :cond_2
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 166
    const-string v0, "Rmq"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[pmq] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    return-void
.end method


# virtual methods
.method public enqueueMessage(JLcom/google/android/gtalkservice/rmq/RmqPacket;)V
    .locals 3
    .param p1, "rmqId"    # J
    .param p3, "packet"    # Lcom/google/android/gtalkservice/rmq/RmqPacket;

    .prologue
    .line 75
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enqueueMessage rmqId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->log(Ljava/lang/String;)V

    .line 77
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 78
    .local v0, "value":Landroid/content/ContentValues;
    const-string v1, "rmq_id"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 79
    const-string v1, "data"

    invoke-virtual {p3}, Lcom/google/android/gtalkservice/rmq/RmqPacket;->getData()[B

    move-result-object v2

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    const-string v1, "type"

    invoke-virtual {p3}, Lcom/google/android/gtalkservice/rmq/RmqPacket;->getProtoBufTag()B

    move-result v2

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Byte;)V

    .line 82
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Landroid/provider/Im$OutgoingRmq;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 83
    return-void
.end method

.method public generateNewRmq2Id()Ljava/lang/String;
    .locals 2

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->getNextRmqId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextRmqId()J
    .locals 4

    .prologue
    .line 67
    iget-wide v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mRmqId:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mRmqId:J

    return-wide v0
.end method

.method public getRmq1Packets()Lcom/google/android/gtalkservice/rmq/RmqPacketList;
    .locals 8

    .prologue
    .line 138
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .local v6, "buf":Ljava/lang/StringBuilder;
    const-string v0, "type"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "=0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Im$OutgoingRmq;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->RMQ_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "rmq_id ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 148
    .local v7, "cursor":Landroid/database/Cursor;
    new-instance v0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;

    invoke-direct {v0, v7}, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;-><init>(Landroid/database/Cursor;)V

    return-object v0
.end method

.method public getRmq2Packets()Lcom/google/android/gtalkservice/rmq/RmqPacketList;
    .locals 8

    .prologue
    .line 152
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .local v6, "buf":Ljava/lang/StringBuilder;
    const-string v0, "type"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "!=0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Im$OutgoingRmq;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->RMQ_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "rmq_id ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 162
    .local v7, "cursor":Landroid/database/Cursor;
    new-instance v0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;

    invoke-direct {v0, v7}, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;-><init>(Landroid/database/Cursor;)V

    return-object v0
.end method

.method public removeMessagesByRmq2Ids(Ljava/util/List;)I
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 110
    .local p1, "rmq2Ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    if-nez v7, :cond_1

    .line 111
    :cond_0
    const/4 v7, 0x0

    .line 134
    :goto_0
    return v7

    .line 114
    :cond_1
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v7, :cond_3

    .line 115
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "remove rmq2 messages: "

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .local v5, "msg":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 117
    .local v4, "id":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2c

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 119
    .end local v4    # "id":Ljava/lang/String;
    :cond_2
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->log(Ljava/lang/String;)V

    .line 122
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "msg":Ljava/lang/StringBuilder;
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    new-array v6, v7, [Ljava/lang/String;

    .line 124
    .local v6, "selectionArgs":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 126
    .local v1, "i":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 127
    .restart local v4    # "id":Ljava/lang/String;
    if-lez v1, :cond_4

    .line 128
    const-string v7, " OR "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    :cond_4
    const-string v7, "rmq_id"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "=?"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    aput-object v4, v6, v1

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_2

    .line 134
    .end local v4    # "id":Ljava/lang/String;
    :cond_5
    iget-object v7, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mResolver:Landroid/content/ContentResolver;

    sget-object v8, Landroid/provider/Im$OutgoingRmq;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9, v6}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    goto :goto_0
.end method

.method public removeMessagesUntil(J)V
    .locals 6
    .param p1, "rmqId"    # J

    .prologue
    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v2, "rmq_id"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "<="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 91
    const-string v2, " AND "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "type"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "=0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mResolver:Landroid/content/ContentResolver;

    sget-object v3, Landroid/provider/Im$OutgoingRmq;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 96
    .local v1, "count":I
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "removeMessagesUntil "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->log(Ljava/lang/String;)V

    .line 102
    :cond_0
    iget-wide v2, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mRmqId:J

    cmp-long v2, v2, p1

    if-gez v2, :cond_1

    .line 103
    iput-wide p1, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mRmqId:J

    .line 106
    :cond_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mResolver:Landroid/content/ContentResolver;

    iget-wide v3, p0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;->mRmqId:J

    invoke-static {v2, v3, v4}, Landroid/provider/Im$LastRmqId;->saveLastRmqId(Landroid/content/ContentResolver;J)V

    .line 107
    return-void
.end method
