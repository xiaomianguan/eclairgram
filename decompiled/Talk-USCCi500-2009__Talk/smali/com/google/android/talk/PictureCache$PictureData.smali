.class Lcom/google/android/talk/PictureCache$PictureData;
.super Ljava/lang/Object;
.source "PictureCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/PictureCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PictureData"
.end annotation


# static fields
.field public static final FLICKR_TYPE:I = 0x4

.field public static final JPG_TYPE:I = 0x1

.field public static final PICASA_TYPE:I = 0x3

.field public static final YOUTUBE_TYPE:I = 0x2


# instance fields
.field private mDescription:Ljava/lang/String;

.field private mDrawable:Landroid/graphics/drawable/BitmapDrawable;

.field private mHash:Ljava/lang/String;

.field private mIsSource:Z

.field private mTitle:Ljava/lang/String;

.field private mType:I


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "hash"    # Ljava/lang/String;

    .prologue
    .line 527
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 528
    iput-object p1, p0, Lcom/google/android/talk/PictureCache$PictureData;->mHash:Ljava/lang/String;

    .line 529
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;Z)V
    .locals 0
    .param p1, "hash"    # Ljava/lang/String;
    .param p2, "drawable"    # Landroid/graphics/drawable/BitmapDrawable;
    .param p3, "isSource"    # Z

    .prologue
    .line 531
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 532
    iput-object p1, p0, Lcom/google/android/talk/PictureCache$PictureData;->mHash:Ljava/lang/String;

    .line 533
    iput-object p2, p0, Lcom/google/android/talk/PictureCache$PictureData;->mDrawable:Landroid/graphics/drawable/BitmapDrawable;

    .line 534
    iput-boolean p3, p0, Lcom/google/android/talk/PictureCache$PictureData;->mIsSource:Z

    .line 535
    return-void
.end method


# virtual methods
.method getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 586
    monitor-enter p0

    .line 587
    :try_start_0
    iget-object v0, p0, Lcom/google/android/talk/PictureCache$PictureData;->mDescription:Ljava/lang/String;

    monitor-exit p0

    return-object v0

    .line 588
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getDrawable()Landroid/graphics/drawable/BitmapDrawable;
    .locals 1

    .prologue
    .line 562
    monitor-enter p0

    .line 563
    :try_start_0
    iget-object v0, p0, Lcom/google/android/talk/PictureCache$PictureData;->mDrawable:Landroid/graphics/drawable/BitmapDrawable;

    monitor-exit p0

    return-object v0

    .line 564
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
    .line 538
    monitor-enter p0

    .line 539
    :try_start_0
    iget-object v0, p0, Lcom/google/android/talk/PictureCache$PictureData;->mHash:Ljava/lang/String;

    monitor-exit p0

    return-object v0

    .line 540
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 574
    monitor-enter p0

    .line 575
    :try_start_0
    iget-object v0, p0, Lcom/google/android/talk/PictureCache$PictureData;->mTitle:Ljava/lang/String;

    monitor-exit p0

    return-object v0

    .line 576
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getType()I
    .locals 1

    .prologue
    .line 550
    monitor-enter p0

    .line 551
    :try_start_0
    iget v0, p0, Lcom/google/android/talk/PictureCache$PictureData;->mType:I

    monitor-exit p0

    return v0

    .line 552
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
    .line 598
    monitor-enter p0

    .line 599
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/talk/PictureCache$PictureData;->mIsSource:Z

    monitor-exit p0

    return v0

    .line 600
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setDescription(Ljava/lang/String;)V
    .locals 1
    .param p1, "d"    # Ljava/lang/String;

    .prologue
    .line 592
    monitor-enter p0

    .line 593
    :try_start_0
    iput-object p1, p0, Lcom/google/android/talk/PictureCache$PictureData;->mDescription:Ljava/lang/String;

    .line 594
    monitor-exit p0

    .line 595
    return-void

    .line 594
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
    .line 568
    monitor-enter p0

    .line 569
    :try_start_0
    iput-object p1, p0, Lcom/google/android/talk/PictureCache$PictureData;->mDrawable:Landroid/graphics/drawable/BitmapDrawable;

    .line 570
    monitor-exit p0

    .line 571
    return-void

    .line 570
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
    .line 544
    monitor-enter p0

    .line 545
    :try_start_0
    iput-object p1, p0, Lcom/google/android/talk/PictureCache$PictureData;->mHash:Ljava/lang/String;

    .line 546
    monitor-exit p0

    .line 547
    return-void

    .line 546
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
    .line 604
    monitor-enter p0

    .line 605
    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/talk/PictureCache$PictureData;->mIsSource:Z

    .line 606
    monitor-exit p0

    .line 607
    return-void

    .line 606
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setTitle(Ljava/lang/String;)V
    .locals 1
    .param p1, "d"    # Ljava/lang/String;

    .prologue
    .line 580
    monitor-enter p0

    .line 581
    :try_start_0
    iput-object p1, p0, Lcom/google/android/talk/PictureCache$PictureData;->mTitle:Ljava/lang/String;

    .line 582
    monitor-exit p0

    .line 583
    return-void

    .line 582
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setType(I)V
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 556
    monitor-enter p0

    .line 557
    :try_start_0
    iput p1, p0, Lcom/google/android/talk/PictureCache$PictureData;->mType:I

    .line 558
    monitor-exit p0

    .line 559
    return-void

    .line 558
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x2c

    .line 610
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 611
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "[PictureData: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    const-string v1, "drawable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/PictureCache$PictureData;->mDrawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 613
    const-string v1, "hash="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/PictureCache$PictureData;->mHash:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 614
    const-string v1, "desc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/PictureCache$PictureData;->mDescription:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 615
    const-string v1, "title="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/PictureCache$PictureData;->mTitle:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 616
    const-string v1, "type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/talk/PictureCache$PictureData;->mType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 617
    const-string v1, "isSource="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/android/talk/PictureCache$PictureData;->mIsSource:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 618
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
