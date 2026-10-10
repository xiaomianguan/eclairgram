.class Lcom/google/android/talk/PictureCache$1;
.super Ljava/lang/Object;
.source "PictureCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/PictureCache;->startQueryThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    const/4 v11, 0x1

    const-string v12, "picasaweb.google.com"

    .line 180
    const/16 v8, 0xa

    invoke-static {v8}, Landroid/os/Process;->setThreadPriority(I)V

    .line 182
    :cond_0
    :goto_0
    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$000()Z

    move-result v8

    if-nez v8, :cond_8

    .line 183
    const/4 v7, 0x0

    .line 184
    .local v7, "workItem":Lcom/google/android/talk/PictureCache$WorkItem;
    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$100()Ljava/util/ArrayList;

    move-result-object v9

    monitor-enter v9

    .line 185
    :try_start_0
    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$100()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_3

    .line 186
    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$100()Ljava/util/ArrayList;

    move-result-object v8

    const/4 v10, 0x0

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Lcom/google/android/talk/PictureCache$WorkItem;

    move-object v7, v0

    .line 193
    :goto_1
    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    if-eqz v7, :cond_0

    .line 199
    iget-object v8, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 200
    .local v6, "uri":Landroid/net/Uri;
    invoke-virtual {v6}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 201
    .local v3, "host":Ljava/lang/String;
    const/4 v2, 0x0

    .line 203
    .local v2, "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    const-string v8, "www.flickr.com"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 207
    iget-object v8, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$200()I

    move-result v9

    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$300()I

    move-result v10

    invoke-static {v8, v9, v10}, Lcom/google/android/talk/PictureCache;->access$400(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v2

    .line 239
    :cond_1
    :goto_2
    if-nez v2, :cond_7

    .line 240
    new-instance v2, Lcom/google/android/talk/PictureCache$PictureData;

    .end local v2    # "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    iget-object v8, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-direct {v2, v8}, Lcom/google/android/talk/PictureCache$PictureData;-><init>(Ljava/lang/String;)V

    .line 241
    .restart local v2    # "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Lcom/google/android/talk/PictureCache$PictureData;->setDrawable(Landroid/graphics/drawable/BitmapDrawable;)V

    .line 245
    :cond_2
    :goto_3
    iget-object v8, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    invoke-virtual {v8, v2}, Lcom/google/android/talk/PictureCache$BitmapCache;->add(Lcom/google/android/talk/PictureCache$PictureData;)V

    .line 247
    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$100()Ljava/util/ArrayList;

    move-result-object v8

    monitor-enter v8

    .line 248
    :try_start_1
    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$100()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 249
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 255
    invoke-virtual {v2}, Lcom/google/android/talk/PictureCache$PictureData;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 256
    iget-object v5, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mPictureLoadedMessage:Landroid/os/Message;

    .line 257
    .local v5, "message":Landroid/os/Message;
    if-eqz v5, :cond_0

    .line 258
    iget-object v4, v5, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    .line 259
    .local v4, "map":Ljava/util/HashMap;
    const-string v8, "bitmap"

    invoke-virtual {v2}, Lcom/google/android/talk/PictureCache$PictureData;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 189
    .end local v2    # "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "map":Ljava/util/HashMap;
    .end local v5    # "message":Landroid/os/Message;
    .end local v6    # "uri":Landroid/net/Uri;
    :cond_3
    :try_start_2
    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$100()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 190
    :catch_0
    move-exception v8

    goto :goto_1

    .line 193
    :catchall_0
    move-exception v8

    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v8

    .line 208
    .restart local v2    # "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    .restart local v3    # "host":Ljava/lang/String;
    .restart local v6    # "uri":Landroid/net/Uri;
    :cond_4
    const-string v8, "picasaweb.google.com"

    invoke-virtual {v12, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 212
    iget-object v8, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$200()I

    move-result v9

    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$300()I

    move-result v10

    invoke-static {v8, v9, v10}, Lcom/google/android/talk/PictureCache;->access$500(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v2

    goto :goto_2

    .line 213
    :cond_5
    const-string v8, "picasaweb.google.com"

    invoke-virtual {v12, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 217
    const-string v8, "www.youtube.com"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 221
    iget-object v8, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$200()I

    move-result v9

    invoke-static {}, Lcom/google/android/talk/PictureCache;->access$300()I

    move-result v10

    invoke-static {v8, v9, v10}, Lcom/google/android/talk/PictureCache;->access$600(Ljava/lang/String;II)Lcom/google/android/talk/PictureCache$PictureData;

    move-result-object v2

    goto :goto_2

    .line 222
    :cond_6
    iget-object v8, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    const-string v9, ".jpg"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 226
    iget-object v8, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-static {v8}, Lcom/google/android/talk/PictureCache;->access$700(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 227
    .local v1, "bm":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_1

    .line 228
    new-instance v2, Lcom/google/android/talk/PictureCache$PictureData;

    .end local v2    # "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    iget-object v8, v7, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-direct {v2, v8}, Lcom/google/android/talk/PictureCache$PictureData;-><init>(Ljava/lang/String;)V

    .line 229
    .restart local v2    # "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    new-instance v8, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v8, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v2, v8}, Lcom/google/android/talk/PictureCache$PictureData;->setDrawable(Landroid/graphics/drawable/BitmapDrawable;)V

    .line 230
    invoke-virtual {v2, v11}, Lcom/google/android/talk/PictureCache$PictureData;->setType(I)V

    goto/16 :goto_2

    .line 242
    .end local v1    # "bm":Landroid/graphics/Bitmap;
    :cond_7
    invoke-virtual {v2}, Lcom/google/android/talk/PictureCache$PictureData;->getDrawable()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 243
    invoke-virtual {v2, v11}, Lcom/google/android/talk/PictureCache$PictureData;->setIsSourceBitmap(Z)V

    goto/16 :goto_3

    .line 249
    :catchall_1
    move-exception v9

    :try_start_4
    monitor-exit v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v9

    .line 278
    .end local v2    # "cacheItem":Lcom/google/android/talk/PictureCache$PictureData;
    .end local v3    # "host":Ljava/lang/String;
    .end local v6    # "uri":Landroid/net/Uri;
    .end local v7    # "workItem":Lcom/google/android/talk/PictureCache$WorkItem;
    :cond_8
    return-void
.end method
