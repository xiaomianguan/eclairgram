.class Lcom/google/android/talk/ChatView$ChatAdapter;
.super Landroid/widget/CursorAdapter;
.source "ChatView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ChatAdapter"
.end annotation


# instance fields
.field public mNeedRequeryCursor:Z

.field public mScrollState:I

.field final synthetic this$0:Lcom/google/android/talk/ChatView;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ChatView;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "c"    # Landroid/database/Cursor;

    .prologue
    .line 1272
    iput-object p1, p0, Lcom/google/android/talk/ChatView$ChatAdapter;->this$0:Lcom/google/android/talk/ChatView;

    .line 1273
    invoke-direct {p0, p2, p3}, Landroid/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;)V

    .line 1274
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1278
    check-cast p1, Lcom/google/android/talk/ChatView$MessageItem;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView$ChatAdapter;->showPlainText()Z

    move-result v0

    invoke-virtual {p1, p3, v0}, Lcom/google/android/talk/ChatView$MessageItem;->bind(Landroid/database/Cursor;Z)V

    .line 1279
    return-void
.end method

.method isScrolling()Z
    .locals 2

    .prologue
    .line 1328
    iget v0, p0, Lcom/google/android/talk/ChatView$ChatAdapter;->mScrollState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1283
    new-instance v0, Lcom/google/android/talk/ChatView$MessageItem;

    iget-object v1, p0, Lcom/google/android/talk/ChatView$ChatAdapter;->this$0:Lcom/google/android/talk/ChatView;

    iget-object v2, p0, Lcom/google/android/talk/ChatView$ChatAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, v2}, Lcom/google/android/talk/ChatView$MessageItem;-><init>(Lcom/google/android/talk/ChatView;Landroid/content/Context;)V

    return-object v0
.end method

.method public final onScroll(Landroid/widget/AbsListView;III)V
    .locals 0
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "first"    # I
    .param p3, "visible"    # I
    .param p4, "total"    # I

    .prologue
    .line 1298
    return-void
.end method

.method public final onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 2
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 1301
    iget v0, p0, Lcom/google/android/talk/ChatView$ChatAdapter;->mScrollState:I

    .line 1303
    .local v0, "oldState":I
    iput p2, p0, Lcom/google/android/talk/ChatView$ChatAdapter;->mScrollState:I

    .line 1306
    iget-object v1, p0, Lcom/google/android/talk/ChatView$ChatAdapter;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v1}, Lcom/google/android/talk/ChatView;->access$4400(Lcom/google/android/talk/ChatView;)V

    .line 1320
    return-void
.end method

.method setNeedRequeryCursor(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 1332
    iput-boolean p1, p0, Lcom/google/android/talk/ChatView$ChatAdapter;->mNeedRequeryCursor:Z

    .line 1333
    return-void
.end method

.method showPlainText()Z
    .locals 1

    .prologue
    .line 1324
    const/4 v0, 0x0

    return v0
.end method
