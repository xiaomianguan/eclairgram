.class public Lcom/google/android/gtalkservice/extensions/FlushableDeflater;
.super Ljava/util/zip/Deflater;
.source "FlushableDeflater.java"


# static fields
.field private static final STUB_INPUT_BUFFER:[B

.field private static final Z_FINISH:I = 0x4

.field private static final Z_NO_FLUSH:I = 0x0

.field public static final Z_SYNC_FLUSH:I = 0x2


# instance fields
.field private compressLevel:I

.field private finished:Z

.field private flushParm:I

.field private inLength:I

.field private inRead:I

.field private inputBuffer:[B

.field private strategy:I

.field private streamHandle:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-string v0, "gtalk_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 46
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->STUB_INPUT_BUFFER:[B

    .line 49
    invoke-static {}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->oneTimeInitialization()V

    .line 50
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 3
    .param p1, "level"    # I
    .param p2, "noHeader"    # Z

    .prologue
    const/4 v0, 0x0

    const/4 v2, -0x1

    .line 77
    invoke-direct {p0}, Ljava/util/zip/Deflater;-><init>()V

    .line 57
    iput v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->flushParm:I

    .line 61
    iput v2, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->compressLevel:I

    .line 63
    iput v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->strategy:I

    .line 65
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    .line 78
    if-lt p1, v2, :cond_0

    const/16 v0, 0x9

    if-le p1, v0, :cond_1

    .line 79
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 81
    :cond_1
    iput p1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->compressLevel:I

    .line 82
    iget v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->compressLevel:I

    iget v1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->strategy:I

    invoke-direct {p0, v0, v1, p2}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->createStream(IIZ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    .line 83
    return-void
.end method

.method private native createStream(IIZ)J
.end method

.method private synchronized native declared-synchronized deflateImpl([BIIJI)I
.end method

.method private synchronized native declared-synchronized endImpl(J)V
.end method

.method private synchronized native declared-synchronized getAdlerImpl(J)I
.end method

.method private synchronized native declared-synchronized getTotalInImpl(J)J
.end method

.method private synchronized native declared-synchronized getTotalOutImpl(J)J
.end method

.method private static native oneTimeInitialization()V
.end method

.method private synchronized native declared-synchronized resetImpl(J)V
.end method

.method private synchronized native declared-synchronized setDictionaryImpl([BIIJ)V
.end method

.method private synchronized native declared-synchronized setInputImpl([BIIJ)V
.end method

.method private synchronized native declared-synchronized setLevelsImpl(IIJ)V
.end method


# virtual methods
.method public declared-synchronized deflate([BII)I
    .locals 1
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "nbytes"    # I

    .prologue
    .line 89
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->flushParm:I

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->deflate([BIII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deflate([BIII)I
    .locals 7
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "nbytes"    # I
    .param p4, "mode"    # I

    .prologue
    .line 110
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 114
    :cond_0
    :try_start_1
    array-length v0, p1

    if-gt p2, v0, :cond_2

    if-ltz p3, :cond_2

    if-ltz p2, :cond_2

    array-length v0, p1

    sub-int/2addr v0, p2

    if-lt v0, p3, :cond_2

    .line 117
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inputBuffer:[B

    if-nez v0, :cond_1

    .line 118
    sget-object v0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->STUB_INPUT_BUFFER:[B

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->setInput([B)V

    .line 120
    :cond_1
    iget-wide v4, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->deflateImpl([BIIJI)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 122
    :cond_2
    :try_start_2
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public declared-synchronized end()V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 140
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 141
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->endImpl(J)V

    .line 142
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inputBuffer:[B

    .line 143
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    :cond_0
    monitor-exit p0

    return-void

    .line 140
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized finish()V
    .locals 1

    .prologue
    .line 155
    monitor-enter p0

    const/4 v0, 0x4

    :try_start_0
    iput v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->flushParm:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    monitor-exit p0

    return-void

    .line 155
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized finished()Z
    .locals 1

    .prologue
    .line 166
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->finished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAdler()I
    .locals 4

    .prologue
    .line 181
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 182
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 181
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 185
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->getAdlerImpl(J)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    monitor-exit p0

    return v0
.end method

.method public declared-synchronized getBytesRead()J
    .locals 4

    .prologue
    .line 388
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 389
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 388
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 391
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->getTotalInImpl(J)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    monitor-exit p0

    return-wide v0
.end method

.method public declared-synchronized getBytesWritten()J
    .locals 4

    .prologue
    .line 404
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 405
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 404
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 407
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->getTotalOutImpl(J)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    monitor-exit p0

    return-wide v0
.end method

.method public declared-synchronized getTotalIn()I
    .locals 4

    .prologue
    .line 197
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 198
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 201
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->getTotalInImpl(J)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    long-to-int v0, v0

    monitor-exit p0

    return v0
.end method

.method public declared-synchronized getTotalOut()I
    .locals 4

    .prologue
    .line 213
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 214
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 213
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 217
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->getTotalOutImpl(J)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    long-to-int v0, v0

    monitor-exit p0

    return v0
.end method

.method public declared-synchronized needsInput()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 237
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inputBuffer:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    move v0, v2

    .line 240
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inRead:I

    iget v1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inLength:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v0, v1, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 237
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reset()V
    .locals 4

    .prologue
    .line 253
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 254
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 257
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->flushParm:I

    .line 258
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->finished:Z

    .line 259
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->resetImpl(J)V

    .line 260
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inputBuffer:[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 261
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setDictionary([BII)V
    .locals 6
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "nbytes"    # I

    .prologue
    .line 281
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 282
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 285
    :cond_0
    :try_start_1
    array-length v0, p1

    if-gt p2, v0, :cond_1

    if-ltz p3, :cond_1

    if-ltz p2, :cond_1

    array-length v0, p1

    sub-int/2addr v0, p2

    if-lt v0, p3, :cond_1

    .line 287
    iget-wide v4, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->setDictionaryImpl([BIIJ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 291
    monitor-exit p0

    return-void

    .line 289
    :cond_1
    :try_start_2
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public declared-synchronized setInput([BII)V
    .locals 6
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "nbytes"    # I

    .prologue
    .line 311
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 312
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 311
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 315
    :cond_0
    :try_start_1
    array-length v0, p1

    if-gt p2, v0, :cond_2

    if-ltz p3, :cond_2

    if-ltz p2, :cond_2

    array-length v0, p1

    sub-int/2addr v0, p2

    if-lt v0, p3, :cond_2

    .line 317
    iput p3, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inLength:I

    .line 318
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inRead:I

    .line 319
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inputBuffer:[B

    if-nez v0, :cond_1

    .line 320
    iget v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->compressLevel:I

    iget v1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->strategy:I

    iget-wide v2, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->setLevelsImpl(IIJ)V

    .line 322
    :cond_1
    iput-object p1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inputBuffer:[B

    .line 323
    iget-wide v4, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->streamHandle:J

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->setInputImpl([BIIJ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 327
    monitor-exit p0

    return-void

    .line 325
    :cond_2
    :try_start_2
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public declared-synchronized setLevel(I)V
    .locals 1
    .param p1, "level"    # I

    .prologue
    .line 347
    monitor-enter p0

    const/4 v0, -0x1

    if-lt p1, v0, :cond_0

    const/16 v0, 0x9

    if-le p1, v0, :cond_1

    .line 348
    :cond_0
    :try_start_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 347
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 350
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inputBuffer:[B

    if-eqz v0, :cond_2

    .line 351
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 353
    :cond_2
    iput p1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->compressLevel:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 354
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setStrategy(I)V
    .locals 1
    .param p1, "strategy"    # I

    .prologue
    .line 369
    monitor-enter p0

    if-ltz p1, :cond_0

    const/4 v0, 0x2

    if-le p1, v0, :cond_1

    .line 370
    :cond_0
    :try_start_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 369
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 372
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->inputBuffer:[B

    if-eqz v0, :cond_2

    .line 373
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 375
    :cond_2
    iput p1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->strategy:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 376
    monitor-exit p0

    return-void
.end method
