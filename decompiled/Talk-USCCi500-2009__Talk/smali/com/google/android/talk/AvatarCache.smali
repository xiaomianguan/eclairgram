.class public Lcom/google/android/talk/AvatarCache;
.super Ljava/lang/Object;
.source "AvatarCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/AvatarCache$WorkItem;,
        Lcom/google/android/talk/AvatarCache$BitmapCache;
    }
.end annotation


# static fields
.field public static final ARG_BITMAP_DRAWABLE:Ljava/lang/String; = "bitmap"

.field public static final ARG_IMAGE_VIEW:Ljava/lang/String; = "imageview"

.field private static final DBG:Z = false

.field private static final TAG:Ljava/lang/String; = "talk"

.field private static volatile sDone:Z

.field private static sInstances:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/google/android/talk/AvatarCache;",
            ">;"
        }
    .end annotation
.end field

.field private static sQueryThread:Ljava/lang/Thread;

.field private static sQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/talk/AvatarCache$WorkItem;",
            ">;"
        }
    .end annotation
.end field

.field private static sResolver:Landroid/content/ContentResolver;


# instance fields
.field private mAccountId:J

.field private mAvatarUri:Landroid/net/Uri;

.field private mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

.field private mNoAvatarList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/google/android/talk/AvatarCache;->sQueue:Ljava/util/ArrayList;

    .line 58
    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/talk/AvatarCache;->sDone:Z

    return-void
.end method

.method private constructor <init>(JJ)V
    .locals 6
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Lcom/google/android/talk/AvatarCache$BitmapCache;

    invoke-direct {v0, p0}, Lcom/google/android/talk/AvatarCache$BitmapCache;-><init>(Lcom/google/android/talk/AvatarCache;)V

    iput-object v0, p0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/AvatarCache;->mNoAvatarList:Ljava/util/ArrayList;

    .line 77
    sget-object v1, Landroid/provider/Im$Avatars;->CONTENT_URI_AVATARS_BY:Landroid/net/Uri;

    move-object v0, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/talk/AvatarCache;->computeAvatarUri(Landroid/net/Uri;JJ)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/AvatarCache;->mAvatarUri:Landroid/net/Uri;

    .line 78
    iput-wide p3, p0, Lcom/google/android/talk/AvatarCache;->mAccountId:J

    .line 79
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 38
    sget-boolean v0, Lcom/google/android/talk/AvatarCache;->sDone:Z

    return v0
.end method

.method static synthetic access$100()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/google/android/talk/AvatarCache;->sQueue:Ljava/util/ArrayList;

    return-object v0
.end method

.method private computeAvatarUri(Landroid/net/Uri;JJ)Landroid/net/Uri;
    .locals 3
    .param p1, "baseUri"    # Landroid/net/Uri;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J

    .prologue
    const/16 v2, 0x2f

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public static destroyAll(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 102
    sget-object v2, Lcom/google/android/talk/AvatarCache;->sInstances:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local p0    # "context":Landroid/content/Context;
    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 103
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcom/google/android/talk/AvatarCache;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/talk/AvatarCache;

    invoke-virtual {p0}, Lcom/google/android/talk/AvatarCache;->destroy()V

    goto :goto_0

    .line 106
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcom/google/android/talk/AvatarCache;>;"
    :cond_0
    const/4 v2, 0x0

    sput-object v2, Lcom/google/android/talk/AvatarCache;->sInstances:Ljava/util/HashMap;

    .line 107
    const/4 v2, 0x0

    sput-boolean v2, Lcom/google/android/talk/AvatarCache;->sDone:Z

    .line 108
    return-void
.end method

.method private findAvatarInCache(Ljava/lang/String;IILjava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;
    .locals 8
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "desiredWidth"    # I
    .param p3, "desiredHeight"    # I
    .param p4, "hash"    # Ljava/lang/String;

    .prologue
    .line 215
    const/4 v1, 0x0

    .line 217
    .local v1, "bd":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v6, p0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    monitor-enter v6

    .line 218
    :try_start_0
    iget-object v7, p0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    invoke-virtual {v7, p1}, Lcom/google/android/talk/AvatarCache$BitmapCache;->get(Ljava/lang/String;)Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;

    move-result-object v3

    .line 219
    .local v3, "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    if-eqz v3, :cond_1

    .line 220
    if-eqz p4, :cond_3

    invoke-virtual {v3}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->getHash()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 222
    invoke-virtual {v3}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v1

    .line 227
    if-lez p2, :cond_1

    if-lez p3, :cond_1

    .line 228
    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 229
    .local v0, "b":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 230
    .local v5, "w":I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 238
    .local v4, "h":I
    if-eq v5, p2, :cond_1

    if-eq v4, p3, :cond_1

    .line 239
    invoke-virtual {v3}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->isSourceBitmap()Z

    move-result v7

    if-nez v7, :cond_0

    if-lt v5, p2, :cond_2

    if-lt v4, p3, :cond_2

    .line 241
    :cond_0
    const/4 v7, 0x0

    invoke-static {v0, p2, p3, v7}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 246
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 247
    .end local v1    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    .local v2, "bd":Landroid/graphics/drawable/BitmapDrawable;
    :try_start_1
    invoke-virtual {v3, v2}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->setDrawable(Landroid/graphics/drawable/BitmapDrawable;)V

    .line 248
    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;->setIsSourceBitmap(Z)V

    .line 249
    iget-object v7, p0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    invoke-virtual {v7}, Lcom/google/android/talk/AvatarCache$BitmapCache;->recomputeCacheSize()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v1, v2

    .line 261
    .end local v0    # "b":Landroid/graphics/Bitmap;
    .end local v2    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    .end local v4    # "h":I
    .end local v5    # "w":I
    .restart local v1    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v6

    .line 263
    return-object v1

    .line 252
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    .restart local v4    # "h":I
    .restart local v5    # "w":I
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 258
    .end local v0    # "b":Landroid/graphics/Bitmap;
    .end local v4    # "h":I
    .end local v5    # "w":I
    :cond_3
    iget-object v7, p0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    invoke-virtual {v7, p1}, Lcom/google/android/talk/AvatarCache$BitmapCache;->clear(Ljava/lang/String;)V

    goto :goto_0

    .line 261
    .end local v3    # "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    :catchall_0
    move-exception v7

    :goto_1
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v7

    .end local v1    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    .restart local v2    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    .restart local v3    # "cacheItem":Lcom/google/android/talk/AvatarCache$BitmapCache$CacheItem;
    .restart local v4    # "h":I
    .restart local v5    # "w":I
    :catchall_1
    move-exception v7

    move-object v1, v2

    .end local v2    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    .restart local v1    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    goto :goto_1
.end method

.method public static getInstance(JJZ)Lcom/google/android/talk/AvatarCache;
    .locals 4
    .param p0, "providerId"    # J
    .param p2, "accountId"    # J
    .param p4, "createIfNotExist"    # Z

    .prologue
    const-wide/16 v2, 0x0

    .line 112
    cmp-long v1, p0, v2

    if-lez v1, :cond_0

    cmp-long v1, p2, v2

    if-gtz v1, :cond_1

    .line 114
    :cond_0
    const/4 v1, 0x0

    .line 127
    :goto_0
    return-object v1

    .line 117
    :cond_1
    sget-object v1, Lcom/google/android/talk/AvatarCache;->sInstances:Ljava/util/HashMap;

    if-nez v1, :cond_2

    .line 118
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "AvatarCache hasn\'t been initialized"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 121
    :cond_2
    sget-object v1, Lcom/google/android/talk/AvatarCache;->sInstances:Ljava/util/HashMap;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/talk/AvatarCache;

    .line 122
    .local v0, "cache":Lcom/google/android/talk/AvatarCache;
    if-nez v0, :cond_3

    if-eqz p4, :cond_3

    .line 123
    new-instance v0, Lcom/google/android/talk/AvatarCache;

    .end local v0    # "cache":Lcom/google/android/talk/AvatarCache;
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/google/android/talk/AvatarCache;-><init>(JJ)V

    .line 124
    .restart local v0    # "cache":Lcom/google/android/talk/AvatarCache;
    sget-object v1, Lcom/google/android/talk/AvatarCache;->sInstances:Ljava/util/HashMap;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    move-object v1, v0

    .line 127
    goto :goto_0
.end method

.method public static initialize(Lcom/google/android/talk/TalkApp;)V
    .locals 1
    .param p0, "app"    # Lcom/google/android/talk/TalkApp;

    .prologue
    .line 92
    sget-object v0, Lcom/google/android/talk/AvatarCache;->sInstances:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 99
    :goto_0
    return-void

    .line 96
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/talk/AvatarCache;->sInstances:Ljava/util/HashMap;

    .line 97
    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sput-object v0, Lcom/google/android/talk/AvatarCache;->sResolver:Landroid/content/ContentResolver;

    .line 98
    invoke-static {}, Lcom/google/android/talk/AvatarCache;->startQueryThread()V

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 334
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[AvatarCache] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    return-void
.end method

.method public static removeInstance(J)V
    .locals 3
    .param p0, "accountId"    # J

    .prologue
    .line 131
    sget-object v1, Lcom/google/android/talk/AvatarCache;->sInstances:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    .line 132
    sget-object v1, Lcom/google/android/talk/AvatarCache;->sInstances:Ljava/util/HashMap;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/talk/AvatarCache;

    .line 133
    .local v0, "instance":Lcom/google/android/talk/AvatarCache;
    if-eqz v0, :cond_0

    .line 134
    invoke-virtual {v0}, Lcom/google/android/talk/AvatarCache;->destroy()V

    .line 137
    .end local v0    # "instance":Lcom/google/android/talk/AvatarCache;
    :cond_0
    return-void
.end method

.method private static startQueryThread()V
    .locals 2

    .prologue
    .line 140
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/android/talk/AvatarCache$1;

    invoke-direct {v1}, Lcom/google/android/talk/AvatarCache$1;-><init>()V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    sput-object v0, Lcom/google/android/talk/AvatarCache;->sQueryThread:Ljava/lang/Thread;

    .line 198
    sget-object v0, Lcom/google/android/talk/AvatarCache;->sQueryThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 199
    return-void
.end method


# virtual methods
.method clear(Ljava/lang/String;)V
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    monitor-enter v0

    .line 208
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    invoke-virtual {v1, p1}, Lcom/google/android/talk/AvatarCache$BitmapCache;->clear(Ljava/lang/String;)V

    .line 209
    iget-object v1, p0, Lcom/google/android/talk/AvatarCache;->mNoAvatarList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 210
    monitor-exit v0

    .line 211
    return-void

    .line 210
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    invoke-virtual {v0}, Lcom/google/android/talk/AvatarCache$BitmapCache;->clearAll()V

    .line 203
    return-void
.end method

.method public getAvatar(Landroid/database/Cursor;IILjava/lang/String;IILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "hashColumn"    # I
    .param p3, "dataColumn"    # I
    .param p4, "username"    # Ljava/lang/String;
    .param p5, "desiredWidth"    # I
    .param p6, "desiredHeight"    # I
    .param p7, "defaultReturn"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 269
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 271
    .local v3, "hash":Ljava/lang/String;
    invoke-direct {p0, p4, p5, p6, v3}, Lcom/google/android/talk/AvatarCache;->findAvatarInCache(Ljava/lang/String;IILjava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v2

    .line 272
    .local v2, "drawable":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v2, :cond_0

    move-object v5, v2

    .line 297
    :goto_0
    return-object v5

    .line 277
    :cond_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    if-ltz p3, :cond_2

    .line 279
    invoke-static {p1, p3}, Lcom/google/android/talk/DatabaseUtils;->getAvatarFromCursor(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 281
    .local v0, "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_2

    .line 282
    const/4 v4, 0x1

    .line 284
    .local v4, "isSource":Z
    if-lez p5, :cond_1

    if-lez p6, :cond_1

    .line 285
    const/4 v5, 0x0

    invoke-static {v0, p5, p6, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 286
    const/4 v4, 0x0

    .line 290
    :cond_1
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 292
    .local v1, "d":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v5, p0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    invoke-virtual {v5, p4, v1, v3, v4}, Lcom/google/android/talk/AvatarCache$BitmapCache;->add(Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;Ljava/lang/String;Z)V

    move-object v5, v1

    .line 293
    goto :goto_0

    .end local v0    # "b":Landroid/graphics/Bitmap;
    .end local v1    # "d":Landroid/graphics/drawable/BitmapDrawable;
    .end local v4    # "isSource":Z
    :cond_2
    move-object v5, p7

    .line 297
    goto :goto_0
.end method

.method public getAvatarIfInCache(Landroid/database/Cursor;IILjava/lang/String;IILandroid/os/Message;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 17
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "hashColumn"    # I
    .param p3, "dataColumn"    # I
    .param p4, "username"    # Ljava/lang/String;
    .param p5, "desiredWidth"    # I
    .param p6, "desiredHeight"    # I
    .param p7, "message"    # Landroid/os/Message;
    .param p8, "defaultReturn"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 303
    invoke-interface/range {p1 .. p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 305
    .local v9, "hash":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move/from16 v2, p5

    move/from16 v3, p6

    move-object v4, v9

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/talk/AvatarCache;->findAvatarInCache(Ljava/lang/String;IILjava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v16

    .line 306
    .local v16, "drawable":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v16, :cond_0

    move-object/from16 v6, v16

    .line 329
    .end local v16    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    :goto_0
    return-object v6

    .line 311
    .restart local v16    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    :cond_0
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    if-ltz p3, :cond_2

    .line 315
    sget-object v16, Lcom/google/android/talk/AvatarCache;->sQueue:Ljava/util/ArrayList;

    .end local v16    # "drawable":Landroid/graphics/drawable/BitmapDrawable;
    monitor-enter v16

    .line 316
    :try_start_0
    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v8

    .line 318
    .local v8, "avatarData":[B
    new-instance v5, Lcom/google/android/talk/AvatarCache$WorkItem;

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/talk/AvatarCache;->mAccountId:J

    move-wide v10, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/AvatarCache;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    move-object v12, v0

    move-object/from16 v6, p0

    move-object/from16 v7, p4

    move/from16 v13, p5

    move/from16 v14, p6

    move-object/from16 v15, p7

    invoke-direct/range {v5 .. v15}, Lcom/google/android/talk/AvatarCache$WorkItem;-><init>(Lcom/google/android/talk/AvatarCache;Ljava/lang/String;[BLjava/lang/String;JLcom/google/android/talk/AvatarCache$BitmapCache;IILandroid/os/Message;)V

    .line 321
    .local v5, "w":Lcom/google/android/talk/AvatarCache$WorkItem;
    sget-object v6, Lcom/google/android/talk/AvatarCache;->sQueue:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 323
    sget-object v6, Lcom/google/android/talk/AvatarCache;->sQueue:Ljava/util/ArrayList;

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 324
    sget-object v6, Lcom/google/android/talk/AvatarCache;->sQueue:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/lang/Object;->notify()V

    .line 326
    :cond_1
    monitor-exit v16

    .end local v5    # "w":Lcom/google/android/talk/AvatarCache$WorkItem;
    .end local v8    # "avatarData":[B
    :cond_2
    move-object/from16 v6, p8

    .line 329
    goto :goto_0

    .line 326
    :catchall_0
    move-exception v6

    monitor-exit v16
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6
.end method

.method public getAvatarUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/google/android/talk/AvatarCache;->mAvatarUri:Landroid/net/Uri;

    return-object v0
.end method
