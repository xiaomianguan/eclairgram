.class Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$3;
.super Ljava/lang/Object;
.source "ChatSwitcher.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->updateViewListeners(Landroid/view/View;Landroid/database/Cursor;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

.field final synthetic val$c:Landroid/database/Cursor;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;Landroid/database/Cursor;I)V
    .locals 0

    .prologue
    .line 433
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$3;->this$1:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    iput-object p2, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$3;->val$c:Landroid/database/Cursor;

    iput p3, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$3;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x0

    .line 434
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    .line 443
    :goto_0
    return v0

    .line 437
    :cond_0
    sparse-switch p2, :sswitch_data_0

    move v0, v1

    .line 443
    goto :goto_0

    .line 440
    :sswitch_0
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$3;->this$1:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$3;->val$c:Landroid/database/Cursor;

    iget v2, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$3;->val$position:I

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/util/ChatSwitcher;->select(Landroid/database/Cursor;I)V

    .line 441
    const/4 v0, 0x1

    goto :goto_0

    .line 437
    nop

    :sswitch_data_0
    .sparse-switch
        0x17 -> :sswitch_0
        0x42 -> :sswitch_0
    .end sparse-switch
.end method
