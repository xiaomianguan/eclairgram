.class Lcom/google/android/talk/AvatarCache$WorkItem;
.super Ljava/lang/Object;
.source "AvatarCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/AvatarCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WorkItem"
.end annotation


# instance fields
.field mAccountId:J

.field mAvatarData:[B

.field mAvatarHash:Ljava/lang/String;

.field mAvatarLoadedMessage:Landroid/os/Message;

.field mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

.field mDesiredBitmapHeight:I

.field mDesiredBitmapWidth:I

.field mUsername:Ljava/lang/String;

.field final synthetic this$0:Lcom/google/android/talk/AvatarCache;


# direct methods
.method constructor <init>(Lcom/google/android/talk/AvatarCache;Ljava/lang/String;[BLjava/lang/String;JLcom/google/android/talk/AvatarCache$BitmapCache;IILandroid/os/Message;)V
    .locals 1
    .param p2, "username"    # Ljava/lang/String;
    .param p3, "avatarData"    # [B
    .param p4, "avatarHash"    # Ljava/lang/String;
    .param p5, "accountId"    # J
    .param p7, "cache"    # Lcom/google/android/talk/AvatarCache$BitmapCache;
    .param p8, "bitmapWidth"    # I
    .param p9, "bitmapHeight"    # I
    .param p10, "message"    # Landroid/os/Message;

    .prologue
    .line 579
    iput-object p1, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->this$0:Lcom/google/android/talk/AvatarCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 580
    iput-object p3, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mAvatarData:[B

    .line 581
    iput-object p4, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mAvatarHash:Ljava/lang/String;

    .line 582
    iput-object p2, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mUsername:Ljava/lang/String;

    .line 583
    iput-wide p5, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mAccountId:J

    .line 584
    iput-object p7, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mCache:Lcom/google/android/talk/AvatarCache$BitmapCache;

    .line 585
    iput p8, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mDesiredBitmapWidth:I

    .line 586
    iput p9, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mDesiredBitmapHeight:I

    .line 589
    if-eqz p10, :cond_0

    iget-object v0, p10, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 590
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p10, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 592
    :cond_0
    iput-object p10, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mAvatarLoadedMessage:Landroid/os/Message;

    .line 593
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 597
    move-object v0, p1

    check-cast v0, Lcom/google/android/talk/AvatarCache$WorkItem;

    move-object v1, v0

    .line 598
    .local v1, "otherWorkItem":Lcom/google/android/talk/AvatarCache$WorkItem;
    iget-object v2, v1, Lcom/google/android/talk/AvatarCache$WorkItem;->mUsername:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mUsername:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-wide v2, v1, Lcom/google/android/talk/AvatarCache$WorkItem;->mAccountId:J

    iget-wide v4, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mAccountId:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 604
    iget-object v0, p0, Lcom/google/android/talk/AvatarCache$WorkItem;->mUsername:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
