.class Lcom/google/android/talk/util/ChatSwitcher$2;
.super Ljava/lang/Object;
.source "ChatSwitcher.java"

# interfaces
.implements Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/util/ChatSwitcher;->requery(Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/util/ChatSwitcher;

.field final synthetic val$r:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;


# direct methods
.method constructor <init>(Lcom/google/android/talk/util/ChatSwitcher;Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V
    .locals 0

    .prologue
    .line 120
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher$2;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iput-object p2, p0, Lcom/google/android/talk/util/ChatSwitcher$2;->val$r:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Landroid/database/Cursor;)V
    .locals 1
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$2;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher;->mSwitcherAdapter:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    invoke-virtual {v0, p1}, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 122
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$2;->val$r:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$2;->val$r:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    invoke-interface {v0, p1}, Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;->onComplete(Landroid/database/Cursor;)V

    .line 125
    :cond_0
    return-void
.end method
