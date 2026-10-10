.class Lcom/google/android/talk/AvatarCache$BitmapCache;
.super Ljava/lang/Object;
.source "AvatarCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/AvatarCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BitmapCache"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    }
.end annotation


# static fields
.field private static final MAX_CACHE_SIZE:J = 0x96000L

.field private static final USE_SOFT:Z = false

.field private static final USE_STRONG:Z = true


# instance fields
.field private mLRU:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSoftCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;",
            ">;>;"
        }
    .end annotation
.end field

.field private mStrongCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;",
            ">;"
        }
    .end annotation
.end field

.field private mStrongCacheSize:J

.field final synthetic this$0:Lcom/google/android/talk/AvatarCache;


# direct methods
.method constructor <init>(Lcom/google/android/talk/AvatarCache;)V
    .locals 2

    .prologue
    .line 337
    iput-object p1, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->this$0:Lcom/google/android/talk/AvatarCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 390
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mSoftCache:Ljava/util/HashMap;

    .line 394
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCache:Ljava/util/HashMap;

    .line 396
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    .line 402
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    return-void
.end method

.method private internalComputeCacheSize()J
    .locals 7

    .prologue
    .line 556
    const-wide/16 v3, 0x0

    .line 557
    .local v3, "size":J
    iget-object v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCache:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 558
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 559
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 560
    .local v2, "key":Ljava/lang/String;
    iget-object v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCache:Ljava/util/HashMap;

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;

    .line 561
    .local v0, "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    invoke-virtual {v0}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/google/android/talk/AvatarCache$BitmapCache;->bitmapSize(Landroid/graphics/drawable/BitmapDrawable;)J

    move-result-wide v5

    add-long/2addr v3, v5

    .line 562
    goto :goto_0

    .line 564
    .end local v0    # "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    .end local v2    # "key":Ljava/lang/String;
    :cond_0
    return-wide v3
.end method


# virtual methods
.method add(Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;Ljava/lang/String;Z)V
    .locals 7
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "b"    # Landroid/graphics/drawable/BitmapDrawable;
    .param p3, "hash"    # Ljava/lang/String;
    .param p4, "isSource"    # Z

    .prologue
    const/4 v6, -0x1

    .line 441
    iget-object v4, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    monitor-enter v4

    .line 443
    const/4 v1, -0x1

    .line 446
    .local v1, "pos":I
    :try_start_0
    iget-object v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    invoke-virtual {v5, p1}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 450
    if-nez v1, :cond_0

    .line 451
    monitor-exit v4

    .line 483
    :goto_0
    return-void

    .line 454
    :cond_0
    if-eq v1, v6, :cond_1

    .line 455
    iget-object v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    invoke-virtual {v5, v1}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    .line 458
    :cond_1
    iget-object v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    invoke-virtual {v5, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 462
    if-ne v1, v6, :cond_2

    .line 466
    new-instance v0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;

    invoke-direct {v0, p0, p3, p2, p4}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;-><init>(Lcom/google/android/talk/AvatarCache$BitmapCache;Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;Z)V

    .line 473
    .local v0, "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    invoke-virtual {p0, p2}, Lcom/google/android/talk/AvatarCache$BitmapCache;->bitmapSize(Landroid/graphics/drawable/BitmapDrawable;)J

    move-result-wide v2

    .line 474
    .local v2, "size":J
    iget-object v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCache:Ljava/util/HashMap;

    invoke-virtual {v5, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    iget-wide v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    add-long/2addr v5, v2

    iput-wide v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    .line 479
    invoke-virtual {p0}, Lcom/google/android/talk/AvatarCache$BitmapCache;->pruneIfCacheExceededMax()V

    .line 482
    .end local v0    # "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    .end local v2    # "size":J
    :cond_2
    monitor-exit v4

    goto :goto_0

    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method

.method bitmapSize(Landroid/graphics/drawable/BitmapDrawable;)J
    .locals 3
    .param p1, "drawable"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 532
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 533
    .local v0, "b":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    int-to-long v1, v1

    return-wide v1
.end method

.method clear(Ljava/lang/String;)V
    .locals 7
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 419
    iget-object v2, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    monitor-enter v2

    .line 423
    :try_start_0
    iget-object v3, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    invoke-virtual {v3, p1}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 424
    .local v1, "pos":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 425
    iget-object v3, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCache:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;

    .line 426
    .local v0, "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    if-eqz v0, :cond_0

    .line 427
    iget-wide v3, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    invoke-virtual {v0}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/google/android/talk/AvatarCache$BitmapCache;->bitmapSize(Landroid/graphics/drawable/BitmapDrawable;)J

    move-result-wide v5

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    .line 429
    :cond_0
    iget-object v3, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    invoke-virtual {v3, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 437
    .end local v0    # "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    :cond_1
    monitor-exit v2

    .line 438
    return-void

    .line 437
    .end local v1    # "pos":I
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method clearAll()V
    .locals 3

    .prologue
    .line 405
    iget-object v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    monitor-enter v0

    .line 411
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCache:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 412
    iget-object v1, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 413
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    .line 415
    monitor-exit v0

    .line 416
    return-void

    .line 415
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method get(Ljava/lang/String;)Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    .locals 6
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 500
    iget-object v3, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    monitor-enter v3

    .line 501
    const/4 v1, 0x0

    .line 504
    .local v1, "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;

    move-object v1, v0

    .line 520
    if-eqz v1, :cond_0

    .line 521
    invoke-virtual {v1}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v2

    invoke-virtual {v1}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->getHash()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->isSourceBitmap()Z

    move-result v5

    invoke-virtual {p0, p1, v2, v4, v5}, Lcom/google/android/talk/AvatarCache$BitmapCache;->add(Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;Ljava/lang/String;Z)V

    .line 526
    :cond_0
    monitor-exit v3

    return-object v1

    .line 527
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method pruneIfCacheExceededMax()V
    .locals 9

    .prologue
    .line 486
    iget-object v4, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    monitor-enter v4

    .line 487
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/talk/AvatarCache$BitmapCache;->strongSize()J

    move-result-wide v5

    const-wide/32 v7, 0x96000

    cmp-long v5, v5, v7

    if-lez v5, :cond_0

    .line 488
    iget-object v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 489
    .local v3, "userToRemove":Ljava/lang/String;
    iget-object v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCache:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;

    .line 490
    .local v2, "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    invoke-virtual {v2}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/google/android/talk/AvatarCache$BitmapCache;->bitmapSize(Landroid/graphics/drawable/BitmapDrawable;)J

    move-result-wide v0

    .line 492
    .local v0, "bitmapSize":J
    iget-wide v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    sub-long/2addr v5, v0

    iput-wide v5, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    goto :goto_0

    .line 494
    .end local v0    # "bitmapSize":J
    .end local v2    # "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    .end local v3    # "userToRemove":Ljava/lang/String;
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    :cond_0
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 496
    return-void
.end method

.method recomputeCacheSize()V
    .locals 3

    .prologue
    .line 549
    iget-object v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mLRU:Ljava/util/LinkedList;

    monitor-enter v0

    .line 550
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/talk/AvatarCache$BitmapCache;->internalComputeCacheSize()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    .line 552
    monitor-exit v0

    .line 553
    return-void

    .line 552
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method strongSize()J
    .locals 2

    .prologue
    .line 545
    iget-wide v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache;->mStrongCacheSize:J

    return-wide v0
.end method
