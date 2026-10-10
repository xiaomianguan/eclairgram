.class public Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
.super Lcom/google/android/gtalkservice/IGTalkConnection$Stub;
.source "GTalkConnectionWrapper.java"


# instance fields
.field private mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

.field private mService:Lcom/google/android/gtalkservice/service/GTalkService;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;Lcom/google/android/gtalkservice/service/GTalkService;)V
    .locals 1
    .param p1, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p2, "service"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/google/android/gtalkservice/IGTalkConnection$Stub;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 37
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0, p0}, Lcom/google/android/gtalkservice/GTalkConnection;->setSessionWrapper(Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;)V

    .line 38
    iput-object p2, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    .line 39
    return-void
.end method


# virtual methods
.method public clearConnectionStatistics()V
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->clearStats()V

    .line 116
    return-void
.end method

.method public createImSessionForProvider(Ljava/lang/String;)Lcom/google/android/gtalkservice/IImSession;
    .locals 2
    .param p1, "serviceProviderName"    # Ljava/lang/String;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getImSessionForProvider(Ljava/lang/String;Z)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v0

    return-object v0
.end method

.method public createImSessionForProviderId(J)Lcom/google/android/gtalkservice/IImSession;
    .locals 2
    .param p1, "serviceProviderId"    # J

    .prologue
    .line 83
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getImSessionForProviderId(JZ)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionUptime()I
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionUptime()I

    move-result v0

    return v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    return-object v0
.end method

.method public getDefaultImSession()Lcom/google/android/gtalkservice/IImSession;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSession()Lcom/google/android/gtalkservice/IImSession;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 3

    .prologue
    .line 66
    const/4 v1, 0x0

    .line 67
    .local v1, "deviceId":Ljava/lang/String;
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccount()Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 68
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    .line 71
    :cond_0
    return-object v1
.end method

.method public getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    return-object v0
.end method

.method public getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;
    .locals 1
    .param p1, "accountId"    # J

    .prologue
    .line 87
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v0

    return-object v0
.end method

.method public getJid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getJid()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastActivityFromServerTime()J
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getLastActivityFromServerTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLastActivityToServerTime()J
    .locals 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getLastActivityToServerTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public getNumberOfConnectionsAttempted()I
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getNumberOfConnectionsAttempted()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getNumberOfConnectionsMade()I
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getNumberOfConnectionsMade()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    return v0
.end method

.method logout()V
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logout()V

    .line 51
    return-void
.end method

.method logoutIfNotUsed()V
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logoutIfNotUsed()V

    .line 55
    return-void
.end method

.method public sendHeartbeat()V
    .locals 3

    .prologue
    .line 123
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    const-string v1, "com.google.android.gtalkservice.permission.SEND_HEARTBEAT"

    const-string v2, "Need SEND_HEART_BEAT permission"

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    if-nez v0, :cond_0

    .line 128
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no connection object"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendHeartbeatToServer()V

    .line 132
    return-void
.end method

.method public sendHttpRequest([BLcom/google/android/gtalkservice/IHttpRequestCallback;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "cb"    # Lcom/google/android/gtalkservice/IHttpRequestCallback;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->sendHttpRequest([BLcom/google/android/gtalkservice/IHttpRequestCallback;)V

    .line 120
    return-void
.end method
