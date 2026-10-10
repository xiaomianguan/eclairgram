.class Lcom/google/android/talk/util/ChatSwitcher$4;
.super Landroid/content/AsyncQueryHandler;
.source "ChatSwitcher.java"


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

.field final synthetic val$onQueryCompleteCallback:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;


# direct methods
.method constructor <init>(Lcom/google/android/talk/util/ChatSwitcher;Landroid/content/ContentResolver;Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;)V
    .locals 0
    .param p2, "x0"    # Landroid/content/ContentResolver;

    .prologue
    .line 557
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iput-object p3, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->val$onQueryCompleteCallback:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    invoke-direct {p0, p2}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 4
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 525
    const-string v2, "talk"

    const/4 v3, 0x3

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 526
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "AsyncQueryHandler.onQueryComplete"

    invoke-static {v2, v3}, Lcom/google/android/talk/util/ChatSwitcher;->access$000(Lcom/google/android/talk/util/ChatSwitcher;Ljava/lang/String;)V

    .line 529
    :cond_0
    if-eqz p3, :cond_1

    .line 530
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "provider"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mProviderIdColumn:I

    .line 531
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "account"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mAccountIdColumn:I

    .line 532
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "username"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mUsernameColumn:I

    .line 533
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "nickname"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mNicknameColumn:I

    .line 534
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "mode"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mPresenceStatusColumn:I

    .line 535
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "last_unread_message"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mLastUnreadMessageColumn:I

    .line 536
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "avatars_hash"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mAvatarHashColumn:I

    .line 537
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "avatars_data"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mAvatarDataColumn:I

    .line 538
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "shortcut"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mShortcutColumn:I

    .line 539
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "last_message_date"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mLastChatColumn:I

    .line 540
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const-string v3, "groupchat"

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/google/android/talk/util/ChatSwitcher;->mGroupChatColumn:I

    .line 543
    :cond_1
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/google/android/talk/util/ChatSwitcher;->access$602(Lcom/google/android/talk/util/ChatSwitcher;Z)Z

    .line 544
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    invoke-static {v2}, Lcom/google/android/talk/util/ChatSwitcher;->access$700(Lcom/google/android/talk/util/ChatSwitcher;)V

    .line 546
    move-object v0, p2

    check-cast v0, Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    move-object v1, v0

    .line 547
    .local v1, "r":Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;
    if-eqz v1, :cond_2

    .line 548
    invoke-interface {v1, p3}, Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;->onComplete(Landroid/database/Cursor;)V

    .line 551
    :cond_2
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->val$onQueryCompleteCallback:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    if-eqz v2, :cond_3

    .line 552
    iget-object v2, p0, Lcom/google/android/talk/util/ChatSwitcher$4;->val$onQueryCompleteCallback:Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;

    invoke-interface {v2, p3}, Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;->onComplete(Landroid/database/Cursor;)V

    .line 554
    :cond_3
    return-void
.end method

.method protected onUpdateComplete(ILjava/lang/Object;I)V
    .locals 0
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "result"    # I

    .prologue
    .line 558
    invoke-super {p0, p1, p2, p3}, Landroid/content/AsyncQueryHandler;->onUpdateComplete(ILjava/lang/Object;I)V

    .line 559
    return-void
.end method
