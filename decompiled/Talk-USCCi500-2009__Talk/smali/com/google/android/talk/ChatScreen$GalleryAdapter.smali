.class Lcom/google/android/talk/ChatScreen$GalleryAdapter;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/PageViewGroup$Adapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GalleryAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;
    }
.end annotation


# instance fields
.field mCursor:Landroid/database/Cursor;

.field mFreeViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/android/talk/ChatScreen;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ChatScreen;Landroid/database/Cursor;)V
    .locals 1
    .param p2, "c"    # Landroid/database/Cursor;

    .prologue
    .line 247
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 245
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mFreeViews:Ljava/util/ArrayList;

    .line 249
    iput-object p2, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    .line 250
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCursor()Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method public getIntent(I)Landroid/content/Intent;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 261
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 263
    :cond_0
    const/4 v1, 0x0

    .line 267
    :goto_0
    return-object v1

    .line 266
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$800(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/util/ChatSwitcher;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/android/talk/util/ChatSwitcher;->intentForPosition(I)Landroid/content/Intent;

    move-result-object v0

    .local v0, "intent":Landroid/content/Intent;
    move-object v1, v0

    .line 267
    goto :goto_0
.end method

.method public getView(ILandroid/view/ViewGroup;)Lcom/google/android/talk/PageViewGroup$IViewHolder;
    .locals 5
    .param p1, "position"    # I
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 271
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    move-object v2, v4

    .line 289
    :goto_0
    return-object v2

    .line 276
    :cond_1
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v2}, Lcom/google/android/talk/ChatScreen;->access$800(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/util/ChatSwitcher;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/google/android/talk/util/ChatSwitcher;->intentForPosition(I)Landroid/content/Intent;

    move-result-object v0

    .line 277
    .local v0, "intent":Landroid/content/Intent;
    if-nez v0, :cond_2

    move-object v2, v4

    .line 279
    goto :goto_0

    .line 282
    :cond_2
    const/4 v1, 0x0

    .line 283
    .local v1, "result":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mFreeViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 284
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mFreeViews:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "result":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    check-cast v1, Lcom/google/android/talk/PageViewGroup$IViewHolder;

    .line 285
    .restart local v1    # "result":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    invoke-interface {v1}, Lcom/google/android/talk/PageViewGroup$IViewHolder;->get()Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/talk/ChatView;

    check-cast v2, Lcom/google/android/talk/ChatView;

    iget-object v3, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    invoke-virtual {v2, v0, v3, v4}, Lcom/google/android/talk/ChatView;->initialize(Landroid/content/Intent;Landroid/database/Cursor;Landroid/os/Bundle;)V

    :goto_1
    move-object v2, v1

    .line 289
    goto :goto_0

    .line 287
    :cond_3
    new-instance v1, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;

    .end local v1    # "result":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    invoke-direct {v1, p0, v0}, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;-><init>(Lcom/google/android/talk/ChatScreen$GalleryAdapter;Landroid/content/Intent;)V

    .restart local v1    # "result":Lcom/google/android/talk/PageViewGroup$IViewHolder;
    goto :goto_1
.end method
