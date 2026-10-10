.class Lcom/google/android/talk/PageViewGroup$5;
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
    .line 623
    iput-object p1, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 624
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v0}, Lcom/google/android/talk/PageViewGroup;->access$1000(Lcom/google/android/talk/PageViewGroup;)Landroid/widget/Scroller;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 625
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/talk/PageViewGroup;->access$1102(Lcom/google/android/talk/PageViewGroup;Z)Z

    .line 626
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v1}, Lcom/google/android/talk/PageViewGroup;->access$1000(Lcom/google/android/talk/PageViewGroup;)Landroid/widget/Scroller;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/PageViewGroup;->scrollTo(II)V

    .line 627
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-virtual {v0}, Lcom/google/android/talk/PageViewGroup;->postInvalidate()V

    .line 628
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v0}, Lcom/google/android/talk/PageViewGroup;->access$1200(Lcom/google/android/talk/PageViewGroup;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 634
    :goto_0
    return-void

    .line 630
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v1}, Lcom/google/android/talk/PageViewGroup;->access$1000(Lcom/google/android/talk/PageViewGroup;)Landroid/widget/Scroller;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/PageViewGroup;->scrollTo(II)V

    .line 631
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v1}, Lcom/google/android/talk/PageViewGroup;->access$1300(Lcom/google/android/talk/PageViewGroup;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/PageViewGroup;->setSelection(I)V

    .line 632
    iget-object v0, p0, Lcom/google/android/talk/PageViewGroup$5;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v0, v2}, Lcom/google/android/talk/PageViewGroup;->access$1102(Lcom/google/android/talk/PageViewGroup;Z)Z

    goto :goto_0
.end method
