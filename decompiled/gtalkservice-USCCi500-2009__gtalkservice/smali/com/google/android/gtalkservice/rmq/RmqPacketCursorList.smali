.class public Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;
.super Lcom/google/android/gtalkservice/rmq/RmqPacketList;
.source "RmqPacketCursorList.java"


# instance fields
.field private final mCursor:Landroid/database/Cursor;

.field private mDataColumnIndex:I

.field private mProtobufTagIndex:I

.field private mRmqIdColumnIndex:I


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/google/android/gtalkservice/rmq/RmqPacketList;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    .line 22
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    const-string v1, "data"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mDataColumnIndex:I

    .line 23
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    const-string v1, "type"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mProtobufTagIndex:I

    .line 24
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    const-string v1, "rmq_id"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mRmqIdColumnIndex:I

    .line 25
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 56
    :cond_0
    return-void
.end method

.method public getPacketAt(I)Lorg/jivesoftware/smack/packet/Packet;
    .locals 8
    .param p1, "position"    # I

    .prologue
    const/4 v7, 0x0

    .line 35
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    if-nez v5, :cond_0

    move-object v5, v7

    .line 49
    :goto_0
    return-object v5

    .line 39
    :cond_0
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    invoke-interface {v5, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 40
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    iget v6, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mRmqIdColumnIndex:I

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 41
    .local v2, "rmqId":J
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    iget v6, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mProtobufTagIndex:I

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 42
    .local v4, "tag":I
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    iget v6, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mDataColumnIndex:I

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "data":Ljava/lang/String;
    if-nez v1, :cond_1

    move-object v5, v7

    .line 45
    goto :goto_0

    .line 48
    :cond_1
    invoke-static {v1}, Landroid/os/Base64Utils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    .line 49
    .local v0, "bytes":[B
    new-instance v5, Lcom/google/android/gtalkservice/rmq/RmqPacket;

    int-to-byte v6, v4

    invoke-direct {v5, v2, v3, v6, v0}, Lcom/google/android/gtalkservice/rmq/RmqPacket;-><init>(JB[B)V

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_0

    .line 29
    const/4 v0, 0x0

    .line 31
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/RmqPacketCursorList;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    goto :goto_0
.end method
