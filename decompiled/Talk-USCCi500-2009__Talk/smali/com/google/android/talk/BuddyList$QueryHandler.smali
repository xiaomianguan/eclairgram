.class final Lcom/google/android/talk/BuddyList$QueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "BuddyList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "QueryHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/BuddyList;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 370
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    .line 371
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 372
    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 4
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 376
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "onQueryComplete"

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 385
    :cond_0
    if-nez p3, :cond_1

    .line 386
    const-string v0, "talk"

    const-string v1, "Query failed. Try again without the avatar column."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 388
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    sget-object v1, Lcom/google/android/talk/BuddyList;->PROJECTION_NOAVATAR:[Ljava/lang/String;

    iput-object v1, v0, Lcom/google/android/talk/BuddyList;->mProjection:[Ljava/lang/String;

    .line 389
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    iget-object v1, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v1, v1, Lcom/google/android/talk/BuddyList;->mProjection:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/RosterListAdapter;->setQueryProjection([Ljava/lang/String;)V

    .line 390
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v1, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v1, v1, Lcom/google/android/talk/BuddyList;->mProjection:[Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v2, v2, Lcom/google/android/talk/BuddyList;->mSelectionClause:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/talk/BuddyList;->startQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 413
    :goto_0
    return-void

    .line 395
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v0, p3}, Lcom/google/android/talk/RosterListAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 397
    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_2

    .line 398
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$400(Lcom/google/android/talk/BuddyList;Z)V

    .line 401
    :cond_2
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "_id"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$702(Lcom/google/android/talk/BuddyList;I)I

    .line 402
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "username"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$802(Lcom/google/android/talk/BuddyList;I)I

    .line 403
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "nickname"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$902(Lcom/google/android/talk/BuddyList;I)I

    .line 404
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "provider"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$1002(Lcom/google/android/talk/BuddyList;I)I

    .line 405
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "account"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$1102(Lcom/google/android/talk/BuddyList;I)I

    .line 406
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "type"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$1202(Lcom/google/android/talk/BuddyList;I)I

    .line 407
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "subscriptionStatus"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$1302(Lcom/google/android/talk/BuddyList;I)I

    .line 408
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "subscriptionType"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$1402(Lcom/google/android/talk/BuddyList;I)I

    .line 409
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "groupchat"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$1502(Lcom/google/android/talk/BuddyList;I)I

    .line 412
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$QueryHandler;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-virtual {v0}, Lcom/google/android/talk/BuddyList;->restoreListViewState()V

    goto :goto_0
.end method
