.class public Lcom/google/android/talk/SearchHeaderCursorAdapter;
.super Landroid/widget/BaseAdapter;
.source "SearchHeaderCursorAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/SearchHeaderCursorAdapter$1;,
        Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "talk"

.field private static final VIEW_TYPE_FOOTER:I = 0x1

.field private static final VIEW_TYPE_NORMAL:I


# instance fields
.field private mAccount:Ljava/lang/String;

.field private mActivity:Landroid/app/Activity;

.field private mBatchMode:Z

.field private mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

.field private mFactory:Landroid/view/LayoutInflater;

.field private mGmail:Landroid/provider/Gmail;

.field private mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

.field mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

.field private mSearchString:Ljava/lang/String;

.field private mStatus:Landroid/provider/Gmail$CursorStatus;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/google/android/talk/IProgressMonitor;Landroid/provider/Gmail;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "progressMonitor"    # Lcom/google/android/talk/IProgressMonitor;
    .param p3, "gmail"    # Landroid/provider/Gmail;

    .prologue
    const/4 v2, 0x0

    .line 62
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 59
    iput-boolean v2, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mBatchMode:Z

    .line 63
    iput-object p1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mActivity:Landroid/app/Activity;

    .line 64
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mFactory:Landroid/view/LayoutInflater;

    .line 65
    iput-object p2, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    .line 66
    sget-object v0, Landroid/provider/Gmail$CursorStatus;->LOADED:Landroid/provider/Gmail$CursorStatus;

    iput-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mStatus:Landroid/provider/Gmail$CursorStatus;

    .line 67
    iput-object p3, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mGmail:Landroid/provider/Gmail;

    .line 68
    new-instance v0, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;-><init>(Lcom/google/android/talk/SearchHeaderCursorAdapter;Landroid/content/Context;Landroid/database/Cursor;)V

    iput-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    .line 69
    iput-boolean v2, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mBatchMode:Z

    .line 70
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/SearchHeaderCursorAdapter;)Landroid/provider/Gmail$ConversationCursor;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchHeaderCursorAdapter;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/talk/SearchHeaderCursorAdapter;)Landroid/view/LayoutInflater;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchHeaderCursorAdapter;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mFactory:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/talk/SearchHeaderCursorAdapter;Landroid/provider/Gmail$CursorStatus;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SearchHeaderCursorAdapter;
    .param p1, "x1"    # Landroid/provider/Gmail$CursorStatus;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->cursorStatusChanged(Landroid/provider/Gmail$CursorStatus;)V

    return-void
.end method

.method private cursorStatusChanged(Landroid/provider/Gmail$CursorStatus;)V
    .locals 8
    .param p1, "newStatus"    # Landroid/provider/Gmail$CursorStatus;

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x0

    .line 96
    iget-object v1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mStatus:Landroid/provider/Gmail$CursorStatus;

    if-eq p1, v1, :cond_0

    .line 97
    const-string v1, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SearchHeaderCursorAdapter.cursorStatusChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    iput-object p1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mStatus:Landroid/provider/Gmail$CursorStatus;

    .line 100
    sget-object v1, Lcom/google/android/talk/SearchHeaderCursorAdapter$1;->$SwitchMap$android$provider$Gmail$CursorStatus:[I

    iget-object v2, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mStatus:Landroid/provider/Gmail$CursorStatus;

    invoke-virtual {v2}, Landroid/provider/Gmail$CursorStatus;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 120
    :cond_0
    :goto_0
    return-void

    .line 102
    :pswitch_0
    iget-object v1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    invoke-interface {v1}, Lcom/google/android/talk/IProgressMonitor;->done()V

    .line 104
    iget-object v1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->onContentChanged()V

    .line 106
    invoke-static {v4}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    .line 107
    .local v0, "app":Lcom/google/android/talk/TalkApp;
    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getRecentSuggestions()Landroid/provider/SearchRecentSuggestions;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mSearchString:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mActivity:Landroid/app/Activity;

    const v4, 0x7f06009e

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    invoke-virtual {v6}, Landroid/provider/Gmail$ConversationCursor;->count()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mSearchString:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/provider/SearchRecentSuggestions;->saveRecentQuery(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 113
    .end local v0    # "app":Lcom/google/android/talk/TalkApp;
    :pswitch_1
    iget-object v1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    invoke-interface {v1, v4, v7}, Lcom/google/android/talk/IProgressMonitor;->beginTask(Ljava/lang/CharSequence;I)V

    goto :goto_0

    .line 116
    :pswitch_2
    iget-object v1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    invoke-interface {v1}, Lcom/google/android/talk/IProgressMonitor;->done()V

    goto :goto_0

    .line 100
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public final changeCursor(Landroid/provider/Gmail$ConversationCursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/provider/Gmail$ConversationCursor;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    .line 82
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    iget-object v1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    invoke-virtual {v1}, Landroid/provider/Gmail$ConversationCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 84
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->getStatus()Landroid/provider/Gmail$CursorStatus;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->cursorStatusChanged(Landroid/provider/Gmail$CursorStatus;)V

    .line 89
    :goto_0
    return-void

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 87
    sget-object v0, Landroid/provider/Gmail$CursorStatus;->LOADED:Landroid/provider/Gmail$CursorStatus;

    invoke-direct {p0, v0}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->cursorStatusChanged(Landroid/provider/Gmail$CursorStatus;)V

    goto :goto_0
.end method

.method public getCount()I
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 128
    iget-object v2, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v2}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->isValid()Z

    move-result v2

    if-nez v2, :cond_0

    move v2, v4

    .line 141
    :goto_0
    return v2

    .line 130
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mStatus:Landroid/provider/Gmail$CursorStatus;

    sget-object v3, Landroid/provider/Gmail$CursorStatus;->ERROR:Landroid/provider/Gmail$CursorStatus;

    if-eq v2, v3, :cond_1

    iget-object v2, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mStatus:Landroid/provider/Gmail$CursorStatus;

    sget-object v3, Landroid/provider/Gmail$CursorStatus;->LOADING:Landroid/provider/Gmail$CursorStatus;

    if-ne v2, v3, :cond_2

    :cond_1
    move v1, v5

    .line 133
    .local v1, "shouldShowFooter":Z
    :goto_1
    iget-object v2, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v2}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->getCount()I

    move-result v2

    if-eqz v1, :cond_3

    move v3, v5

    :goto_2
    add-int v0, v2, v3

    .local v0, "result":I
    move v2, v0

    .line 141
    goto :goto_0

    .end local v0    # "result":I
    .end local v1    # "shouldShowFooter":Z
    :cond_2
    move v1, v4

    .line 130
    goto :goto_1

    .restart local v1    # "shouldShowFooter":Z
    :cond_3
    move v3, v4

    .line 133
    goto :goto_2
.end method

.method public final getCursor()Landroid/provider/Gmail$ConversationCursor;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    return-object v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->count()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v0, p1}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    .line 148
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 153
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->count()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v0, p1}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->getItemId(I)J

    move-result-wide v0

    .line 156
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 181
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->getCount()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 182
    const/4 v0, 0x1

    .line 184
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 188
    iget-object v3, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v3}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->getCount()I

    move-result v3

    if-ne p1, v3, :cond_1

    const/4 v3, 0x1

    move v2, v3

    .line 197
    .local v2, "wantsFooterView":Z
    :goto_0
    if-eqz v2, :cond_2

    .line 198
    move-object v0, p2

    check-cast v0, Lcom/google/android/talk/SearchFooterView;

    move-object v1, v0

    .line 199
    .local v1, "footerView":Lcom/google/android/talk/SearchFooterView;
    if-nez v1, :cond_0

    .line 200
    iget-object v3, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mFactory:Landroid/view/LayoutInflater;

    const v4, 0x7f030012

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .end local v1    # "footerView":Lcom/google/android/talk/SearchFooterView;
    check-cast v1, Lcom/google/android/talk/SearchFooterView;

    .line 202
    .restart local v1    # "footerView":Lcom/google/android/talk/SearchFooterView;
    :cond_0
    iget-object v3, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mStatus:Landroid/provider/Gmail$CursorStatus;

    iget-object v4, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mConversationCursor:Landroid/provider/Gmail$ConversationCursor;

    invoke-virtual {v1, v3, v4}, Lcom/google/android/talk/SearchFooterView;->bind(Landroid/provider/Gmail$CursorStatus;Landroid/provider/Gmail$ConversationCursor;)V

    move-object v3, v1

    .line 205
    .end local v1    # "footerView":Lcom/google/android/talk/SearchFooterView;
    :goto_1
    return-object v3

    .line 188
    .end local v2    # "wantsFooterView":Z
    :cond_1
    const/4 v3, 0x0

    move v2, v3

    goto :goto_0

    .line 205
    .restart local v2    # "wantsFooterView":Z
    :cond_2
    iget-object v3, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v3, p1, p2, p3}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    goto :goto_1
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 176
    const/4 v0, 0x2

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 124
    const/4 v0, 0x1

    return v0
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->notifyDataSetChanged()V

    .line 212
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v0, p1}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 165
    :cond_0
    return-void
.end method

.method public final setAccount(Ljava/lang/String;)V
    .locals 0
    .param p1, "account"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mAccount:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public final setSearch(Ljava/lang/String;)V
    .locals 0
    .param p1, "searchString"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mSearchString:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 169
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/google/android/talk/SearchHeaderCursorAdapter;->mInnerAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;

    invoke-virtual {v0, p1}, Lcom/google/android/talk/SearchHeaderCursorAdapter$InnerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 172
    :cond_0
    return-void
.end method
