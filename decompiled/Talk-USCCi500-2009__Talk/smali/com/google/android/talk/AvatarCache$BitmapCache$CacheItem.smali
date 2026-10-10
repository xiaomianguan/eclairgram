.class Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
.super Ljava/lang/Object;
.source "AvatarCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/AvatarCache$BitmapCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CacheItem"
.end annotation


# instance fields
.field private drawable:Landroid/graphics/drawable/BitmapDrawable;

.field private hash:Ljava/lang/String;

.field private isSource:Z

.field final synthetic this$1:Lcom/google/android/talk/AvatarCache$BitmapCache;


# direct methods
.method constructor <init>(Lcom/google/android/talk/AvatarCache$BitmapCache;Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;Z)V
    .locals 0
    .param p2, "hash"    # Ljava/lang/String;
    .param p3, "drawable"    # Landroid/graphics/drawable/BitmapDrawable;
    .param p4, "isSource"    # Z

    .prologue
    .line 343
    iput-object p1, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->this$1:Lcom/google/android/talk/AvatarCache$BitmapCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 344
    iput-object p2, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->hash:Ljava/lang/String;

    .line 345
    iput-object p3, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->drawable:Landroid/graphics/drawable/BitmapDrawable;

    .line 346
    iput-boolean p4, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->isSource:Z

    .line 347
    return-void
.end method


# virtual methods
.method getDrawable()Landroid/graphics/drawable/BitmapDrawable;
    .locals 1

    .prologue
    .line 362
    monitor-enter p0

    .line 363
    :try_start_0
    iget-object v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->drawable:Landroid/graphics/drawable/BitmapDrawable;

    monitor-exit p0

    return-object v0

    .line 364
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getHash()Ljava/lang/String;
    .locals 1

    .prologue
    .line 350
    monitor-enter p0

    .line 351
    :try_start_0
    iget-object v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->hash:Ljava/lang/String;

    monitor-exit p0

    return-object v0

    .line 352
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method isSourceBitmap()Z
    .locals 1

    .prologue
    .line 374
    monitor-enter p0

    .line 375
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->isSource:Z

    monitor-exit p0

    return v0

    .line 376
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setDrawable(Landroid/graphics/drawable/BitmapDrawable;)V
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 368
    monitor-enter p0

    .line 369
    :try_start_0
    iput-object p1, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->drawable:Landroid/graphics/drawable/BitmapDrawable;

    .line 370
    monitor-exit p0

    .line 371
    return-void

    .line 370
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setHash(Ljava/lang/String;)V
    .locals 1
    .param p1, "hash"    # Ljava/lang/String;

    .prologue
    .line 356
    monitor-enter p0

    .line 357
    :try_start_0
    iput-object p1, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->hash:Ljava/lang/String;

    .line 358
    monitor-exit p0

    .line 359
    return-void

    .line 358
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setIsSourceBitmap(Z)V
    .locals 1
    .param p1, "isSource"    # Z

    .prologue
    .line 380
    monitor-enter p0

    .line 381
    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->isSource:Z

    .line 382
    monitor-exit p0

    .line 383
    return-void

    .line 382
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
