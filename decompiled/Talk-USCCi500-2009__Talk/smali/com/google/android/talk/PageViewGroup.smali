.class public Lcom/google/android/talk/PageViewGroup;
.super Landroid/view/ViewGroup;
.source "PageViewGroup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/PageViewGroup$ViewHolder;,
        Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;,
        Lcom/google/android/talk/PageViewGroup$Adapter;,
        Lcom/google/android/talk/PageViewGroup$IViewHolder;,
        Lcom/google/android/talk/PageViewGroup$SimpleViewCache;,
        Lcom/google/android/talk/PageViewGroup$IMakeView;
    }
.end annotation


# static fields
.field private static final LEFT_RIGHT_DIRECTION:I = 0x1

.field private static final MOVE_THRESHOLD:F = 0.2f

.field private static final NO_DIRECTION:I = 0x0

.field private static final UP_DOWN_DIRECTION:I = 0x2

.field private static final VIEW_CACHE_SIZE:I = 0x3


# instance fields
.field private mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

.field private mAllowWrapping:Z

.field mAnimateScrollRunnable:Ljava/lang/Runnable;

.field private mAnimatingScroll:Z

.field private mCenterOnLayout:Z

.field private mDownX:I

.field private mDownY:I

.field private mFakes:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mHandler:Landroid/os/Handler;

.field mLastTouchX:F

.field private mLockDirection:I

.field private mNextSelection:I

.field private mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

.field private mPlaceholders:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

.field mRefreshRunnable:Ljava/lang/Runnable;

.field private mScroller:Landroid/widget/Scroller;

.field private mSelection:I

.field private mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 418
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 64
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/google/android/talk/PageViewGroup$IViewHolder;

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/talk/PageViewGroup;->mCenterOnLayout:Z

    .line 78
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mHandler:Landroid/os/Handler;

    .line 132
    new-instance v0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    new-instance v1, Lcom/google/android/talk/PageViewGroup$1;

    invoke-direct {v1, p0}, Lcom/google/android/talk/PageViewGroup$1;-><init>(Lcom/google/android/talk/PageViewGroup;)V

    invoke-direct {v0, p0, v1}, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;-><init>(Lcom/google/android/talk/PageViewGroup;Lcom/google/android/talk/PageViewGroup$IMakeView;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mFakes:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    .line 138
    new-instance v0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    new-instance v1, Lcom/google/android/talk/PageViewGroup$2;

    invoke-direct {v1, p0}, Lcom/google/android/talk/PageViewGroup$2;-><init>(Lcom/google/android/talk/PageViewGroup;)V

    invoke-direct {v0, p0, v1}, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;-><init>(Lcom/google/android/talk/PageViewGroup;Lcom/google/android/talk/PageViewGroup$IMakeView;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mPlaceholders:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    .line 476
    new-instance v0, Lcom/google/android/talk/PageViewGroup$4;

    invoke-direct {v0, p0}, Lcom/google/android/talk/PageViewGroup$4;-><init>(Lcom/google/android/talk/PageViewGroup;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mRefreshRunnable:Ljava/lang/Runnable;

    .line 622
    new-instance v0, Lcom/google/android/talk/PageViewGroup$5;

    invoke-direct {v0, p0}, Lcom/google/android/talk/PageViewGroup$5;-><init>(Lcom/google/android/talk/PageViewGroup;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mAnimateScrollRunnable:Ljava/lang/Runnable;

    .line 419
    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup;->makeGestureDetector()Landroid/view/GestureDetector;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mGestureDetector:Landroid/view/GestureDetector;

    .line 420
    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mScroller:Landroid/widget/Scroller;

    .line 421
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 412
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 64
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/google/android/talk/PageViewGroup$IViewHolder;

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/talk/PageViewGroup;->mCenterOnLayout:Z

    .line 78
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mHandler:Landroid/os/Handler;

    .line 132
    new-instance v0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    new-instance v1, Lcom/google/android/talk/PageViewGroup$1;

    invoke-direct {v1, p0}, Lcom/google/android/talk/PageViewGroup$1;-><init>(Lcom/google/android/talk/PageViewGroup;)V

    invoke-direct {v0, p0, v1}, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;-><init>(Lcom/google/android/talk/PageViewGroup;Lcom/google/android/talk/PageViewGroup$IMakeView;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mFakes:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    .line 138
    new-instance v0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    new-instance v1, Lcom/google/android/talk/PageViewGroup$2;

    invoke-direct {v1, p0}, Lcom/google/android/talk/PageViewGroup$2;-><init>(Lcom/google/android/talk/PageViewGroup;)V

    invoke-direct {v0, p0, v1}, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;-><init>(Lcom/google/android/talk/PageViewGroup;Lcom/google/android/talk/PageViewGroup$IMakeView;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mPlaceholders:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    .line 476
    new-instance v0, Lcom/google/android/talk/PageViewGroup$4;

    invoke-direct {v0, p0}, Lcom/google/android/talk/PageViewGroup$4;-><init>(Lcom/google/android/talk/PageViewGroup;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mRefreshRunnable:Ljava/lang/Runnable;

    .line 622
    new-instance v0, Lcom/google/android/talk/PageViewGroup$5;

    invoke-direct {v0, p0}, Lcom/google/android/talk/PageViewGroup$5;-><init>(Lcom/google/android/talk/PageViewGroup;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mAnimateScrollRunnable:Ljava/lang/Runnable;

    .line 413
    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup;->makeGestureDetector()Landroid/view/GestureDetector;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mGestureDetector:Landroid/view/GestureDetector;

    .line 414
    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mScroller:Landroid/widget/Scroller;

    .line 415
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/PageViewGroup;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/talk/PageViewGroup;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/google/android/talk/PageViewGroup;)Landroid/widget/Scroller;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mScroller:Landroid/widget/Scroller;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/google/android/talk/PageViewGroup;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;
    .param p1, "x1"    # Z

    .prologue
    .line 58
    iput-boolean p1, p0, Lcom/google/android/talk/PageViewGroup;->mAnimatingScroll:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/google/android/talk/PageViewGroup;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/google/android/talk/PageViewGroup;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    iget v0, p0, Lcom/google/android/talk/PageViewGroup;->mNextSelection:I

    return v0
.end method

.method static synthetic access$200(Lcom/google/android/talk/PageViewGroup;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup;->createScrollingCaches()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$Adapter;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/talk/PageViewGroup;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;
    .param p1, "x1"    # Z

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/google/android/talk/PageViewGroup;->recenterAndSelect(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$SimpleViewCache;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mPlaceholders:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/talk/PageViewGroup;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;

    .prologue
    .line 58
    iget v0, p0, Lcom/google/android/talk/PageViewGroup;->mSelection:I

    return v0
.end method

.method static synthetic access$800(Lcom/google/android/talk/PageViewGroup;I)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;
    .param p1, "x1"    # I

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/google/android/talk/PageViewGroup;->wrap(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/google/android/talk/PageViewGroup;Lcom/google/android/talk/PageViewGroup$IViewHolder;I)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/PageViewGroup;
    .param p1, "x1"    # Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .param p2, "x2"    # I

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lcom/google/android/talk/PageViewGroup;->installView(Lcom/google/android/talk/PageViewGroup$IViewHolder;I)V

    return-void
.end method

.method private clearScrollingCaches()V
    .locals 4

    .prologue
    .line 689
    iget-object v3, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    array-length v0, v3

    .line 690
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 691
    iget-object v3, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v2, v3, v1

    .line 692
    .local v2, "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    if-eqz v2, :cond_0

    .line 693
    invoke-interface {v2}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->clearScrollingCache()V

    .line 690
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 696
    .end local v2    # "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_1
    return-void
.end method

.method private createScrollingCaches()V
    .locals 4

    .prologue
    .line 679
    iget-object v3, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    array-length v0, v3

    .line 680
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 681
    iget-object v3, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v2, v3, v1

    .line 682
    .local v2, "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    if-eqz v2, :cond_0

    .line 683
    invoke-interface {v2}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->createScrollingCache()V

    .line 680
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 686
    .end local v2    # "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_1
    return-void
.end method

.method private installView(Lcom/google/android/talk/PageViewGroup$IViewHolder;I)V
    .locals 7
    .param p1, "vh"    # Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .param p2, "slot"    # I

    .prologue
    const/4 v4, -0x1

    .line 460
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v2

    .line 461
    .local v2, "mywidth":I
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getHeight()I

    move-result v1

    .line 463
    .local v1, "myheight":I
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 466
    .local v0, "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-interface {p1}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->get()Landroid/view/View;

    move-result-object v3

    .line 467
    .local v3, "v":Landroid/view/View;
    const/4 v4, 0x1

    invoke-virtual {p0, v3, p2, v0, v4}, Lcom/google/android/talk/PageViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 468
    mul-int v4, v2, p2

    const/4 v5, 0x0

    mul-int v6, v2, p2

    add-int/2addr v6, v2

    invoke-virtual {v3, v4, v5, v6, v1}, Landroid/view/View;->layout(IIII)V

    .line 469
    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aput-object p1, v4, p2

    .line 470
    return-void
.end method

.method private makeGestureDetector()Landroid/view/GestureDetector;
    .locals 3

    .prologue
    .line 316
    new-instance v0, Lcom/google/android/talk/PageViewGroup$3;

    invoke-direct {v0, p0}, Lcom/google/android/talk/PageViewGroup$3;-><init>(Lcom/google/android/talk/PageViewGroup;)V

    .line 408
    .local v0, "listener":Landroid/view/GestureDetector$OnGestureListener;
    new-instance v1, Landroid/view/GestureDetector;

    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    return-object v1
.end method

.method private moveFactor()F
    .locals 5

    .prologue
    .line 699
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v2

    .line 702
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getScrollX()I

    move-result v3

    sub-int v1, v3, v2

    .line 707
    .local v1, "scrollX":I
    int-to-float v3, v1

    int-to-float v4, v2

    div-float v0, v3, v4

    .line 708
    .local v0, "moveFactor":F
    return v0
.end method

.method private nextSelection(Z)I
    .locals 2
    .param p1, "forward"    # Z

    .prologue
    .line 288
    if-eqz p1, :cond_0

    iget v0, p0, Lcom/google/android/talk/PageViewGroup;->mSelection:I

    add-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/google/android/talk/PageViewGroup;->mSelection:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method private recenter()V
    .locals 2

    .prologue
    .line 263
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/talk/PageViewGroup;->scrollTo(II)V

    .line 264
    return-void
.end method

.method private recenterAndSelect(Z)V
    .locals 6
    .param p1, "forward"    # Z

    .prologue
    const/4 v5, 0x0

    .line 292
    invoke-direct {p0, p1}, Lcom/google/android/talk/PageViewGroup;->nextSelection(Z)I

    move-result v0

    .line 293
    .local v0, "nextSelection":I
    iget-boolean v1, p0, Lcom/google/android/talk/PageViewGroup;->mAllowWrapping:Z

    if-nez v1, :cond_1

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    invoke-interface {v1}, Lcom/google/android/talk/PageViewGroup$Adapter;->getCount()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 295
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup;->recenter()V

    .line 309
    :goto_0
    return-void

    .line 297
    :cond_1
    iput v0, p0, Lcom/google/android/talk/PageViewGroup;->mNextSelection:I

    .line 299
    if-nez p1, :cond_2

    .line 301
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getScrollX()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getScrollX()I

    move-result v3

    neg-int v3, v3

    invoke-virtual {v1, v2, v5, v3, v5}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 302
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup;->mAnimateScrollRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 305
    :cond_2
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getScrollX()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getScrollX()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v1, v2, v5, v3, v5}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 306
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup;->mAnimateScrollRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private wrap(I)I
    .locals 3
    .param p1, "x"    # I

    .prologue
    .line 272
    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    if-nez v2, :cond_0

    move v1, p1

    .line 284
    .end local p1    # "x":I
    .local v1, "x":I
    :goto_0
    return v1

    .line 275
    .end local v1    # "x":I
    .restart local p1    # "x":I
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    invoke-interface {v2}, Lcom/google/android/talk/PageViewGroup$Adapter;->getCount()I

    move-result v0

    .line 276
    .local v0, "count":I
    if-nez v0, :cond_1

    move v1, p1

    .line 277
    .end local p1    # "x":I
    .restart local v1    # "x":I
    goto :goto_0

    .line 279
    .end local v1    # "x":I
    .restart local p1    # "x":I
    :cond_1
    if-gez p1, :cond_2

    .line 280
    neg-int v2, p1

    rem-int/2addr v2, v0

    sub-int p1, v0, v2

    .line 282
    :cond_2
    rem-int/2addr p1, v0

    move v1, p1

    .line 284
    .end local p1    # "x":I
    .restart local v1    # "x":I
    goto :goto_0
.end method


# virtual methods
.method public clear()V
    .locals 4

    .prologue
    .line 146
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 147
    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v1, v2, v0

    .line 148
    .local v1, "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    if-eqz v1, :cond_0

    .line 149
    invoke-interface {v1}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->stop()V

    .line 150
    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    const/4 v3, 0x0

    aput-object v3, v2, v0

    .line 146
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 153
    .end local v1    # "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_1
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 670
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getSelectedView()Landroid/view/View;

    move-result-object v0

    .line 671
    .local v0, "focus":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 672
    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    .line 674
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 14
    .param p1, "m"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v13, 0x2

    const v12, 0x3e4ccccd    # 0.2f

    const v11, -0x41b33333    # -0.2f

    const/4 v9, 0x0

    const/4 v10, 0x1

    .line 723
    iget-boolean v7, p0, Lcom/google/android/talk/PageViewGroup;->mAnimatingScroll:Z

    if-eqz v7, :cond_0

    move v7, v10

    .line 810
    :goto_0
    return v7

    .line 727
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 807
    :cond_1
    :goto_1
    iget v7, p0, Lcom/google/android/talk/PageViewGroup;->mLockDirection:I

    if-eq v7, v10, :cond_b

    .line 808
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v7

    goto :goto_0

    .line 729
    :pswitch_0
    iput-boolean v9, p0, Lcom/google/android/talk/PageViewGroup;->mCenterOnLayout:Z

    .line 730
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v7, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 732
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/google/android/talk/PageViewGroup;->mDownX:I

    .line 733
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v7, v7

    iput v7, p0, Lcom/google/android/talk/PageViewGroup;->mDownY:I

    .line 734
    iput v9, p0, Lcom/google/android/talk/PageViewGroup;->mLockDirection:I

    .line 735
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    if-eqz v7, :cond_1

    .line 736
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    invoke-interface {v7}, Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;->onStartReveal()V

    goto :goto_1

    .line 740
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    .line 741
    .local v6, "newaction":I
    iget v7, p0, Lcom/google/android/talk/PageViewGroup;->mLockDirection:I

    if-nez v7, :cond_2

    .line 745
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v7, v7

    iget v8, p0, Lcom/google/android/talk/PageViewGroup;->mDownX:I

    sub-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 746
    .local v2, "deltaX":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v7, v7

    iget v8, p0, Lcom/google/android/talk/PageViewGroup;->mDownY:I

    sub-int/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 747
    .local v3, "deltaY":I
    const/16 v4, 0x19

    .line 748
    .local v4, "minimumLatchMotion":I
    const/16 v7, 0x19

    if-le v2, v7, :cond_7

    if-ge v3, v2, :cond_7

    .line 749
    iput v10, p0, Lcom/google/android/talk/PageViewGroup;->mLockDirection:I

    .line 750
    const/4 v6, 0x3

    .line 756
    .end local v2    # "deltaX":I
    .end local v3    # "deltaY":I
    .end local v4    # "minimumLatchMotion":I
    :cond_2
    :goto_2
    iget v7, p0, Lcom/google/android/talk/PageViewGroup;->mLockDirection:I

    if-eq v7, v13, :cond_3

    .line 757
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v7, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 759
    :cond_3
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    if-eqz v7, :cond_6

    .line 760
    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup;->moveFactor()F

    move-result v5

    .line 766
    .local v5, "moveFactor":F
    const/4 v0, 0x0

    .line 767
    .local v0, "commit":Z
    cmpl-float v7, v5, v12

    if-gtz v7, :cond_4

    cmpg-float v7, v5, v11

    if-gez v7, :cond_5

    .line 768
    :cond_4
    const/4 v0, 0x1

    .line 770
    :cond_5
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getScrollX()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v8, v9

    const/high16 v9, 0x3f800000    # 1.0f

    sub-float/2addr v8, v9

    invoke-interface {v7, v8, v0}, Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;->onRevealChange(FZ)V

    .line 772
    .end local v0    # "commit":Z
    .end local v5    # "moveFactor":F
    :cond_6
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->setAction(I)V

    goto/16 :goto_1

    .line 751
    .restart local v2    # "deltaX":I
    .restart local v3    # "deltaY":I
    .restart local v4    # "minimumLatchMotion":I
    :cond_7
    const/16 v7, 0x19

    if-le v3, v7, :cond_2

    if-ge v2, v3, :cond_2

    .line 752
    iput v13, p0, Lcom/google/android/talk/PageViewGroup;->mLockDirection:I

    .line 753
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v7

    invoke-virtual {p0, v7, v9}, Lcom/google/android/talk/PageViewGroup;->scrollTo(II)V

    goto :goto_2

    .line 775
    .end local v2    # "deltaX":I
    .end local v3    # "deltaY":I
    .end local v4    # "minimumLatchMotion":I
    .end local v6    # "newaction":I
    :pswitch_2
    iput-boolean v10, p0, Lcom/google/android/talk/PageViewGroup;->mCenterOnLayout:Z

    .line 776
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v7, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 777
    .local v1, "consumed":Z
    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup;->clearScrollingCaches()V

    .line 786
    if-nez v1, :cond_8

    .line 787
    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup;->moveFactor()F

    move-result v5

    .line 789
    .restart local v5    # "moveFactor":F
    cmpl-float v7, v5, v12

    if-lez v7, :cond_9

    .line 790
    invoke-direct {p0, v10}, Lcom/google/android/talk/PageViewGroup;->recenterAndSelect(Z)V

    .line 797
    .end local v5    # "moveFactor":F
    :cond_8
    :goto_3
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    if-eqz v7, :cond_1

    .line 798
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    invoke-interface {v7}, Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;->onStopReveal()V

    goto/16 :goto_1

    .line 791
    .restart local v5    # "moveFactor":F
    :cond_9
    cmpg-float v7, v5, v11

    if-gez v7, :cond_a

    .line 792
    invoke-direct {p0, v9}, Lcom/google/android/talk/PageViewGroup;->recenterAndSelect(Z)V

    goto :goto_3

    .line 794
    :cond_a
    invoke-direct {p0}, Lcom/google/android/talk/PageViewGroup;->recenter()V

    goto :goto_3

    .line 802
    .end local v1    # "consumed":Z
    .end local v5    # "moveFactor":F
    :pswitch_3
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    if-eqz v7, :cond_1

    .line 803
    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    invoke-interface {v7}, Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;->onStopReveal()V

    goto/16 :goto_1

    :cond_b
    move v7, v10

    .line 810
    goto/16 :goto_0

    .line 727
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public foreachChat(Lcom/google/android/talk/ChatScreen$ChatRunnable;)V
    .locals 2
    .param p1, "cr"    # Lcom/google/android/talk/ChatScreen$ChatRunnable;

    .prologue
    .line 638
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_0

    .line 639
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    .line 640
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v1, v1, v0

    invoke-interface {v1, p1}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->run(Lcom/google/android/talk/ChatScreen$ChatRunnable;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 645
    :cond_0
    return-void

    .line 638
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getAdapter()Lcom/google/android/talk/PageViewGroup$Adapter;
    .locals 1

    .prologue
    .line 815
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 648
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getAdapter()Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/talk/PageViewGroup$Adapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getSelectedItemPosition()I
    .locals 1

    .prologue
    .line 831
    iget v0, p0, Lcom/google/android/talk/PageViewGroup;->mNextSelection:I

    invoke-direct {p0, v0}, Lcom/google/android/talk/PageViewGroup;->wrap(I)I

    move-result v0

    return v0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 661
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v0, v0, v1

    if-eqz v0, :cond_0

    .line 662
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v0, v0, v1

    invoke-interface {v0}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->get()Landroid/view/View;

    move-result-object v0

    .line 664
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSelectedViewAdjacent(Z)Landroid/view/View;
    .locals 3
    .param p1, "forward"    # Z

    .prologue
    .line 652
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    if-eqz p1, :cond_0

    const/4 v2, 0x2

    :goto_0
    aget-object v0, v1, v2

    .line 653
    .local v0, "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    if-eqz v0, :cond_1

    .line 654
    invoke-interface {v0}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->get()Landroid/view/View;

    move-result-object v1

    .line 656
    :goto_1
    return-object v1

    .line 652
    .end local v0    # "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 656
    .restart local v0    # "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method protected onLayout(ZIIII)V
    .locals 11
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 528
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getWidth()I

    move-result v4

    .line 529
    .local v4, "mywidth":I
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    invoke-interface {v9}, Lcom/google/android/talk/PageViewGroup$Adapter;->getCount()I

    move-result v9

    move v0, v9

    .line 530
    .local v0, "count":I
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->removeAllViews()V

    .line 540
    iget v9, p0, Lcom/google/android/talk/PageViewGroup;->mNextSelection:I

    iget v10, p0, Lcom/google/android/talk/PageViewGroup;->mSelection:I

    sub-int v3, v9, v10

    .line 541
    .local v3, "moveDelta":I
    iget v9, p0, Lcom/google/android/talk/PageViewGroup;->mNextSelection:I

    iput v9, p0, Lcom/google/android/talk/PageViewGroup;->mSelection:I

    .line 543
    if-eqz v3, :cond_0

    .line 544
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    const/4 v10, 0x1

    aget-object v9, v9, v10

    if-eqz v9, :cond_0

    .line 545
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    const/4 v10, 0x1

    aget-object v9, v9, v10

    invoke-interface {v9}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->unfocus()V

    .line 552
    :cond_0
    if-lez v3, :cond_6

    .line 554
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    const/4 v9, 0x3

    if-ge v1, v9, :cond_b

    .line 555
    add-int v2, v1, v3

    .line 556
    .local v2, "j":I
    const/4 v9, 0x3

    if-ge v2, v9, :cond_4

    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v9, v9, v2

    move-object v6, v9

    .line 557
    .local v6, "source":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :goto_2
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v9, v9, v1

    if-eqz v9, :cond_1

    .line 558
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v9, v9, v1

    invoke-interface {v9}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->stop()V

    .line 560
    :cond_1
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    iget-object v10, p0, Lcom/google/android/talk/PageViewGroup;->mFakes:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    invoke-virtual {v10, v6}, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->memberOf(Lcom/google/android/talk/PageViewGroup$IViewHolder;)Z

    move-result v10

    if-nez v10, :cond_5

    move-object v10, v6

    :goto_3
    aput-object v10, v9, v1

    .line 561
    const/4 v9, 0x3

    if-ge v2, v9, :cond_2

    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    const/4 v10, 0x0

    aput-object v10, v9, v2

    .line 554
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 529
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v3    # "moveDelta":I
    .end local v6    # "source":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_3
    const/4 v9, 0x0

    move v0, v9

    goto :goto_0

    .line 556
    .restart local v0    # "count":I
    .restart local v1    # "i":I
    .restart local v2    # "j":I
    .restart local v3    # "moveDelta":I
    :cond_4
    const/4 v9, 0x0

    move-object v6, v9

    goto :goto_2

    .line 560
    .restart local v6    # "source":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_5
    const/4 v10, 0x0

    goto :goto_3

    .line 563
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v6    # "source":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_6
    if-gez v3, :cond_b

    .line 565
    const/4 v1, 0x2

    .restart local v1    # "i":I
    :goto_4
    if-ltz v1, :cond_b

    .line 566
    add-int v2, v1, v3

    .line 567
    .restart local v2    # "j":I
    if-ltz v2, :cond_9

    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v9, v9, v2

    move-object v6, v9

    .line 568
    .restart local v6    # "source":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :goto_5
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v9, v9, v1

    if-eqz v9, :cond_7

    .line 569
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v9, v9, v1

    invoke-interface {v9}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->stop()V

    .line 571
    :cond_7
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    iget-object v10, p0, Lcom/google/android/talk/PageViewGroup;->mFakes:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    invoke-virtual {v10, v6}, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->memberOf(Lcom/google/android/talk/PageViewGroup$IViewHolder;)Z

    move-result v10

    if-nez v10, :cond_a

    move-object v10, v6

    :goto_6
    aput-object v10, v9, v1

    .line 572
    if-ltz v2, :cond_8

    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    const/4 v10, 0x0

    aput-object v10, v9, v2

    .line 565
    :cond_8
    add-int/lit8 v1, v1, -0x1

    goto :goto_4

    .line 567
    .end local v6    # "source":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_9
    const/4 v9, 0x0

    move-object v6, v9

    goto :goto_5

    .line 571
    .restart local v6    # "source":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_a
    const/4 v10, 0x0

    goto :goto_6

    .line 578
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v6    # "source":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    :cond_b
    const/4 v1, -0x1

    .restart local v1    # "i":I
    :goto_7
    const/4 v9, 0x1

    if-gt v1, v9, :cond_f

    .line 579
    add-int/lit8 v5, v1, 0x1

    .line 580
    .local v5, "slot":I
    iget v9, p0, Lcom/google/android/talk/PageViewGroup;->mSelection:I

    add-int v8, v9, v1

    .line 581
    .local v8, "viewNumber":I
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v7, v9, v5

    .line 582
    .local v7, "vh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    if-nez v7, :cond_d

    .line 583
    iget-boolean v9, p0, Lcom/google/android/talk/PageViewGroup;->mAllowWrapping:Z

    if-nez v9, :cond_e

    if-ltz v8, :cond_c

    if-lt v8, v0, :cond_e

    .line 584
    :cond_c
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mFakes:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    invoke-virtual {v9}, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->get()Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v7

    .line 591
    :goto_8
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    add-int/lit8 v10, v1, 0x1

    aput-object v7, v9, v10

    .line 597
    :cond_d
    invoke-direct {p0, v7, v5}, Lcom/google/android/talk/PageViewGroup;->installView(Lcom/google/android/talk/PageViewGroup$IViewHolder;I)V

    .line 578
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 589
    :cond_e
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mPlaceholders:Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    invoke-virtual {v9}, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->get()Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v7

    goto :goto_8

    .line 602
    .end local v5    # "slot":I
    .end local v7    # "vh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .end local v8    # "viewNumber":I
    :cond_f
    iget-boolean v9, p0, Lcom/google/android/talk/PageViewGroup;->mCenterOnLayout:Z

    if-eqz v9, :cond_10

    .line 603
    const/4 v9, 0x0

    invoke-virtual {p0, v4, v9}, Lcom/google/android/talk/PageViewGroup;->scrollTo(II)V

    .line 607
    :cond_10
    if-eqz v3, :cond_11

    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    const/4 v10, 0x1

    aget-object v9, v9, v10

    if-eqz v9, :cond_11

    .line 608
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    const/4 v10, 0x1

    aget-object v9, v9, v10

    invoke-interface {v9}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->focus()V

    .line 611
    :cond_11
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    if-eqz v9, :cond_13

    .line 613
    const-string v9, "talk"

    const/4 v10, 0x3

    invoke-static {v9, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 614
    const-string v9, "talk"

    const-string v10, "onLayout: post mRefreshRunnable"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    :cond_12
    iget-object v9, p0, Lcom/google/android/talk/PageViewGroup;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lcom/google/android/talk/PageViewGroup;->mRefreshRunnable:Ljava/lang/Runnable;

    invoke-virtual {v9, v10}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 619
    :cond_13
    return-void
.end method

.method protected onMeasure(II)V
    .locals 8
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v7, 0x40000000    # 2.0f

    .line 434
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 435
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    .line 436
    .local v6, "widthSpecSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 437
    .local v4, "heightSpecSize":I
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->getChildCount()I

    move-result v1

    .line 438
    .local v1, "childCount":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v1, :cond_0

    .line 439
    invoke-virtual {p0, v5}, Lcom/google/android/talk/PageViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 441
    .local v0, "child":Landroid/view/View;
    invoke-static {v6, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 443
    .local v2, "childWidthMeasureSpec":I
    invoke-static {v4, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 446
    .local v3, "childheightMeasureSpec":I
    invoke-virtual {v0, v2, v3}, Landroid/view/View;->measure(II)V

    .line 438
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 448
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "childWidthMeasureSpec":I
    .end local v3    # "childheightMeasureSpec":I
    :cond_0
    invoke-virtual {p0, v6, v4}, Lcom/google/android/talk/PageViewGroup;->setMeasuredDimension(II)V

    .line 449
    return-void
.end method

.method public setAdapter(Lcom/google/android/talk/PageViewGroup$Adapter;)V
    .locals 3
    .param p1, "a"    # Lcom/google/android/talk/PageViewGroup$Adapter;

    .prologue
    .line 819
    iput-object p1, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    .line 820
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 821
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    .line 822
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    aget-object v1, v1, v0

    invoke-interface {v1}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->stop()V

    .line 823
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mViews:[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 820
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 826
    :cond_1
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/talk/PageViewGroup;->mNextSelection:I

    iput v1, p0, Lcom/google/android/talk/PageViewGroup;->mSelection:I

    .line 827
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->requestLayout()V

    .line 828
    return-void
.end method

.method public setAllowWrapping(Z)V
    .locals 0
    .param p1, "allow"    # Z

    .prologue
    .line 847
    iput-boolean p1, p0, Lcom/google/android/talk/PageViewGroup;->mAllowWrapping:Z

    .line 848
    return-void
.end method

.method public setOnTouchCallback(Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;)V
    .locals 0
    .param p1, "cb"    # Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    .prologue
    .line 424
    iput-object p1, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    .line 425
    return-void
.end method

.method public setSelection(I)V
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 835
    iget v0, p0, Lcom/google/android/talk/PageViewGroup;->mSelection:I

    .line 837
    .local v0, "oldSelection":I
    iput p1, p0, Lcom/google/android/talk/PageViewGroup;->mNextSelection:I

    .line 838
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/talk/PageViewGroup;->mCenterOnLayout:Z

    .line 839
    invoke-virtual {p0}, Lcom/google/android/talk/PageViewGroup;->requestLayout()V

    .line 841
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    if-eqz v1, :cond_0

    .line 842
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup;->mObserver:Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;

    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup;->mAdapter:Lcom/google/android/talk/PageViewGroup$Adapter;

    invoke-direct {p0, p1}, Lcom/google/android/talk/PageViewGroup;->wrap(I)I

    move-result v3

    invoke-interface {v2, v3}, Lcom/google/android/talk/PageViewGroup$Adapter;->getIntent(I)Landroid/content/Intent;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;->onSelection(Landroid/content/Intent;)V

    .line 844
    :cond_0
    return-void
.end method
