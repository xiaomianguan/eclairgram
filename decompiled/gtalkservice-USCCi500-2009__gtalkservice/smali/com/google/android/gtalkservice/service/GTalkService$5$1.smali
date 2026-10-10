.class Lcom/google/android/gtalkservice/service/GTalkService$5$1;
.super Ljava/lang/Object;
.source "GTalkService.java"

# interfaces
.implements Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/service/GTalkService$5;->createGTalkConnection(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/gtalkservice/service/GTalkService$5;

.field final synthetic val$account:Lcom/google/android/gtalkservice/Account;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService$5;Lcom/google/android/gtalkservice/Account;)V
    .locals 0

    .prologue
    .line 1962
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService$5$1;->this$1:Lcom/google/android/gtalkservice/service/GTalkService$5;

    iput-object p2, p0, Lcom/google/android/gtalkservice/service/GTalkService$5$1;->val$account:Lcom/google/android/gtalkservice/Account;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public authFailed(Ljava/lang/String;)V
    .locals 6
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 1963
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    .line 1964
    const-string v2, "createGTalkConnection: authFailed!"

    invoke-static {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 1966
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService$5$1;->this$1:Lcom/google/android/gtalkservice/service/GTalkService$5;

    invoke-virtual {v2, p1}, Lcom/google/android/gtalkservice/service/GTalkService$5;->getConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 1968
    .local v0, "connWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    if-eqz v0, :cond_1

    .line 1969
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    .line 1970
    .local v1, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v2

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v3

    const/4 v4, 0x4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/google/android/gtalkservice/ImSession;->setConnectionStateAndError(IIZ)V

    .line 1975
    .end local v1    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    :cond_1
    return-void
.end method

.method public authTokenFetched(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "authToken"    # Ljava/lang/String;

    .prologue
    .line 1929
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    .line 1930
    const-string v1, "createGTalkConnection: authToken fetched, login..."

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 1932
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$5$1;->val$account:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v1, p2}, Lcom/google/android/gtalkservice/Account;->setAuthToken(Ljava/lang/String;)V

    .line 1933
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$5$1;->this$1:Lcom/google/android/gtalkservice/service/GTalkService$5;

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService$5$1;->val$account:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService$5;->getConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    .line 1935
    .local v0, "connection":Lcom/google/android/gtalkservice/IGTalkConnection;
    if-eqz v0, :cond_1

    .line 1936
    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .end local v0    # "connection":Lcom/google/android/gtalkservice/IGTalkConnection;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->login()V

    .line 1939
    :cond_1
    return-void
.end method

.method public fetchAuthTokenLater(Ljava/lang/String;)V
    .locals 3
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 1949
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    .line 1950
    const-string v1, "createGTalkConnection: fetchAuthTokenLater..."

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 1953
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$5$1;->val$account:Lcom/google/android/gtalkservice/Account;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/Account;->setAuthToken(Ljava/lang/String;)V

    .line 1954
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$5$1;->this$1:Lcom/google/android/gtalkservice/service/GTalkService$5;

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/service/GTalkService$5;->getConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    .line 1955
    .local v0, "connection":Lcom/google/android/gtalkservice/IGTalkConnection;
    if-eqz v0, :cond_1

    .line 1956
    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .end local v0    # "connection":Lcom/google/android/gtalkservice/IGTalkConnection;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->login()V

    .line 1960
    :cond_1
    return-void
.end method
