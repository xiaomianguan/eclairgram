.class public abstract Lcom/google/android/talk/RosterListActivity;
.super Landroid/app/Activity;
.source "RosterListActivity.java"


# static fields
.field private static final DBG_PERF:Z = false

.field private static final LIST_STATE_KEY:Ljava/lang/String; = "liststate"

.field private static final LOG_TAG:Ljava/lang/String; = "talk"


# instance fields
.field protected mAccountId:J

.field protected mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

.field protected mApp:Lcom/google/android/talk/TalkApp;

.field protected mDontRestoreListViewState:Z

.field protected final mHandler:Landroid/os/Handler;

.field protected mImSession:Lcom/google/android/gtalkservice/IImSession;

.field protected mList:Landroid/widget/ListView;

.field private mListState:Landroid/os/Parcelable;

.field protected mLogLevel:I

.field protected mProjection:[Ljava/lang/String;

.field protected mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

.field protected mSelectionArgs:[Ljava/lang/String;

.field protected mSelectionClause:Ljava/lang/String;

.field protected mService:Lcom/google/android/gtalkservice/IGTalkService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 55
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mHandler:Landroid/os/Handler;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/talk/RosterListActivity;->mLogLevel:I

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mListState:Landroid/os/Parcelable;

    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 307
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RosterListActivity] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 311
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RosterListActivity] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": empty cursor, possibly low memory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    return-void
.end method


# virtual methods
.method protected abstract addRemoteListeners()V
.end method

.method protected getCursor()Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    if-nez v0, :cond_0

    .line 253
    const/4 v0, 0x0

    .line 256
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v0}, Lcom/google/android/talk/RosterListAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    goto :goto_0
.end method

.method public getListView()Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mList:Landroid/widget/ListView;

    return-object v0
.end method

.method protected initAccount(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedStates"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v2, 0x0

    const-string v4, "accountId"

    .line 316
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "accountId"

    invoke-virtual {v0, v4, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/talk/RosterListActivity;->mAccountId:J

    .line 317
    iget-wide v0, p0, Lcom/google/android/talk/RosterListActivity;->mAccountId:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 318
    const-string v0, "accountId"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/talk/RosterListActivity;->mAccountId:J

    .line 320
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mApp:Lcom/google/android/talk/TalkApp;

    iget-wide v1, p0, Lcom/google/android/talk/RosterListActivity;->mAccountId:J

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/TalkApp;->getAccountInfo(J)Lcom/google/android/talk/TalkApp$AccountInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    .line 321
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    if-nez v0, :cond_1

    .line 322
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->finish()V

    .line 326
    :goto_0
    return-void

    .line 325
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->prepareQueryParameters()V

    goto :goto_0
.end method

.method protected initSession(Lcom/google/android/gtalkservice/IGTalkService;)Z
    .locals 4
    .param p1, "service"    # Lcom/google/android/gtalkservice/IGTalkService;

    .prologue
    .line 237
    :try_start_0
    iget-wide v1, p0, Lcom/google/android/talk/RosterListActivity;->mAccountId:J

    invoke-interface {p1, v1, v2}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    .line 238
    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v1, :cond_0

    .line 240
    const/4 v1, 0x0

    .line 248
    :goto_0
    return v1

    .line 243
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->addRemoteListeners()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 248
    :goto_1
    const/4 v1, 0x1

    goto :goto_0

    .line 244
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 245
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initSession: caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedStates"    # Landroid/os/Bundle;

    .prologue
    .line 80
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 82
    const v0, 0x7f03000d

    invoke-virtual {p0, v0}, Lcom/google/android/talk/RosterListActivity;->setContentView(I)V

    .line 84
    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/google/android/talk/RosterListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mList:Landroid/widget/ListView;

    .line 85
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mList:Landroid/widget/ListView;

    new-instance v1, Lcom/google/android/talk/RosterListActivity$2;

    invoke-direct {v1, p0}, Lcom/google/android/talk/RosterListActivity$2;-><init>(Lcom/google/android/talk/RosterListActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 91
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v0

    iput v0, p0, Lcom/google/android/talk/RosterListActivity;->mLogLevel:I

    .line 92
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 147
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 149
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 150
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 151
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 153
    :cond_0
    return-void
.end method

.method protected abstract onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
.end method

.method protected onRestart()V
    .locals 3

    .prologue
    .line 96
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 98
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/RosterListActivity;->mLogLevel:I

    .line 100
    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    .line 101
    .local v0, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eq v1, v0, :cond_2

    .line 102
    :cond_0
    iget v1, p0, Lcom/google/android/talk/RosterListActivity;->mLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_1

    .line 103
    const-string v1, "onRestart: service disconnected..."

    invoke-direct {p0, v1}, Lcom/google/android/talk/RosterListActivity;->log(Ljava/lang/String;)V

    .line 105
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->handleDisconnectedService()V

    .line 106
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->registerForServiceStateChanged()V

    .line 110
    :goto_0
    return-void

    .line 108
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->serviceStateChanged()V

    goto :goto_0
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "inState"    # Landroid/os/Bundle;

    .prologue
    .line 184
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 186
    const-string v0, "liststate"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mListState:Landroid/os/Parcelable;

    .line 187
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 114
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 116
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 117
    .local v0, "cursor":Landroid/database/Cursor;
    if-nez v0, :cond_1

    .line 118
    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mProjection:[Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/talk/RosterListActivity;->mSelectionClause:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/talk/RosterListActivity;->mSelectionArgs:[Ljava/lang/String;

    invoke-virtual {p0, v1, v2, v3}, Lcom/google/android/talk/RosterListActivity;->startQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 129
    :cond_0
    :goto_0
    return-void

    .line 121
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/google/android/talk/RosterListActivity;->requeryCursor(Z)V

    .line 125
    iget-boolean v1, p0, Lcom/google/android/talk/RosterListActivity;->mDontRestoreListViewState:Z

    if-nez v1, :cond_0

    .line 126
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->restoreListViewState()V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 159
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 164
    iget-object v3, p0, Lcom/google/android/talk/RosterListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/talk/RosterListActivity;->mListState:Landroid/os/Parcelable;

    .line 165
    const-string v3, "liststate"

    iget-object v4, p0, Lcom/google/android/talk/RosterListActivity;->mListState:Landroid/os/Parcelable;

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 168
    iget-object v3, p0, Lcom/google/android/talk/RosterListActivity;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v3, :cond_0

    .line 170
    :try_start_0
    iget-object v3, p0, Lcom/google/android/talk/RosterListActivity;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v3}, Lcom/google/android/gtalkservice/IImSession;->getAccountId()J

    move-result-wide v0

    .line 173
    .local v0, "accountId":J
    const-string v3, "accountId"

    invoke-virtual {p1, v3, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .end local v0    # "accountId":J
    :cond_0
    :goto_0
    return-void

    .line 174
    :catch_0
    move-exception v3

    move-object v2, v3

    .line 175
    .local v2, "ex":Landroid/os/RemoteException;
    const-string v3, "talk"

    const-string v4, "onSaveInstanceState: caught "

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 134
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 136
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 137
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 138
    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 141
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->unregisterForServiceStateChanged()V

    .line 142
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->removeRemoteListeners()V

    .line 143
    return-void
.end method

.method protected abstract prepareQueryParameters()V
.end method

.method protected registerForServiceStateChanged()V
    .locals 3

    .prologue
    .line 66
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/talk/RosterListActivity$1;

    invoke-direct {v2, p0}, Lcom/google/android/talk/RosterListActivity$1;-><init>(Lcom/google/android/talk/RosterListActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/TalkApp;->addServiceStateChangedCallback(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 71
    return-void
.end method

.method protected abstract removeRemoteListeners()V
.end method

.method public requeryCursor(Z)V
    .locals 14
    .param p1, "async"    # Z

    .prologue
    const/4 v12, 0x2

    const-string v13, "]="

    .line 260
    iget-object v11, p0, Lcom/google/android/talk/RosterListActivity;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v11}, Lcom/google/android/talk/RosterListAdapter;->isScrolling()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 261
    iget v11, p0, Lcom/google/android/talk/RosterListActivity;->mLogLevel:I

    if-lt v11, v12, :cond_0

    const-string v11, "defer requery cursor"

    invoke-direct {p0, v11}, Lcom/google/android/talk/RosterListActivity;->log(Ljava/lang/String;)V

    .line 262
    :cond_0
    iget-object v11, p0, Lcom/google/android/talk/RosterListActivity;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Lcom/google/android/talk/RosterListAdapter;->setNeedRequeryCursor(Z)V

    .line 301
    :cond_1
    :goto_0
    return-void

    .line 266
    :cond_2
    if-eqz p1, :cond_5

    .line 267
    iget-object v11, p0, Lcom/google/android/talk/RosterListActivity;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v11}, Lcom/google/android/talk/RosterListAdapter;->getQuerySelection()Ljava/lang/String;

    move-result-object v10

    .line 268
    .local v10, "selectionClause":Ljava/lang/String;
    iget-object v11, p0, Lcom/google/android/talk/RosterListActivity;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v11}, Lcom/google/android/talk/RosterListAdapter;->getQuerySelectionArgs()[Ljava/lang/String;

    move-result-object v9

    .line 269
    .local v9, "selectionArgs":[Ljava/lang/String;
    iget-object v11, p0, Lcom/google/android/talk/RosterListActivity;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {v11}, Lcom/google/android/talk/RosterListAdapter;->getQueryProjection()[Ljava/lang/String;

    move-result-object v8

    .line 271
    .local v8, "projection":[Ljava/lang/String;
    iget v11, p0, Lcom/google/android/talk/RosterListActivity;->mLogLevel:I

    if-ne v11, v12, :cond_4

    .line 272
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "requeryCursor: selectionClause is "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/google/android/talk/RosterListActivity;->log(Ljava/lang/String;)V

    .line 273
    if-eqz v9, :cond_3

    .line 274
    const/4 v3, 0x0

    .line 275
    .local v3, "i":I
    move-object v1, v9

    .local v1, "arr$":[Ljava/lang/String;
    array-length v7, v1

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    move v4, v3

    .end local v3    # "i":I
    .local v4, "i":I
    :goto_1
    if-ge v5, v7, :cond_3

    aget-object v0, v1, v5

    .line 276
    .local v0, "arg":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "selArg["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]="

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/google/android/talk/RosterListActivity;->log(Ljava/lang/String;)V

    .line 275
    add-int/lit8 v5, v5, 0x1

    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_1

    .line 279
    .end local v0    # "arg":Ljava/lang/String;
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v4    # "i":I
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    :cond_3
    if-eqz v8, :cond_4

    .line 280
    const/4 v3, 0x0

    .line 281
    .restart local v3    # "i":I
    move-object v1, v8

    .restart local v1    # "arr$":[Ljava/lang/String;
    array-length v7, v1

    .restart local v7    # "len$":I
    const/4 v5, 0x0

    .restart local v5    # "i$":I
    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    :goto_2
    if-ge v5, v7, :cond_4

    aget-object v6, v1, v5

    .line 282
    .local v6, "item":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "proj["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "]="

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/google/android/talk/RosterListActivity;->log(Ljava/lang/String;)V

    .line 281
    add-int/lit8 v5, v5, 0x1

    move v4, v3

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_2

    .line 287
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v4    # "i":I
    .end local v5    # "i$":I
    .end local v6    # "item":Ljava/lang/String;
    .end local v7    # "len$":I
    :cond_4
    invoke-virtual {p0, v8, v10, v9}, Lcom/google/android/talk/RosterListActivity;->startQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_0

    .line 293
    .end local v8    # "projection":[Ljava/lang/String;
    .end local v9    # "selectionArgs":[Ljava/lang/String;
    .end local v10    # "selectionClause":Ljava/lang/String;
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->getCursor()Landroid/database/Cursor;

    move-result-object v2

    .line 294
    .local v2, "cursor":Landroid/database/Cursor;
    if-eqz v2, :cond_1

    .line 295
    invoke-interface {v2}, Landroid/database/Cursor;->requery()Z

    goto/16 :goto_0
.end method

.method protected restoreListViewState()V
    .locals 2

    .prologue
    .line 190
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mListState:Landroid/os/Parcelable;

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->getListView()Landroid/widget/ListView;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mListState:Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 192
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mListState:Landroid/os/Parcelable;

    .line 193
    iget v0, p0, Lcom/google/android/talk/RosterListActivity;->mLogLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "restoreListViewState: pos="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ListView;->getSelectedItemPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/RosterListActivity;->log(Ljava/lang/String;)V

    .line 197
    :cond_0
    return-void
.end method

.method protected serviceStateChanged()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 215
    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    .line 217
    .local v0, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v0, :cond_2

    .line 218
    iget v1, p0, Lcom/google/android/talk/RosterListActivity;->mLogLevel:I

    if-lt v1, v2, :cond_0

    const-string v1, "service connected"

    invoke-direct {p0, v1}, Lcom/google/android/talk/RosterListActivity;->log(Ljava/lang/String;)V

    .line 220
    :cond_0
    iput-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    .line 222
    invoke-virtual {p0, v0}, Lcom/google/android/talk/RosterListActivity;->initSession(Lcom/google/android/gtalkservice/IGTalkService;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 223
    const-string v1, "talk"

    const-string v2, "[RosterListActivity] initSession failed. Finish!"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    invoke-static {p0}, Lcom/google/android/talk/ActivityUtils;->showLandingPage(Landroid/app/Activity;)V

    .line 233
    :cond_1
    :goto_0
    return-void

    .line 228
    :cond_2
    iget v1, p0, Lcom/google/android/talk/RosterListActivity;->mLogLevel:I

    if-lt v1, v2, :cond_3

    const-string v1, "service disconnected"

    invoke-direct {p0, v1}, Lcom/google/android/talk/RosterListActivity;->log(Ljava/lang/String;)V

    .line 230
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/talk/RosterListActivity;->finish()V

    goto :goto_0
.end method

.method public setListAdapter(Landroid/widget/ListAdapter;)V
    .locals 1
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 204
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 205
    return-void
.end method

.method protected abstract startQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
.end method

.method protected unregisterForServiceStateChanged()V
    .locals 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/TalkApp;->removeServiceStateChangedCallback(Landroid/os/Handler;)V

    .line 75
    return-void
.end method
