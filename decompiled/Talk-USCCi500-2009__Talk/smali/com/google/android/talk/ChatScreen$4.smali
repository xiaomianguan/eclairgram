.class Lcom/google/android/talk/ChatScreen$4;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->makeObserver()Lcom/google/android/talk/PageViewGroup$ObserverCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatScreen;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen;)V
    .locals 0

    .prologue
    .line 455
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRevealChange(FZ)V
    .locals 5
    .param p1, "percentRevealed"    # F
    .param p2, "commit"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 456
    cmpl-float v0, p1, v3

    if-eqz v0, :cond_1

    .line 457
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$1500(Lcom/google/android/talk/ChatScreen;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 458
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$1500(Lcom/google/android/talk/ChatScreen;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 459
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$1500(Lcom/google/android/talk/ChatScreen;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$2100(Lcom/google/android/talk/ChatScreen;)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 460
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$2100(Lcom/google/android/talk/ChatScreen;)Landroid/view/animation/Animation;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 461
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$2100(Lcom/google/android/talk/ChatScreen;)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/animation/Animation;->startNow()V

    .line 463
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$1800(Lcom/google/android/talk/ChatScreen;)V

    .line 465
    :cond_1
    if-eqz p2, :cond_3

    .line 466
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$100(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/PageViewGroup;

    move-result-object v1

    cmpl-float v2, p1, v3

    if-lez v2, :cond_2

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {v1, v2}, Lcom/google/android/talk/PageViewGroup;->getSelectedViewAdjacent(Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatScreen;->updateTitle(Landroid/view/View;)V

    .line 470
    :goto_1
    return-void

    :cond_2
    move v2, v4

    .line 466
    goto :goto_0

    .line 468
    :cond_3
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$000(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/ChatView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatScreen;->updateTitle(Landroid/view/View;)V

    goto :goto_1
.end method

.method public onSelection(Landroid/content/Intent;)V
    .locals 1
    .param p1, "selectedIntent"    # Landroid/content/Intent;

    .prologue
    .line 442
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$1800(Lcom/google/android/talk/ChatScreen;)V

    .line 443
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-virtual {v0, p1}, Lcom/google/android/talk/ChatScreen;->setIntent(Landroid/content/Intent;)V

    .line 444
    return-void
.end method

.method public onStartReveal()V
    .locals 2

    .prologue
    .line 447
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$2000(Lcom/google/android/talk/ChatScreen;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$1900(Lcom/google/android/talk/ChatScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 448
    return-void
.end method

.method public onStopReveal()V
    .locals 4

    .prologue
    .line 451
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$2000(Lcom/google/android/talk/ChatScreen;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$1900(Lcom/google/android/talk/ChatScreen;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 452
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$2000(Lcom/google/android/talk/ChatScreen;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$4;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$1900(Lcom/google/android/talk/ChatScreen;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x9c4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 453
    return-void
.end method
