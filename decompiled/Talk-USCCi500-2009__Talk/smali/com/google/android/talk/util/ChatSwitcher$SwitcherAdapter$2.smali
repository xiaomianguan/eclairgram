.class Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$2;
.super Ljava/lang/Object;
.source "ChatSwitcher.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 428
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$2;->this$1:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    iput-object p2, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$2;->val$c:Landroid/database/Cursor;

    iput p3, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$2;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 429
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$2;->this$1:Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;

    iget-object v0, v0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iget-object v1, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$2;->val$c:Landroid/database/Cursor;

    iget v2, p0, Lcom/google/android/talk/util/ChatSwitcher$SwitcherAdapter$2;->val$position:I

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/util/ChatSwitcher;->select(Landroid/database/Cursor;I)V

    .line 430
    return-void
.end method
