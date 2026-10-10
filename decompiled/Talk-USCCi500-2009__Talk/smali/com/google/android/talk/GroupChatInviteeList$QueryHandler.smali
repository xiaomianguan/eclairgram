.class final Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "GroupChatInviteeList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/GroupChatInviteeList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "QueryHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/GroupChatInviteeList;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/GroupChatInviteeList;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    .line 83
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 84
    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 4
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 90
    if-nez p3, :cond_0

    .line 91
    const-string v0, "talk"

    const-string v1, "Query failed. Try again without the avatar column."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    sget-object v1, Lcom/google/android/talk/BuddyList;->PROJECTION_NOAVATAR:[Ljava/lang/String;

    iput-object v1, v0, Lcom/google/android/talk/GroupChatInviteeList;->mProjection:[Ljava/lang/String;

    .line 94
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    iget-object v0, v0, Lcom/google/android/talk/GroupChatInviteeList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    iget-object v1, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    iget-object v1, v1, Lcom/google/android/talk/GroupChatInviteeList;->mProjection:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/RosterListAdapter;->setQueryProjection([Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    iget-object v1, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    iget-object v1, v1, Lcom/google/android/talk/GroupChatInviteeList;->mProjection:[Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    iget-object v2, v2, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionClause:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    iget-object v3, v3, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionArgs:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/talk/GroupChatInviteeList;->startQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 110
    :goto_0
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    iget-object v0, v0, Lcom/google/android/talk/GroupChatInviteeList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v0, p3}, Lcom/google/android/talk/RosterListAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 103
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    const-string v1, "username"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/talk/GroupChatInviteeList;->access$102(Lcom/google/android/talk/GroupChatInviteeList;I)I

    .line 106
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    invoke-virtual {v0}, Lcom/google/android/talk/GroupChatInviteeList;->restoreListViewState()V

    .line 109
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->this$0:Lcom/google/android/talk/GroupChatInviteeList;

    invoke-virtual {v0}, Lcom/google/android/talk/GroupChatInviteeList;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->requestFocus()Z

    goto :goto_0
.end method
