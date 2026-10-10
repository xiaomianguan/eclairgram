.class public Lcom/google/android/talk/PictureCache;
.super Ljava/lang/Object;
.source "PictureCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/PictureCache$WorkItem;,
        Lcom/google/android/talk/PictureCache$BitmapCache;,
        Lcom/google/android/talk/PictureCache$PictureData;
    }
.end annotation


# static fields
.field public static final ARG_BITMAP_DRAWABLE:Ljava/lang/String; = "bitmap"

.field public static final ARG_IMAGE_VIEW:Ljava/lang/String; = "imageview"

.field private static final ATTR_FARM:Ljava/lang/String; = "farm"

.field private static final ATTR_HEIGHT:Ljava/lang/String; = "height"

.field private static final ATTR_PHOTO_ID:Ljava/lang/String; = "id"

.field private static final ATTR_SECRET:Ljava/lang/String; = "secret"

.field private static final ATTR_SERVER:Ljava/lang/String; = "server"

.field private static final ATTR_URL:Ljava/lang/String; = "url"

.field private static final ATTR_WIDTH:Ljava/lang/String; = "width"

.field private static final BUFFER_SIZE:I = 0x1000

.field private static final DBG:Z = false

.field private static final FLICKR_API_KEY:Ljava/lang/String; = "c5ae0bd91eae2afd648ed0fd91a0589b"

.field private static HEIGHT:I = 0x0

.field public static final PICTURE_LOADED:I = 0x7b

.field private static final TAG:Ljava/lang/String; = "talk"

.field private static final TAG_DESCRIPTION:Ljava/lang/String; = "media:description"

.field private static final TAG_FLICKR_DESCRIPTION:Ljava/lang/String; = "description"

.field private static final TAG_FLICKR_TITLE:Ljava/lang/String; = "title"

.field private static final TAG_GROUP:Ljava/lang/String; = "media:group"

.field private static final TAG_PHOTO:Ljava/lang/String; = "photo"

.field private static final TAG_THUMBNAIL:Ljava/lang/String; = "media:thumbnail"

.field private static final TAG_TITLE:Ljava/lang/String; = "media:title"

.field private static WIDTH:I

.field private static final mLogLevel:I

.field private static sContentResolver:Landroid/content/ContentResolver;

.field private static volatile sDone:Z

.field private static sHttpClient:Lcom/google/android/net/GoogleHttpClient;

.field private static sInstances:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/google/android/talk/PictureCache;",
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
            "Lcom/google/android/talk/PictureCache$WorkItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAccountId:J

.field private mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

.field private mContact:Ljava/lang/String;

.field private mNoPictureList:Ljava/util/ArrayList;
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
    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/google/android/talk/PictureCache;->sQueue:Ljava/util/ArrayList;

    .line 84
    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/talk/PictureCache;->sDone:Z

    .line 86
    const/16 v0, 0x8e

    sput v0, Lcom/google/android/talk/PictureCache;->WIDTH:I

    .line 87
    const/16 v0, 0x6e

    sput v0, Lcom/google/android/talk/PictureCache;->HEIGHT:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;J)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "accountId"    # J

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    new-instance v0, Lcom/google/android/talk/PictureCache$BitmapCache;

    invoke-direct {v0, p0}, Lcom/google/android/talk/PictureCache$BitmapCache;-><init>(Lcom/google/android/talk/PictureCache;)V

    iput-object v0, p0, Lcom/google/android/talk/PictureCache;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    .line 101
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/PictureCache;->mNoPictureList:Ljava/util/ArrayList;

    .line 111
    iput-wide p2, p0, Lcom/google/android/talk/PictureCache;->mAccountId:J

    .line 112
    iput-object p1, p0, Lcom/google/android/talk/PictureCache;->mContact:Ljava/lang/String;

    .line 113
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 63
    sget-boolean v0, Lcom/google/android/talk/PictureCache;->sDone:Z

    return v0
.end method

.method static synthetic access$100()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/google/android/talk/PictureCache;->sQueue:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200()I
    .locals 1

    .prologue
    .line 63
    sget v0, Lcom/google/android/talk/PictureCache;->WIDTH:I

    return v0
.end method

.method static synthetic access$300()I
    .locals 1

    .prologue
    .line 63
    sget v0, Lcom/google/android/talk/PictureCache;->HEIGHT:I

    return v0
.end method

.method static synthetic access$400(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 63
    invoke-static {p0, p1, p2}, Lcom/google/android/talk/PictureCache;->getFlickrPicture(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 63
    invoke-static {p0, p1, p2}, Lcom/google/android/talk/PictureCache;->getPicasaPicture(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 63
    invoke-static {p0, p1, p2}, Lcom/google/android/talk/PictureCache;->getYouTubeThumbnail(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p0}, Lcom/google/android/talk/PictureCache;->getJpgPicture(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static allowScraping(Ljava/lang/String;)Z
    .locals 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 339
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 340
    .local v0, "uri":Landroid/net/Uri;
    const-string v1, "www.flickr.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/google/android/talk/PictureCache;->sContentResolver:Landroid/content/ContentResolver;

    const-string v2, "gtalk_flickr_photo_info_url"

    invoke-static {v1, v2}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    :cond_0
    const-string v1, "picasaweb.google.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/google/android/talk/PictureCache;->sContentResolver:Landroid/content/ContentResolver;

    const-string v2, "gtalk_picasa_album_url"

    invoke-static {v1, v2}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    :cond_1
    const-string v1, "www.youtube.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Lcom/google/android/talk/PictureCache;->sContentResolver:Landroid/content/ContentResolver;

    const-string v2, "gtalk_youtube_video_url"

    invoke-static {v1, v2}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".jpg"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "true"

    sget-object v2, Lcom/google/android/talk/PictureCache;->sContentResolver:Landroid/content/ContentResolver;

    const-string v3, "gtalk_url_scraping_for_jpg"

    invoke-static {v2, v3}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static destroyAll(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 128
    sget-object v2, Lcom/google/android/talk/PictureCache;->sInstances:Ljava/util/HashMap;

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

    .line 129
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcom/google/android/talk/PictureCache;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/talk/PictureCache;

    invoke-virtual {p0}, Lcom/google/android/talk/PictureCache;->destroy()V

    goto :goto_0

    .line 132
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcom/google/android/talk/PictureCache;>;"
    :cond_0
    const/4 v2, 0x0

    sput-object v2, Lcom/google/android/talk/PictureCache;->sInstances:Ljava/util/HashMap;

    .line 133
    const/4 v2, 0x1

    sput-boolean v2, Lcom/google/android/talk/PictureCache;->sDone:Z

    .line 135
    sget-object v2, Lcom/google/android/talk/PictureCache;->sHttpClient:Lcom/google/android/net/GoogleHttpClient;

    invoke-virtual {v2}, Lcom/google/android/net/GoogleHttpClient;->close()V

    .line 136
    return-void
.end method

.method private dumpStream(Ljava/net/URL;Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 462
    return-void
.end method

.method private findPictureDataInCache(Ljava/lang/String;IILjava/lang/String;)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "desiredWidth"    # I
    .param p3, "desiredHeight"    # I
    .param p4, "hash"    # Ljava/lang/String;

    .prologue
    .line 370
    const/4 v3, 0x0

    .line 372
    .local v3, "pictureData":Lcom/google/android/talk/PictureCache$PictureData;
    iget-object v5, p0, Lcom/google/android/talk/PictureCache;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    monitor-enter v5

    .line 373
    :try_start_0
    iget-object v6, p0, Lcom/google/android/talk/PictureCache;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    invoke-virtual {v6, p1}, Lcom/google/android/talk/PictureCache$BitmapCache;->get(Ljava/lang/String;)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v3

    .line 374
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/google/android/talk/PictureCache$PictureData;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 375
    if-eqz p4, :cond_2

    invoke-virtual {v3}, Lcom/google/android/talk/PictureCache$PictureData;->getHash()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 379
    invoke-virtual {v3}, Lcom/google/android/talk/PictureCache$PictureData;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v1

    .line 384
    .local v1, "bd":Landroid/graphics/drawable/BitmapDrawable;
    if-lez p2, :cond_1

    if-lez p3, :cond_1

    .line 385
    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 386
    .local v0, "b":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    .line 387
    .local v4, "w":I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 395
    .local v2, "h":I
    if-eq v4, p2, :cond_1

    if-eq v2, p3, :cond_1

    .line 396
    invoke-virtual {v3}, Lcom/google/android/talk/PictureCache$PictureData;->isSourceBitmap()Z

    move-result v6

    if-nez v6, :cond_0

    if-lt v4, p2, :cond_1

    if-lt v2, p3, :cond_1

    .line 398
    :cond_0
    const/4 v6, 0x0

    invoke-static {v0, p2, p3, v6}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 406
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    .end local v1    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    invoke-direct {v1, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 407
    .restart local v1    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {v3, v1}, Lcom/google/android/talk/PictureCache$PictureData;->setDrawable(Landroid/graphics/drawable/BitmapDrawable;)V

    .line 408
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Lcom/google/android/talk/PictureCache$PictureData;->setIsSourceBitmap(Z)V

    .line 409
    iget-object v6, p0, Lcom/google/android/talk/PictureCache;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    invoke-virtual {v6}, Lcom/google/android/talk/PictureCache$BitmapCache;->recomputeCacheSize()V

    .line 426
    .end local v0    # "b":Landroid/graphics/Bitmap;
    .end local v1    # "bd":Landroid/graphics/drawable/BitmapDrawable;
    .end local v2    # "h":I
    .end local v4    # "w":I
    :cond_1
    :goto_0
    monitor-exit v5

    .line 428
    return-object v3

    .line 423
    :cond_2
    iget-object v6, p0, Lcom/google/android/talk/PictureCache;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    invoke-virtual {v6, p1}, Lcom/google/android/talk/PictureCache$BitmapCache;->clear(Ljava/lang/String;)V

    goto :goto_0

    .line 426
    :catchall_0
    move-exception v6

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6
.end method

.method private static getFlickrPicture(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 10
    .param p0, "urlString"    # Ljava/lang/String;
    .param p1, "targetWidth"    # I
    .param p2, "targetHeight"    # I

    .prologue
    const/4 v9, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 1001
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 1005
    .local v4, "uri":Landroid/net/Uri;
    const-string v5, "www.flickr.com"

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    move-object v5, v8

    .line 1031
    :goto_0
    return-object v5

    .line 1012
    :cond_0
    invoke-virtual {v4}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    .line 1013
    .local v2, "pathSegs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x3

    if-eq v5, v6, :cond_1

    const-string v6, "photos"

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    move-object v5, v8

    .line 1018
    goto :goto_0

    .line 1020
    :cond_1
    sget-object v5, Lcom/google/android/talk/PictureCache;->sContentResolver:Landroid/content/ContentResolver;

    const-string v6, "gtalk_flickr_photo_info_url"

    invoke-static {v5, v6}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1022
    .local v0, "flickrPhotoInfoUrl":Ljava/lang/String;
    new-array v5, v9, [Ljava/lang/Object;

    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v7

    const/4 v6, 0x1

    const-string v7, "c5ae0bd91eae2afd648ed0fd91a0589b"

    aput-object v7, v5, v6

    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1027
    .local v1, "flickrUrl":Ljava/lang/String;
    invoke-static {v1}, Lcom/google/android/talk/PictureCache;->getReaderForUrl(Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v3

    .line 1028
    .local v3, "responseReader":Ljava/io/Reader;
    if-eqz v3, :cond_2

    .line 1029
    invoke-static {p0, v3, p1, p2}, Lcom/google/android/talk/PictureCache;->parseFlickrResponse(Ljava/lang/String;Ljava/io/Reader;II)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v5

    goto :goto_0

    :cond_2
    move-object v5, v8

    .line 1031
    goto :goto_0
.end method

.method private static getHttpContent(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 7
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1165
    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v1, p0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 1166
    .local v1, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    sget-object v4, Lcom/google/android/talk/PictureCache;->sHttpClient:Lcom/google/android/net/GoogleHttpClient;

    invoke-virtual {v4, v1}, Lcom/google/android/net/GoogleHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 1167
    .local v2, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    .line 1168
    .local v3, "status":I
    const/16 v4, 0xc8

    if-ne v3, v4, :cond_0

    .line 1169
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 1170
    .local v0, "body":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_0

    .line 1171
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v4

    return-object v4

    .line 1174
    .end local v0    # "body":Lorg/apache/http/HttpEntity;
    :cond_0
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to retrieve ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] with status "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static getInstance(Ljava/lang/String;JZ)Lcom/google/android/talk/PictureCache;
    .locals 3
    .param p0, "contact"    # Ljava/lang/String;
    .param p1, "accountId"    # J
    .param p3, "createIfNotExist"    # Z

    .prologue
    .line 144
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-gtz v1, :cond_1

    .line 148
    :cond_0
    const/4 v1, 0x0

    .line 161
    :goto_0
    return-object v1

    .line 151
    :cond_1
    sget-object v1, Lcom/google/android/talk/PictureCache;->sInstances:Ljava/util/HashMap;

    if-nez v1, :cond_2

    .line 152
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "PictureCache hasn\'t been initialized"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 155
    :cond_2
    sget-object v1, Lcom/google/android/talk/PictureCache;->sInstances:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/talk/PictureCache;

    .line 156
    .local v0, "cache":Lcom/google/android/talk/PictureCache;
    if-nez v0, :cond_3

    if-eqz p3, :cond_3

    .line 157
    new-instance v0, Lcom/google/android/talk/PictureCache;

    .end local v0    # "cache":Lcom/google/android/talk/PictureCache;
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/talk/PictureCache;-><init>(Ljava/lang/String;J)V

    .line 158
    .restart local v0    # "cache":Lcom/google/android/talk/PictureCache;
    sget-object v1, Lcom/google/android/talk/PictureCache;->sInstances:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    move-object v1, v0

    .line 161
    goto :goto_0
.end method

.method private static getJpgPicture(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 10
    .param p0, "urlStr"    # Ljava/lang/String;

    .prologue
    const/4 v9, -0x1

    const/4 v8, 0x0

    .line 285
    const/4 v2, 0x0

    .line 287
    .local v2, "image":Landroid/graphics/Bitmap;
    :try_start_0
    invoke-static {p0}, Lcom/google/android/talk/PictureCache;->getHttpContent(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 295
    .local v3, "inputStream":Ljava/io/InputStream;
    invoke-static {v3}, Lcom/google/android/talk/PictureCache;->getStreamData(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 297
    .local v0, "data":[B
    new-instance v3, Ljava/io/ByteArrayInputStream;

    .end local v3    # "inputStream":Ljava/io/InputStream;
    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 298
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    new-instance v4, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 299
    .local v4, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v7, 0x1

    iput-boolean v7, v4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 300
    const/4 v7, 0x0

    invoke-static {v3, v7, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 305
    .local v5, "trialImage":Landroid/graphics/Bitmap;
    iget v7, v4, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-eq v7, v9, :cond_0

    iget v7, v4, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-ne v7, v9, :cond_1

    :cond_0
    move-object v7, v8

    .line 335
    .end local v0    # "data":[B
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v5    # "trialImage":Landroid/graphics/Bitmap;
    :goto_0
    return-object v7

    .line 312
    .restart local v0    # "data":[B
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    .restart local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v5    # "trialImage":Landroid/graphics/Bitmap;
    :cond_1
    iget v7, v4, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    sget v8, Lcom/google/android/talk/PictureCache;->HEIGHT:I

    div-int v1, v7, v8

    .line 313
    .local v1, "hscale":I
    iget v7, v4, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    sget v8, Lcom/google/android/talk/PictureCache;->WIDTH:I

    div-int v6, v7, v8

    .line 314
    .local v6, "wscale":I
    invoke-static {v1, v6}, Ljava/lang/Math;->max(II)I

    move-result v7

    iput v7, v4, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    .line 315
    const/4 v7, 0x0

    iput-boolean v7, v4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 322
    new-instance v3, Ljava/io/ByteArrayInputStream;

    .end local v3    # "inputStream":Ljava/io/InputStream;
    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 323
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    const/4 v7, 0x0

    invoke-static {v3, v7, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 324
    if-nez v2, :cond_2

    .end local v0    # "data":[B
    .end local v1    # "hscale":I
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v5    # "trialImage":Landroid/graphics/Bitmap;
    .end local v6    # "wscale":I
    :cond_2
    :goto_1
    move-object v7, v2

    .line 335
    goto :goto_0

    .line 330
    :catch_0
    move-exception v7

    goto :goto_1
.end method

.method private static getPicasaPicture(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 12
    .param p0, "urlString"    # Ljava/lang/String;
    .param p1, "targetWidth"    # I
    .param p2, "targetHeight"    # I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 851
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 855
    .local v5, "uri":Landroid/net/Uri;
    const-string v6, "picasaweb.google.com"

    invoke-virtual {v5}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    move-object v6, v8

    .line 885
    :goto_0
    return-object v6

    .line 862
    :cond_0
    invoke-virtual {v5}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    .line 863
    .local v2, "pathSegs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-eq v6, v11, :cond_1

    move-object v6, v8

    .line 867
    goto :goto_0

    .line 869
    :cond_1
    sget-object v6, Lcom/google/android/talk/PictureCache;->sContentResolver:Landroid/content/ContentResolver;

    const-string v7, "gtalk_picasa_album_url"

    invoke-static {v6, v7}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 871
    .local v0, "albumUrl":Ljava/lang/String;
    new-array v6, v11, [Ljava/lang/Object;

    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v0, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 876
    .local v3, "picasaUrl":Ljava/lang/String;
    invoke-static {v3}, Lcom/google/android/talk/PictureCache;->getReaderForUrl(Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v4

    .line 877
    .local v4, "responseReader":Ljava/io/Reader;
    if-eqz v4, :cond_3

    .line 878
    invoke-static {p0, v4, p1, p2}, Lcom/google/android/talk/PictureCache;->parseGDataResponse(Ljava/lang/String;Ljava/io/Reader;II)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v1

    .line 880
    .local v1, "data":Lcom/google/android/talk/PictureCache$PictureData;
    if-eqz v1, :cond_2

    .line 881
    const/4 v6, 0x3

    invoke-virtual {v1, v6}, Lcom/google/android/talk/PictureCache$PictureData;->setType(I)V

    :cond_2
    move-object v6, v1

    .line 883
    goto :goto_0

    .end local v1    # "data":Lcom/google/android/talk/PictureCache$PictureData;
    :cond_3
    move-object v6, v8

    .line 885
    goto :goto_0
.end method

.method private static getReaderForUrl(Ljava/lang/String;)Ljava/io/Reader;
    .locals 2
    .param p0, "urlString"    # Ljava/lang/String;

    .prologue
    .line 890
    :try_start_0
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-static {p0}, Lcom/google/android/talk/PictureCache;->getHttpContent(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 896
    :goto_0
    return-object v0

    .line 891
    :catch_0
    move-exception v0

    .line 896
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getStreamData(Ljava/io/InputStream;)[B
    .locals 4
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1181
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1182
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v3, 0x1000

    new-array v2, v3, [B

    .line 1184
    .local v2, "readBuffer":[B
    :goto_0
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "nRead":I
    if-ltz v1, :cond_0

    .line 1185
    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 1187
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method private static getUserAgent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    const-string v0, "AndroidGoogleTalkAppHttp/1.0"

    return-object v0
.end method

.method private static getYouTubeThumbnail(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 9
    .param p0, "urlString"    # Ljava/lang/String;
    .param p1, "targetWidth"    # I
    .param p2, "targetHeight"    # I

    .prologue
    const/4 v8, 0x0

    .line 1127
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 1131
    .local v2, "uri":Landroid/net/Uri;
    const-string v6, "www.youtube.com"

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    move-object v6, v8

    .line 1161
    :goto_0
    return-object v6

    .line 1138
    :cond_0
    const-string v6, "v"

    invoke-virtual {v2, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1139
    .local v3, "videoId":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v6, v8

    .line 1143
    goto :goto_0

    .line 1145
    :cond_1
    sget-object v6, Lcom/google/android/talk/PictureCache;->sContentResolver:Landroid/content/ContentResolver;

    const-string v7, "gtalk_youtube_video_url"

    invoke-static {v6, v7}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1147
    .local v4, "youTubeGdataUrl":Ljava/lang/String;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 1152
    .local v5, "youtubeUrl":Ljava/lang/String;
    invoke-static {v5}, Lcom/google/android/talk/PictureCache;->getReaderForUrl(Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v1

    .line 1153
    .local v1, "responseReader":Ljava/io/Reader;
    if-eqz v1, :cond_3

    .line 1154
    invoke-static {p0, v1, p1, p2}, Lcom/google/android/talk/PictureCache;->parseGDataResponse(Ljava/lang/String;Ljava/io/Reader;II)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v0

    .line 1156
    .local v0, "data":Lcom/google/android/talk/PictureCache$PictureData;
    if-eqz v0, :cond_2

    .line 1157
    const/4 v6, 0x2

    invoke-virtual {v0, v6}, Lcom/google/android/talk/PictureCache$PictureData;->setType(I)V

    :cond_2
    move-object v6, v0

    .line 1159
    goto :goto_0

    .end local v0    # "data":Lcom/google/android/talk/PictureCache$PictureData;
    :cond_3
    move-object v6, v8

    .line 1161
    goto :goto_0
.end method

.method public static initialize(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 116
    sget-object v0, Lcom/google/android/talk/PictureCache;->sInstances:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 125
    :goto_0
    return-void

    .line 120
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/talk/PictureCache;->sInstances:Ljava/util/HashMap;

    .line 121
    invoke-static {}, Lcom/google/android/talk/PictureCache;->startQueryThread()V

    .line 123
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sput-object v0, Lcom/google/android/talk/PictureCache;->sContentResolver:Landroid/content/ContentResolver;

    .line 124
    new-instance v0, Lcom/google/android/net/GoogleHttpClient;

    invoke-static {}, Lcom/google/android/talk/PictureCache;->getUserAgent()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/google/android/net/GoogleHttpClient;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    sput-object v0, Lcom/google/android/talk/PictureCache;->sHttpClient:Lcom/google/android/net/GoogleHttpClient;

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 506
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[PictureCache] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    return-void
.end method

.method private static logw(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 510
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[PictureCache] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 511
    return-void
.end method

.method private static parseFlickrResponse(Ljava/lang/String;Ljava/io/Reader;II)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 7
    .param p0, "urlString"    # Ljava/lang/String;
    .param p1, "response"    # Ljava/io/Reader;
    .param p2, "targetWidth"    # I
    .param p3, "targetHeight"    # I

    .prologue
    .line 1058
    sget-object p2, Lcom/google/android/talk/PictureCache;->sContentResolver:Landroid/content/ContentResolver;

    .end local p2    # "targetWidth":I
    const-string p3, "gtalk_flickr_photo_url"

    .end local p3    # "targetHeight":I
    invoke-static {p2, p3}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1061
    .local p3, "flickrPhotoUrl":Ljava/lang/String;
    if-nez p3, :cond_0

    .line 1062
    const/4 p0, 0x0

    .line 1122
    .end local p0    # "urlString":Ljava/lang/String;
    .end local p1    # "response":Ljava/io/Reader;
    :goto_0
    return-object p0

    .line 1065
    .restart local p0    # "urlString":Ljava/lang/String;
    .restart local p1    # "response":Ljava/io/Reader;
    :cond_0
    new-instance p2, Lcom/google/android/talk/PictureCache$PictureData;

    invoke-direct {p2, p0}, Lcom/google/android/talk/PictureCache$PictureData;-><init>(Ljava/lang/String;)V

    .line 1068
    .local p2, "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object p0

    .line 1069
    .local p0, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {p0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v4

    .line 1071
    .local v4, "xpp":Lorg/xmlpull/v1/XmlPullParser;
    const/4 p0, 0x0

    .line 1072
    .local p0, "index":I
    const/4 v0, 0x0

    .line 1073
    .local v0, "thisTag":Ljava/lang/String;
    const p0, 0x7fffffff

    .line 1074
    .local p0, "diff":I
    const/4 p0, 0x0

    .line 1076
    .local p0, "bestThumbnailUrl":Ljava/lang/String;
    invoke-interface {v4, p1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 1077
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result p0

    .local p0, "eventType":I
    move p1, p0

    .end local p0    # "eventType":I
    .local p1, "eventType":I
    move-object p0, v0

    .line 1078
    .end local v0    # "thisTag":Ljava/lang/String;
    .local p0, "thisTag":Ljava/lang/String;
    :goto_1
    const/4 p0, 0x1

    if-eq p1, p0, :cond_3

    .line 1079
    .end local p0    # "thisTag":Ljava/lang/String;
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 1080
    .local v3, "thisTag":Ljava/lang/String;
    const/4 p0, 0x2

    if-ne p1, p0, :cond_5

    .line 1081
    const-string p0, "photo"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 1082
    const/4 p0, 0x0

    const-string v0, "secret"

    invoke-interface {v4, p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1083
    .local v1, "secret":Ljava/lang/String;
    const/4 p0, 0x0

    const-string v0, "server"

    invoke-interface {v4, p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1084
    .local v2, "server":Ljava/lang/String;
    const/4 p0, 0x0

    const-string v0, "farm"

    invoke-interface {v4, p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1085
    .local p0, "farm":Ljava/lang/String;
    const/4 v0, 0x0

    const-string v5, "id"

    invoke-interface {v4, v0, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1087
    .local v0, "photoId":Ljava/lang/String;
    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    const/4 p0, 0x1

    aput-object v2, v5, p0

    .end local p0    # "farm":Ljava/lang/String;
    const/4 p0, 0x2

    aput-object v0, v5, p0

    const/4 p0, 0x3

    aput-object v1, v5, p0

    invoke-static {p3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 1092
    .local p0, "photoUrl":Ljava/lang/String;
    invoke-static {p0}, Lcom/google/android/talk/PictureCache;->getJpgPicture(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 1093
    .local p0, "bm":Landroid/graphics/Bitmap;
    if-eqz p0, :cond_1

    .line 1094
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .end local v0    # "photoId":Ljava/lang/String;
    invoke-direct {v0, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p2, v0}, Lcom/google/android/talk/PictureCache$PictureData;->setDrawable(Landroid/graphics/drawable/BitmapDrawable;)V

    :cond_1
    move p0, p1

    .line 1110
    .end local v1    # "secret":Ljava/lang/String;
    .end local v2    # "server":Ljava/lang/String;
    .end local p1    # "eventType":I
    .local p0, "eventType":I
    :goto_2
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result p0

    move p1, p0

    .end local p0    # "eventType":I
    .restart local p1    # "eventType":I
    move-object p0, v3

    .end local v3    # "thisTag":Ljava/lang/String;
    .local p0, "thisTag":Ljava/lang/String;
    goto :goto_1

    .line 1096
    .end local p0    # "thisTag":Ljava/lang/String;
    .restart local v3    # "thisTag":Ljava/lang/String;
    :cond_2
    const-string p0, "description"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 1097
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result p0

    .line 1098
    .end local p1    # "eventType":I
    .local p0, "eventType":I
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/android/talk/PictureCache$PictureData;->setDescription(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 1112
    .end local v3    # "thisTag":Ljava/lang/String;
    .end local v4    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    .end local p0    # "eventType":I
    :catch_0
    move-exception p0

    .line 1121
    :cond_3
    :goto_3
    const/4 p0, 0x4

    invoke-virtual {p2, p0}, Lcom/google/android/talk/PictureCache$PictureData;->setType(I)V

    move-object p0, p2

    .line 1122
    goto/16 :goto_0

    .line 1102
    .restart local v3    # "thisTag":Ljava/lang/String;
    .restart local v4    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    .restart local p1    # "eventType":I
    :cond_4
    :try_start_1
    const-string p0, "title"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    .line 1103
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result p0

    .line 1104
    .end local p1    # "eventType":I
    .restart local p0    # "eventType":I
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/android/talk/PictureCache$PictureData;->setTitle(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 1116
    .end local v3    # "thisTag":Ljava/lang/String;
    .end local v4    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    .end local p0    # "eventType":I
    :catch_1
    move-exception p0

    goto :goto_3

    .restart local v3    # "thisTag":Ljava/lang/String;
    .restart local v4    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    .restart local p1    # "eventType":I
    :cond_5
    move p0, p1

    .end local p1    # "eventType":I
    .restart local p0    # "eventType":I
    goto :goto_2
.end method

.method private static parseGDataResponse(Ljava/lang/String;Ljava/io/Reader;II)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 10
    .param p0, "urlString"    # Ljava/lang/String;
    .param p1, "response"    # Ljava/io/Reader;
    .param p2, "targetWidth"    # I
    .param p3, "targetHeight"    # I

    .prologue
    .line 925
    new-instance v0, Lcom/google/android/talk/PictureCache$PictureData;

    invoke-direct {v0, p0}, Lcom/google/android/talk/PictureCache$PictureData;-><init>(Ljava/lang/String;)V

    .line 928
    .local v0, "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object p0

    .line 929
    .local p0, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {p0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v7

    .line 931
    .local v7, "xpp":Lorg/xmlpull/v1/XmlPullParser;
    const/4 p0, 0x0

    .line 932
    .local p0, "index":I
    const/4 v4, 0x0

    .line 933
    .local v4, "thisTag":Ljava/lang/String;
    const v1, 0x7fffffff

    .line 934
    .local v1, "diff":I
    const/4 p0, 0x0

    .line 935
    .local p0, "bestThumbnailUrl":Ljava/lang/String;
    const/4 v3, 0x0

    .line 936
    .local v3, "gotThumbnail":Z
    const/4 v2, 0x0

    .line 938
    .local v2, "gotDescription":Z
    invoke-interface {v7, p1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 939
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result p1

    .local p1, "eventType":I
    move v9, p1

    .end local p1    # "eventType":I
    .local v9, "eventType":I
    move-object p1, v4

    .end local v4    # "thisTag":Ljava/lang/String;
    .local p1, "thisTag":Ljava/lang/String;
    move v4, v3

    .end local v3    # "gotThumbnail":Z
    .local v4, "gotThumbnail":Z
    move v3, v2

    .end local v2    # "gotDescription":Z
    .local v3, "gotDescription":Z
    move v2, v9

    .line 940
    .end local v9    # "eventType":I
    .local v2, "eventType":I
    :goto_0
    const/4 p1, 0x1

    if-eq v2, p1, :cond_5

    .end local p1    # "thisTag":Ljava/lang/String;
    if-eqz v3, :cond_0

    if-nez v4, :cond_5

    .line 942
    :cond_0
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 943
    .local v5, "thisTag":Ljava/lang/String;
    const/4 p1, 0x2

    if-ne v2, p1, :cond_3

    .line 944
    const-string p1, "media:thumbnail"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 945
    const/4 p1, 0x0

    const-string v6, "height"

    invoke-interface {v7, p1, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    .line 946
    .local p1, "height":I
    const/4 v6, 0x0

    const-string v8, "width"

    invoke-interface {v7, v6, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 951
    .local v6, "width":I
    sub-int/2addr p1, p3

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .end local p1    # "height":I
    move-result p1

    sub-int/2addr v6, p2

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .end local v6    # "width":I
    move-result v6

    invoke-static {p1, v6}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 953
    .local p1, "newDiff":I
    if-ge p1, v1, :cond_8

    .line 954
    move p1, p1

    .line 955
    .end local v1    # "diff":I
    .local p1, "diff":I
    const/4 p0, 0x0

    const-string v1, "url"

    .end local p0    # "bestThumbnailUrl":Ljava/lang/String;
    invoke-interface {v7, p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .restart local p0    # "bestThumbnailUrl":Ljava/lang/String;
    :goto_1
    move v1, v2

    .end local v2    # "eventType":I
    .local v1, "eventType":I
    move v2, v3

    .end local v3    # "gotDescription":Z
    .local v2, "gotDescription":Z
    move v3, v4

    .end local v4    # "gotThumbnail":Z
    .local v3, "gotThumbnail":Z
    move-object v4, v5

    .line 985
    .end local v5    # "thisTag":Ljava/lang/String;
    .local v4, "thisTag":Ljava/lang/String;
    :goto_2
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    move v9, v1

    .end local v1    # "eventType":I
    .restart local v9    # "eventType":I
    move v1, p1

    .end local p1    # "diff":I
    .local v1, "diff":I
    move-object p1, v4

    .end local v4    # "thisTag":Ljava/lang/String;
    .local p1, "thisTag":Ljava/lang/String;
    move v4, v3

    .end local v3    # "gotThumbnail":Z
    .local v4, "gotThumbnail":Z
    move v3, v2

    .end local v2    # "gotDescription":Z
    .local v3, "gotDescription":Z
    move v2, v9

    .end local v9    # "eventType":I
    .local v2, "eventType":I
    goto :goto_0

    .line 957
    .end local p1    # "thisTag":Ljava/lang/String;
    .restart local v5    # "thisTag":Ljava/lang/String;
    :cond_1
    const-string p1, "media:description"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 958
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result p1

    .line 959
    .end local v2    # "eventType":I
    .local p1, "eventType":I
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/talk/PictureCache$PictureData;->setDescription(Ljava/lang/String;)V

    .line 963
    const/4 v2, 0x1

    .end local v3    # "gotDescription":Z
    .local v2, "gotDescription":Z
    move v3, v4

    .end local v4    # "gotThumbnail":Z
    .local v3, "gotThumbnail":Z
    move-object v4, v5

    .end local v5    # "thisTag":Ljava/lang/String;
    .local v4, "thisTag":Ljava/lang/String;
    move v9, v1

    .end local v1    # "diff":I
    .local v9, "diff":I
    move v1, p1

    .end local p1    # "eventType":I
    .local v1, "eventType":I
    move p1, v9

    .end local v9    # "diff":I
    .local p1, "diff":I
    goto :goto_2

    .line 964
    .end local p1    # "diff":I
    .local v1, "diff":I
    .local v2, "eventType":I
    .local v3, "gotDescription":Z
    .local v4, "gotThumbnail":Z
    .restart local v5    # "thisTag":Ljava/lang/String;
    :cond_2
    const-string p1, "media:title"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 965
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result p1

    .line 966
    .end local v2    # "eventType":I
    .local p1, "eventType":I
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/talk/PictureCache$PictureData;->setTitle(Ljava/lang/String;)V

    move v2, v3

    .end local v3    # "gotDescription":Z
    .local v2, "gotDescription":Z
    move v3, v4

    .end local v4    # "gotThumbnail":Z
    .local v3, "gotThumbnail":Z
    move-object v4, v5

    .end local v5    # "thisTag":Ljava/lang/String;
    .local v4, "thisTag":Ljava/lang/String;
    move v9, v1

    .end local v1    # "diff":I
    .restart local v9    # "diff":I
    move v1, p1

    .end local p1    # "eventType":I
    .local v1, "eventType":I
    move p1, v9

    .end local v9    # "diff":I
    .local p1, "diff":I
    goto :goto_2

    .line 971
    .end local p1    # "diff":I
    .local v1, "diff":I
    .local v2, "eventType":I
    .local v3, "gotDescription":Z
    .local v4, "gotThumbnail":Z
    .restart local v5    # "thisTag":Ljava/lang/String;
    :cond_3
    const/4 p1, 0x3

    if-ne v2, p1, :cond_7

    .line 972
    const-string p1, "media:group"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    if-eqz p0, :cond_6

    .line 973
    invoke-static {p0}, Lcom/google/android/talk/PictureCache;->getJpgPicture(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 977
    .local p1, "bm":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_4

    .line 978
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;

    .end local v4    # "gotThumbnail":Z
    invoke-direct {v4, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v4}, Lcom/google/android/talk/PictureCache$PictureData;->setDrawable(Landroid/graphics/drawable/BitmapDrawable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 980
    :cond_4
    const/4 p1, 0x1

    .line 983
    .local p1, "gotThumbnail":Z
    :goto_3
    const/4 v4, 0x0

    .end local v5    # "thisTag":Ljava/lang/String;
    .local v4, "thisTag":Ljava/lang/String;
    move v9, v2

    .end local v2    # "eventType":I
    .local v9, "eventType":I
    move v2, v3

    .end local v3    # "gotDescription":Z
    .local v2, "gotDescription":Z
    move v3, p1

    .end local p1    # "gotThumbnail":Z
    .local v3, "gotThumbnail":Z
    move p1, v1

    .end local v1    # "diff":I
    .local p1, "diff":I
    move v1, v9

    .end local v9    # "eventType":I
    .local v1, "eventType":I
    goto :goto_2

    .line 991
    .end local v1    # "eventType":I
    .end local v2    # "gotDescription":Z
    .end local v3    # "gotThumbnail":Z
    .end local v4    # "thisTag":Ljava/lang/String;
    .end local v7    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    .end local p0    # "bestThumbnailUrl":Ljava/lang/String;
    .end local p1    # "diff":I
    :catch_0
    move-exception p0

    .line 996
    :cond_5
    :goto_4
    return-object v0

    .line 987
    :catch_1
    move-exception p0

    goto :goto_4

    .local v1, "diff":I
    .local v2, "eventType":I
    .local v3, "gotDescription":Z
    .local v4, "gotThumbnail":Z
    .restart local v5    # "thisTag":Ljava/lang/String;
    .restart local v7    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    .restart local p0    # "bestThumbnailUrl":Ljava/lang/String;
    :cond_6
    move p1, v4

    .end local v4    # "gotThumbnail":Z
    .local p1, "gotThumbnail":Z
    goto :goto_3

    .end local p1    # "gotThumbnail":Z
    .restart local v4    # "gotThumbnail":Z
    :cond_7
    move p1, v1

    .end local v1    # "diff":I
    .local p1, "diff":I
    move v1, v2

    .end local v2    # "eventType":I
    .local v1, "eventType":I
    move v2, v3

    .end local v3    # "gotDescription":Z
    .local v2, "gotDescription":Z
    move v3, v4

    .end local v4    # "gotThumbnail":Z
    .local v3, "gotThumbnail":Z
    move-object v4, v5

    .end local v5    # "thisTag":Ljava/lang/String;
    .local v4, "thisTag":Ljava/lang/String;
    goto :goto_2

    .local v1, "diff":I
    .local v2, "eventType":I
    .local v3, "gotDescription":Z
    .local v4, "gotThumbnail":Z
    .restart local v5    # "thisTag":Ljava/lang/String;
    .local p1, "newDiff":I
    :cond_8
    move p1, v1

    .end local v1    # "diff":I
    .local p1, "diff":I
    goto :goto_1
.end method

.method public static removeInstance(J)V
    .locals 3
    .param p0, "accountId"    # J

    .prologue
    .line 165
    sget-object v1, Lcom/google/android/talk/PictureCache;->sInstances:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    .line 166
    sget-object v1, Lcom/google/android/talk/PictureCache;->sInstances:Ljava/util/HashMap;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/talk/PictureCache;

    .line 167
    .local v0, "instance":Lcom/google/android/talk/PictureCache;
    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {v0}, Lcom/google/android/talk/PictureCache;->destroy()V

    .line 171
    .end local v0    # "instance":Lcom/google/android/talk/PictureCache;
    :cond_0
    return-void
.end method

.method private static startQueryThread()V
    .locals 2

    .prologue
    .line 174
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/android/talk/PictureCache$1;

    invoke-direct {v1}, Lcom/google/android/talk/PictureCache$1;-><init>()V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    sput-object v0, Lcom/google/android/talk/PictureCache;->sQueryThread:Ljava/lang/Thread;

    .line 281
    sget-object v0, Lcom/google/android/talk/PictureCache;->sQueryThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 282
    return-void
.end method


# virtual methods
.method clear(Ljava/lang/String;)V
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 362
    iget-object v0, p0, Lcom/google/android/talk/PictureCache;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    monitor-enter v0

    .line 363
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/PictureCache;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    invoke-virtual {v1, p1}, Lcom/google/android/talk/PictureCache$BitmapCache;->clear(Ljava/lang/String;)V

    .line 364
    iget-object v1, p0, Lcom/google/android/talk/PictureCache;->mNoPictureList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 365
    monitor-exit v0

    .line 366
    return-void

    .line 365
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
    .line 355
    iget-object v0, p0, Lcom/google/android/talk/PictureCache;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    invoke-virtual {v0}, Lcom/google/android/talk/PictureCache$BitmapCache;->clearAll()V

    .line 356
    return-void
.end method

.method public getPictureDataIfInCache(Ljava/lang/String;IILandroid/os/Handler;Lcom/google/android/talk/PictureCache$PictureData;)Lcom/google/android/talk/PictureCache$PictureData;
    .locals 10
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "desiredWidth"    # I
    .param p3, "desiredHeight"    # I
    .param p4, "handler"    # Landroid/os/Handler;
    .param p5, "defaultReturn"    # Lcom/google/android/talk/PictureCache$PictureData;

    .prologue
    .line 467
    invoke-direct {p0, p1, p2, p3, p1}, Lcom/google/android/talk/PictureCache;->findPictureDataInCache(Ljava/lang/String;IILjava/lang/String;)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v8

    .line 471
    .local v8, "pictureData":Lcom/google/android/talk/PictureCache$PictureData;
    if-eqz v8, :cond_0

    move-object v1, v8

    .line 501
    :goto_0
    return-object v1

    .line 475
    :cond_0
    new-instance v6, Landroid/os/Message;

    invoke-direct {v6}, Landroid/os/Message;-><init>()V

    .line 476
    .local v6, "message":Landroid/os/Message;
    const/16 v1, 0x7b

    iput v1, v6, Landroid/os/Message;->what:I

    .line 477
    invoke-virtual {v6, p4}, Landroid/os/Message;->setTarget(Landroid/os/Handler;)V

    .line 481
    sget-object v9, Lcom/google/android/talk/PictureCache;->sQueue:Ljava/util/ArrayList;

    monitor-enter v9

    .line 482
    :try_start_0
    new-instance v0, Lcom/google/android/talk/PictureCache$WorkItem;

    iget-object v3, p0, Lcom/google/android/talk/PictureCache;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/google/android/talk/PictureCache$WorkItem;-><init>(Lcom/google/android/talk/PictureCache;Ljava/lang/String;Lcom/google/android/talk/PictureCache$BitmapCache;IILandroid/os/Message;)V

    .line 485
    .local v0, "w":Lcom/google/android/talk/PictureCache$WorkItem;
    sget-object v1, Lcom/google/android/talk/PictureCache;->sQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 489
    sget-object v1, Lcom/google/android/talk/PictureCache;->sQueue:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 490
    sget-object v1, Lcom/google/android/talk/PictureCache;->sQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 499
    :goto_1
    monitor-exit v9

    move-object v1, p5

    .line 501
    goto :goto_0

    .line 496
    :cond_1
    sget-object v1, Lcom/google/android/talk/PictureCache;->sQueue:Ljava/util/ArrayList;

    sget-object v2, Lcom/google/android/talk/PictureCache;->sQueue:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/talk/PictureCache$WorkItem;

    .line 497
    .local v7, "orig":Lcom/google/android/talk/PictureCache$WorkItem;
    iput-object v6, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mPictureLoadedMessage:Landroid/os/Message;

    goto :goto_1

    .line 499
    .end local v0    # "w":Lcom/google/android/talk/PictureCache$WorkItem;
    .end local v7    # "orig":Lcom/google/android/talk/PictureCache$WorkItem;
    :catchall_0
    move-exception v1

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
