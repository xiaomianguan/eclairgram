.class Lcom/google/android/talk/BuddyList$5;
.super Ljava/lang/Object;
.source "BuddyList.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


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
    .line 542
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$5;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keycode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 543
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$5;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->access$000(Lcom/google/android/talk/BuddyList;)Landroid/widget/EditText;

    move-result-object v0

    if-eq p1, v0, :cond_0

    move v0, v1

    .line 562
    :goto_0
    return v0

    .line 547
    :cond_0
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    .line 548
    goto :goto_0

    .line 551
    :cond_1
    const/16 v0, 0x42

    if-ne p2, v0, :cond_3

    .line 552
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$5;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    if-lt v0, v2, :cond_2

    .line 553
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$5;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "onKey - Enter: apply custom status text"

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 556
    :cond_2
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$5;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->access$200(Lcom/google/android/talk/BuddyList;)V

    .line 557
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$5;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->access$1900(Lcom/google/android/talk/BuddyList;)Landroid/widget/ImageButton;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageButton;->requestFocus()Z

    move v0, v2

    .line 559
    goto :goto_0

    :cond_3
    move v0, v1

    .line 562
    goto :goto_0
.end method
