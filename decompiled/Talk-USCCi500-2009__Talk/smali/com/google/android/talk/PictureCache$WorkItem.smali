.class Lcom/google/android/talk/PictureCache$WorkItem;
.super Ljava/lang/Object;
.source "PictureCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/PictureCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WorkItem"
.end annotation


# instance fields
.field mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

.field mDesiredBitmapHeight:I

.field mDesiredBitmapWidth:I

.field mPictureLoadedMessage:Landroid/os/Message;

.field mUrl:Ljava/lang/String;

.field final synthetic this$0:Lcom/google/android/talk/PictureCache;


# direct methods
.method constructor <init>(Lcom/google/android/talk/PictureCache;Ljava/lang/String;Lcom/google/android/talk/PictureCache$BitmapCache;IILandroid/os/Message;)V
    .locals 1
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "cache"    # Lcom/google/android/talk/PictureCache$BitmapCache;
    .param p4, "bitmapWidth"    # I
    .param p5, "bitmapHeight"    # I
    .param p6, "message"    # Landroid/os/Message;

    .prologue
    .line 824
    iput-object p1, p0, Lcom/google/android/talk/PictureCache$WorkItem;->this$0:Lcom/google/android/talk/PictureCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 825
    iput-object p2, p0, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    .line 826
    iput-object p3, p0, Lcom/google/android/talk/PictureCache$WorkItem;->mCache:Lcom/google/android/talk/PictureCache$BitmapCache;

    .line 827
    iput p4, p0, Lcom/google/android/talk/PictureCache$WorkItem;->mDesiredBitmapWidth:I

    .line 828
    iput p5, p0, Lcom/google/android/talk/PictureCache$WorkItem;->mDesiredBitmapHeight:I

    .line 831
    if-eqz p6, :cond_0

    iget-object v0, p6, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 832
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 834
    :cond_0
    iput-object p6, p0, Lcom/google/android/talk/PictureCache$WorkItem;->mPictureLoadedMessage:Landroid/os/Message;

    .line 835
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 839
    move-object v0, p1

    check-cast v0, Lcom/google/android/talk/PictureCache$WorkItem;

    move-object v1, v0

    .line 840
    .local v1, "otherWorkItem":Lcom/google/android/talk/PictureCache$WorkItem;
    iget-object v2, v1, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 845
    iget-object v0, p0, Lcom/google/android/talk/PictureCache$WorkItem;->mUrl:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
