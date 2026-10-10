.class Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;
.super Landroid/content/BroadcastReceiver;
.source "GTalkService.java"

# interfaces
.implements Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/service/GTalkService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AccountsAndSettingsMonitor"
.end annotation


# instance fields
.field private final mService:Lcom/google/android/gtalkservice/service/GTalkService;

.field final synthetic this$0:Lcom/google/android/gtalkservice/service/GTalkService;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/service/GTalkService;)V
    .locals 0
    .param p2, "service"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 415
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 416
    iput-object p2, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    .line 417
    return-void
.end method

.method static synthetic access$1000(Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    .prologue
    .line 411
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->auditGTalkConnections()V

    return-void
.end method

.method private auditGTalkConnections()V
    .locals 2

    .prologue
    .line 538
    invoke-direct {p0, p0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->getAccounts(Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Ljava/util/Map;

    move-result-object v0

    .line 539
    .local v0, "accounts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/gtalkservice/Account;>;"
    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->auditGTalkConnections(Ljava/util/Map;Z)V

    .line 541
    return-void
.end method

.method private auditGTalkConnections(Ljava/util/Map;Z)V
    .locals 11
    .param p2, "stopConnections"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gtalkservice/Account;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p1, "accounts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/gtalkservice/Account;>;"
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 554
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v7

    if-nez v7, :cond_2

    .line 555
    :cond_0
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_1

    const-string v7, "auditGTalkConnections: no accounts, bail"

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 601
    :cond_1
    return-void

    .line 559
    :cond_2
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->autoConnect()Z

    move-result v3

    .line 560
    .local v3, "autoConnect":Z
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1800(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/Set;

    move-result-object v2

    .line 562
    .local v2, "activeSessionUsernames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "auditGTalkConnections: autoConnect="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 567
    :cond_3
    if-eqz v3, :cond_5

    .line 568
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 569
    .local v5, "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 570
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 571
    .local v6, "username":Ljava/lang/String;
    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/Account;

    .line 573
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_4

    .line 574
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "AcctMonitor.auditGTalkConnections: create connection for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 576
    :cond_4
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v7, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1900(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/Account;)V

    goto :goto_0

    .line 579
    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    .end local v5    # "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v6    # "username":Ljava/lang/String;
    :cond_5
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_6

    .line 580
    const-string v7, "AcctMonitor.auditGTalkConnections: not starting any connections since autoConnect is false"

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 585
    :cond_6
    if-eqz p2, :cond_1

    .line 590
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_7
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 591
    .restart local v6    # "username":Ljava/lang/String;
    invoke-interface {p1, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_b

    move v1, v10

    .line 592
    .local v1, "accountDoesntExist":Z
    :goto_2
    if-eqz v3, :cond_8

    if-eqz v1, :cond_7

    .line 593
    :cond_8
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_9

    .line 594
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "AcctMonitor.auditGTalkConnections: stopping connection for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", accountDoesntExist is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 597
    :cond_9
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v7, v6}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1600(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v7

    check-cast v7, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    if-nez v1, :cond_a

    iget-object v8, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v8}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2000(Lcom/google/android/gtalkservice/service/GTalkService;)Z

    move-result v8

    if-eqz v8, :cond_c

    :cond_a
    move v8, v10

    :goto_3
    invoke-direct {p0, v7, v8}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->logoutConnection(Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;Z)V

    goto :goto_1

    .end local v1    # "accountDoesntExist":Z
    :cond_b
    move v1, v9

    .line 591
    goto :goto_2

    .restart local v1    # "accountDoesntExist":Z
    :cond_c
    move v8, v9

    .line 597
    goto :goto_3
.end method

.method private auditGTalkImAccounts()V
    .locals 0

    .prologue
    .line 534
    return-void
.end method

.method private getAccounts(Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Ljava/util/Map;
    .locals 5
    .param p1, "callback"    # Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gtalkservice/Account;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 637
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->getGls()Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v1

    .line 638
    .local v1, "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    if-nez v1, :cond_1

    .line 639
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    const-string v3, "getAccounts: GLS not yet available"

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    :cond_0
    move-object v3, v4

    .line 649
    :goto_0
    return-object v3

    .line 643
    :cond_1
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 644
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/gtalkservice/Account;>;"
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v3, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryAccount(Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 645
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    if-nez v0, :cond_2

    move-object v3, v4

    .line 646
    goto :goto_0

    .line 648
    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    .line 649
    goto :goto_0
.end method

.method private getConnection(Ljava/lang/String;)Lcom/google/android/gtalkservice/GTalkConnection;
    .locals 4
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 477
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v2, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1600(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 480
    .local v1, "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    if-nez v1, :cond_0

    .line 481
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v2, p1, v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1500(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 482
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v2, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1700(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/Account;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v1

    .end local v1    # "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    check-cast v1, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 484
    .restart local v1    # "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    if-nez v1, :cond_0

    move-object v2, v3

    .line 490
    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    :goto_0
    return-object v2

    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    goto :goto_0
.end method

.method private handleBackgroundDataSettingChange()V
    .locals 2

    .prologue
    .line 656
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2100(Lcom/google/android/gtalkservice/service/GTalkService;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 657
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2200(Lcom/google/android/gtalkservice/service/GTalkService;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 658
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$600(Lcom/google/android/gtalkservice/service/GTalkService;)Landroid/provider/Im$ProviderSettings$QueryMap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getAutomaticallyConnectToGTalkServer()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$700(Lcom/google/android/gtalkservice/service/GTalkService;Z)V

    .line 663
    :cond_0
    :goto_0
    return-void

    .line 660
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$2300(Lcom/google/android/gtalkservice/service/GTalkService;Z)V

    goto :goto_0
.end method

.method private logoutConnection(Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;Z)V
    .locals 3
    .param p1, "connection"    # Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .param p2, "force"    # Z

    .prologue
    .line 611
    const/4 v0, 0x1

    .line 613
    .local v0, "logoutSession":Z
    if-nez p2, :cond_0

    .line 614
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/ImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v1

    .line 616
    .local v1, "presence":Lcom/google/android/gtalkservice/Presence;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 617
    const/4 v0, 0x0

    .line 618
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    const-string v2, "AcctMonitor.logoutConnection: presence online, bail!"

    invoke-static {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 622
    .end local v1    # "presence":Lcom/google/android/gtalkservice/Presence;
    :cond_0
    if-eqz v0, :cond_2

    .line 623
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_1

    const-string v2, "AcctMonitor.logoutConnection: logout"

    invoke-static {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 624
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->logout()V

    .line 626
    :cond_2
    return-void
.end method


# virtual methods
.method public authFailed(Ljava/lang/String;)V
    .locals 5
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 516
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    const-string v1, "authFailed"

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 518
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->getConnection(Ljava/lang/String;)Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 520
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    if-nez v0, :cond_1

    .line 521
    const-string v1, "authFailed: getConnection() returned null!"

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 529
    :goto_0
    return-void

    .line 525
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v2

    const/4 v3, 0x4

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/android/gtalkservice/ImSession;->setConnectionStateAndError(IIZ)V

    goto :goto_0
.end method

.method public authTokenFetched(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "authToken"    # Ljava/lang/String;

    .prologue
    .line 463
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "authTokenFetched("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, ") token is empty!"

    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 467
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 468
    .local v1, "accountsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/gtalkservice/Account;>;"
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v2, p1, p2}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1500(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 470
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    if-eqz v0, :cond_1

    .line 471
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->auditGTalkConnections(Ljava/util/Map;Z)V

    .line 474
    :cond_1
    return-void

    .line 463
    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    .end local v1    # "accountsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/gtalkservice/Account;>;"
    :cond_2
    const-string v3, ")"

    goto :goto_0
.end method

.method public fetchAuthTokenLater(Ljava/lang/String;)V
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 494
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    const-string v1, "fetchAuthTokenLater..."

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 496
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->getConnection(Ljava/lang/String;)Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 498
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    if-nez v0, :cond_1

    .line 499
    const-string v1, "fetchAuthTokenLater: getConnection() returned null!"

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 513
    :goto_0
    return-void

    .line 508
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->isSessionOpen()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 509
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->retryConnection(Z)V

    goto :goto_0

    .line 511
    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->login()V

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const-wide/16 v6, 0x0

    const/4 v5, 0x0

    .line 420
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 422
    .local v0, "action":Ljava/lang/String;
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AcctMonitor.onReceiveIntent: action "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 424
    :cond_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->getGls()Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v1

    .line 425
    .local v1, "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    if-nez v1, :cond_2

    .line 426
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_1

    const-string v3, "AcctMonitor.onReceiveIntent: GLS not yet available"

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$500(Ljava/lang/String;)V

    .line 460
    :cond_1
    :goto_0
    return-void

    .line 430
    :cond_2
    const-string v3, "android.intent.action.USER_PRESENT"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 431
    invoke-static {}, Lcom/google/android/gtalkservice/service/GTalkService;->isUserIdle()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 432
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v3, v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1100(Lcom/google/android/gtalkservice/service/GTalkService;Z)V

    .line 434
    :cond_3
    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1202(Z)Z

    .line 435
    invoke-static {v6, v7}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1302(J)J

    goto :goto_0

    .line 436
    :cond_4
    const-string v3, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 440
    const/4 v3, 0x1

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1202(Z)Z

    .line 441
    invoke-static {}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1300()J

    move-result-wide v3

    cmp-long v3, v3, v6

    if-nez v3, :cond_1

    .line 442
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1302(J)J

    goto :goto_0

    .line 444
    :cond_5
    const-string v3, "com.android.sync.SYNC_CONN_STATUS_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 445
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->pollAutoSyncSetting()V

    .line 446
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->auditGTalkConnections()V

    goto :goto_0

    .line 447
    :cond_6
    const-string v3, "android.accounts.LOGIN_ACCOUNTS_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 448
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->auditGTalkConnections()V

    .line 449
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->auditGTalkImAccounts()V

    goto :goto_0

    .line 450
    :cond_7
    const-string v3, "android.intent.action.DEVICE_STORAGE_LOW"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 451
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->handleDeviceStorageLow()V

    goto :goto_0

    .line 452
    :cond_8
    const-string v3, "android.intent.action.DEVICE_STORAGE_OK"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 453
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->handleDeviceStorageOk()V

    goto :goto_0

    .line 454
    :cond_9
    const-string v3, "android.net.conn.BACKGROUND_DATA_SETTING_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 455
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Lcom/google/android/gtalkservice/service/GTalkService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 457
    .local v2, "manager":Landroid/net/ConnectivityManager;
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getBackgroundDataSetting()Z

    move-result v4

    invoke-static {v3, v4}, Lcom/google/android/gtalkservice/service/GTalkService;->access$1400(Lcom/google/android/gtalkservice/service/GTalkService;Z)V

    .line 458
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->handleBackgroundDataSettingChange()V

    goto/16 :goto_0
.end method
