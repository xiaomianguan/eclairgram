.class public Lorg/jivesoftware/smack/util/Cache;
.super Ljava/lang/Object;
.source "Cache.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/util/Cache$LinkedListNode;,
        Lorg/jivesoftware/smack/util/Cache$LinkedList;,
        Lorg/jivesoftware/smack/util/Cache$CacheObject;
    }
.end annotation


# instance fields
.field protected ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

.field protected cacheHits:J

.field protected cacheMisses:J

.field protected lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

.field protected map:Ljava/util/Map;

.field protected maxCacheSize:I

.field protected maxLifetime:J


# direct methods
.method public constructor <init>(IJ)V
    .locals 2
    .param p1, "maxSize"    # I
    .param p2, "maxLifetime"    # J

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J

    .line 98
    if-nez p1, :cond_0

    .line 99
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Max cache size cannot be 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_0
    iput p1, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    .line 102
    iput-wide p2, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J

    .line 106
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x67

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    .line 108
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-direct {v0}, Lorg/jivesoftware/smack/util/Cache$LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    .line 109
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-direct {v0}, Lorg/jivesoftware/smack/util/Cache$LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    .line 110
    return-void
.end method


# virtual methods
.method public declared-synchronized clear()V
    .locals 4

    .prologue
    .line 185
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 186
    .local v1, "keys":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 187
    aget-object v2, v1, v0

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 191
    :cond_0
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 192
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->clear()V

    .line 193
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->clear()V

    .line 195
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/jivesoftware/smack/util/Cache;->cacheHits:J

    .line 196
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    monitor-exit p0

    return-void

    .line 185
    .end local v0    # "i":I
    .end local v1    # "keys":[Ljava/lang/Object;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 231
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 233
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 231
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized containsValue(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 253
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 255
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/Cache$CacheObject;-><init>(Ljava/lang/Object;)V

    .line 257
    .local v0, "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    monitor-exit p0

    return v1

    .line 253
    .end local v0    # "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected declared-synchronized cullCache()V
    .locals 6

    .prologue
    .line 354
    monitor-enter p0

    :try_start_0
    iget v2, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gez v2, :cond_1

    .line 375
    :cond_0
    monitor-exit p0

    return-void

    .line 359
    :cond_1
    :try_start_1
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    iget v3, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    if-le v2, v3, :cond_0

    .line 361
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 364
    iget v2, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    int-to-double v2, v2

    const-wide v4, 0x3feccccccccccccdL    # 0.9

    mul-double/2addr v2, v4

    double-to-int v0, v2

    .line 365
    .local v0, "desiredSize":I
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v1

    .local v1, "i":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 367
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v2

    iget-object v2, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_2

    .line 368
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error attempting to cullCache with remove("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v4

    iget-object v4, v4, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "cacheObject not found in cache!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 371
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 365
    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 354
    .end local v0    # "desiredSize":I
    .end local v1    # "i":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected declared-synchronized deleteExpiredEntries()V
    .locals 7

    .prologue
    .line 312
    monitor-enter p0

    :try_start_0
    iget-wide v3, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-gtz v3, :cond_1

    .line 346
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 320
    :cond_1
    :try_start_1
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v2

    .line 322
    .local v2, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    if-eqz v2, :cond_0

    .line 329
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J

    sub-long v0, v3, v5

    .line 331
    .local v0, "expireTime":J
    :cond_2
    iget-wide v3, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->timestamp:J

    cmp-long v3, v0, v3

    if-lez v3, :cond_0

    .line 332
    iget-object v3, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    .line 333
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error attempting to remove("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") - cacheObject not found in cache!"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 336
    invoke-virtual {v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 340
    :cond_3
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 342
    if-nez v2, :cond_2

    goto :goto_0

    .line 312
    .end local v0    # "expireTime":J
    .end local v2    # "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized entrySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 266
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 268
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 266
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    const-wide/16 v3, 0x1

    .line 139
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 141
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    .line 142
    .local v0, "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;
    if-nez v0, :cond_0

    .line 144
    iget-wide v1, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    const/4 v1, 0x0

    .line 157
    :goto_0
    monitor-exit p0

    return-object v1

    .line 149
    :cond_0
    :try_start_1
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 150
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    iget-object v2, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->addFirst(Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 154
    iget-wide v1, p0, Lorg/jivesoftware/smack/util/Cache;->cacheHits:J

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/jivesoftware/smack/util/Cache;->cacheHits:J

    .line 155
    iget v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->readCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->readCount:I

    .line 157
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 139
    .end local v0    # "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getCacheHits()J
    .locals 2

    .prologue
    .line 280
    iget-wide v0, p0, Lorg/jivesoftware/smack/util/Cache;->cacheHits:J

    return-wide v0
.end method

.method public getCacheMisses()J
    .locals 2

    .prologue
    .line 284
    iget-wide v0, p0, Lorg/jivesoftware/smack/util/Cache;->cacheMisses:J

    return-wide v0
.end method

.method public getMaxCacheSize()I
    .locals 1

    .prologue
    .line 288
    iget v0, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    return v0
.end method

.method public getMaxLifetime()J
    .locals 2

    .prologue
    .line 299
    iget-wide v0, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J

    return-wide v0
.end method

.method public declared-synchronized isEmpty()Z
    .locals 1

    .prologue
    .line 210
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 212
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 210
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized keySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 274
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 276
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 274
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 113
    monitor-enter p0

    const/4 v2, 0x0

    .line 115
    .local v2, "oldValue":Ljava/lang/Object;
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 116
    const/4 v3, 0x1

    invoke-virtual {p0, p1, v3}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v2

    .line 119
    .end local v2    # "oldValue":Ljava/lang/Object;
    :cond_0
    new-instance v1, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    invoke-direct {v1, p2}, Lorg/jivesoftware/smack/util/Cache$CacheObject;-><init>(Ljava/lang/Object;)V

    .line 120
    .local v1, "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v3, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->lastAccessedList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->addFirst(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v3

    iput-object v3, v1, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 126
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->ageList:Lorg/jivesoftware/smack/util/Cache$LinkedList;

    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->addFirst(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v0

    .line 127
    .local v0, "ageNode":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->timestamp:J

    .line 128
    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$CacheObject;->ageListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 131
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->cullCache()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    monitor-exit p0

    return-object v2

    .line 113
    .end local v0    # "ageNode":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .end local v1    # "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 4
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 237
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 238
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 239
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 243
    .local v2, "value":Ljava/lang/Object;
    instance-of v3, v2, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    if-eqz v3, :cond_0

    .line 244
    check-cast v2, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    .end local v2    # "value":Ljava/lang/Object;
    iget-object v2, v2, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;

    .line 246
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3, v2}, Lorg/jivesoftware/smack/util/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 248
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_1
    return-void
.end method

.method public declared-synchronized remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 161
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smack/util/Cache;->remove(Ljava/lang/Object;Z)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(Ljava/lang/Object;Z)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "internal"    # Z

    .prologue
    const/4 v2, 0x0

    .line 169
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    .local v0, "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;
    if-nez v0, :cond_0

    move-object v1, v2

    .line 181
    :goto_0
    monitor-exit p0

    return-object v1

    .line 175
    :cond_0
    :try_start_1
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 176
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->ageListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 178
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->ageListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 179
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 181
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 169
    .end local v0    # "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setMaxCacheSize(I)V
    .locals 1
    .param p1, "maxCacheSize"    # I

    .prologue
    .line 292
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lorg/jivesoftware/smack/util/Cache;->maxCacheSize:I

    .line 295
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->cullCache()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 296
    monitor-exit p0

    return-void

    .line 292
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setMaxLifetime(J)V
    .locals 0
    .param p1, "maxLifetime"    # J

    .prologue
    .line 303
    iput-wide p1, p0, Lorg/jivesoftware/smack/util/Cache;->maxLifetime:J

    .line 304
    return-void
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 202
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 204
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 202
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized values()Ljava/util/Collection;
    .locals 4

    .prologue
    .line 218
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache;->deleteExpiredEntries()V

    .line 220
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v0

    .line 221
    .local v0, "cacheObjects":[Ljava/lang/Object;
    array-length v3, v0

    new-array v2, v3, [Ljava/lang/Object;

    .line 222
    .local v2, "values":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 223
    aget-object v3, v0, v1

    check-cast v3, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    iget-object v3, v3, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;

    aput-object v3, v2, v1

    .line 222
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 225
    :cond_0
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    monitor-exit p0

    return-object v3

    .line 218
    .end local v0    # "cacheObjects":[Ljava/lang/Object;
    .end local v1    # "i":I
    .end local v2    # "values":[Ljava/lang/Object;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method
