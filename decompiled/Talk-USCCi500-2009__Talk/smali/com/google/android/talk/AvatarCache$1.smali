.class Lcom/google/android/talk/AvatarCache$1;
.super Ljava/lang/Object;
.source "AvatarCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/AvatarCache;->startQueryThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 144
    const/16 v9, 0xa

    invoke-static {v9}, Landroid/os/Process;->setThreadPriority(I)V

    .line 146
    :cond_0
    :goto_0
    invoke-static {}, Lcom/google/android/talk/AvatarCache;->access$000()Z

    move-result v9

    if-nez v9, :cond_4

    .line 147
    const/4 v8, 0x0

    .line 148
    .local v8, "workItem":Lcom/google/android/talk/AvatarCache$WorkItem;
    invoke-static {}, Lcom/google/android/talk/AvatarCache;->access$100()Ljava/util/ArrayList;

    move-result-object v10

    monitor-enter v10

    .line 149
    :try_start_0
    invoke-static {}, Lcom/google/android/talk/AvatarCache;->access$100()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_3

    .line 150
    invoke-static {}, Lcom/google/android/talk/AvatarCache;->access$100()Ljava/util/ArrayList;

    move-result-object v9

    const/4 v11, 0x0

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object v0, v9

    check-cast v0, Lcom/google/android/talk/AvatarCache$WorkItem;

    move-object v8, v0

    .line 157
    :goto_1
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 159
    if-eqz v8, :cond_0

    .line 160
    iget-object v9, v8, Lcom/google/android/talk/AvatarCache$WorkItem;->mAvatarData:[B

    invoke-static {v9}, Lcom/google/android/talk/DatabaseUtils;->decodeAvatar([B)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 162
    .local v1, "b":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_2

    .line 163
    const/4 v5, 0x1

    .line 164
    .local v5, "isSource":Z
    iget v4, v8, Lcom/google/android/talk/AvatarCache$WorkItem;->mDesiredBitmapWidth:I

    .line 165
    .local v4, "dw":I
    iget v3, v8, Lcom/google/android/talk/AvatarCache$WorkItem;->mDesiredBitmapHeight:I

    .line 169
    .local v3, "dh":I
    if-lez v4, :cond_1

    if-lez v3, :cond_1

    .line 170
    invoke-static {v1, v4, v3, v12}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 171
    const/4 v5, 0x0

    .line 176
    :cond_1
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 177
    .local v2, "d":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v9, v8, Lcom/google/android/talk/AvatarCache$WorkItem;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    iget-object v10, v8, Lcom/google/android/talk/AvatarCache$WorkItem;->mUsername:Ljava/lang/String;

    iget-object v11, v8, Lcom/google/android/talk/AvatarCache$WorkItem;->mAvatarHash:Ljava/lang/String;

    invoke-virtual {v9, v10, v2, v11, v5}, Lcom/google/android/talk/AvatarCache$BitmapCache;->add(Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;Ljava/lang/String;Z)V

    .line 181
    .end local v2    # "d":Landroid/graphics/drawable/BitmapDrawable;
    .end local v3    # "dh":I
    .end local v4    # "dw":I
    .end local v5    # "isSource":Z
    :cond_2
    invoke-static {}, Lcom/google/android/talk/AvatarCache;->access$100()Ljava/util/ArrayList;

    move-result-object v9

    monitor-enter v9

    .line 182
    :try_start_1
    invoke-static {}, Lcom/google/android/talk/AvatarCache;->access$100()Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 183
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 185
    iget-object v7, v8, Lcom/google/android/talk/AvatarCache$WorkItem;->mAvatarLoadedMessage:Landroid/os/Message;

    .line 186
    .local v7, "message":Landroid/os/Message;
    if-eqz v7, :cond_0

    .line 187
    iget-object v6, v7, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v6, Ljava/util/HashMap;

    .line 188
    .local v6, "map":Ljava/util/HashMap;
    const-string v9, "bitmap"

    invoke-virtual {v6, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    invoke-virtual {v7}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 153
    .end local v1    # "b":Landroid/graphics/Bitmap;
    .end local v6    # "map":Ljava/util/HashMap;
    .end local v7    # "message":Landroid/os/Message;
    :cond_3
    :try_start_2
    invoke-static {}, Lcom/google/android/talk/AvatarCache;->access$100()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 154
    :catch_0
    move-exception v9

    goto :goto_1

    .line 157
    :catchall_0
    move-exception v9

    :try_start_3
    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v9

    .line 183
    .restart local v1    # "b":Landroid/graphics/Bitmap;
    :catchall_1
    move-exception v10

    :try_start_4
    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v10

    .line 195
    .end local v1    # "b":Landroid/graphics/Bitmap;
    .end local v8    # "workItem":Lcom/google/android/talk/AvatarCache$WorkItem;
    :cond_4
    return-void
.end method
