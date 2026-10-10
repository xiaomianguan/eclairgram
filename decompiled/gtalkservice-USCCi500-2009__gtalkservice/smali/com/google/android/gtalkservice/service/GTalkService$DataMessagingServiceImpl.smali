.class public Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;
.super Lcom/google/android/datamessaging/IDataMessagingService$Stub;
.source "GTalkService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/service/GTalkService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DataMessagingServiceImpl"
.end annotation


# instance fields
.field mService:Lcom/google/android/gtalkservice/service/GTalkService;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService;)V
    .locals 0
    .param p1, "service"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 1820
    invoke-direct {p0}, Lcom/google/android/datamessaging/IDataMessagingService$Stub;-><init>()V

    .line 1821
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    .line 1822
    return-void
.end method

.method private requestFailed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "intentCategory"    # Ljava/lang/String;
    .param p2, "error"    # Ljava/lang/String;

    .prologue
    .line 1873
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {p1, p2}, Lcom/google/android/datamessaging/DataMessagingService;->createPushMessagingRegistrationErrorIntent(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkService;->sendBroadcast(Landroid/content/Intent;)V

    .line 1876
    return-void
.end method


# virtual methods
.method public registerForPushMessaging(Landroid/app/PendingIntent;Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p2, "developerId"    # Ljava/lang/String;
    .param p3, "extraParams"    # Ljava/util/Map;

    .prologue
    .line 1851
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2600(Lcom/google/android/gtalkservice/service/GTalkService;)Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    move-result-object v0

    .line 1852
    .local v0, "registrar":Lcom/google/android/gtalkservice/PushMessagingRegistrar;
    if-nez v0, :cond_0

    .line 1853
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getTargetPackage()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError;->RETRY_LATER:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual {v2}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 1859
    :goto_0
    return-void

    .line 1858
    :cond_0
    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->register(Landroid/app/PendingIntent;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0
.end method

.method public sendMessage(Ljava/lang/String;Landroid/content/Intent;)V
    .locals 7
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "data"    # Landroid/content/Intent;

    .prologue
    .line 1825
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    const-string v5, "com.google.android.permission.SEND_DATA_MESSAGE"

    const-string v6, "Need SEND_DATA_MESSAGE permission"

    invoke-virtual {v4, v5, v6}, Lcom/google/android/gtalkservice/service/GTalkService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 1829
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v2

    .line 1832
    .local v2, "origId":J
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryConnection()Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 1834
    .local v0, "connWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    if-nez v0, :cond_0

    .line 1835
    const-string v4, "sendMessage: no connection!"

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 1836
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "no connection found"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1843
    .end local v0    # "connWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    :catchall_0
    move-exception v4

    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v4

    .line 1839
    .restart local v0    # "connWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    :cond_0
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sendMessage: to="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", data="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 1840
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    .line 1841
    .local v1, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getDataMessageManager()Lcom/google/android/gtalkservice/DataMessageManager;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Lcom/google/android/gtalkservice/DataMessageManager;->sendDataMessage(Ljava/lang/String;Landroid/content/Intent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1843
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1845
    return-void
.end method

.method public unregisterForPushMessaging(Landroid/app/PendingIntent;)V
    .locals 3
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 1862
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2600(Lcom/google/android/gtalkservice/service/GTalkService;)Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    move-result-object v0

    .line 1863
    .local v0, "registrar":Lcom/google/android/gtalkservice/PushMessagingRegistrar;
    if-nez v0, :cond_0

    .line 1864
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getTargetPackage()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError;->RETRY_LATER:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual {v2}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;->requestFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 1870
    :goto_0
    return-void

    .line 1869
    :cond_0
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->unregister(Landroid/app/PendingIntent;)V

    goto :goto_0
.end method
