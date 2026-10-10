.class Lcom/google/android/talk/RosterListAdapter;
.super Landroid/widget/CursorAdapter;
.source "RosterListAdapter.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/RosterListAdapter$1;,
        Lcom/google/android/talk/RosterListAdapter$RosterListItemFactory;
    }
.end annotation


# static fields
.field private static final DBG:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "talk"


# instance fields
.field private mAccountId:J

.field private mApp:Lcom/google/android/talk/TalkApp;

.field protected mBaseSelectionClause:Ljava/lang/String;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mIsOnline:Z

.field private mMarkup:Lcom/google/android/talk/util/Markup;

.field private mNeedRequeryCursor:Z

.field private mProjection:[Ljava/lang/String;

.field private mProviderId:J

.field private mRosterListActivity:Lcom/google/android/talk/RosterListActivity;

.field private mScrollState:I

.field protected mSelectionArgs:[Ljava/lang/String;

.field protected mSelectionClause:Ljava/lang/String;

.field protected mUnfilteredCursor:Landroid/database/Cursor;

.field protected mUnfilteredSelectionClause:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;JJLcom/google/android/talk/RosterListActivity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3
    .param p1, "c"    # Landroid/database/Cursor;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J
    .param p6, "activity"    # Lcom/google/android/talk/RosterListActivity;
    .param p7, "unfilteredSelectionClause"    # Ljava/lang/String;
    .param p8, "baseSelectionClause"    # Ljava/lang/String;
    .param p9, "selectionArgs"    # [Ljava/lang/String;
    .param p10, "projection"    # [Ljava/lang/String;

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, p6, p1, v0}, Landroid/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/talk/RosterListAdapter;->mIsOnline:Z

    .line 65
    invoke-static {p6}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mApp:Lcom/google/android/talk/TalkApp;

    .line 66
    iput-object p6, p0, Lcom/google/android/talk/RosterListAdapter;->mRosterListActivity:Lcom/google/android/talk/RosterListActivity;

    .line 67
    new-instance v0, Lcom/google/android/talk/util/Markup;

    invoke-direct {v0, p6}, Lcom/google/android/talk/util/Markup;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mMarkup:Lcom/google/android/talk/util/Markup;

    .line 69
    invoke-static {p6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {v0, p6}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 70
    iget-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mInflater:Landroid/view/LayoutInflater;

    new-instance v1, Lcom/google/android/talk/RosterListAdapter$RosterListItemFactory;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/android/talk/RosterListAdapter$RosterListItemFactory;-><init>(Lcom/google/android/talk/RosterListAdapter;Lcom/google/android/talk/RosterListAdapter$1;)V

    invoke-virtual {v0, v1}, Landroid/view/LayoutInflater;->setFactory(Landroid/view/LayoutInflater$Factory;)V

    .line 72
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/google/android/talk/RosterListAdapter;->setAccountInfo(JJ)V

    .line 74
    invoke-virtual {p0, p7}, Lcom/google/android/talk/RosterListAdapter;->setUnfilteredSelectionClause(Ljava/lang/String;)V

    .line 75
    iput-object p8, p0, Lcom/google/android/talk/RosterListAdapter;->mBaseSelectionClause:Ljava/lang/String;

    .line 76
    iput-object p9, p0, Lcom/google/android/talk/RosterListAdapter;->mSelectionArgs:[Ljava/lang/String;

    .line 77
    iput-object p10, p0, Lcom/google/android/talk/RosterListAdapter;->mProjection:[Ljava/lang/String;

    .line 79
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListAdapter;->resetQuerySelection()V

    .line 80
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/talk/RosterListAdapter;)Lcom/google/android/talk/TalkApp;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/RosterListAdapter;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mApp:Lcom/google/android/talk/TalkApp;

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 206
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RosterListAdapter] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 95
    move-object v0, p1

    check-cast v0, Lcom/google/android/talk/RosterListItem;

    move-object v1, v0

    iget-wide v3, p0, Lcom/google/android/talk/RosterListAdapter;->mProviderId:J

    iget-wide v5, p0, Lcom/google/android/talk/RosterListAdapter;->mAccountId:J

    iget-boolean v7, p0, Lcom/google/android/talk/RosterListAdapter;->mIsOnline:Z

    invoke-virtual {p0}, Lcom/google/android/talk/RosterListAdapter;->isScrolling()Z

    move-result v8

    iget-object v9, p0, Lcom/google/android/talk/RosterListAdapter;->mMarkup:Lcom/google/android/talk/util/Markup;

    move-object v2, p3

    invoke-virtual/range {v1 .. v9}, Lcom/google/android/talk/RosterListItem;->bind(Landroid/database/Cursor;JJZZLcom/google/android/talk/util/Markup;)V

    .line 102
    return-void
.end method

.method public getItemViewType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 106
    invoke-virtual {p0, p1}, Lcom/google/android/talk/RosterListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 107
    .local v0, "c":Landroid/database/Cursor;
    if-nez v0, :cond_0

    .line 110
    const/4 v1, -0x1

    .line 112
    :goto_0
    return v1

    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/RosterListAdapter;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-static {v1, v0}, Lcom/google/android/talk/RosterListItem;->getItemViewType(Lcom/google/android/talk/TalkApp;Landroid/database/Cursor;)I

    move-result v1

    goto :goto_0
.end method

.method protected getQueryProjection()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mProjection:[Ljava/lang/String;

    return-object v0
.end method

.method public getQuerySelection()Ljava/lang/String;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mSelectionClause:Ljava/lang/String;

    return-object v0
.end method

.method protected getQuerySelectionArgs()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mSelectionArgs:[Ljava/lang/String;

    return-object v0
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 117
    const/4 v0, 0x3

    return v0
.end method

.method public final isScrolling()Z
    .locals 2

    .prologue
    .line 231
    iget v0, p0, Lcom/google/android/talk/RosterListAdapter;->mScrollState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected makeQuerySelection(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "filter"    # Ljava/lang/String;

    .prologue
    .line 167
    invoke-static {p1}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 169
    const-string v0, "%s AND ((%s LIKE %s) OR (%s LIKE %s))"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/talk/RosterListAdapter;->mBaseSelectionClause:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "username"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p1, v1, v2

    const/4 v2, 0x3

    const-string v3, "nickname"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mSelectionClause:Ljava/lang/String;

    .line 174
    iget-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mSelectionClause:Ljava/lang/String;

    return-object v0
.end method

.method protected makeQuerySelectionArgs()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mSelectionArgs:[Ljava/lang/String;

    return-object v0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 84
    iget-object v1, p0, Lcom/google/android/talk/RosterListAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v2, 0x7f03000e

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/talk/RosterListItem;

    .line 86
    .local v0, "view":Lcom/google/android/talk/RosterListItem;
    iget-object v1, p0, Lcom/google/android/talk/RosterListAdapter;->mCursor:Landroid/database/Cursor;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/RosterListItem;->init(Landroid/database/Cursor;)V

    .line 89
    const/high16 v1, 0x60000

    invoke-virtual {v0, v1}, Lcom/google/android/talk/RosterListItem;->setDescendantFocusability(I)V

    .line 90
    return-object v0
.end method

.method public final onScroll(Landroid/widget/AbsListView;III)V
    .locals 0
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "first"    # I
    .param p3, "visible"    # I
    .param p4, "total"    # I

    .prologue
    .line 228
    return-void
.end method

.method public final onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 3
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 235
    iget v0, p0, Lcom/google/android/talk/RosterListAdapter;->mScrollState:I

    .line 237
    .local v0, "oldState":I
    iput p2, p0, Lcom/google/android/talk/RosterListAdapter;->mScrollState:I

    .line 241
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 242
    iget-boolean v1, p0, Lcom/google/android/talk/RosterListAdapter;->mNeedRequeryCursor:Z

    if-eqz v1, :cond_1

    .line 243
    iget-object v1, p0, Lcom/google/android/talk/RosterListAdapter;->mRosterListActivity:Lcom/google/android/talk/RosterListActivity;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/google/android/talk/RosterListActivity;->requeryCursor(Z)V

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 245
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method public resetQuerySelection()V
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mUnfilteredSelectionClause:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/talk/RosterListAdapter;->mSelectionClause:Ljava/lang/String;

    .line 183
    return-void
.end method

.method public runQueryOnBackgroundThread(Ljava/lang/CharSequence;)Landroid/database/Cursor;
    .locals 8
    .param p1, "constraint"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v2, 0x0

    .line 130
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 131
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListAdapter;->resetQuerySelection()V

    .line 133
    iget-object v1, p0, Lcom/google/android/talk/RosterListAdapter;->mUnfilteredCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_0

    .line 135
    iget-object v6, p0, Lcom/google/android/talk/RosterListAdapter;->mUnfilteredCursor:Landroid/database/Cursor;

    .line 139
    .local v6, "c":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->requery()Z

    .line 141
    iput-object v2, p0, Lcom/google/android/talk/RosterListAdapter;->mUnfilteredCursor:Landroid/database/Cursor;

    move-object v1, v6

    .line 159
    .end local v6    # "c":Landroid/database/Cursor;
    :goto_0
    return-object v1

    .line 145
    :cond_0
    invoke-super {p0, v2}, Landroid/widget/CursorAdapter;->runQueryOnBackgroundThread(Ljava/lang/CharSequence;)Landroid/database/Cursor;

    move-result-object v1

    goto :goto_0

    .line 148
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/RosterListAdapter;->mUnfilteredCursor:Landroid/database/Cursor;

    if-nez v1, :cond_2

    .line 149
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/RosterListAdapter;->mUnfilteredCursor:Landroid/database/Cursor;

    .line 152
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x25

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 153
    .local v7, "filter":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/android/talk/RosterListAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 155
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {p0, v7}, Lcom/google/android/talk/RosterListAdapter;->makeQuerySelection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 159
    .local v3, "selection":Ljava/lang/String;
    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/talk/RosterListAdapter;->mProjection:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/talk/RosterListAdapter;->makeQuerySelectionArgs()[Ljava/lang/String;

    move-result-object v4

    const-string v5, "subscriptionType DESC, last_message_date DESC, mode DESC, nickname COLLATE UNICODE ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    goto :goto_0
.end method

.method setAccountInfo(JJ)V
    .locals 0
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J

    .prologue
    .line 123
    iput-wide p1, p0, Lcom/google/android/talk/RosterListAdapter;->mProviderId:J

    .line 124
    iput-wide p3, p0, Lcom/google/android/talk/RosterListAdapter;->mAccountId:J

    .line 125
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListAdapter;->notifyDataSetInvalidated()V

    .line 126
    return-void
.end method

.method final setIsOnline(Z)V
    .locals 0
    .param p1, "isOnline"    # Z

    .prologue
    .line 219
    iput-boolean p1, p0, Lcom/google/android/talk/RosterListAdapter;->mIsOnline:Z

    .line 220
    return-void
.end method

.method public setNeedRequeryCursor(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 223
    iput-boolean p1, p0, Lcom/google/android/talk/RosterListAdapter;->mNeedRequeryCursor:Z

    .line 224
    return-void
.end method

.method protected setQueryProjection([Ljava/lang/String;)V
    .locals 0
    .param p1, "projection"    # [Ljava/lang/String;

    .prologue
    .line 198
    iput-object p1, p0, Lcom/google/android/talk/RosterListAdapter;->mProjection:[Ljava/lang/String;

    .line 199
    return-void
.end method

.method public setUnfilteredSelectionClause(Ljava/lang/String;)V
    .locals 0
    .param p1, "selectionClause"    # Ljava/lang/String;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/google/android/talk/RosterListAdapter;->mUnfilteredSelectionClause:Ljava/lang/String;

    .line 203
    return-void
.end method
