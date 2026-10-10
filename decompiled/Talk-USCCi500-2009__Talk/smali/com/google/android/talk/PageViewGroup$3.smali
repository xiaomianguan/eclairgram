.class Lcom/google/android/talk/PageViewGroup$3;
.super Ljava/lang/Object;
.source "PageViewGroup.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/PageViewGroup;->makeGestureDetector()Landroid/view/GestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/PageViewGroup;


# direct methods
.method constructor <init>(Lcom/google/android/talk/PageViewGroup;)V
    .locals 0

    .prologue
    .line 403
    iput-object p1, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private canGoLeft()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 323
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v1}, Lcom/google/android/talk/PageViewGroup;->access$300(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/talk/PageViewGroup$Adapter;->getCount()I

    move-result v0

    .line 324
    .local v0, "count":I
    if-le v0, v2, :cond_0

    move v1, v2

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private canGoRight()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 328
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v1}, Lcom/google/android/talk/PageViewGroup;->access$300(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/talk/PageViewGroup$Adapter;->getCount()I

    move-result v0

    .line 329
    .local v0, "count":I
    if-le v0, v2, :cond_0

    move v1, v2

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 318
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v0}, Lcom/google/android/talk/PageViewGroup;->access$200(Lcom/google/android/talk/PageViewGroup;)V

    .line 319
    const/4 v0, 0x1

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 4
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 337
    cmpl-float v0, p3, v1

    if-nez v0, :cond_0

    move v0, v2

    .line 347
    :goto_0
    return v0

    .line 341
    :cond_0
    cmpl-float v0, p3, v1

    if-lez v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup$3;->canGoLeft()Z

    move-result v0

    if-nez v0, :cond_1

    move v0, v2

    .line 342
    goto :goto_0

    .line 343
    :cond_1
    cmpg-float v0, p3, v1

    if-gez v0, :cond_2

    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup$3;->canGoRight()Z

    move-result v0

    if-nez v0, :cond_2

    move v0, v2

    .line 344
    goto :goto_0

    .line 346
    :cond_2
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    cmpg-float v1, p3, v1

    if-gez v1, :cond_3

    move v1, v3

    :goto_1
    invoke-static {v0, v1}, Lcom/google/android/talk/PageViewGroup;->access$400(Lcom/google/android/talk/PageViewGroup;Z)V

    move v0, v3

    .line 347
    goto :goto_0

    :cond_3
    move v1, v2

    .line 346
    goto :goto_1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 352
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 8
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x0

    .line 356
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v4}, Lcom/google/android/talk/PageViewGroup;->getScrollX()I

    move-result v4

    float-to-int v5, p3

    add-int v1, v4, v5

    .line 358
    .local v1, "target":I
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v4}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v4

    if-ge v1, v4, :cond_3

    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup$3;->canGoLeft()Z

    move-result v4

    if-nez v4, :cond_3

    .line 359
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v4}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v1

    .line 364
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v4, v1, v6}, Lcom/google/android/talk/PageViewGroup;->scrollTo(II)V

    .line 366
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v4}, Lcom/google/android/talk/PageViewGroup;->access$300(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v4}, Lcom/google/android/talk/PageViewGroup;->access$300(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/android/talk/PageViewGroup$Adapter;->getCount()I

    move-result v4

    if-ne v4, v7, :cond_2

    .line 382
    const/4 v0, 0x0

    .line 383
    .local v0, "swap":Z
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v4}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v3

    .line 384
    .local v3, "width":I
    if-ge v1, v3, :cond_4

    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v4}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v4

    aget-object v4, v4, v6

    instance-of v4, v4, Lcom/google/android/talk/PageViewGroup$ViewHolder;

    if-eqz v4, :cond_4

    .line 385
    const/4 v0, 0x1

    .line 389
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 390
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v4}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v4

    aget-object v2, v4, v6

    .line 391
    .local v2, "temp":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v4}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v5

    aget-object v5, v5, v7

    aput-object v5, v4, v6

    .line 392
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v4}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v4

    aput-object v2, v4, v7

    .line 394
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v4}, Lcom/google/android/talk/PageViewGroup;->requestLayout()V

    .line 397
    .end local v0    # "swap":Z
    .end local v2    # "temp":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .end local v3    # "width":I
    :cond_2
    const/4 v4, 0x1

    return v4

    .line 360
    :cond_3
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v4}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v4

    if-le v1, v4, :cond_0

    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup$3;->canGoRight()Z

    move-result v4

    if-nez v4, :cond_0

    .line 361
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v4}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v1

    goto :goto_0

    .line 386
    .restart local v0    # "swap":Z
    .restart local v3    # "width":I
    :cond_4
    if-le v1, v3, :cond_1

    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$3;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v4}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v4

    aget-object v4, v4, v7

    instance-of v4, v4, Lcom/google/android/talk/PageViewGroup$ViewHolder;

    if-eqz v4, :cond_1

    .line 387
    const/4 v0, 0x1

    goto :goto_1
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 401
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 404
    const/4 v0, 0x0

    return v0
.end method
