.class public abstract Lcom/google/android/gtalkservice/ProxiedImSession;
.super Lcom/google/android/gtalkservice/ImSession;
.source "ProxiedImSession.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;
.implements Lcom/google/android/gtalkservice/DelayedLogin;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;,
        Lcom/google/android/gtalkservice/ProxiedImSession$SendLoginHandler;
    }
.end annotation


# static fields
.field private static final DBG:Z = true


# instance fields
.field private mAccountId:J

.field private mLoginPending:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/GTalkConnectionContext;J)V
    .locals 0
    .param p1, "connectionContext"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .param p2, "serviceProviderId"    # J

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gtalkservice/ImSession;-><init>(Lcom/google/android/gtalkservice/GTalkConnectionContext;J)V

    .line 36
    return-void
.end method

.method private createAccount()V
    .locals 6

    .prologue
    .line 168
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getHostConnectionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getServiceProviderId()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/gtalkservice/ProxiedImSession;->mUsername:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gtalkservice/ProxiedImSession;->mPassword:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->addOrUpdateAccount(Landroid/content/ContentResolver;JLjava/lang/String;Ljava/lang/String;Z)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/ProxiedImSession;->mAccountId:J

    .line 174
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 301
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ProxiedImSession] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    return-void
.end method

.method private logw(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 305
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ProxiedImSession] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    return-void
.end method

.method private logw(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 309
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ProxiedImSession] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 310
    return-void
.end method


# virtual methods
.method public addGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 244
    const-string v0, "GTalkService"

    const-string v1, "addGroupChatInvitationListener not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    return-void
.end method

.method public createGroupChatSession(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 2
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "contacts"    # [Ljava/lang/String;

    .prologue
    .line 229
    const-string v0, "GTalkService"

    const-string v1, "createGroupChatSession not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    return-void
.end method

.method public abstract createLoginPacket(Ljava/lang/String;Ljava/lang/String;Z)Lorg/jivesoftware/smack/packet/IQ;
.end method

.method public declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "roomAddress"    # Ljava/lang/String;
    .param p2, "inviter"    # Ljava/lang/String;

    .prologue
    .line 239
    const-string v0, "GTalkService"

    const-string v1, "declineGroupChatInvitation not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    return-void
.end method

.method public getAccountId()J
    .locals 2

    .prologue
    .line 48
    iget-wide v0, p0, Lcom/google/android/gtalkservice/ProxiedImSession;->mAccountId:J

    return-wide v0
.end method

.method public joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "roomAddress"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;

    .prologue
    .line 234
    const-string v0, "GTalkService"

    const-string v1, "joinGroupChatSession not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    return-void
.end method

.method public login()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 154
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    const-string v1, "login (maybe delayed) ..."

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/ProxiedImSession;->log(Ljava/lang/String;)V

    .line 156
    :cond_0
    iput-boolean v4, p0, Lcom/google/android/gtalkservice/ProxiedImSession;->mLoginPending:Z

    .line 157
    new-instance v0, Lcom/google/android/gtalkservice/ProxiedImSession$SendLoginHandler;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getUsername()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/google/android/gtalkservice/ProxiedImSession$SendLoginHandler;-><init>(Lcom/google/android/gtalkservice/ProxiedImSession;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .local v0, "sendLogin":Lcom/google/android/gtalkservice/ProxiedImSession$SendLoginHandler;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ProxiedImSession$SendLoginHandler;->send()V

    .line 159
    const/4 v1, 0x2

    invoke-virtual {p0, v1, v3, v3}, Lcom/google/android/gtalkservice/ProxiedImSession;->setConnectionStateAndError(IIZ)V

    .line 163
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getHostConnectionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/gtalkservice/ProxiedImSession;->mAccountId:J

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/android/gtalkservice/RosterManager;->setRosterRequestPendingForAccount(JZ)V

    .line 165
    return-void
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 11
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "keepSignedIn"    # Z

    .prologue
    const/4 v10, 0x1

    const-string v9, "GTalkService"

    .line 52
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 53
    :cond_0
    const-string v8, "GTalkService"

    const-string v8, "[ProxiedImSession] login: empty username or pw"

    invoke-static {v9, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :goto_0
    return-void

    .line 62
    :cond_1
    monitor-enter p0

    .line 63
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getUsername()Ljava/lang/String;

    move-result-object v2

    .line 64
    .local v2, "currentUsername":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 65
    const-string v8, "GTalkService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "[ProxiedImSession] login already attempted with username "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ". Need to logout first!"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    monitor-exit p0

    goto :goto_0

    .line 69
    .end local v2    # "currentUsername":Ljava/lang/String;
    :catchall_0
    move-exception v8

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8

    .restart local v2    # "currentUsername":Ljava/lang/String;
    :cond_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/ProxiedImSession;->setUsername(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p0, p2}, Lcom/google/android/gtalkservice/ProxiedImSession;->setPassword(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getAccountId()J

    move-result-wide v5

    .line 76
    .local v5, "oldAccountId":J
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->createAccount()V

    .line 78
    invoke-virtual {p0, v10}, Lcom/google/android/gtalkservice/ProxiedImSession;->setLastLoginState(Z)V

    .line 80
    const-wide/16 v8, 0x0

    cmp-long v8, v5, v8

    if-eqz v8, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getAccountId()J

    move-result-wide v8

    cmp-long v8, v8, v5

    if-eqz v8, :cond_3

    .line 84
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "login: clear roster for old account "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/gtalkservice/ProxiedImSession;->log(Ljava/lang/String;)V

    .line 86
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getHostConnectionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    invoke-static {v8, v5, v6}, Lcom/google/android/gtalkservice/DatabaseHelper;->clearStoredRoster(Landroid/content/ContentResolver;J)V

    .line 91
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v4

    .line 92
    .local v4, "hostConnection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v1

    .line 93
    .local v1, "connState":I
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v0

    .line 94
    .local v0, "connError":I
    const/4 v3, 0x0

    .line 95
    .local v3, "delayLogin":Z
    const/4 v7, 0x0

    .line 98
    .local v7, "requestHostSessionRoster":Z
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "login: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", hostConnection.connectState = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v1}, Lcom/google/android/gtalkservice/ConnectionState;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", hostConnection.error="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v0}, Lcom/google/android/gtalkservice/ConnectionError;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/gtalkservice/ProxiedImSession;->log(Ljava/lang/String;)V

    .line 103
    packed-switch v1, :pswitch_data_0

    .line 131
    :goto_1
    :pswitch_0
    const/4 v7, 0x1

    .line 136
    :goto_2
    :pswitch_1
    if-eqz v7, :cond_4

    .line 139
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->requestRoster()V

    .line 143
    :cond_4
    if-eqz v3, :cond_7

    .line 144
    invoke-virtual {v4, p0}, Lcom/google/android/gtalkservice/GTalkConnection;->addDelayedLoginCallback(Lcom/google/android/gtalkservice/DelayedLogin;)V

    goto/16 :goto_0

    .line 108
    :pswitch_2
    invoke-virtual {p0, v1, v0, v10}, Lcom/google/android/gtalkservice/ProxiedImSession;->setConnectionStateAndError(IIZ)V

    .line 109
    const/4 v7, 0x1

    .line 110
    goto :goto_2

    .line 114
    :pswitch_3
    if-ne v1, v10, :cond_6

    .line 115
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->connect()Z

    move-result v8

    if-nez v8, :cond_5

    .line 116
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v1

    .line 117
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v0

    .line 126
    :goto_3
    invoke-virtual {p0, v1, v0, v10}, Lcom/google/android/gtalkservice/ProxiedImSession;->setConnectionStateAndError(IIZ)V

    .line 127
    const/4 v3, 0x1

    goto :goto_1

    .line 119
    :cond_5
    const/4 v1, 0x2

    .line 120
    const/4 v0, 0x0

    goto :goto_3

    .line 124
    :cond_6
    const/4 v0, 0x0

    goto :goto_3

    .line 146
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->login()V

    goto/16 :goto_0

    .line 103
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public logout()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 205
    invoke-virtual {p0, v3}, Lcom/google/android/gtalkservice/ProxiedImSession;->setLastLoginState(Z)V

    .line 209
    monitor-enter p0

    .line 210
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getUsername()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 211
    const-string v1, "GTalkService"

    const-string v2, "[ProxiedImSession] logout already called"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    monitor-exit p0

    .line 225
    :goto_0
    return-void

    .line 215
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/ProxiedImSession;->setUsername(Ljava/lang/String;)V

    .line 216
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/ProxiedImSession;->setPassword(Ljava/lang/String;)V

    .line 217
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    new-instance v0, Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;-><init>(Lcom/google/android/gtalkservice/ProxiedImSession;)V

    .line 220
    .local v0, "sendLogout":Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;->send()V

    .line 222
    new-instance v1, Lcom/google/android/gtalkservice/Presence;

    sget-object v2, Lcom/google/android/gtalkservice/Presence$Show;->NONE:Lcom/google/android/gtalkservice/Presence$Show;

    invoke-direct {v1, v3, v2, v4}, Lcom/google/android/gtalkservice/Presence;-><init>(ZLcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/ProxiedImSession;->setPresence(Lcom/google/android/gtalkservice/Presence;)Z

    .line 223
    invoke-virtual {p0, v3}, Lcom/google/android/gtalkservice/ProxiedImSession;->setConnectionState(I)Z

    .line 224
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->notifyConnectionListeners()V

    goto :goto_0

    .line 217
    .end local v0    # "sendLogout":Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected onLoggedIn()V
    .locals 4

    .prologue
    .line 177
    const/4 v0, 0x0

    .line 194
    .local v0, "customStatus":Ljava/lang/String;
    new-instance v1, Lcom/google/android/gtalkservice/Presence;

    const/4 v2, 0x1

    sget-object v3, Lcom/google/android/gtalkservice/Presence$Show;->NONE:Lcom/google/android/gtalkservice/Presence$Show;

    invoke-direct {v1, v2, v3, v0}, Lcom/google/android/gtalkservice/Presence;-><init>(ZLcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/ProxiedImSession;->setAndSendPresence(Lcom/google/android/gtalkservice/Presence;)V

    .line 198
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/ProxiedImSession;->setConnectionState(I)Z

    .line 199
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->notifyConnectionListeners()V

    .line 201
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ProxiedImSession;->loadVCard()V

    .line 202
    return-void
.end method

.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 1
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 41
    instance-of v0, p1, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;

    if-eqz v0, :cond_0

    .line 45
    :cond_0
    return-void
.end method

.method public removeGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IGroupChatInvitationListener;

    .prologue
    .line 249
    const-string v0, "GTalkService"

    const-string v1, "removeGroupChatInvitationListener not supported"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    return-void
.end method
