.class public Lcom/google/android/gtalkservice/ImAccountInfo;
.super Ljava/lang/Object;
.source "ImAccountInfo.java"


# instance fields
.field accountId:J

.field providerId:J

.field username:Ljava/lang/String;


# direct methods
.method public constructor <init>(JJLjava/lang/String;)V
    .locals 0
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .param p5, "username"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-wide p1, p0, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    .line 26
    iput-wide p3, p0, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    .line 27
    iput-object p5, p0, Lcom/google/android/gtalkservice/ImAccountInfo;->username:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public static getAccountId(Lcom/google/android/gtalkservice/GTalkConnection;)J
    .locals 3
    .param p0, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    .line 60
    .local v0, "imSession":Lcom/google/android/gtalkservice/ImSession;
    if-nez v0, :cond_0

    .line 61
    const-wide/16 v1, 0x0

    .line 64
    :goto_0
    return-wide v1

    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getAccountId()J

    move-result-wide v1

    goto :goto_0
.end method

.method public static getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;
    .locals 7
    .param p0, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v6

    .line 39
    .local v6, "imSession":Lcom/google/android/gtalkservice/ImSession;
    if-nez v6, :cond_0

    .line 40
    const/4 v0, 0x0

    .line 43
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gtalkservice/ImAccountInfo;

    invoke-virtual {v6}, Lcom/google/android/gtalkservice/ImSession;->getServiceProviderId()J

    move-result-wide v1

    invoke-virtual {v6}, Lcom/google/android/gtalkservice/ImSession;->getAccountId()J

    move-result-wide v3

    invoke-virtual {v6}, Lcom/google/android/gtalkservice/ImSession;->getUsername()Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gtalkservice/ImAccountInfo;-><init>(JJLjava/lang/String;)V

    goto :goto_0
.end method

.method public static getProviderId(Lcom/google/android/gtalkservice/GTalkConnection;)J
    .locals 3
    .param p0, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 48
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    .line 50
    .local v0, "imSession":Lcom/google/android/gtalkservice/ImSession;
    if-nez v0, :cond_0

    .line 51
    const-wide/16 v1, 0x0

    .line 54
    :goto_0
    return-wide v1

    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getServiceProviderId()J

    move-result-wide v1

    goto :goto_0
.end method
