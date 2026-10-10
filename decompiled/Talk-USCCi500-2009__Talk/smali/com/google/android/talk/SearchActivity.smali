.class public Lcom/google/android/talk/SearchActivity;
.super Landroid/app/ListActivity;
.source "SearchActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/SearchActivity$QueryHandler;
    }
.end annotation


# static fields
.field public static final EXTRA_USERNAME:Ljava/lang/String; = "username"

.field private static final LOG_TAG:Ljava/lang/String; = "talk"


# instance fields
.field private mApp:Lcom/google/android/talk/TalkApp;

.field private mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

.field private mEmptyView:Landroid/widget/TextView;

.field private mGmail:Landroid/provider/Gmail;

.field private mMustRequeryCursor:Z

.field private mQueryHandler:Lcom/google/android/talk/SearchActivity$QueryHandler;

.field private mQueryString:Ljava/lang/String;

.field private mUserName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/talk/SearchActivity;->mMustRequeryCursor:Z

    .line 305
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/SearchActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchActivity;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/talk/SearchActivity;->mUserName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/talk/SearchActivity;)Landroid/provider/Gmail;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchActivity;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/talk/SearchActivity;->mGmail:Landroid/provider/Gmail;

    return-object v0
.end method

.method private createConversationIntent(Landroid/provider/Gmail$ConversationCursor;Z)Landroid/content/Intent;
    .locals 4
    .param p1, "cursor"    # Landroid/provider/Gmail$ConversationCursor;
    .param p2, "cursorIsTransient"    # Z

    .prologue
    .line 248
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/google/android/talk/SearchChatResultActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 249
    .local v0, "result":Landroid/content/Intent;
    const-string v1, "thread-id"

    invoke-virtual {p1}, Landroid/provider/Gmail$ConversationCursor;->getConversationId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 250
    const-string v1, "account"

    iget-object v2, p0, Lcom/google/android/talk/SearchActivity;->mUserName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 252
    return-object v0
.end method

.method private doSearchQuery(Landroid/content/Intent;Ljava/lang/String;)V
    .locals 8
    .param p1, "queryIntent"    # Landroid/content/Intent;
    .param p2, "entryPoint"    # Ljava/lang/String;

    .prologue
    const-string v2, "talk"

    .line 282
    const-string v0, "query"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchActivity;->mQueryString:Ljava/lang/String;

    .line 285
    iget-object v0, p0, Lcom/google/android/talk/SearchActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getCurrentAccountInfo()Lcom/google/android/talk/TalkApp$AccountInfo;

    move-result-object v6

    .line 286
    .local v6, "accountInfo":Lcom/google/android/talk/TalkApp$AccountInfo;
    if-eqz v6, :cond_0

    iget-object v0, v6, Lcom/google/android/talk/TalkApp$AccountInfo;->mUsername:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 287
    :cond_0
    const-string v0, "talk"

    const-string v0, "No AccountInfo & no username, bailing from search."

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    invoke-virtual {p0}, Lcom/google/android/talk/SearchActivity;->finish()V

    .line 302
    :goto_0
    return-void

    .line 291
    :cond_1
    iget-object v0, v6, Lcom/google/android/talk/TalkApp$AccountInfo;->mUsername:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/talk/SearchActivity;->mUserName:Ljava/lang/String;

    .line 292
    iget-object v0, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mUserName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->setAccount(Ljava/lang/String;)V

    .line 294
    const-string v0, "talk"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "doSearchQuery queryString: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mQueryString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " userName: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mUserName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    const/4 v7, 0x0

    .line 297
    .local v7, "selectionArgs":[Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "in:chats "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mQueryString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 298
    .local v4, "query":Ljava/lang/String;
    iget-object v0, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mQueryString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->setSearch(Ljava/lang/String;)V

    .line 299
    iget-object v0, p0, Lcom/google/android/talk/SearchActivity;->mQueryHandler:Lcom/google/android/talk/SearchActivity$QueryHandler;

    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchActivity$QueryHandler;->setAdapter(Lcom/google/android/talk/SearchHeaderCursorAdapter;)V

    .line 300
    iget-object v0, p0, Lcom/google/android/talk/SearchActivity;->mGmail:Landroid/provider/Gmail;

    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mUserName:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/talk/SearchActivity;->mQueryHandler:Lcom/google/android/talk/SearchActivity$QueryHandler;

    const/4 v3, 0x0

    sget-object v5, Landroid/provider/Gmail$BecomeActiveNetworkCursor;->YES:Landroid/provider/Gmail$BecomeActiveNetworkCursor;

    invoke-virtual/range {v0 .. v5}, Landroid/provider/Gmail;->runQueryForConversations(Ljava/lang/String;Landroid/content/AsyncQueryHandler;ILjava/lang/String;Landroid/provider/Gmail$BecomeActiveNetworkCursor;)V

    goto :goto_0
.end method

.method private maybeRequery()V
    .locals 2

    .prologue
    .line 202
    iget-boolean v1, p0, Lcom/google/android/talk/SearchActivity;->mMustRequeryCursor:Z

    if-eqz v1, :cond_0

    .line 203
    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    invoke-virtual {v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->getCursor()Landroid/provider/Gmail$ConversationCursor;

    move-result-object v0

    .line 204
    .local v0, "conversationCursor":Landroid/provider/Gmail$ConversationCursor;
    if-eqz v0, :cond_0

    .line 205
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/talk/SearchActivity;->mMustRequeryCursor:Z

    .line 206
    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->becomeActiveNetworkCursor()V

    .line 207
    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->requery()Z

    .line 210
    .end local v0    # "conversationCursor":Landroid/provider/Gmail$ConversationCursor;
    :cond_0
    return-void
.end method

.method private openConversation(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 225
    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    invoke-virtual {v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->getCursor()Landroid/provider/Gmail$ConversationCursor;

    move-result-object v0

    .line 226
    .local v0, "cursor":Landroid/provider/Gmail$ConversationCursor;
    invoke-virtual {v0, p1}, Landroid/provider/Gmail$ConversationCursor;->moveTo(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 227
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/talk/SearchActivity;->openConversation(Landroid/provider/Gmail$ConversationCursor;Z)V

    .line 229
    :cond_0
    return-void
.end method

.method private openConversation(Landroid/provider/Gmail$ConversationCursor;Z)V
    .locals 1
    .param p1, "cursor"    # Landroid/provider/Gmail$ConversationCursor;
    .param p2, "cursorIsTransient"    # Z

    .prologue
    .line 237
    invoke-direct {p0, p1, p2}, Lcom/google/android/talk/SearchActivity;->createConversationIntent(Landroid/provider/Gmail$ConversationCursor;Z)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchActivity;->startActivity(Landroid/content/Intent;)V

    .line 238
    return-void
.end method


# virtual methods
.method public isSelected(J)Z
    .locals 1
    .param p1, "conversationId"    # J

    .prologue
    .line 213
    const/4 v0, 0x0

    return v0
.end method

.method public onContentChanged()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 119
    iget-object v2, p0, Lcom/google/android/talk/SearchActivity;->mEmptyView:Landroid/widget/TextView;

    if-eqz v2, :cond_0

    .line 120
    iget-object v2, p0, Lcom/google/android/talk/SearchActivity;->mQueryString:Ljava/lang/String;

    if-nez v2, :cond_2

    const-string v2, ""

    move-object v0, v2

    .line 122
    .local v0, "msg":Ljava/lang/String;
    :goto_0
    iget-object v2, p0, Lcom/google/android/talk/SearchActivity;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    invoke-super {p0}, Landroid/app/ListActivity;->onContentChanged()V

    .line 125
    const-string v2, "talk"

    const-string v3, "SearchActivity.onContentChanged"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    iget-object v2, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    if-eqz v2, :cond_1

    .line 128
    iget-object v2, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    invoke-virtual {v2}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->getCount()I

    move-result v1

    .line 129
    .local v1, "searchResultCount":I
    const v2, 0x7f06009e

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/google/android/talk/SearchActivity;->mQueryString:Ljava/lang/String;

    aput-object v4, v3, v6

    invoke-virtual {p0, v2, v3}, Lcom/google/android/talk/SearchActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/android/talk/SearchActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 131
    .end local v1    # "searchResultCount":I
    :cond_1
    return-void

    .line 120
    :cond_2
    const v2, 0x7f06009f

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/android/talk/SearchActivity;->mQueryString:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/google/android/talk/SearchActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object v0, v2

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x1

    .line 74
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 77
    const v5, 0x7f030013

    invoke-virtual {p0, v5}, Lcom/google/android/talk/SearchActivity;->setContentView(I)V

    .line 79
    invoke-virtual {p0}, Lcom/google/android/talk/SearchActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    .line 80
    .local v1, "listView":Landroid/widget/ListView;
    const v5, 0x1080062

    invoke-virtual {v1, v5}, Landroid/widget/ListView;->setSelector(I)V

    .line 81
    invoke-virtual {v1, v8}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 83
    new-instance v5, Lcom/google/android/talk/SearchActivity$QueryHandler;

    invoke-direct {v5, p0, p0}, Lcom/google/android/talk/SearchActivity$QueryHandler;-><init>(Lcom/google/android/talk/SearchActivity;Landroid/content/Context;)V

    iput-object v5, p0, Lcom/google/android/talk/SearchActivity;->mQueryHandler:Lcom/google/android/talk/SearchActivity$QueryHandler;

    .line 84
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    .line 85
    .local v0, "app":Lcom/google/android/talk/TalkApp;
    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getGmailProvider()Landroid/provider/Gmail;

    move-result-object v5

    iput-object v5, p0, Lcom/google/android/talk/SearchActivity;->mGmail:Landroid/provider/Gmail;

    .line 88
    invoke-virtual {p0}, Lcom/google/android/talk/SearchActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 89
    .local v4, "queryIntent":Landroid/content/Intent;
    invoke-virtual {v4}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    .line 91
    .local v3, "queryAction":Ljava/lang/String;
    const-string v5, "talk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SearchActivity.onCreate queryAction: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    new-instance v2, Lcom/google/android/talk/NetworkProgressMonitor;

    new-instance v5, Lcom/google/android/talk/SearchActivity$1;

    invoke-direct {v5, p0}, Lcom/google/android/talk/SearchActivity$1;-><init>(Lcom/google/android/talk/SearchActivity;)V

    invoke-direct {v2, p0, v5}, Lcom/google/android/talk/NetworkProgressMonitor;-><init>(Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 98
    .local v2, "pm":Lcom/google/android/talk/IProgressMonitor;
    new-instance v5, Lcom/google/android/talk/SearchHeaderCursorAdapter;

    iget-object v6, p0, Lcom/google/android/talk/SearchActivity;->mGmail:Landroid/provider/Gmail;

    invoke-direct {v5, p0, v2, v6}, Lcom/google/android/talk/SearchHeaderCursorAdapter;-><init>(Landroid/app/Activity;Lcom/google/android/talk/IProgressMonitor;Landroid/provider/Gmail;)V

    iput-object v5, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    .line 99
    iget-object v5, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    invoke-virtual {p0, v5}, Lcom/google/android/talk/SearchActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 100
    invoke-virtual {v1, v8}, Landroid/widget/ListView;->setFocusable(Z)V

    .line 101
    invoke-virtual {v1, v8}, Landroid/widget/ListView;->setClickable(Z)V

    .line 102
    invoke-virtual {p0, v1}, Lcom/google/android/talk/SearchActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 104
    const v5, 0x1020004

    invoke-virtual {p0, v5}, Lcom/google/android/talk/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/google/android/talk/SearchActivity;->mEmptyView:Landroid/widget/TextView;

    .line 106
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v5

    iput-object v5, p0, Lcom/google/android/talk/SearchActivity;->mApp:Lcom/google/android/talk/TalkApp;

    .line 108
    const-string v5, "onCreate"

    invoke-direct {p0, v4, v5}, Lcom/google/android/talk/SearchActivity;->doSearchQuery(Landroid/content/Intent;Ljava/lang/String;)V

    .line 109
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v1, 0x0

    .line 257
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 260
    const v0, 0x7f060023

    invoke-interface {p1, v1, v1, v1, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v1, Lcom/google/android/talk/SearchActivity$2;

    invoke-direct {v1, p0}, Lcom/google/android/talk/SearchActivity$2;-><init>(Lcom/google/android/talk/SearchActivity;)V

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x108004f

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    const/16 v1, 0x73

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 270
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 191
    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    if-eqz v1, :cond_0

    .line 192
    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    invoke-virtual {v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->getCursor()Landroid/provider/Gmail$ConversationCursor;

    move-result-object v0

    .line 194
    .local v0, "conversationCursor":Landroid/provider/Gmail$ConversationCursor;
    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 198
    .end local v0    # "conversationCursor":Landroid/provider/Gmail$ConversationCursor;
    :cond_0
    invoke-super {p0}, Landroid/app/ListActivity;->onDestroy()V

    .line 199
    return-void
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 0
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 218
    invoke-direct {p0, p3}, Lcom/google/android/talk/SearchActivity;->openConversation(I)V

    .line 219
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "newIntent"    # Landroid/content/Intent;

    .prologue
    .line 142
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 145
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 146
    .local v0, "queryAction":Ljava/lang/String;
    const-string v2, "query"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 147
    .local v1, "queryString":Ljava/lang/String;
    const-string v2, "onNewIntent"

    invoke-direct {p0, p1, v2}, Lcom/google/android/talk/SearchActivity;->doSearchQuery(Landroid/content/Intent;Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 162
    invoke-super {p0}, Landroid/app/ListActivity;->onPause()V

    .line 163
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/talk/SearchActivity;->mMustRequeryCursor:Z

    .line 164
    return-void
.end method

.method protected onRestart()V
    .locals 0

    .prologue
    .line 168
    invoke-super {p0}, Landroid/app/ListActivity;->onRestart()V

    .line 169
    invoke-direct {p0}, Lcom/google/android/talk/SearchActivity;->maybeRequery()V

    .line 170
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 174
    invoke-super {p0}, Landroid/app/ListActivity;->onResume()V

    .line 175
    invoke-direct {p0}, Lcom/google/android/talk/SearchActivity;->maybeRequery()V

    .line 176
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 180
    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    invoke-virtual {v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->getCursor()Landroid/provider/Gmail$ConversationCursor;

    move-result-object v0

    .line 182
    .local v0, "conversationCursor":Landroid/provider/Gmail$ConversationCursor;
    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->deactivate()V

    .line 185
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/talk/SearchActivity;->mMustRequeryCursor:Z

    .line 186
    invoke-super {p0}, Landroid/app/ListActivity;->onStop()V

    .line 187
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .param p1, "hasFocus"    # Z

    .prologue
    .line 152
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onWindowFocusChanged(Z)V

    .line 153
    iget-object v1, p0, Lcom/google/android/talk/SearchActivity;->mCursorAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    invoke-virtual {v1}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->getCursor()Landroid/provider/Gmail$ConversationCursor;

    move-result-object v0

    .line 155
    .local v0, "conversationCursor":Landroid/provider/Gmail$ConversationCursor;
    if-eqz v0, :cond_0

    .line 156
    invoke-virtual {v0, p1}, Landroid/provider/Gmail$ConversationCursor;->setContentsVisibleToUser(Z)V

    .line 158
    :cond_0
    return-void
.end method
