.class public Lcom/google/android/gtalkservice/service/ImSessionWrapper;
.super Lcom/google/android/gtalkservice/IImSession$Stub;
.source "ImSessionWrapper.java"


# instance fields
.field mSession:Lcom/google/android/gtalkservice/ImSession;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/ImSession;)V
    .locals 0
    .param p1, "session"    # Lcom/google/android/gtalkservice/ImSession;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/google/android/gtalkservice/IImSession$Stub;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    .line 41
    return-void
.end method


# virtual methods
.method public addConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IConnectionStateListener;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->addConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V

    .line 89
    return-void
.end method

.method public addContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "groups"    # [Ljava/lang/String;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gtalkservice/ImSession;->addContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 113
    return-void
.end method

.method public addGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->addGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V

    .line 169
    return-void
.end method

.method public addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 176
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 177
    return-void
.end method

.method public addRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->addRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V

    .line 185
    return-void
.end method

.method public approveSubscriptionRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "groups"    # [Ljava/lang/String;

    .prologue
    .line 140
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gtalkservice/ImSession;->approveSubscriptionRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 141
    return-void
.end method

.method public blockContact(Ljava/lang/String;)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 124
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->blockContact(Ljava/lang/String;)V

    .line 125
    return-void
.end method

.method public clearContactFlags(Ljava/lang/String;)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->clearContactFlags(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public closeAllChatSessions()V
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->closeAllChatSessions()V

    .line 205
    return-void
.end method

.method public createChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;
    .locals 1
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->createChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v0

    return-object v0
.end method

.method public createGroupChatSession(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "contacts"    # [Ljava/lang/String;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/ImSession;->createGroupChatSession(Ljava/lang/String;[Ljava/lang/String;)V

    .line 157
    return-void
.end method

.method public declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "roomAddress"    # Ljava/lang/String;
    .param p2, "inviter"    # Ljava/lang/String;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/ImSession;->declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public declineSubscriptionRequest(Ljava/lang/String;)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->declineSubscriptionRequest(Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public editContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "groups"    # [Ljava/lang/String;

    .prologue
    .line 116
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gtalkservice/ImSession;->editContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 117
    return-void
.end method

.method public getAccountId()J
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getAccountId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;
    .locals 1
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v0

    return-object v0
.end method

.method public getPresence()Lcom/google/android/gtalkservice/Presence;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v0

    return-object v0
.end method

.method public getServiceProviderId()J
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getServiceProviderId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSessionImpl()Lcom/google/android/gtalkservice/ImSession;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getUsername()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public goOffRecordInRoom(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "offRecordFlag"    # Z

    .prologue
    .line 196
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/ImSession;->goOffRecordInRoom(Ljava/lang/String;Z)V

    .line 197
    return-void
.end method

.method public goOffRecordWithContacts(Ljava/util/List;Z)V
    .locals 1
    .param p1, "contacts"    # Ljava/util/List;
    .param p2, "offRecordFlag"    # Z

    .prologue
    .line 192
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    check-cast p1, Ljava/util/ArrayList;

    .end local p1    # "contacts":Ljava/util/List;
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/ImSession;->goOffRecordWithContact(Ljava/util/ArrayList;Z)V

    .line 193
    return-void
.end method

.method public hideContact(Ljava/lang/String;)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->hideContact(Ljava/lang/String;)V

    .line 133
    return-void
.end method

.method public isOffRecordWithContact(Ljava/lang/String;)Z
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 200
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->isOffRecordWithContact(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "roomAddress"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gtalkservice/ImSession;->joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    return-void
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 5
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "keepSignedIn"    # Z

    .prologue
    .line 62
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    .line 65
    .local v1, "origId":J
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v3, p1, p2, p3}, Lcom/google/android/gtalkservice/ImSession;->login(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 71
    return-void

    .line 66
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 67
    .local v0, "ex":Ljava/lang/NullPointerException;
    const-string v3, "GTalkService"

    const-string v4, "[ImSessionWrapper] login: caught "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public logout()V
    .locals 3

    .prologue
    .line 76
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 78
    .local v0, "origId":J
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/ImSession;->logout()V

    .line 80
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 81
    return-void
.end method

.method public pinContact(Ljava/lang/String;)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 128
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->pinContact(Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method public pruneOldChatSessions(J)V
    .locals 1
    .param p1, "time"    # J

    .prologue
    .line 208
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/ImSession;->pruneOldChatSessions(J)V

    .line 209
    return-void
.end method

.method public removeConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IConnectionStateListener;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->removeConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V

    .line 93
    return-void
.end method

.method public removeContact(Ljava/lang/String;)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 120
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->removeContact(Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method public removeGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->removeGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V

    .line 173
    return-void
.end method

.method public removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 181
    return-void
.end method

.method public removeRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 188
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->removeRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V

    .line 189
    return-void
.end method

.method public setPresence(Lcom/google/android/gtalkservice/Presence;)V
    .locals 1
    .param p1, "presence"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->setAndSendPresence(Lcom/google/android/gtalkservice/Presence;)V

    .line 97
    return-void
.end method

.method public uploadAvatar(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "avatar"    # Landroid/graphics/Bitmap;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->uploadAvatar(Landroid/graphics/Bitmap;)V

    .line 105
    return-void
.end method

.method public uploadAvatarFromDb()V
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->mSession:Lcom/google/android/gtalkservice/ImSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->uploadAvatarFromDb()V

    .line 109
    return-void
.end method
