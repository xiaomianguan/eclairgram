.class Lcom/google/android/talk/PageViewGroup$4;
.super Ljava/lang/Object;
.source "PageViewGroup.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/PageViewGroup;
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
    .line 477
    iput-object p1, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 478
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$300(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v5

    if-nez v5, :cond_1

    .line 513
    :cond_0
    :goto_0
    return-void

    .line 481
    :cond_1
    const/4 v4, 0x0

    .local v4, "viewslot":I
    :goto_1
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v5

    array-length v5, v5

    if-ge v4, v5, :cond_7

    .line 482
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v5

    aget-object v1, v5, v4

    .line 483
    .local v1, "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$600(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$SimpleViewCache;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/google/android/talk/PageViewGroup$SimpleViewCache;->memberOf(Lcom/google/android/talk/PageViewGroup$IViewHolder;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 484
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$700(Lcom/google/android/talk/PageViewGroup;)I

    move-result v5

    add-int/2addr v5, v4

    sub-int v3, v5, v8

    .line 486
    .local v3, "viewPosition":I
    const/4 v2, 0x0

    .line 487
    .local v2, "newVh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$300(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/talk/PageViewGroup$Adapter;->getCount()I

    move-result v0

    .line 488
    .local v0, "count":I
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v5

    array-length v5, v5

    if-ge v0, v5, :cond_2

    if-ltz v3, :cond_3

    if-ge v3, v0, :cond_3

    .line 489
    :cond_2
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$300(Lcom/google/android/talk/PageViewGroup;)Lcom/google/android/talk/PageViewGroup$Adapter;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v6, v3}, Lcom/google/android/talk/PageViewGroup;->access$800(Lcom/google/android/talk/PageViewGroup;I)I

    move-result v6

    iget-object v7, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-interface {v5, v6, v7}, Lcom/google/android/talk/PageViewGroup$Adapter;->getView(ILandroid/view/ViewGroup;)Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v2

    .line 492
    :cond_3
    if-nez v2, :cond_5

    .line 481
    .end local v0    # "count":I
    .end local v2    # "newVh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .end local v3    # "viewPosition":I
    :cond_4
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 499
    .restart local v0    # "count":I
    .restart local v2    # "newVh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .restart local v3    # "viewPosition":I
    :cond_5
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v5}, Lcom/google/android/talk/PageViewGroup;->getChildCount()I

    move-result v5

    if-le v5, v4, :cond_6

    .line 500
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v5

    aget-object v5, v5, v4

    invoke-interface {v5}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->stop()V

    .line 501
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v5, v4}, Lcom/google/android/talk/PageViewGroup;->removeViewAt(I)V

    .line 505
    :cond_6
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5, v2, v4}, Lcom/google/android/talk/PageViewGroup;->access$900(Lcom/google/android/talk/PageViewGroup;Lcom/google/android/talk/PageViewGroup$IViewHolder;I)V

    goto :goto_2

    .line 510
    .end local v0    # "count":I
    .end local v1    # "ivh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .end local v2    # "newVh":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .end local v3    # "viewPosition":I
    :cond_7
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v5

    aget-object v5, v5, v8

    if-eqz v5, :cond_0

    .line 511
    iget-object v5, p0, Lcom/google/android/talk/PageViewGroup$4;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v5}, Lcom/google/android/talk/PageViewGroup;->access$500(Lcom/google/android/talk/PageViewGroup;)[Lcom/google/android/talk/PageViewGroup$IViewHolder;

    move-result-object v5

    aget-object v5, v5, v8

    invoke-interface {v5}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->focus()V

    goto/16 :goto_0
.end method
