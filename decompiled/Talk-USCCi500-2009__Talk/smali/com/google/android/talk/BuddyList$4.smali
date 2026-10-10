.class Lcom/google/android/talk/BuddyList$4;
.super Ljava/lang/Object;
.source "BuddyList.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/BuddyList;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyList;)V
    .locals 0

    .prologue
    .line 509
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    .line 510
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->access$000(Lcom/google/android/talk/BuddyList;)Landroid/widget/EditText;

    move-result-object v0

    if-eq p1, v0, :cond_1

    .line 538
    :cond_0
    :goto_0
    return-void

    .line 514
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_2

    .line 515
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "custom text field focus changed, focus="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 524
    :cond_2
    if-eqz p2, :cond_3

    .line 526
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->access$000(Lcom/google/android/talk/BuddyList;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v1}, Lcom/google/android/talk/BuddyList;->access$1600(Lcom/google/android/talk/BuddyList;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 528
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->access$1700(Lcom/google/android/talk/BuddyList;)Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 529
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v1}, Lcom/google/android/talk/BuddyList;->access$1700(Lcom/google/android/talk/BuddyList;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 530
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$1702(Lcom/google/android/talk/BuddyList;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    goto :goto_0

    .line 533
    :cond_3
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->access$1700(Lcom/google/android/talk/BuddyList;)Ljava/lang/Runnable;

    move-result-object v0

    if-nez v0, :cond_0

    .line 534
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v1, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v1}, Lcom/google/android/talk/BuddyList;->access$1800(Lcom/google/android/talk/BuddyList;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$1702(Lcom/google/android/talk/BuddyList;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 535
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/talk/BuddyList$4;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v1}, Lcom/google/android/talk/BuddyList;->access$1700(Lcom/google/android/talk/BuddyList;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x1e

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
