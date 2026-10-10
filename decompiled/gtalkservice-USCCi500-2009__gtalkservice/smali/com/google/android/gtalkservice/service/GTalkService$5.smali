.class Lcom/google/android/gtalkservice/service/GTalkService$5;
.super Lcom/google/android/gtalkservice/IGTalkService$Stub;
.source "GTalkService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/service/GTalkService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/service/GTalkService;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService;)V
    .locals 0

    .prologue
    .line 2084
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IGTalkService$Stub;-><init>()V

    return-void
.end method

.method private enforcePermission()V
    .locals 3

    .prologue
    .line 1886
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    const-string v1, "com.google.android.gtalkservice.permission.GTALK_SERVICE"

    const-string v2, "Need GTalk_SERVICE permission"

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1889
    return-void
.end method


# virtual methods
.method public asyncCreateGTalkConnection(Ljava/lang/String;Lcom/google/android/gtalkservice/IGTalkConnectionListener;)V
    .locals 2
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/google/android/gtalkservice/IGTalkConnectionListener;

    .prologue
    .line 1999
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;->enforcePermission()V

    .line 2001
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2100(Lcom/google/android/gtalkservice/service/GTalkService;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2002
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v1, :cond_0

    const-string v1, "asyncCreateGTalkConnection: add listener to pending list"

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 2003
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v1, p1, p2}, Lcom/google/android/gtalkservice/service/GTalkService;->access$3200(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Lcom/google/android/gtalkservice/IGTalkConnectionListener;)V

    .line 2016
    :goto_0
    return-void

    .line 2005
    :cond_1
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v1, :cond_2

    const-string v1, "asyncCreateGTalkConnection: create conn synchronously"

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 2006
    :cond_2
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService$5;->createGTalkConnection(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    .line 2008
    .local v0, "conn":Lcom/google/android/gtalkservice/IGTalkConnection;
    if-eqz v0, :cond_3

    .line 2009
    :try_start_0
    invoke-interface {p2, v0}, Lcom/google/android/gtalkservice/IGTalkConnectionListener;->onConnectionCreated(Lcom/google/android/gtalkservice/IGTalkConnection;)V

    goto :goto_0

    .line 2013
    :catch_0
    move-exception v1

    goto :goto_0

    .line 2011
    :cond_3
    invoke-interface {p2, p1}, Lcom/google/android/gtalkservice/IGTalkConnectionListener;->onConnectionCreationFailed(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public createGTalkConnection(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 8
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    const-string v7, "GTalkService"

    .line 1892
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;->enforcePermission()V

    .line 1894
    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2000(Lcom/google/android/gtalkservice/service/GTalkService;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1895
    const-string v5, "GTalkService"

    const-string v5, "createGTalkConnection failed due to device storage low!"

    invoke-static {v7, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v6

    .line 1995
    :goto_0
    return-object v5

    .line 1899
    :cond_0
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 1901
    .local v2, "origId":J
    const/4 v4, 0x0

    .line 1908
    .local v4, "retVal":Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1909
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v5, :cond_1

    .line 1910
    const-string v5, "createGTalkConnection: empty username, use primary account"

    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 1912
    :cond_1
    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryAccount(Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 1920
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    :goto_1
    if-eqz v0, :cond_5

    .line 1921
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getAuthToken()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_3

    .line 1922
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v5, :cond_2

    .line 1923
    const-string v5, "createGTalkConnection: async fetch auth token..."

    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 1926
    :cond_2
    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$3000(Lcom/google/android/gtalkservice/service/GTalkService;)Lcom/google/android/gtalkservice/AuthTokenFetcher;

    move-result-object v5

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/google/android/gtalkservice/service/GTalkService$5$1;

    invoke-direct {v7, p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService$5$1;-><init>(Lcom/google/android/gtalkservice/service/GTalkService$5;Lcom/google/android/gtalkservice/Account;)V

    invoke-virtual {v5, v6, v7}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->asyncFetch(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V

    .line 1980
    :cond_3
    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v5, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1700(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/Account;)Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 1992
    :goto_2
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    :goto_3
    move-object v5, v4

    .line 1995
    goto :goto_0

    .line 1917
    :cond_4
    :try_start_1
    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    const/4 v6, 0x0

    invoke-static {v5, p1, v6}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2900(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .restart local v0    # "account":Lcom/google/android/gtalkservice/Account;
    goto :goto_1

    .line 1982
    :cond_5
    const-string v5, "GTalkService"

    const-string v6, "createGTalkConnection: account is null!"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1987
    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v5, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$3100(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 1989
    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    :catch_0
    move-exception v5

    move-object v1, v5

    .line 1990
    .local v1, "ex":Ljava/lang/Exception;
    :try_start_2
    const-string v5, "GTalkService"

    const-string v6, "createGTalkConnection: caught "

    invoke-static {v5, v6, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1992
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_3

    .end local v1    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v5
.end method

.method public dismissNotificationFor(Ljava/lang/String;J)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "providerId"    # J

    .prologue
    .line 2080
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;->enforcePermission()V

    .line 2081
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->dismissNotificationFor(Ljava/lang/String;J)V

    .line 2082
    return-void
.end method

.method public dismissNotifications(J)V
    .locals 1
    .param p1, "providerId"    # J

    .prologue
    .line 2075
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;->enforcePermission()V

    .line 2076
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->dismissNotifications(J)V

    .line 2077
    return-void
.end method

.method public getActiveConnections()Ljava/util/List;
    .locals 6

    .prologue
    .line 2020
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;->enforcePermission()V

    .line 2022
    const/4 v2, 0x0

    .line 2024
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/IBinder;>;"
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$300(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/concurrent/locks/Lock;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 2026
    :try_start_0
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$400(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2027
    .end local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/IBinder;>;"
    .local v3, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/IBinder;>;"
    :try_start_1
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$400(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 2028
    .local v0, "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2031
    .end local v0    # "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    move-object v2, v3

    .end local v3    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/IBinder;>;"
    .restart local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/IBinder;>;"
    :goto_1
    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$300(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/concurrent/locks/Lock;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v4

    .end local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/IBinder;>;"
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v3    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/IBinder;>;"
    :cond_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$300(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/concurrent/locks/Lock;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 2034
    return-object v3

    .line 2031
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/IBinder;>;"
    .restart local v2    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/IBinder;>;"
    :catchall_1
    move-exception v4

    goto :goto_1
.end method

.method public getConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 2038
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;->enforcePermission()V

    .line 2040
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2041
    const-string v0, "GTalkService"

    const-string v1, "getConnectionForUser: empty username"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2042
    const/4 v0, 0x0

    .line 2045
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1600(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    goto :goto_0
.end method

.method public getDefaultConnection()Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 1

    .prologue
    .line 2049
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;->enforcePermission()V

    .line 2051
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryConnection()Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    return-object v0
.end method

.method public getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;
    .locals 5
    .param p1, "accountId"    # J

    .prologue
    .line 2055
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;->enforcePermission()V

    .line 2057
    const/4 v2, 0x0

    .line 2059
    .local v2, "imSession":Lcom/google/android/gtalkservice/IImSession;
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$300(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/concurrent/locks/Lock;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 2061
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$400(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 2062
    .local v0, "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 2063
    if-eqz v2, :cond_0

    .line 2068
    .end local v0    # "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    :cond_1
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$300(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/concurrent/locks/Lock;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 2071
    return-object v2

    .line 2068
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$300(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/concurrent/locks/Lock;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3
.end method

.method public printDiagnostics()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 2085
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;->enforcePermission()V

    .line 2087
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 2088
    .local v2, "sw":Ljava/io/StringWriter;
    new-instance v0, Ljava/io/PrintWriter;

    invoke-direct {v0, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 2089
    .local v0, "pw":Ljava/io/PrintWriter;
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$5;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v3, v4, v0, v4}, Lcom/google/android/gtalkservice/service/GTalkService;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 2090
    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2091
    .local v1, "retVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 2092
    return-object v1
.end method
