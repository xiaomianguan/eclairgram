.class public Lcom/google/android/talk/GroupChatApproval;
.super Landroid/app/Activity;
.source "GroupChatApproval.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "talk"


# instance fields
.field mAcceptButton:Landroid/widget/Button;

.field mAcceptHandler:Landroid/view/View$OnClickListener;

.field mDeclineButton:Landroid/widget/Button;

.field mDeclineHandler:Landroid/view/View$OnClickListener;

.field mInviter:Ljava/lang/String;

.field mMessage:Landroid/widget/TextView;

.field mPassword:Ljava/lang/String;

.field mRoomAddress:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 137
    new-instance v0, Lcom/google/android/talk/GroupChatApproval$1;

    invoke-direct {v0, p0}, Lcom/google/android/talk/GroupChatApproval$1;-><init>(Lcom/google/android/talk/GroupChatApproval;)V

    iput-object v0, p0, Lcom/google/android/talk/GroupChatApproval;->mAcceptHandler:Landroid/view/View$OnClickListener;

    .line 143
    new-instance v0, Lcom/google/android/talk/GroupChatApproval$2;

    invoke-direct {v0, p0}, Lcom/google/android/talk/GroupChatApproval$2;-><init>(Lcom/google/android/talk/GroupChatApproval;)V

    iput-object v0, p0, Lcom/google/android/talk/GroupChatApproval;->mDeclineHandler:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private updateServiceForGroupChat(Z)V
    .locals 10
    .param p1, "accept"    # Z

    .prologue
    .line 93
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v2

    .line 94
    .local v2, "app":Lcom/google/android/talk/TalkApp;
    invoke-virtual {v2}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v4

    .line 95
    .local v4, "service":Lcom/google/android/gtalkservice/IGTalkService;
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "accountId"

    const-wide/16 v8, 0x0

    invoke-virtual {v6, v7, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 97
    .local v0, "accountId":J
    :try_start_0
    invoke-interface {v4, v0, v1}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v5

    .line 98
    .local v5, "session":Lcom/google/android/gtalkservice/IImSession;
    if-eqz p1, :cond_1

    .line 99
    iget-object v6, p0, Lcom/google/android/talk/GroupChatApproval;->mRoomAddress:Ljava/lang/String;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/google/android/talk/GroupChatApproval;->mPassword:Ljava/lang/String;

    invoke-interface {v5, v6, v7, v8}, Lcom/google/android/gtalkservice/IImSession;->joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    iget-object v6, p0, Lcom/google/android/talk/GroupChatApproval;->mInviter:Ljava/lang/String;

    invoke-interface {v5, v6}, Lcom/google/android/gtalkservice/IImSession;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v3

    .line 101
    .local v3, "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    if-eqz v3, :cond_0

    .line 102
    invoke-interface {v3}, Lcom/google/android/gtalkservice/IChatSession;->leave()V

    .line 107
    .end local v3    # "chatSession":Lcom/google/android/gtalkservice/IChatSession;
    :cond_0
    :goto_0
    iget-object v6, v2, Lcom/google/android/talk/TalkApp;->mGroupChatInvitations:Ljava/util/HashMap;

    iget-object v7, p0, Lcom/google/android/talk/GroupChatApproval;->mRoomAddress:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .end local v5    # "session":Lcom/google/android/gtalkservice/IImSession;
    :goto_1
    return-void

    .line 105
    .restart local v5    # "session":Lcom/google/android/gtalkservice/IImSession;
    :cond_1
    iget-object v6, p0, Lcom/google/android/talk/GroupChatApproval;->mRoomAddress:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/talk/GroupChatApproval;->mInviter:Ljava/lang/String;

    invoke-interface {v5, v6, v7}, Lcom/google/android/gtalkservice/IImSession;->declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 108
    .end local v5    # "session":Lcom/google/android/gtalkservice/IImSession;
    :catch_0
    move-exception v6

    goto :goto_1
.end method


# virtual methods
.method acceptGroupChat()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 115
    invoke-direct {p0, v2}, Lcom/google/android/talk/GroupChatApproval;->updateServiceForGroupChat(Z)V

    .line 116
    new-instance v0, Landroid/os/Bundle;

    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 117
    .local v0, "ret":Landroid/os/Bundle;
    const-string v1, "approval"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 118
    const-string v1, "room"

    iget-object v2, p0, Lcom/google/android/talk/GroupChatApproval;->mRoomAddress:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    const-string v1, "password"

    iget-object v2, p0, Lcom/google/android/talk/GroupChatApproval;->mPassword:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    const/4 v1, -0x1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/google/android/talk/GroupChatApproval;->setResult(ILandroid/content/Intent;)V

    .line 122
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->finish()V

    .line 123
    return-void
.end method

.method declineGroupChat()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 126
    invoke-direct {p0, v2}, Lcom/google/android/talk/GroupChatApproval;->updateServiceForGroupChat(Z)V

    .line 127
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 128
    .local v0, "ret":Landroid/os/Bundle;
    const-string v1, "approval"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 129
    const-string v1, "room"

    iget-object v2, p0, Lcom/google/android/talk/GroupChatApproval;->mRoomAddress:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    const-string v1, "password"

    iget-object v2, p0, Lcom/google/android/talk/GroupChatApproval;->mPassword:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const/4 v1, -0x1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/google/android/talk/GroupChatApproval;->setResult(ILandroid/content/Intent;)V

    .line 133
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->finish()V

    .line 134
    return-void
.end method

.method initView()V
    .locals 7

    .prologue
    .line 77
    const v3, 0x7f0b0021

    invoke-virtual {p0, v3}, Lcom/google/android/talk/GroupChatApproval;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/google/android/talk/GroupChatApproval;->mMessage:Landroid/widget/TextView;

    .line 79
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .local v2, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/util/Formatter;

    invoke-direct {v1, v2}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;)V

    .line 81
    .local v1, "formatter":Ljava/util/Formatter;
    const v3, 0x7f060056

    invoke-virtual {p0, v3}, Lcom/google/android/talk/GroupChatApproval;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 82
    .local v0, "format":Ljava/lang/CharSequence;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/android/talk/GroupChatApproval;->mInviter:Ljava/lang/String;

    invoke-static {v6}, Lcom/google/android/talk/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v3, v4}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 83
    iget-object v3, p0, Lcom/google/android/talk/GroupChatApproval;->mMessage:Landroid/widget/TextView;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    const v3, 0x7f0b0022

    invoke-virtual {p0, v3}, Lcom/google/android/talk/GroupChatApproval;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/google/android/talk/GroupChatApproval;->mAcceptButton:Landroid/widget/Button;

    .line 86
    iget-object v3, p0, Lcom/google/android/talk/GroupChatApproval;->mAcceptButton:Landroid/widget/Button;

    iget-object v4, p0, Lcom/google/android/talk/GroupChatApproval;->mAcceptHandler:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    const v3, 0x7f0b0023

    invoke-virtual {p0, v3}, Lcom/google/android/talk/GroupChatApproval;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/google/android/talk/GroupChatApproval;->mDeclineButton:Landroid/widget/Button;

    .line 89
    iget-object v3, p0, Lcom/google/android/talk/GroupChatApproval;->mDeclineButton:Landroid/widget/Button;

    iget-object v4, p0, Lcom/google/android/talk/GroupChatApproval;->mDeclineHandler:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    return-void
.end method

.method log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 150
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GroupChatApproval] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 49
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 51
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->resolveIntent()V

    .line 53
    const v0, 0x7f03000a

    invoke-virtual {p0, v0}, Lcom/google/android/talk/GroupChatApproval;->setContentView(I)V

    .line 54
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->initView()V

    .line 55
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 59
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 60
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->finish()V

    .line 61
    return-void
.end method

.method resolveIntent()V
    .locals 3

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/google/android/talk/GroupChatApproval;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 66
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "muc_inviter"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/GroupChatApproval;->mInviter:Ljava/lang/String;

    .line 67
    const-string v1, "room"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/GroupChatApproval;->mRoomAddress:Ljava/lang/String;

    .line 68
    const-string v1, "password"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/GroupChatApproval;->mPassword:Ljava/lang/String;

    .line 70
    const-string v1, "talk"

    const/4 v2, 0x3

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resolveIntent inviter="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/GroupChatApproval;->mInviter:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", room="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/GroupChatApproval;->mRoomAddress:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", password="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/GroupChatApproval;->mPassword:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/talk/GroupChatApproval;->log(Ljava/lang/String;)V

    .line 74
    :cond_0
    return-void
.end method
