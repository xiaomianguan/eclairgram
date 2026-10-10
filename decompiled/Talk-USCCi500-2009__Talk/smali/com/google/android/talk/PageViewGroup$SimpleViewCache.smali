.class Lcom/google/android/talk/PageViewGroup$SimpleViewCache;
.super Ljava/lang/Object;
.source "PageViewGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/PageViewGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SimpleViewCache"
.end annotation


# instance fields
.field private mAvailable:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/talk/PageViewGroup$IViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mInUse:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/talk/PageViewGroup$IViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mMaker:Lcom/google/android/talk/PageViewGroup$IMakeView;

.field final synthetic this$0:Lcom/google/android/talk/PageViewGroup;


# direct methods
.method constructor <init>(Lcom/google/android/talk/PageViewGroup;Lcom/google/android/talk/PageViewGroup$IMakeView;)V
    .locals 1
    .param p2, "maker"    # Lcom/google/android/talk/PageViewGroup$IMakeView;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mAvailable:Ljava/util/ArrayList;

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mInUse:Ljava/util/ArrayList;

    .line 115
    iput-object p2, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mMaker:Lcom/google/android/talk/PageViewGroup$IMakeView;

    .line 116
    return-void
.end method


# virtual methods
.method get()Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .locals 6

    .prologue
    .line 119
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mAvailable:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 120
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mAvailable:Ljava/util/ArrayList;

    new-instance v2, Lcom/google/android/talk/PageViewGroup$ViewHolder;

    iget-object v3, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mMaker:Lcom/google/android/talk/PageViewGroup$IMakeView;

    invoke-interface {v3}, Lcom/google/android/talk/PageViewGroup$IMakeView;->makeView()Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mAvailable:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mInUse:Ljava/util/ArrayList;

    invoke-direct {v2, v3, v4, v5}, Lcom/google/android/talk/PageViewGroup$ViewHolder;-><init>(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mAvailable:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mAvailable:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/talk/PageViewGroup$IViewHolder;

    .line 123
    .local v0, "retval":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mInUse:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    return-object v0
.end method

.method memberOf(Lcom/google/android/talk/PageViewGroup$IViewHolder;)Z
    .locals 1
    .param p1, "v"    # Lcom/google/android/talk/PageViewGroup$IViewHolder;

    .prologue
    .line 128
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mInUse:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->mAvailable:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
