.class public Lcom/google/android/talk/PageViewGroup$ViewHolder;
.super Ljava/lang/Object;
.source "PageViewGroup.java"

# interfaces
.implements Lcom/google/android/talk/PageViewGroup$IViewHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/PageViewGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field mAvailable:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/talk/PageViewGroup$IViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field mInUse:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/talk/PageViewGroup$IViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 219
    iput-object p1, p0, Lcom/google/android/talk/PageViewGroup$ViewHolder;->mView:Landroid/view/View;

    .line 220
    return-void
.end method

.method public constructor <init>(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/talk/PageViewGroup$IViewHolder;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/talk/PageViewGroup$IViewHolder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 212
    .local p2, "available":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/talk/PageViewGroup$IViewHolder;>;"
    .local p3, "inUse":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/talk/PageViewGroup$IViewHolder;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    iput-object p1, p0, Lcom/google/android/talk/PageViewGroup$ViewHolder;->mView:Landroid/view/View;

    .line 214
    iput-object p2, p0, Lcom/google/android/talk/PageViewGroup$ViewHolder;->mAvailable:Ljava/util/ArrayList;

    .line 215
    iput-object p3, p0, Lcom/google/android/talk/PageViewGroup$ViewHolder;->mInUse:Ljava/util/ArrayList;

    .line 216
    return-void
.end method


# virtual methods
.method public clearScrollingCache()V
    .locals 0

    .prologue
    .line 249
    return-void
.end method

.method public createScrollingCache()V
    .locals 0

    .prologue
    .line 246
    return-void
.end method

.method public focus()V
    .locals 0

    .prologue
    .line 223
    return-void
.end method

.method public get()Landroid/view/View;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$ViewHolder;->mView:Landroid/view/View;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 242
    const-string v0, ""

    return-object v0
.end method

.method public run(Lcom/google/android/talk/ChatScreen$ChatRunnable;)Z
    .locals 1
    .param p1, "cr"    # Lcom/google/android/talk/ChatScreen$ChatRunnable;

    .prologue
    .line 252
    const/4 v0, 0x1

    return v0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$ViewHolder;->mInUse:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$ViewHolder;->mInUse:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$ViewHolder;->mAvailable:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 234
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$ViewHolder;->mAvailable:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 236
    :cond_1
    return-void
.end method

.method public unfocus()V
    .locals 0

    .prologue
    .line 239
    return-void
.end method
