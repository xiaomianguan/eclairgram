.class public Lcom/google/android/talk/GroupChatInviteeList;
.super Lcom/google/android/talk/RosterListActivity;
.source "GroupChatInviteeList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;,
        Lcom/google/android/talk/GroupChatInviteeList$RosterListener;
    }
.end annotation


# static fields
.field private static final GROUP_CHAT_INVITEE:I = 0x2

.field private static final LOG_TAG:Ljava/lang/String; = "talk"

.field private static final QUERY_TOKEN:I = 0x5

.field private static final SELECTION_CLAUSE:Ljava/lang/String; = "account=%s AND mode>0 AND type!=2 AND type!=3 AND (subscriptionType=2 OR subscriptionType=4)"


# instance fields
.field private mParticipants:[Ljava/lang/String;

.field private mQueryHandler:Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;

.field private final mRosterListener:Lcom/google/android/talk/GroupChatInviteeList$RosterListener;

.field private mUsernameColumn:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/google/android/talk/RosterListActivity;-><init>()V

    .line 78
    new-instance v0, Lcom/google/android/talk/GroupChatInviteeList$RosterListener;

    invoke-direct {v0, p0}, Lcom/google/android/talk/GroupChatInviteeList$RosterListener;-><init>(Lcom/google/android/talk/GroupChatInviteeList;)V

    iput-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mRosterListener:Lcom/google/android/talk/GroupChatInviteeList$RosterListener;

    .line 111
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/GroupChatInviteeList;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/GroupChatInviteeList;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/google/android/talk/GroupChatInviteeList;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$102(Lcom/google/android/talk/GroupChatInviteeList;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/GroupChatInviteeList;
    .param p1, "x1"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/google/android/talk/GroupChatInviteeList;->mUsernameColumn:I

    return p1
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 239
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GroupChatInviteeList] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    return-void
.end method


# virtual methods
.method protected addRemoteListeners()V
    .locals 3

    .prologue
    .line 189
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/GroupChatInviteeList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/GroupChatInviteeList;->mRosterListener:Lcom/google/android/talk/GroupChatInviteeList$RosterListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->addRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    :goto_0
    return-void

    .line 190
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 191
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    const-string v2, "addRemoteListeners caught "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedStates"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x2

    .line 119
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/view/Window;->requestFeature(I)Z

    .line 120
    invoke-super {p0, p1}, Lcom/google/android/talk/RosterListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 122
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mApp:Lcom/google/android/talk/TalkApp;

    .line 125
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/talk/GroupChatInviteeList;->registerForContextMenu(Landroid/view/View;)V

    .line 127
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "from"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mParticipants:[Ljava/lang/String;

    .line 129
    iget v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mLogLevel:I

    if-ne v0, v2, :cond_0

    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mParticipants.length = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/GroupChatInviteeList;->mParticipants:[Ljava/lang/String;

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/GroupChatInviteeList;->log(Ljava/lang/String;)V

    .line 131
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mParticipants:[Ljava/lang/String;

    array-length v0, v0

    if-ge v11, v0, :cond_0

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mParticipants["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/GroupChatInviteeList;->mParticipants:[Ljava/lang/String;

    aget-object v1, v1, v11

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/GroupChatInviteeList;->log(Ljava/lang/String;)V

    .line 131
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 136
    .end local v11    # "i":I
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/talk/GroupChatInviteeList;->initAccount(Landroid/os/Bundle;)V

    .line 138
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->getListView()Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setTextFilterEnabled(Z)V

    .line 141
    new-instance v12, Landroid/os/Bundle;

    invoke-direct {v12}, Landroid/os/Bundle;-><init>()V

    .line 143
    .local v12, "ret":Landroid/os/Bundle;
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v12}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Lcom/google/android/talk/GroupChatInviteeList;->setResult(ILandroid/content/Intent;)V

    .line 146
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->registerForServiceStateChanged()V

    .line 149
    new-instance v0, Lcom/google/android/talk/RosterListAdapter;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/talk/GroupChatInviteeList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-wide v2, v2, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    iget-wide v4, p0, Lcom/google/android/talk/GroupChatInviteeList;->mAccountId:J

    iget-object v7, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionClause:Ljava/lang/String;

    iget-object v8, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionClause:Ljava/lang/String;

    iget-object v9, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionArgs:[Ljava/lang/String;

    sget-object v10, Lcom/google/android/talk/BuddyList;->PROJECTION:[Ljava/lang/String;

    move-object v6, p0

    invoke-direct/range {v0 .. v10}, Lcom/google/android/talk/RosterListAdapter;-><init>(Landroid/database/Cursor;JJLcom/google/android/talk/RosterListActivity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    .line 152
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mRosterListAdapter:Lcom/google/android/talk/RosterListAdapter;

    invoke-virtual {p0, v0}, Lcom/google/android/talk/GroupChatInviteeList;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 155
    new-instance v0, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;

    invoke-direct {v0, p0, p0}, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;-><init>(Lcom/google/android/talk/GroupChatInviteeList;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mQueryHandler:Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;

    .line 156
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p1, "parent"    # Landroid/widget/AdapterView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 231
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 232
    return-void
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 6
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 220
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->getListView()Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 221
    .local v0, "c":Landroid/database/Cursor;
    iget v3, p0, Lcom/google/android/talk/GroupChatInviteeList;->mUsernameColumn:I

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 223
    .local v1, "contact":Ljava/lang/String;
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 224
    .local v2, "ret":Landroid/os/Bundle;
    const-string v3, "invitee"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    const/4 v3, -0x1

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/google/android/talk/GroupChatInviteeList;->setResult(ILandroid/content/Intent;)V

    .line 226
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatInviteeList;->finish()V

    .line 227
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .param p1, "parent"    # Landroid/widget/AdapterView;

    .prologue
    .line 236
    return-void
.end method

.method protected prepareQueryParameters()V
    .locals 8

    .prologue
    .line 161
    sget-object v3, Lcom/google/android/talk/BuddyList;->PROJECTION:[Ljava/lang/String;

    iput-object v3, p0, Lcom/google/android/talk/GroupChatInviteeList;->mProjection:[Ljava/lang/String;

    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v3, "account=%s AND mode>0 AND type!=2 AND type!=3 AND (subscriptionType=2 OR subscriptionType=4)"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-wide v6, p0, Lcom/google/android/talk/GroupChatInviteeList;->mAccountId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    iget-object v3, p0, Lcom/google/android/talk/GroupChatInviteeList;->mParticipants:[Ljava/lang/String;

    array-length v2, v3

    .line 168
    .local v2, "len":I
    new-array v3, v2, [Ljava/lang/String;

    iput-object v3, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionArgs:[Ljava/lang/String;

    .line 171
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 172
    const-string v3, " AND "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "username"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "!=?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    iget-object v3, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionArgs:[Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/talk/GroupChatInviteeList;->mParticipants:[Ljava/lang/String;

    aget-object v4, v4, v1

    aput-object v4, v3, v1

    .line 171
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 176
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionClause:Ljava/lang/String;

    .line 178
    iget v3, p0, Lcom/google/android/talk/GroupChatInviteeList;->mLogLevel:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 179
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "prepareQueryParameters: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionClause:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/talk/GroupChatInviteeList;->log(Ljava/lang/String;)V

    .line 180
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mSelectionArgs: (length "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionArgs:[Ljava/lang/String;

    array-length v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/talk/GroupChatInviteeList;->log(Ljava/lang/String;)V

    .line 181
    const/4 v1, 0x0

    :goto_1
    iget-object v3, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionArgs:[Ljava/lang/String;

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 182
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "    "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/talk/GroupChatInviteeList;->mSelectionArgs:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/talk/GroupChatInviteeList;->log(Ljava/lang/String;)V

    .line 181
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 185
    :cond_1
    return-void
.end method

.method protected removeRemoteListeners()V
    .locals 3

    .prologue
    .line 197
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/GroupChatInviteeList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    .line 198
    iget-object v1, p0, Lcom/google/android/talk/GroupChatInviteeList;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/GroupChatInviteeList;->mRosterListener:Lcom/google/android/talk/GroupChatInviteeList$RosterListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->removeRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    :cond_0
    :goto_0
    return-void

    .line 200
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 201
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "talk"

    const-string v2, "removeRemoteListeners caught "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected startQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 8
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selectionClause"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x5

    .line 207
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mQueryHandler:Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->cancelOperation(I)V

    .line 209
    iget-object v0, p0, Lcom/google/android/talk/GroupChatInviteeList;->mQueryHandler:Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;

    const/4 v2, 0x0

    sget-object v3, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const-string v7, "subscriptionType DESC, last_message_date DESC, mode DESC, nickname COLLATE UNICODE ASC"

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/talk/GroupChatInviteeList$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    return-void
.end method
