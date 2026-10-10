.class Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/PageViewGroup$IViewHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatScreen$GalleryAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChatViewHolder"
.end annotation


# instance fields
.field private mChatView:Lcom/google/android/talk/ChatView;

.field mHasFocus:Z

.field mIntent:Landroid/content/Intent;

.field final synthetic this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ChatScreen$GalleryAdapter;Landroid/content/Intent;)V
    .locals 0
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 297
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 298
    iput-object p2, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mIntent:Landroid/content/Intent;

    .line 299
    return-void
.end method


# virtual methods
.method public clearScrollingCache()V
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->clearScrollingCache()V

    .line 399
    return-void
.end method

.method public createScrollingCache()V
    .locals 1

    .prologue
    .line 394
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->createScrollingCache()V

    .line 395
    return-void
.end method

.method public focus()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 317
    iget-boolean v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mHasFocus:Z

    if-eqz v0, :cond_0

    .line 364
    :goto_0
    return-void

    .line 321
    :cond_0
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->access$300()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_1

    .line 322
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FOCUS: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v1}, Lcom/google/android/talk/ChatView;->getContact()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$400(Ljava/lang/String;)V

    .line 325
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mHasFocus:Z

    .line 329
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->getSession()Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v0

    if-nez v0, :cond_2

    .line 330
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v1}, Lcom/google/android/talk/ChatView;->getContact()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v2}, Lcom/google/android/talk/ChatView;->getAccountId()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/talk/ChatScreen;->access$1000(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IChatSession;

    .line 332
    :cond_2
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0, v4}, Lcom/google/android/talk/ChatView;->initSession(Z)Z

    .line 338
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v1, v1, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$1100(Lcom/google/android/talk/ChatScreen;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatView;->restoreUnsentComposedMessage(Landroid/widget/TextView;)V

    .line 342
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->focus()V

    .line 343
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-static {v0, v1}, Lcom/google/android/talk/ChatScreen;->access$1200(Lcom/google/android/talk/ChatScreen;Lcom/google/android/talk/ChatView;)V

    .line 358
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$1300(Lcom/google/android/talk/ChatScreen;)Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 359
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$1300(Lcom/google/android/talk/ChatScreen;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 360
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/talk/ChatScreen;->access$1302(Lcom/google/android/talk/ChatScreen;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 363
    :cond_3
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatScreen;->updateTitle(Landroid/view/View;)V

    goto/16 :goto_0
.end method

.method public get()Landroid/view/View;
    .locals 7

    .prologue
    const/4 v3, -0x1

    .line 302
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    if-nez v0, :cond_0

    .line 303
    new-instance v0, Lcom/google/android/talk/ChatView;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v1, v1, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    iget-object v3, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mIntent:Landroid/content/Intent;

    iget-object v4, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v4, v4, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mCursor:Landroid/database/Cursor;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v6, v6, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v6}, Lcom/google/android/talk/ChatScreen;->access$900(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/ChatScreen$ChatHost;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/talk/ChatView;-><init>(Landroid/content/Context;Landroid/view/ViewGroup$LayoutParams;Landroid/content/Intent;Landroid/database/Cursor;Landroid/os/Bundle;Lcom/google/android/talk/ChatScreen$ChatHost;)V

    iput-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    .line 313
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    return-object v0
.end method

.method public run(Lcom/google/android/talk/ChatScreen$ChatRunnable;)Z
    .locals 1
    .param p1, "cr"    # Lcom/google/android/talk/ChatScreen$ChatRunnable;

    .prologue
    .line 402
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-interface {p1, v0}, Lcom/google/android/talk/ChatScreen$ChatRunnable;->run(Lcom/google/android/talk/ChatView;)Z

    move-result v0

    return v0
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 367
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->access$300()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 368
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "STOP: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v1}, Lcom/google/android/talk/ChatView;->getContact()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$400(Ljava/lang/String;)V

    .line 371
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->unfocus()V

    .line 372
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->onStop()V

    .line 373
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->mFreeViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 374
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mHasFocus:Z

    .line 375
    return-void
.end method

.method public unfocus()V
    .locals 2

    .prologue
    .line 378
    iget-boolean v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mHasFocus:Z

    if-nez v0, :cond_0

    .line 391
    :goto_0
    return-void

    .line 382
    :cond_0
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->access$300()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_1

    .line 383
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UNFOCUS: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v1}, Lcom/google/android/talk/ChatView;->getContact()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$400(Ljava/lang/String;)V

    .line 385
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mHasFocus:Z

    .line 387
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-static {v0, v1}, Lcom/google/android/talk/ChatScreen;->access$1400(Lcom/google/android/talk/ChatScreen;Lcom/google/android/talk/ChatView;)V

    .line 389
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->this$1:Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v1, v1, Lcom/google/android/talk/ChatScreen$GalleryAdapter;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$1100(Lcom/google/android/talk/ChatScreen;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatView;->saveUnsentComposedMessage(Landroid/widget/TextView;)V

    .line 390
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$GalleryAdapter$ChatViewHolder;->mChatView:Lcom/google/android/talk/ChatView;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->unfocus()V

    goto :goto_0
.end method
