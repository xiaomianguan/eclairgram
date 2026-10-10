.class Lcom/google/android/talk/util/ChatSwitcher$3;
.super Ljava/lang/Object;
.source "ChatSwitcher.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/util/ChatSwitcher;-><init>(Landroid/app/Activity;Landroid/os/Handler;Lcom/google/android/talk/TalkApp;Landroid/view/LayoutInflater;Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;Ljava/lang/Runnable;Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/util/ChatSwitcher;


# direct methods
.method constructor <init>(Lcom/google/android/talk/util/ChatSwitcher;)V
    .locals 0

    .prologue
    .line 500
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher$3;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x0

    .line 501
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_0

    move v0, v3

    .line 510
    :goto_0
    return v0

    .line 504
    :cond_0
    sparse-switch p2, :sswitch_data_0

    :goto_1
    move v0, v3

    .line 510
    goto :goto_0

    .line 507
    :sswitch_0
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$3;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher$3;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iget-object v1, v1, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v1}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$3;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-static {v2}, Lcom/google/android/talk/util/ChatSwitcher;->access$500(Lcom/google/android/talk/util/ChatSwitcher;)Landroid/widget/GridView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/GridView;->getSelectedItemPosition()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/util/ChatSwitcher;->select(Landroid/database/Cursor;I)V

    goto :goto_1

    .line 504
    :sswitch_data_0
    .sparse-switch
        0x17 -> :sswitch_0
        0x42 -> :sswitch_0
    .end sparse-switch
.end method
