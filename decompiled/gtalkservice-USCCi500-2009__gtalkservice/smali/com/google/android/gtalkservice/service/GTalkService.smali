.class public Lcom/google/android/gtalkservice/service/GTalkService;
.super Landroid/app/Service;
.source "GTalkService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/service/GTalkService$6;,
        Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;,
        Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;,
        Lcom/google/android/gtalkservice/service/GTalkService$WorkerThread;,
        Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;
    }
.end annotation


# static fields
.field private static final ACCOUNT_ID_COLUMN:I = 0x0

.field private static final ACCOUNT_PASSWORD_COLUMN:I = 0x3

.field private static final ACCOUNT_PROJECTION:[Ljava/lang/String;

.field private static final ACCOUNT_PROVIDER_COLUMN:I = 0x1

.field private static final ACCOUNT_USERNAME_COLUMN:I = 0x2

.field private static final ACTION_SYNC:Ljava/lang/String; = "com.android.sync.SYNC_CONN_STATUS_CHANGED"

.field private static final AUTH_TYPE:Ljava/lang/String; = "mail"

.field private static final DEFAULT_IDLE_TIMEOUT:J = 0xdbba0L

.field public static final EVENT_CONNECTION_CLOSED:I = 0x12c

.field public static final EVENT_CONNECTION_ESTABLISHED:I = 0xc8

.field public static final EVENT_CRASH_APP:I = 0x3e8

.field public static final EVENT_GSERVICES_CHANGED:I = 0x1f4

.field public static final EVENT_NETWORK_STATE_CHANGED:I = 0x64

.field public static final EVENT_REFRESH_AUTH_TOKEN:I = 0x190

.field private static final GSERVICES_POST_DELAY_MS:I = 0x2710

.field private static final OBSERVED_GSERVICES:[Ljava/lang/String;

.field private static sIdleTimeout:J

.field private static sScreenOff:Z

.field private static sScreenOffTimestamp:J


# instance fields
.field private mAccountsAndSettingsMonitor:Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

.field private mAsyncConnectionListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;",
            ">;"
        }
    .end annotation
.end field

.field private mAuthTokenFetcher:Lcom/google/android/gtalkservice/AuthTokenFetcher;

.field private mAutoSyncEnabled:Z

.field private mBackgroundDataEnabled:Z

.field private mConnections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private mControlAutoConnectUsingAutoSync:Z

.field private final mDataMessagingBinder:Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;

.field private mDeviceStorageLow:Z

.field private final mGTalkServiceBinder:Lcom/google/android/gtalkservice/IGTalkService$Stub;

.field private mGls:Lcom/google/android/googleapps/IGoogleLoginService;

.field private mGlsConnection:Landroid/content/ServiceConnection;

.field private mGservices:Landroid/provider/Settings$Gservices$QueryMap;

.field private mHandler:Landroid/os/Handler;

.field private mIpcLock:Ljava/lang/Object;

.field private mJidResource:Ljava/lang/String;

.field private mLastLoginStateSelection:Ljava/lang/String;

.field private mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

.field private mPendingGservicesChange:Z

.field private mPrimaryConnection:Lcom/google/android/gtalkservice/IGTalkConnection;

.field private mPushMessagingRegistrar:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

.field private mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

.field private mServiceInitialized:Z

.field private mSessionsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

.field private mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

.field private mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

.field private mShowMobileIndicator:Z

.field private mStatusBarNotifier:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

.field private mTimeSinceServiceOnCreate:J

.field private mWorkerLooper:Landroid/os/Looper;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 126
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    const-string v1, "provider"

    aput-object v1, v0, v3

    const-string v1, "username"

    aput-object v1, v0, v4

    const-string v1, "pw"

    aput-object v1, v0, v5

    sput-object v0, Lcom/google/android/gtalkservice/service/GTalkService;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    .line 195
    const/16 v0, 0x13

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "gtalk_hostname"

    aput-object v1, v0, v2

    const-string v1, "gtalk_rmq_ack_interval"

    aput-object v1, v0, v3

    const-string v1, "gtalk_active_heartbeat_ping_interval_ms"

    aput-object v1, v0, v4

    const-string v1, "gtalk_heartbeat_ping_interval_ms"

    aput-object v1, v0, v5

    const-string v1, "gtalk_sync_heartbeat_ping_interval_ms"

    aput-object v1, v0, v6

    const/4 v1, 0x5

    const-string v2, "gtalk_nosync_heartbeat_ping_interval_ms"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "gtalk_heartbeat_ack_timeout_ms"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "gtalk_secure_port"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "gtalk_min_reconnect_delay_short"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "gtalk_reconnect_variant_short"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "gtalk_min_reconnect_delay_long"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "gtalk_reconnect_variant_long"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "gtalk_idle_timeout_ms"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "gtalk_max_reconnect_delay"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "gtalk_short_network_downtime"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "gtalk_connect_on_auto_sync"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "gtalk_use_rmq2"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "gtalk_support_rmq_and_rmq2"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "gtalk_rmq2_include_stream_id"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gtalkservice/service/GTalkService;->OBSERVED_GSERVICES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 836
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 164
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mBackgroundDataEnabled:Z

    .line 169
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mIpcLock:Ljava/lang/Object;

    .line 170
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 171
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    .line 172
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    .line 187
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAsyncConnectionListeners:Ljava/util/ArrayList;

    .line 217
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPendingGservicesChange:Z

    .line 222
    new-instance v0, Lcom/google/android/gtalkservice/service/GTalkService$1;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/service/GTalkService$1;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mHandler:Landroid/os/Handler;

    .line 1879
    new-instance v0, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mDataMessagingBinder:Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;

    .line 1884
    new-instance v0, Lcom/google/android/gtalkservice/service/GTalkService$5;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/service/GTalkService$5;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGTalkServiceBinder:Lcom/google/android/gtalkservice/IGTalkService$Stub;

    .line 837
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/gtalkservice/service/GTalkService;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->networkStateChanged()V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->refreshAuthToken(Lcom/google/android/gtalkservice/GTalkConnection;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/android/gtalkservice/service/GTalkService;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Z

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->sendDeviceIdleStatusForConnections(Z)V

    return-void
.end method

.method static synthetic access$1202(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 111
    sput-boolean p0, Lcom/google/android/gtalkservice/service/GTalkService;->sScreenOff:Z

    return p0
.end method

.method static synthetic access$1300()J
    .locals 2

    .prologue
    .line 111
    sget-wide v0, Lcom/google/android/gtalkservice/service/GTalkService;->sScreenOffTimestamp:J

    return-wide v0
.end method

.method static synthetic access$1302(J)J
    .locals 0
    .param p0, "x0"    # J

    .prologue
    .line 111
    sput-wide p0, Lcom/google/android/gtalkservice/service/GTalkService;->sScreenOffTimestamp:J

    return-wide p0
.end method

.method static synthetic access$1400(Lcom/google/android/gtalkservice/service/GTalkService;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Z

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->setBackgroundDataWithLock(Z)V

    return-void
.end method

.method static synthetic access$1500(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/service/GTalkService;->createAccount(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1600(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->getConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1700(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/Account;)Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/Account;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->createConnection(Lcom/google/android/gtalkservice/Account;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getAllSessionUsernames()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1900(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/Account;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/Account;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->createConnectionAndLogin(Lcom/google/android/gtalkservice/Account;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/gtalkservice/service/GTalkService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPendingGservicesChange:Z

    return v0
.end method

.method static synthetic access$2000(Lcom/google/android/gtalkservice/service/GTalkService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getDeviceStorageLow()Z

    move-result v0

    return v0
.end method

.method static synthetic access$202(Lcom/google/android/gtalkservice/service/GTalkService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Z

    .prologue
    .line 111
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPendingGservicesChange:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/google/android/gtalkservice/service/GTalkService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getServiceInitialized()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2200(Lcom/google/android/gtalkservice/service/GTalkService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->isBackgroundDataEnabled()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2300(Lcom/google/android/gtalkservice/service/GTalkService;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Z

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->logoutAllSessions(Z)V

    return-void
.end method

.method static synthetic access$2400(Lcom/google/android/gtalkservice/service/GTalkService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mShowMobileIndicator:Z

    return v0
.end method

.method static synthetic access$2402(Lcom/google/android/gtalkservice/service/GTalkService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Z

    .prologue
    .line 111
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mShowMobileIndicator:Z

    return p1
.end method

.method static synthetic access$2500(Lcom/google/android/gtalkservice/service/GTalkService;)Lcom/google/android/googleapps/IGoogleLoginService;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGls:Lcom/google/android/googleapps/IGoogleLoginService;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/google/android/gtalkservice/service/GTalkService;)Lcom/google/android/gtalkservice/PushMessagingRegistrar;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPushMessagingRegistrar:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    return-object v0
.end method

.method static synthetic access$2602(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/PushMessagingRegistrar;)Lcom/google/android/gtalkservice/PushMessagingRegistrar;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPushMessagingRegistrar:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    return-object p1
.end method

.method static synthetic access$2700(Lcom/google/android/gtalkservice/service/GTalkService;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->setServiceInitialized()V

    return-void
.end method

.method static synthetic access$2800(Lcom/google/android/gtalkservice/service/GTalkService;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    .prologue
    .line 111
    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/service/GTalkService;->getAccount(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/concurrent/locks/Lock;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/google/android/gtalkservice/service/GTalkService;)Lcom/google/android/gtalkservice/AuthTokenFetcher;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAuthTokenFetcher:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->reconcileGTalkAccount(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3200(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Lcom/google/android/gtalkservice/IGTalkConnectionListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/google/android/gtalkservice/IGTalkConnectionListener;

    .prologue
    .line 111
    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/service/GTalkService;->addAsyncConnectionListener(Ljava/lang/String;Lcom/google/android/gtalkservice/IGTalkConnectionListener;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/android/gtalkservice/service/GTalkService;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-static {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/android/gtalkservice/service/GTalkService;)Landroid/provider/Im$ProviderSettings$QueryMap;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/gtalkservice/service/GTalkService;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Z

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->initializeConnection(Z)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/android/gtalkservice/service/GTalkService;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;

    .prologue
    .line 111
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->resetOnGservicesChange()V

    return-void
.end method

.method static synthetic access$902(Lcom/google/android/gtalkservice/service/GTalkService;Landroid/os/Looper;)Landroid/os/Looper;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "x1"    # Landroid/os/Looper;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mWorkerLooper:Landroid/os/Looper;

    return-object p1
.end method

.method private addAsyncConnectionListener(Ljava/lang/String;Lcom/google/android/gtalkservice/IGTalkConnectionListener;)V
    .locals 3
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/google/android/gtalkservice/IGTalkConnectionListener;

    .prologue
    .line 1184
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAsyncConnectionListeners:Ljava/util/ArrayList;

    monitor-enter v0

    .line 1185
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAsyncConnectionListeners:Ljava/util/ArrayList;

    new-instance v2, Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;

    invoke-direct {v2, p0, p1, p2}, Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Lcom/google/android/gtalkservice/IGTalkConnectionListener;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1186
    monitor-exit v0

    .line 1187
    return-void

    .line 1186
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private clearLastLoginStateAfterBoot(ZLjava/lang/String;)V
    .locals 4
    .param p1, "alwaysSignIn"    # Z
    .param p2, "selection"    # Ljava/lang/String;

    .prologue
    .line 1286
    invoke-static {}, Lcom/google/android/gtalkservice/ServiceAutoStarter;->getBootFlag()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1287
    invoke-static {}, Lcom/google/android/gtalkservice/ServiceAutoStarter;->clearBootFlag()V

    .line 1288
    if-nez p1, :cond_1

    .line 1289
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    const-string v1, "clear last login state"

    invoke-static {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1291
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1292
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "last_login_state"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1293
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, p2, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1297
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_1
    return-void
.end method

.method private computeJIDResource()Ljava/lang/String;
    .locals 15

    .prologue
    const/16 v14, 0xc

    .line 1789
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v10, "android"

    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1791
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    add-long v8, v10, v12

    .line 1792
    .local v8, "seed":J
    new-instance v6, Ljava/util/Random;

    invoke-direct {v6, v8, v9}, Ljava/util/Random;-><init>(J)V

    .line 1793
    .local v6, "rand":Ljava/util/Random;
    invoke-virtual {v6}, Ljava/util/Random;->nextLong()J

    move-result-wide v3

    .line 1794
    .local v3, "l":J
    invoke-static {v3, v4}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v7

    .line 1795
    .local v7, "s":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v5

    .line 1797
    .local v5, "len":I
    if-le v5, v14, :cond_1

    .line 1798
    const/4 v10, 0x0

    invoke-virtual {v7, v10, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 1806
    :cond_0
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1807
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10

    .line 1799
    :cond_1
    if-ge v5, v14, :cond_0

    .line 1800
    sub-int v1, v14, v5

    .line 1801
    .local v1, "fillerLen":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1802
    const-string v10, "0"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1801
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private createAccount(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;
    .locals 9
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    const-string v8, "GTalkService"

    .line 808
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "createAccount: user="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 810
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 811
    const-string v5, "GTalkService"

    const-string v5, "createConnection: empty username."

    invoke-static {v8, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v7

    .line 833
    :goto_0
    return-object v5

    .line 816
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getGls()Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v4

    .line 817
    .local v4, "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    invoke-interface {v4}, Lcom/google/android/googleapps/IGoogleLoginService;->getAndroidId()J

    move-result-wide v1

    .line 819
    .local v1, "androidId":J
    const-wide/16 v5, 0x0

    cmp-long v5, v1, v5

    if-nez v5, :cond_2

    .line 820
    const/16 v5, 0x9

    invoke-static {v5}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 821
    const-string v5, "GTalkService"

    const-string v6, "createAccount: gls.getAndroidId() returned 0!"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v7

    .line 822
    goto :goto_0

    .line 825
    :cond_2
    invoke-static {v1, v2}, Landroid/provider/Settings;->getGTalkDeviceId(J)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, p1, p2, v5}, Lcom/google/android/gtalkservice/Account;->createAccountFromSettings(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    move-object v5, v0

    .line 828
    goto :goto_0

    .line 829
    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    .end local v1    # "androidId":J
    .end local v4    # "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    :catch_0
    move-exception v5

    move-object v3, v5

    .line 831
    .local v3, "e":Landroid/os/RemoteException;
    const-string v5, "GTalkService"

    const-string v5, "createConnection: server died."

    invoke-static {v8, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v7

    .line 833
    goto :goto_0
.end method

.method private createConnection(Lcom/google/android/gtalkservice/Account;)Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 9
    .param p1, "account"    # Lcom/google/android/gtalkservice/Account;

    .prologue
    const/4 v8, 0x0

    .line 1438
    if-nez p1, :cond_1

    .line 1439
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_0

    const-string v7, "createConnection: null account, bail"

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    :cond_0
    move-object v7, v8

    .line 1508
    :goto_0
    return-object v7

    .line 1444
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Account;->getPort()I

    move-result v7

    if-gez v7, :cond_3

    .line 1445
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_2

    const-string v7, "createConnection: rejected: port is negative"

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    :cond_2
    move-object v7, v8

    .line 1446
    goto :goto_0

    .line 1450
    :cond_3
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->isBackgroundDataEnabled()Z

    move-result v7

    if-nez v7, :cond_5

    .line 1451
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_4

    const-string v7, "createConnection: rejected: background data is disabled"

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    :cond_4
    move-object v7, v8

    .line 1452
    goto :goto_0

    .line 1458
    :cond_5
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 1460
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v6

    .line 1461
    .local v6, "username":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/google/android/gtalkservice/service/GTalkService;->internalGetConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v2

    .line 1462
    .local v2, "iSession":Lcom/google/android/gtalkservice/IGTalkConnection;
    if-eqz v2, :cond_7

    .line 1463
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_6

    const-string v7, "createConnection: connection already exists"

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1482
    :cond_6
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v7, v2

    goto :goto_0

    .line 1467
    :cond_7
    :try_start_1
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_8

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "createConnection: open new GTalk connection for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1468
    :cond_8
    new-instance v0, Lcom/google/android/gtalkservice/GTalkConnection;

    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    iget-object v8, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mWorkerLooper:Landroid/os/Looper;

    invoke-direct {v0, v7, p1, v8}, Lcom/google/android/gtalkservice/GTalkConnection;-><init>(Lcom/google/android/gtalkservice/service/GTalkServiceContext;Lcom/google/android/gtalkservice/Account;Landroid/os/Looper;)V

    .line 1469
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    new-instance v1, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    invoke-direct {v1, v0, p0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;Lcom/google/android/gtalkservice/service/GTalkService;)V

    .line 1471
    .local v1, "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    const/4 v7, 0x0

    invoke-static {v7}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 1473
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1478
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPrimaryConnection:Lcom/google/android/gtalkservice/IGTalkConnection;

    if-nez v7, :cond_9

    .line 1479
    iput-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPrimaryConnection:Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1482
    :cond_9
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 1486
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    invoke-virtual {v7}, Landroid/net/NetworkConnectivityListener;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    .line 1487
    .local v3, "networkInfo":Landroid/net/NetworkInfo;
    sget-object v5, Landroid/net/NetworkInfo$State;->UNKNOWN:Landroid/net/NetworkInfo$State;

    .line 1488
    .local v5, "state":Landroid/net/NetworkInfo$State;
    const/4 v4, 0x0

    .line 1489
    .local v4, "networkType":I
    if-eqz v3, :cond_a

    .line 1490
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    .line 1491
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v5

    .line 1492
    sget-object v7, Landroid/net/NetworkInfo$State;->DISCONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v5, v7, :cond_a

    .line 1493
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    invoke-virtual {v7}, Landroid/net/NetworkConnectivityListener;->getState()Landroid/net/NetworkConnectivityListener$State;

    move-result-object v7

    sget-object v8, Landroid/net/NetworkConnectivityListener$State;->CONNECTED:Landroid/net/NetworkConnectivityListener$State;

    if-ne v7, v8, :cond_a

    .line 1494
    sget-object v5, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    .line 1498
    :cond_a
    invoke-virtual {v0, v5, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->networkStateChanged(Landroid/net/NetworkInfo$State;I)V

    .line 1501
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Account;->getAuthToken()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_b

    .line 1502
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->login()V

    :goto_1
    move-object v7, v1

    .line 1508
    goto/16 :goto_0

    .line 1482
    .end local v0    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    .end local v1    # "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v2    # "iSession":Lcom/google/android/gtalkservice/IGTalkConnection;
    .end local v3    # "networkInfo":Landroid/net/NetworkInfo;
    .end local v4    # "networkType":I
    .end local v5    # "state":Landroid/net/NetworkInfo$State;
    .end local v6    # "username":Ljava/lang/String;
    :catchall_0
    move-exception v7

    iget-object v8, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v8}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v7

    .line 1504
    .restart local v0    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    .restart local v1    # "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .restart local v2    # "iSession":Lcom/google/android/gtalkservice/IGTalkConnection;
    .restart local v3    # "networkInfo":Landroid/net/NetworkInfo;
    .restart local v4    # "networkType":I
    .restart local v5    # "state":Landroid/net/NetworkInfo$State;
    .restart local v6    # "username":Ljava/lang/String;
    :cond_b
    const-string v7, "GTalkService"

    const-string v8, "createConnection: missing account.authToken..."

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1505
    const/4 v7, 0x4

    invoke-virtual {v0, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    goto :goto_1
.end method

.method private createConnectionAndLogin(Lcom/google/android/gtalkservice/Account;)V
    .locals 5
    .param p1, "account"    # Lcom/google/android/gtalkservice/Account;

    .prologue
    const/4 v4, 0x0

    .line 1393
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->createConnection(Lcom/google/android/gtalkservice/Account;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 1396
    .local v1, "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    if-nez v1, :cond_1

    .line 1426
    :cond_0
    :goto_0
    return-void

    .line 1399
    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 1405
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Account;->getAuthToken()Ljava/lang/String;

    move-result-object v2

    .line 1406
    .local v2, "newAuthToken":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1407
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccount()Lcom/google/android/gtalkservice/Account;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/Account;->getAuthToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1408
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->setAccount(Lcom/google/android/gtalkservice/Account;)V

    .line 1410
    const-string v3, "createConnAndLogin: auth token changed, reconnect..."

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1413
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->isSessionOpen()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1419
    invoke-virtual {v0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->resetReconnectionTimer(Z)V

    .line 1420
    invoke-virtual {v0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->retryConnection(Z)V

    goto :goto_0

    .line 1422
    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->login()V

    goto :goto_0
.end method

.method private createGTalkConnectionsForAsyncListeners()V
    .locals 11

    .prologue
    const-string v10, "GTalkService"

    const-string v9, " primary account user"

    .line 1192
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAsyncConnectionListeners:Ljava/util/ArrayList;

    monitor-enter v7

    .line 1193
    :try_start_0
    iget-object v8, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAsyncConnectionListeners:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-nez v8, :cond_1

    .line 1194
    monitor-exit v7

    .line 1230
    :cond_0
    return-void

    .line 1197
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAsyncConnectionListeners:Ljava/util/ArrayList;

    invoke-direct {v4, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1198
    .local v4, "listCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;>;"
    iget-object v8, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAsyncConnectionListeners:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    .line 1199
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1201
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;

    .line 1202
    .local v5, "listener":Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;
    iget-object v6, v5, Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;->username:Ljava/lang/String;

    .line 1203
    .local v6, "username":Ljava/lang/String;
    iget-object v1, v5, Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;->connectionListener:Lcom/google/android/gtalkservice/IGTalkConnectionListener;

    .line 1205
    .local v1, "connListener":Lcom/google/android/gtalkservice/IGTalkConnectionListener;
    const/4 v0, 0x0

    .line 1207
    .local v0, "conn":Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_start_1
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGTalkServiceBinder:Lcom/google/android/gtalkservice/IGTalkService$Stub;

    invoke-virtual {v7, v6}, Lcom/google/android/gtalkservice/IGTalkService$Stub;->createGTalkConnection(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v0

    .line 1210
    :goto_1
    if-eqz v0, :cond_4

    .line 1211
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "successfully created GTalkConnection for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_3

    move-object v7, v6

    :goto_2
    invoke-static {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1214
    :cond_2
    :try_start_2
    invoke-interface {v1, v0}, Lcom/google/android/gtalkservice/IGTalkConnectionListener;->onConnectionCreated(Lcom/google/android/gtalkservice/IGTalkConnection;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 1215
    :catch_0
    move-exception v2

    .line 1216
    .local v2, "e":Landroid/os/RemoteException;
    const-string v7, "GTalkService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "createGTalkConnectionsForAsyncListeners: listener is gone, DeadObjectException "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Landroid/os/RemoteException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v10, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1199
    .end local v0    # "conn":Lcom/google/android/gtalkservice/IGTalkConnection;
    .end local v1    # "connListener":Lcom/google/android/gtalkservice/IGTalkConnectionListener;
    .end local v2    # "e":Landroid/os/RemoteException;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "listCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;>;"
    .end local v5    # "listener":Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;
    .end local v6    # "username":Ljava/lang/String;
    :catchall_0
    move-exception v8

    :try_start_3
    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v8

    .line 1211
    .restart local v0    # "conn":Lcom/google/android/gtalkservice/IGTalkConnection;
    .restart local v1    # "connListener":Lcom/google/android/gtalkservice/IGTalkConnectionListener;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "listCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;>;"
    .restart local v5    # "listener":Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;
    .restart local v6    # "username":Ljava/lang/String;
    :cond_3
    const-string v7, " primary account user"

    move-object v7, v9

    goto :goto_2

    .line 1221
    :cond_4
    const-string v7, "GTalkService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "createGTalkConnectionsForAsyncListeners: failed to create connection for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v6, :cond_5

    move-object v8, v6

    :goto_3
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v10, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1225
    :try_start_4
    invoke-interface {v1, v6}, Lcom/google/android/gtalkservice/IGTalkConnectionListener;->onConnectionCreationFailed(Ljava/lang/String;)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 1226
    :catch_1
    move-exception v7

    goto :goto_0

    .line 1221
    :cond_5
    const-string v8, " primary account user"

    move-object v8, v9

    goto :goto_3

    .line 1208
    :catch_2
    move-exception v7

    goto :goto_1
.end method

.method private getAccount(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;
    .locals 9
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    .prologue
    const/4 v7, 0x0

    const-string v8, "GTalkService"

    .line 712
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getGls()Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v2

    .line 713
    .local v2, "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    if-nez v2, :cond_0

    .line 714
    const-string v4, "GTalkService"

    const-string v4, "getAccount: GLS not yet available"

    invoke-static {v8, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v7

    .line 746
    :goto_0
    return-object v4

    .line 719
    :cond_0
    :try_start_0
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->isValidAccount(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 720
    const-string v4, "GTalkService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getAccount: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not a valid account"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v7

    .line 721
    goto :goto_0

    .line 724
    :cond_1
    const-string v4, "mail"

    invoke-interface {v2, p1, v4}, Lcom/google/android/googleapps/IGoogleLoginService;->peekCredentials(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 725
    .local v3, "token":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    if-eqz p2, :cond_2

    .line 727
    const-string v4, "getAccount: empty auth token, start async token fetch..."

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 729
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAuthTokenFetcher:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-virtual {v4, p1, p2}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->asyncFetch(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V

    move-object v4, v7

    .line 733
    goto :goto_0

    .line 737
    :cond_2
    invoke-direct {p0, p1, v3}, Lcom/google/android/gtalkservice/service/GTalkService;->createAccount(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 738
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    if-nez v0, :cond_3

    move-object v4, v7

    .line 739
    goto :goto_0

    :cond_3
    move-object v4, v0

    .line 742
    goto :goto_0

    .line 743
    .end local v0    # "account":Lcom/google/android/gtalkservice/Account;
    .end local v3    # "token":Ljava/lang/String;
    :catch_0
    move-exception v4

    move-object v1, v4

    .line 745
    .local v1, "doe":Landroid/os/RemoteException;
    const-string v4, "GTalkService"

    const-string v4, "login service dead: "

    invoke-static {v8, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v4, v7

    .line 746
    goto :goto_0
.end method

.method private getAllSessionUsernames()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1546
    invoke-static {}, Lcom/google/android/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v2

    .line 1548
    .local v2, "users":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 1550
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 1551
    .local v0, "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getUsername()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1554
    .end local v0    # "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 1557
    return-object v2
.end method

.method private getConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 3
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 1512
    const/4 v0, 0x0

    .line 1514
    .local v0, "retVal":Lcom/google/android/gtalkservice/IGTalkConnection;
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 1516
    :try_start_0
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->internalGetConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 1518
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 1521
    return-object v0

    .line 1518
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method private getDeviceStorageLow()Z
    .locals 2

    .prologue
    .line 388
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mIpcLock:Ljava/lang/Object;

    monitor-enter v0

    .line 389
    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mDeviceStorageLow:Z

    monitor-exit v0

    return v1

    .line 390
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getJidResourceFromSettings()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1748
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getJidResource()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getServiceInitialized()Z
    .locals 2

    .prologue
    .line 1380
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mIpcLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1381
    :try_start_0
    iget-boolean v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mServiceInitialized:Z

    monitor-exit v0

    return v1

    .line 1382
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private initIdleTimeout()V
    .locals 6

    .prologue
    .line 1164
    const-wide/32 v3, 0xdbba0

    sput-wide v3, Lcom/google/android/gtalkservice/service/GTalkService;->sIdleTimeout:J

    .line 1166
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getGservices()Landroid/provider/Settings$Gservices$QueryMap;

    move-result-object v0

    .line 1167
    .local v0, "gservices":Landroid/provider/Settings$Gservices$QueryMap;
    const-string v3, "gtalk_idle_timeout_ms"

    invoke-virtual {v0, v3}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1169
    .local v1, "idleTimeoutString":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1171
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    int-to-long v3, v3

    sput-wide v3, Lcom/google/android/gtalkservice/service/GTalkService;->sIdleTimeout:J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1178
    :cond_0
    :goto_0
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_1

    .line 1179
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initIdleTimeout: sIdleTimeout="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-wide v4, Lcom/google/android/gtalkservice/service/GTalkService;->sIdleTimeout:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ms"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1181
    :cond_1
    return-void

    .line 1172
    :catch_0
    move-exception v3

    move-object v2, v3

    .line 1174
    .local v2, "nfe":Ljava/lang/NumberFormatException;
    const-string v3, "GTalkService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "initIdleTimeout: caught "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private initProviders()V
    .locals 7

    .prologue
    const-string v6, "query"

    const-string v5, "google:mobile:rmq2"

    const-string v4, "google:mobile:chat"

    const-string v3, "android:iq:rmq"

    .line 1300
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    const-string v0, "##### initProviders #####"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1302
    :cond_0
    invoke-static {}, Lorg/jivesoftware/smack/provider/ProviderManager;->initializeBuiltInProviders()V

    .line 1304
    const-string v0, "data"

    const-string v1, "google:mobile:data"

    new-instance v2, Lcom/google/android/gtalkservice/extensions/DataMessageProvider;

    invoke-direct {v2}, Lcom/google/android/gtalkservice/extensions/DataMessageProvider;-><init>()V

    invoke-static {v0, v1, v2}, Lorg/jivesoftware/smack/provider/ProviderManager;->addExtensionProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/PacketExtensionProvider;)V

    .line 1308
    const-string v0, "stanza-ack"

    const-string v1, "android:iq:rmq"

    new-instance v1, Lcom/google/android/gtalkservice/extensions/RmqAckProvider;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/RmqAckProvider;-><init>()V

    invoke-static {v0, v3, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 1311
    const-string v0, "last-stanza"

    const-string v1, "android:iq:rmq"

    new-instance v1, Lcom/google/android/gtalkservice/extensions/RmqLastIdReceivedProvider;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/RmqLastIdReceivedProvider;-><init>()V

    invoke-static {v0, v3, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 1315
    const-string v0, "selective-ack"

    const-string v1, "google:mobile:rmq2"

    new-instance v1, Lcom/google/android/gtalkservice/extensions/SelectiveAckProvider;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/SelectiveAckProvider;-><init>()V

    invoke-static {v0, v5, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 1318
    const-string v0, "stream-ack"

    const-string v1, "google:mobile:rmq2"

    new-instance v1, Lcom/google/android/gtalkservice/extensions/StreamAckProvider;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/StreamAckProvider;-><init>()V

    invoke-static {v0, v5, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 1321
    const-string v0, "read"

    const-string v1, "google:mobile:chat"

    new-instance v1, Lcom/google/android/gtalkservice/extensions/ChatReadProvider;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/ChatReadProvider;-><init>()V

    invoke-static {v0, v4, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 1325
    const-string v0, "closed"

    const-string v1, "google:mobile:chat"

    new-instance v1, Lcom/google/android/gtalkservice/extensions/ChatClosedProvider;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/ChatClosedProvider;-><init>()V

    invoke-static {v0, v4, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 1329
    const-string v0, "query"

    const-string v0, "google:shared-status"

    new-instance v1, Lcom/google/android/gtalkservice/extensions/SharedStatusProvider;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/SharedStatusProvider;-><init>()V

    invoke-static {v6, v0, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 1333
    const-string v0, "query"

    const-string v0, "google:nosave"

    new-instance v1, Lcom/google/android/gtalkservice/extensions/OtrQueryProvider;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/OtrQueryProvider;-><init>()V

    invoke-static {v6, v0, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/provider/IQProvider;)V

    .line 1336
    return-void
.end method

.method private initializeConnection(Z)V
    .locals 1
    .param p1, "alwaysSignIn"    # Z

    .prologue
    .line 1033
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAccountsAndSettingsMonitor:Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->access$1000(Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;)V

    .line 1035
    if-eqz p1, :cond_0

    .line 1036
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mLastLoginStateSelection:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->keepSignedIn(Ljava/lang/String;)V

    .line 1039
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->createGTalkConnectionsForAsyncListeners()V

    .line 1040
    return-void
.end method

.method private internalGetConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 6
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 1526
    const/4 v2, 0x0

    .line 1528
    .local v2, "retVal":Lcom/google/android/gtalkservice/IGTalkConnection;
    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 1529
    .local v0, "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getUsername()Ljava/lang/String;

    move-result-object v3

    .line 1531
    .local v3, "user1":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1532
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "internalGetConnectionForUser: found conn for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1533
    :cond_1
    move-object v2, v0

    .line 1538
    .end local v0    # "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v3    # "user1":Ljava/lang/String;
    :cond_2
    return-object v2
.end method

.method private isBackgroundDataEnabled()Z
    .locals 1

    .prologue
    .line 1706
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mBackgroundDataEnabled:Z

    return v0
.end method

.method public static isUserIdle()Z
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 350
    sget-boolean v2, Lcom/google/android/gtalkservice/service/GTalkService;->sScreenOff:Z

    if-nez v2, :cond_0

    move v2, v6

    .line 365
    :goto_0
    return v2

    .line 355
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 356
    .local v0, "now":J
    sget-wide v2, Lcom/google/android/gtalkservice/service/GTalkService;->sScreenOffTimestamp:J

    sub-long v2, v0, v2

    sget-wide v4, Lcom/google/android/gtalkservice/service/GTalkService;->sIdleTimeout:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    .line 357
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_1

    const-string v2, "isUserIdle: true"

    invoke-static {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 358
    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    .line 361
    :cond_2
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_3

    .line 362
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isUserIdle: false, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-wide v3, Lcom/google/android/gtalkservice/service/GTalkService;->sScreenOffTimestamp:J

    sub-long v3, v0, v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-wide v3, Lcom/google/android/gtalkservice/service/GTalkService;->sIdleTimeout:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    :cond_3
    move v2, v6

    .line 365
    goto :goto_0
.end method

.method private isValidAccount(Ljava/lang/String;)Z
    .locals 8
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 690
    const/4 v4, 0x0

    .line 693
    .local v4, "retVal":Z
    :try_start_0
    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGls:Lcom/google/android/googleapps/IGoogleLoginService;

    invoke-interface {v5}, Lcom/google/android/googleapps/IGoogleLoginService;->getAccounts()[Ljava/lang/String;

    move-result-object v0

    .line 694
    .local v0, "accounts":[Ljava/lang/String;
    array-length v3, v0

    .line 696
    .local v3, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 697
    aget-object v5, v0, v2

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_1

    .line 698
    const/4 v4, 0x1

    .line 706
    .end local v0    # "accounts":[Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "len":I
    :cond_0
    :goto_1
    return v4

    .line 696
    .restart local v0    # "accounts":[Ljava/lang/String;
    .restart local v2    # "i":I
    .restart local v3    # "len":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 702
    .end local v0    # "accounts":[Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "len":I
    :catch_0
    move-exception v5

    move-object v1, v5

    .line 703
    .local v1, "ex":Landroid/os/RemoteException;
    const-string v5, "GTalkService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "isValidAccount caught "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private keepSignedIn(Ljava/lang/String;)V
    .locals 10
    .param p1, "selection"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 1255
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/gtalkservice/service/GTalkService;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    move-object v3, p1

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1261
    .local v7, "c":Landroid/database/Cursor;
    if-eqz v7, :cond_2

    .line 1263
    :goto_0
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1264
    const/4 v0, 0x2

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 1265
    .local v5, "username":Ljava/lang/String;
    const/4 v0, 0x3

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1266
    .local v6, "pw":Ljava/lang/String;
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    int-to-long v3, v0

    .line 1267
    .local v3, "providerId":J
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    int-to-long v1, v0

    .line 1268
    .local v1, "accountId":J
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "keepSignedIn: login for "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    :cond_0
    move-object v0, p0

    .line 1270
    invoke-direct/range {v0 .. v6}, Lcom/google/android/gtalkservice/service/GTalkService;->login(JJLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1272
    .end local v1    # "accountId":J
    .end local v3    # "providerId":J
    .end local v5    # "username":Ljava/lang/String;
    .end local v6    # "pw":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-object v8, v0

    .line 1273
    .local v8, "ex":Landroid/database/SQLException;
    :try_start_1
    const-string v0, "GTalkService"

    const-string v9, "keepSignedIn caught "

    invoke-static {v0, v9, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1275
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1280
    .end local v8    # "ex":Landroid/database/SQLException;
    :goto_1
    return-void

    .line 1275
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v0

    .line 1278
    :cond_2
    const-string v0, "keepSignedIn"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private static log(Ljava/lang/String;)V
    .locals 4
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 1811
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GTalkService."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1812
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 2105
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GTalkService] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": empty cursor, possibly low memory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2106
    return-void
.end method

.method private login(JJLjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "accountId"    # J
    .param p3, "providerId"    # J
    .param p5, "username"    # Ljava/lang/String;
    .param p6, "pw"    # Ljava/lang/String;

    .prologue
    const-string v6, "GTalkService"

    .line 1234
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGTalkServiceBinder:Lcom/google/android/gtalkservice/IGTalkService$Stub;

    invoke-virtual {v3, p1, p2}, Lcom/google/android/gtalkservice/IGTalkService$Stub;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    .line 1235
    .local v1, "imSession":Lcom/google/android/gtalkservice/IImSession;
    if-nez v1, :cond_1

    .line 1236
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryConnection()Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v2

    .line 1237
    .local v2, "primaryConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    if-nez v2, :cond_0

    .line 1238
    const-string v3, "GTalkService"

    const-string v4, "no primary GTalkConnection, login failed"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1251
    .end local v1    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    .end local v2    # "primaryConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    :goto_0
    return-void

    .line 1241
    .restart local v1    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    .restart local v2    # "primaryConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryConnection()Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v3

    invoke-interface {v3, p3, p4}, Lcom/google/android/gtalkservice/IGTalkConnection;->createImSessionForProviderId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    .line 1242
    if-nez v1, :cond_1

    .line 1243
    const-string v3, "GTalkService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unable to create ImSession for providerId "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1248
    .end local v1    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    .end local v2    # "primaryConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 1249
    .local v0, "doe":Landroid/os/RemoteException;
    const-string v3, "GTalkService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unable to login "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 1247
    .end local v0    # "doe":Landroid/os/RemoteException;
    .restart local v1    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :cond_1
    const/4 v3, 0x1

    :try_start_1
    invoke-interface {v1, p5, p6, v3}, Lcom/google/android/gtalkservice/IImSession;->login(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private logoutAllSessions(Z)V
    .locals 5
    .param p1, "force"    # Z

    .prologue
    .line 1561
    const-string v3, "logoutAllSessions"

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1565
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 1567
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1569
    .local v2, "listCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;>;"
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 1573
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 1574
    .local v0, "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    if-eqz p1, :cond_0

    .line 1575
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->logout()V

    goto :goto_0

    .line 1569
    .end local v0    # "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "listCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;>;"
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3

    .line 1577
    .restart local v0    # "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "listCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;>;"
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->logoutIfNotUsed()V

    goto :goto_0

    .line 1580
    .end local v0    # "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    :cond_1
    return-void
.end method

.method private networkStateChanged()V
    .locals 8

    .prologue
    .line 1603
    iget-object v6, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    invoke-virtual {v6}, Landroid/net/NetworkConnectivityListener;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 1605
    .local v2, "networkInfo":Landroid/net/NetworkInfo;
    if-nez v2, :cond_1

    .line 1660
    :cond_0
    :goto_0
    return-void

    .line 1609
    :cond_1
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v5

    .line 1610
    .local v5, "state":Landroid/net/NetworkInfo$State;
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v3

    .line 1611
    .local v3, "networkType":I
    const/4 v4, 0x0

    .line 1621
    .local v4, "sendUpdate":Z
    sget-object v6, Lcom/google/android/gtalkservice/service/GTalkService$6;->$SwitchMap$android$net$NetworkInfo$State:[I

    invoke-virtual {v5}, Landroid/net/NetworkInfo$State;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 1650
    :cond_2
    :goto_1
    if-eqz v4, :cond_0

    .line 1651
    iget-object v6, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 1653
    :try_start_0
    iget-object v6, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 1654
    .local v0, "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v6

    invoke-virtual {v6, v5, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->networkStateChanged(Landroid/net/NetworkInfo$State;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 1657
    .end local v0    # "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v6

    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v6

    .line 1623
    :pswitch_0
    const/4 v4, 0x1

    .line 1628
    iget-object v6, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPushMessagingRegistrar:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    if-eqz v6, :cond_2

    .line 1629
    iget-object v6, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPushMessagingRegistrar:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-virtual {v6}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->networkRecovered()V

    goto :goto_1

    .line 1635
    :pswitch_1
    iget-object v6, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    invoke-virtual {v6}, Landroid/net/NetworkConnectivityListener;->getState()Landroid/net/NetworkConnectivityListener$State;

    move-result-object v6

    sget-object v7, Landroid/net/NetworkConnectivityListener$State;->NOT_CONNECTED:Landroid/net/NetworkConnectivityListener$State;

    if-ne v6, v7, :cond_3

    .line 1636
    const/4 v4, 0x1

    goto :goto_1

    .line 1637
    :cond_3
    sget-boolean v6, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v6, :cond_2

    .line 1638
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "networkStateChanged: GOT "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", but NetConnListener.getState != NOT_CONNECTED"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", so drop notification"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 1657
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_4
    iget-object v6, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0

    .line 1621
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private reconcileGTalkAccount(Ljava/lang/String;)V
    .locals 10
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    const-string v9, "GTalkService"

    .line 758
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getGls()Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v2

    .line 760
    .local v2, "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    if-nez v2, :cond_1

    .line 761
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v5, :cond_0

    const-string v5, "reconcileGTalkAccount: GLS not yet ready"

    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 804
    :cond_0
    :goto_0
    return-void

    .line 765
    :cond_1
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v5, :cond_2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "reconcileGTalkAccount for username="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 767
    :cond_2
    if-nez p1, :cond_5

    .line 770
    const/4 v5, 0x0

    :try_start_0
    invoke-interface {v2, v5}, Lcom/google/android/googleapps/IGoogleLoginService;->getAccount(Z)Ljava/lang/String;

    move-result-object p1

    .line 771
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_0

    .line 786
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v5, "provider"

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 787
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v5, 0x3d

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    invoke-virtual {v6}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getGtalkProviderId()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 789
    const/4 v4, 0x0

    .line 793
    .local v4, "selectionArgs":[Ljava/lang/String;
    if-eqz p1, :cond_4

    .line 794
    const-string v5, " AND "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "username"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "=?"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 795
    const/4 v5, 0x1

    new-array v4, v5, [Ljava/lang/String;

    .end local v4    # "selectionArgs":[Ljava/lang/String;
    aput-object p1, v4, v8

    .line 798
    .restart local v4    # "selectionArgs":[Ljava/lang/String;
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 800
    .local v3, "selection":Ljava/lang/String;
    const-string v5, "GTalkService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[GTalkService] delete IM account(s) "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz p1, :cond_6

    move-object v6, p1

    :goto_1
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v9, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 803
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v5, v6, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 775
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v3    # "selection":Ljava/lang/String;
    .end local v4    # "selectionArgs":[Ljava/lang/String;
    :catch_0
    move-exception v5

    move-object v1, v5

    .line 776
    .local v1, "ex":Landroid/os/RemoteException;
    const-string v5, "GTalkService"

    const-string v5, "reconcileGTalkAccount caught "

    invoke-static {v9, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 779
    .end local v1    # "ex":Landroid/os/RemoteException;
    :cond_5
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->isValidAccount(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto/16 :goto_0

    .line 800
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    .restart local v3    # "selection":Ljava/lang/String;
    .restart local v4    # "selectionArgs":[Ljava/lang/String;
    :cond_6
    const-string v6, "because there is no GLS account"

    goto :goto_1
.end method

.method private refreshAuthToken(Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 6
    .param p1, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 295
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getGls()Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v1

    .line 296
    .local v1, "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    if-nez v1, :cond_1

    .line 297
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    const-string v3, "asyncRefreshAuthToken: GLS not yet available"

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 312
    :cond_0
    :goto_0
    return-void

    .line 301
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccount()Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 303
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getAuthToken()Ljava/lang/String;

    move-result-object v2

    .line 308
    .local v2, "oldToken":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/google/android/gtalkservice/Account;->setAuthToken(Ljava/lang/String;)V

    .line 310
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAuthTokenFetcher:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAccountsAndSettingsMonitor:Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    invoke-virtual {v3, v4, v2, v5}, Lcom/google/android/gtalkservice/AuthTokenFetcher;->asyncRefreshAuthToken(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)V

    goto :goto_0
.end method

.method private removeProviders()V
    .locals 6

    .prologue
    const-string v5, "query"

    const-string v4, "google:mobile:rmq2"

    const-string v3, "google:mobile:chat"

    const-string v2, "android:iq:rmq"

    .line 1339
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    const-string v0, "##### removeProviders #####"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1341
    :cond_0
    invoke-static {}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeBultInProviders()V

    .line 1343
    const-string v0, "data"

    const-string v1, "google:mobile:data"

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeExtensionProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 1346
    const-string v0, "stanza-ack"

    const-string v1, "android:iq:rmq"

    invoke-static {v0, v2}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 1347
    const-string v0, "last-stanza"

    const-string v1, "android:iq:rmq"

    invoke-static {v0, v2}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 1349
    const-string v0, "selective-ack"

    const-string v1, "google:mobile:rmq2"

    invoke-static {v0, v4}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 1350
    const-string v0, "stream-ack"

    const-string v1, "google:mobile:rmq2"

    invoke-static {v0, v4}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 1352
    const-string v0, "read"

    const-string v1, "google:mobile:chat"

    invoke-static {v0, v3}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 1353
    const-string v0, "closed"

    const-string v1, "google:mobile:chat"

    invoke-static {v0, v3}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 1355
    const-string v0, "query"

    const-string v0, "google:shared-status"

    invoke-static {v5, v0}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 1356
    const-string v0, "query"

    const-string v0, "google:nosave"

    invoke-static {v5, v0}, Lorg/jivesoftware/smack/provider/ProviderManager;->removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V

    .line 1357
    return-void
.end method

.method private resetOnGservicesChange()V
    .locals 14

    .prologue
    .line 1044
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->queryControlAutoConnectUsingAutoSync()Z

    move-result v2

    .line 1048
    .local v2, "controlAutoConnectUsingAutoSync":Z
    iget-boolean v11, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mControlAutoConnectUsingAutoSync:Z

    if-eq v11, v2, :cond_1

    .line 1049
    iput-boolean v2, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mControlAutoConnectUsingAutoSync:Z

    .line 1051
    sget-boolean v11, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v11, :cond_0

    .line 1052
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "useAutoSync="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-boolean v12, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mControlAutoConnectUsingAutoSync:Z

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", audit connections..."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1054
    :cond_0
    iget-object v11, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAccountsAndSettingsMonitor:Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    invoke-static {v11}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->access$1000(Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;)V

    .line 1060
    :cond_1
    iget-object v11, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v11}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 1062
    :try_start_0
    new-instance v6, Ljava/util/ArrayList;

    iget-object v11, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-direct {v6, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1064
    .local v6, "listCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;>;"
    iget-object v11, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v11}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 1068
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 1070
    .local v1, "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 1071
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccount()Lcom/google/android/gtalkservice/Account;

    move-result-object v3

    .line 1072
    .local v3, "currentAccount":Lcom/google/android/gtalkservice/Account;
    if-eqz v3, :cond_2

    .line 1075
    invoke-virtual {v3}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v10

    .line 1076
    .local v10, "username":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/google/android/gtalkservice/Account;->getAuthToken()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v10, v11}, Lcom/google/android/gtalkservice/service/GTalkService;->createAccount(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;

    move-result-object v7

    .line 1077
    .local v7, "newAccount":Lcom/google/android/gtalkservice/Account;
    invoke-virtual {v3, v7}, Lcom/google/android/gtalkservice/Account;->connectionSettingsMatch(Lcom/google/android/gtalkservice/Account;)Z

    move-result v11

    if-nez v11, :cond_6

    .line 1078
    sget-boolean v11, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v11, :cond_3

    .line 1079
    const-string v11, "resetOnGservicesChange: logout current connection and relogin"

    invoke-static {v11}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1080
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "resetOnGservicesChange: old "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/Account;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1081
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "resetOnGservicesChange: new "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v7}, Lcom/google/android/gtalkservice/Account;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1083
    :cond_3
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v5

    .line 1085
    .local v5, "imSessionImpl":Lcom/google/android/gtalkservice/ImSession;
    const/4 v9, 0x0

    .line 1086
    .local v9, "priorPresence":Lcom/google/android/gtalkservice/Presence;
    if-eqz v5, :cond_4

    .line 1087
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/ImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v9

    .line 1089
    :cond_4
    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/service/GTalkService;->removeConnection(Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;)V

    .line 1090
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logout()V

    .line 1091
    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/service/GTalkService;->createConnectionAndLogin(Lcom/google/android/gtalkservice/Account;)V

    .line 1092
    if-eqz v9, :cond_5

    .line 1093
    invoke-virtual {v9}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 1094
    invoke-direct {p0, v10}, Lcom/google/android/gtalkservice/service/GTalkService;->getConnectionForUser(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v8

    .line 1095
    .local v8, "newConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    if-eqz v8, :cond_5

    .line 1096
    invoke-interface {v8}, Lcom/google/android/gtalkservice/IGTalkConnection;->getDefaultImSession()Lcom/google/android/gtalkservice/IImSession;

    move-result-object v11

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-interface {v11, v10, v12, v13}, Lcom/google/android/gtalkservice/IImSession;->login(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1103
    .end local v8    # "newConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    :cond_5
    if-eqz v5, :cond_2

    .line 1104
    const/4 v11, 0x0

    const/16 v12, 0x9

    const/4 v13, 0x1

    invoke-virtual {v5, v11, v12, v13}, Lcom/google/android/gtalkservice/ImSession;->setConnectionStateAndError(IIZ)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 1116
    .end local v0    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    .end local v3    # "currentAccount":Lcom/google/android/gtalkservice/Account;
    .end local v5    # "imSessionImpl":Lcom/google/android/gtalkservice/ImSession;
    .end local v7    # "newAccount":Lcom/google/android/gtalkservice/Account;
    .end local v9    # "priorPresence":Lcom/google/android/gtalkservice/Presence;
    .end local v10    # "username":Ljava/lang/String;
    :catch_0
    move-exception v11

    goto/16 :goto_0

    .line 1064
    .end local v1    # "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "listCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;>;"
    :catchall_0
    move-exception v11

    iget-object v12, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v12}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v11

    .line 1109
    .restart local v0    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    .restart local v1    # "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .restart local v3    # "currentAccount":Lcom/google/android/gtalkservice/Account;
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v6    # "listCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;>;"
    .restart local v7    # "newAccount":Lcom/google/android/gtalkservice/Account;
    .restart local v10    # "username":Ljava/lang/String;
    :cond_6
    :try_start_2
    invoke-virtual {v3, v7}, Lcom/google/android/gtalkservice/Account;->heartbeatSettingsMatch(Lcom/google/android/gtalkservice/Account;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 1111
    sget-boolean v11, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v11, :cond_7

    .line 1112
    const-string v11, "resetOnGservicesChange: heartbeats changed, notify connections"

    invoke-static {v11}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1114
    :cond_7
    invoke-virtual {v0, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->heartbeatSettingsChanged(Lcom/google/android/gtalkservice/Account;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 1119
    .end local v0    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    .end local v1    # "connectionWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v3    # "currentAccount":Lcom/google/android/gtalkservice/Account;
    .end local v7    # "newAccount":Lcom/google/android/gtalkservice/Account;
    .end local v10    # "username":Ljava/lang/String;
    :cond_8
    return-void
.end method

.method private saveJidResourceToSettings(Ljava/lang/String;)V
    .locals 1
    .param p1, "jidResource"    # Ljava/lang/String;

    .prologue
    .line 1752
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0, p1}, Landroid/provider/Im$ProviderSettings$QueryMap;->setJidResource(Ljava/lang/String;)V

    .line 1753
    return-void
.end method

.method private sendDeviceIdleStatusForConnection(Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;Z)V
    .locals 1
    .param p1, "connWrapper"    # Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .param p2, "idle"    # Z

    .prologue
    .line 383
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 384
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v0, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->sendDeviceIdleStatus(Z)V

    .line 385
    return-void
.end method

.method private sendDeviceIdleStatusForConnections(Z)V
    .locals 4
    .param p1, "idle"    # Z

    .prologue
    .line 371
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 373
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 374
    .local v0, "connWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    invoke-direct {p0, v0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->sendDeviceIdleStatusForConnection(Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 377
    .end local v0    # "connWrapper":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 379
    return-void
.end method

.method private setBackgroundData(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 1710
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mBackgroundDataEnabled:Z

    .line 1711
    return-void
.end method

.method private setBackgroundDataWithLock(Z)V
    .locals 2
    .param p1, "flag"    # Z

    .prologue
    .line 1714
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 1716
    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mBackgroundDataEnabled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1718
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 1720
    return-void

    .line 1718
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method private setDeviceStorageLow(Z)V
    .locals 2
    .param p1, "flag"    # Z

    .prologue
    .line 394
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mIpcLock:Ljava/lang/Object;

    monitor-enter v0

    .line 395
    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mDeviceStorageLow:Z

    .line 396
    monitor-exit v0

    .line 397
    return-void

    .line 396
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private setServiceInitialized()V
    .locals 2

    .prologue
    .line 1386
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mIpcLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1387
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mServiceInitialized:Z

    .line 1388
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1389
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    const-string v0, "GTalkService is initialized"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1390
    :cond_0
    return-void

    .line 1388
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method public autoConnect()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1665
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->isBackgroundDataEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 1681
    :goto_0
    return v0

    .line 1671
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getDeviceStorageLow()Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    .line 1672
    goto :goto_0

    .line 1677
    :cond_1
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mControlAutoConnectUsingAutoSync:Z

    if-eqz v0, :cond_2

    .line 1678
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->isAutoSyncEnabled()Z

    move-result v0

    goto :goto_0

    .line 1681
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 11
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "out"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .prologue
    const-string v7, "------------------------"

    const-string v7, ""

    .line 316
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 318
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getDeviceStorageLow()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 319
    const-string v7, ""

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 320
    const-string v7, "----- DEVICE STORAGE IS LOW -----"

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 321
    const-string v7, ""

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 324
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    iget-wide v9, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mTimeSinceServiceOnCreate:J

    sub-long/2addr v7, v9

    const-wide/16 v9, 0x3e8

    div-long v2, v7, v9

    .line 325
    .local v2, "elapsed":J
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Time since service creation: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v2, v3}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 326
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "User idle: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Lcom/google/android/gtalkservice/service/GTalkService;->isUserIdle()Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 327
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Screen-off: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-boolean v8, Lcom/google/android/gtalkservice/service/GTalkService;->sScreenOff:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 328
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Using AutoSync: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-boolean v8, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mControlAutoConnectUsingAutoSync:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 329
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Number of connections: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 331
    const/4 v4, 0x1

    .line 332
    .local v4, "i":I
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    move v5, v4

    .end local v4    # "i":I
    .local v5, "i":I
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 333
    .local v1, "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    const-string v7, ""

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 334
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "connection #"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 335
    const-string v7, "------------------------"

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 336
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 337
    .local v0, "conn":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v0, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->dump(Ljava/io/PrintWriter;)V

    .line 338
    const-string v7, "------------------------"

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    move v5, v4

    .line 339
    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto :goto_0

    .line 341
    .end local v0    # "conn":Lcom/google/android/gtalkservice/GTalkConnection;
    .end local v1    # "connection":Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;
    :cond_1
    const-string v7, ""

    invoke-virtual {p2, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 342
    invoke-static {p2}, Lcom/google/android/gtalkservice/usagegauge/UsageGauge;->dump(Ljava/io/PrintWriter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 344
    iget-object v7, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 346
    return-void

    .line 344
    .end local v2    # "elapsed":J
    .end local v5    # "i":I
    .end local v6    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v7

    iget-object v8, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v8}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v7
.end method

.method public getGls()Lcom/google/android/googleapps/IGoogleLoginService;
    .locals 2

    .prologue
    .line 1368
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mIpcLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1369
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGls:Lcom/google/android/googleapps/IGoogleLoginService;

    monitor-exit v0

    return-object v1

    .line 1370
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getGservices()Landroid/provider/Settings$Gservices$QueryMap;
    .locals 1

    .prologue
    .line 1364
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGservices:Landroid/provider/Settings$Gservices$QueryMap;

    return-object v0
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 2101
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getHeartbeatInterval()J
    .locals 2

    .prologue
    .line 1740
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getHeartbeatInterval()J

    move-result-wide v0

    return-wide v0
.end method

.method public getJidResource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1756
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mJidResource:Ljava/lang/String;

    return-object v0
.end method

.method public getPrimaryAccount(Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;
    .locals 6
    .param p1, "callback"    # Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;

    .prologue
    const/4 v5, 0x0

    .line 668
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getGls()Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v1

    .line 670
    .local v1, "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    if-nez v1, :cond_1

    .line 671
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    const-string v3, "getPrimaryAccount: GLS not yet ready"

    invoke-static {v3}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    :cond_0
    move-object v3, v5

    .line 685
    .end local v1    # "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    :goto_0
    return-object v3

    .line 675
    .restart local v1    # "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    :cond_1
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Lcom/google/android/googleapps/IGoogleLoginService;->getAccount(Z)Ljava/lang/String;

    move-result-object v2

    .line 677
    .local v2, "username":Ljava/lang/String;
    if-nez v2, :cond_2

    move-object v3, v5

    .line 678
    goto :goto_0

    .line 681
    :cond_2
    invoke-direct {p0, v2, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->getAccount(Ljava/lang/String;Lcom/google/android/gtalkservice/AuthTokenFetcher$Callback;)Lcom/google/android/gtalkservice/Account;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 682
    .end local v1    # "gls":Lcom/google/android/googleapps/IGoogleLoginService;
    .end local v2    # "username":Ljava/lang/String;
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 684
    .local v0, "doe":Landroid/os/RemoteException;
    const-string v3, "GTalkService"

    const-string v4, "login service dead: "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v3, v5

    .line 685
    goto :goto_0
.end method

.method public getPrimaryConnection()Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 2

    .prologue
    .line 1429
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 1431
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPrimaryConnection:Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1433
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getShowAwayOnIdle()Z
    .locals 1

    .prologue
    .line 1728
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getShowAwayOnIdle()Z

    move-result v0

    return v0
.end method

.method public getShowMobileIndicator()Z
    .locals 1

    .prologue
    .line 1724
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mShowMobileIndicator:Z

    return v0
.end method

.method public getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;
    .locals 1

    .prologue
    .line 1360
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mStatusBarNotifier:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    return-object v0
.end method

.method public getUploadHeartbeatStat()Z
    .locals 1

    .prologue
    .line 1732
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getUploadHeartbeatStat()Z

    move-result v0

    return v0
.end method

.method public handleDeviceStorageLow()V
    .locals 1

    .prologue
    .line 400
    const/4 v0, 0x6

    invoke-static {v0}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 401
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->setDeviceStorageLow(Z)V

    .line 402
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAccountsAndSettingsMonitor:Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->access$1000(Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;)V

    .line 403
    return-void
.end method

.method public handleDeviceStorageOk()V
    .locals 1

    .prologue
    .line 406
    const/4 v0, 0x7

    invoke-static {v0}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 407
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->setDeviceStorageLow(Z)V

    .line 408
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAccountsAndSettingsMonitor:Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;->access$1000(Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;)V

    .line 409
    return-void
.end method

.method public initGservicesQueryMap()V
    .locals 13

    .prologue
    const/4 v2, 0x0

    const-string v5, "=?"

    const-string v4, " OR "

    const-string v3, "name"

    .line 1122
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 1123
    .local v12, "selection":Ljava/lang/StringBuilder;
    const-string v0, "name"

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "=?"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1124
    const/4 v8, 0x1

    .local v8, "i":I
    :goto_0
    sget-object v0, Lcom/google/android/gtalkservice/service/GTalkService;->OBSERVED_GSERVICES:[Ljava/lang/String;

    array-length v0, v0

    if-ge v8, v0, :cond_0

    .line 1125
    const-string v0, " OR "

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "=?"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1124
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1127
    :cond_0
    const-string v0, " OR "

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " LIKE \"gtalk:%\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1129
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Settings$Gservices;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/google/android/gtalkservice/service/GTalkService;->OBSERVED_GSERVICES:[Ljava/lang/String;

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1136
    .local v7, "cursor":Landroid/database/Cursor;
    new-instance v0, Landroid/provider/Settings$Gservices$QueryMap;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, v1, v7, v2, v3}, Landroid/provider/Settings$Gservices$QueryMap;-><init>(Landroid/content/ContentResolver;Landroid/database/Cursor;ZLandroid/os/Handler;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGservices:Landroid/provider/Settings$Gservices$QueryMap;

    .line 1142
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_1

    .line 1143
    const-string v0, "QueryMap is initially:"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1144
    sget-object v6, Lcom/google/android/gtalkservice/service/GTalkService;->OBSERVED_GSERVICES:[Ljava/lang/String;

    .local v6, "arr$":[Ljava/lang/String;
    array-length v10, v6

    .local v10, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_1
    if-ge v9, v10, :cond_1

    aget-object v11, v6, v9

    .line 1145
    .local v11, "name":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "     "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGservices:Landroid/provider/Settings$Gservices$QueryMap;

    invoke-virtual {v1, v11}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1144
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 1149
    .end local v6    # "arr$":[Ljava/lang/String;
    .end local v9    # "i$":I
    .end local v10    # "len$":I
    .end local v11    # "name":Ljava/lang/String;
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGservices:Landroid/provider/Settings$Gservices$QueryMap;

    new-instance v1, Lcom/google/android/gtalkservice/service/GTalkService$4;

    invoke-direct {v1, p0}, Lcom/google/android/gtalkservice/service/GTalkService$4;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;)V

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->addObserver(Ljava/util/Observer;)V

    .line 1161
    return-void
.end method

.method public isAutoSyncEnabled()Z
    .locals 1

    .prologue
    .line 1702
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAutoSyncEnabled:Z

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 996
    const-string v0, "GTalkService"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 997
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onBind "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1000
    :cond_0
    const-class v0, Lcom/google/android/gtalkservice/IGTalkService;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1001
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGTalkServiceBinder:Lcom/google/android/gtalkservice/IGTalkService$Stub;

    .line 1009
    :goto_0
    return-object v0

    .line 1004
    :cond_1
    const-class v0, Lcom/google/android/datamessaging/IDataMessagingService;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1005
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mDataMessagingBinder:Lcom/google/android/gtalkservice/service/GTalkService$DataMessagingServiceImpl;

    goto :goto_0

    .line 1009
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreate()V
    .locals 13

    .prologue
    const/4 v4, 0x1

    .line 841
    invoke-static {}, Lcom/google/android/gtalkservice/LogTag;->queryLoggingLevel()V

    .line 842
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    const-string v0, "onCreate"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 844
    :cond_0
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 846
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mTimeSinceServiceOnCreate:J

    .line 848
    new-instance v0, Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    .line 849
    new-instance v0, Lcom/google/android/gtalkservice/AuthTokenFetcher;

    const-string v1, "mail"

    invoke-direct {v0, p0, v1}, Lcom/google/android/gtalkservice/AuthTokenFetcher;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAuthTokenFetcher:Lcom/google/android/gtalkservice/AuthTokenFetcher;

    .line 851
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    .line 852
    new-instance v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getGtalkProviderId()J

    move-result-wide v1

    invoke-direct {v0, p0, v1, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;-><init>(Landroid/content/Context;J)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mStatusBarNotifier:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    .line 854
    new-instance v0, Landroid/net/NetworkConnectivityListener;

    invoke-direct {v0}, Landroid/net/NetworkConnectivityListener;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    .line 855
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/net/NetworkConnectivityListener;->registerHandler(Landroid/os/Handler;I)V

    .line 856
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    invoke-virtual {v0, p0}, Landroid/net/NetworkConnectivityListener;->startListening(Landroid/content/Context;)V

    .line 858
    new-instance v0, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    invoke-direct {v0, p0, p0}, Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;Lcom/google/android/gtalkservice/service/GTalkService;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAccountsAndSettingsMonitor:Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    .line 860
    new-instance v0, Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getGtalkProviderId()J

    move-result-wide v2

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Landroid/provider/Im$ProviderSettings$QueryMap;-><init>(Landroid/content/ContentResolver;JZLandroid/os/Handler;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    .line 866
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getShowMobileIndicator()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mShowMobileIndicator:Z

    .line 867
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    new-instance v1, Lcom/google/android/gtalkservice/service/GTalkService$2;

    invoke-direct {v1, p0}, Lcom/google/android/gtalkservice/service/GTalkService$2;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;)V

    invoke-virtual {v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->addObserver(Ljava/util/Observer;)V

    .line 883
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getAutomaticallyConnectToGTalkServer()Z

    move-result v6

    .line 885
    .local v6, "alwaysSignIn":Z
    new-instance v12, Ljava/lang/StringBuilder;

    const-string v0, "last_login_state"

    invoke-direct {v12, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 886
    .local v12, "whereClause":Ljava/lang/StringBuilder;
    const-string v0, "=1 AND "

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 887
    const-string v0, "provider"

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getGtalkProviderId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 889
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mLastLoginStateSelection:Ljava/lang/String;

    .line 891
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mLastLoginStateSelection:Ljava/lang/String;

    invoke-direct {p0, v6, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->clearLastLoginStateAfterBoot(ZLjava/lang/String;)V

    .line 895
    new-instance v11, Lcom/google/android/gtalkservice/service/GTalkService$WorkerThread;

    invoke-direct {v11, p0}, Lcom/google/android/gtalkservice/service/GTalkService$WorkerThread;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;)V

    .line 896
    .local v11, "thread":Lcom/google/android/gtalkservice/service/GTalkService$WorkerThread;
    invoke-virtual {v11}, Lcom/google/android/gtalkservice/service/GTalkService$WorkerThread;->start()V

    .line 897
    :goto_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mWorkerLooper:Landroid/os/Looper;

    if-nez v0, :cond_1

    .line 898
    monitor-enter p0

    .line 900
    const-wide/16 v0, 0x2

    :try_start_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 903
    :goto_1
    :try_start_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 906
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->initGservicesQueryMap()V

    .line 907
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->initIdleTimeout()V

    .line 909
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->queryControlAutoConnectUsingAutoSync()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mControlAutoConnectUsingAutoSync:Z

    .line 910
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->pollAutoSyncSetting()V

    .line 913
    new-instance v0, Lcom/google/android/gtalkservice/service/GTalkService$3;

    invoke-direct {v0, p0, v6}, Lcom/google/android/gtalkservice/service/GTalkService$3;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;Z)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGlsConnection:Landroid/content/ServiceConnection;

    .line 936
    sget-object v0, Lcom/google/android/googlelogin/GoogleLoginServiceConstants;->SERVICE_INTENT:Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGlsConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0, v1, v4}, Lcom/google/android/gtalkservice/service/GTalkService;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 939
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/os/PowerManager;

    .line 940
    .local v10, "powerManager":Landroid/os/PowerManager;
    invoke-virtual {v10}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-nez v0, :cond_3

    move v0, v4

    :goto_2
    sput-boolean v0, Lcom/google/android/gtalkservice/service/GTalkService;->sScreenOff:Z

    .line 942
    new-instance v7, Landroid/content/IntentFilter;

    invoke-direct {v7}, Landroid/content/IntentFilter;-><init>()V

    .line 943
    .local v7, "intentFilter":Landroid/content/IntentFilter;
    const-string v0, "android.accounts.LOGIN_ACCOUNTS_CHANGED"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 944
    const-string v0, "com.android.sync.SYNC_CONN_STATUS_CHANGED"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 945
    const-string v0, "android.net.conn.BACKGROUND_DATA_SETTING_CHANGED"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 946
    const-string v0, "android.intent.action.USER_PRESENT"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 947
    const-string v0, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 948
    const-string v0, "android.intent.action.DEVICE_STORAGE_LOW"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 949
    const-string v0, "android.intent.action.DEVICE_STORAGE_OK"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 951
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAccountsAndSettingsMonitor:Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    invoke-virtual {p0, v0, v7}, Lcom/google/android/gtalkservice/service/GTalkService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 953
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->initProviders()V

    .line 955
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/net/ConnectivityManager;

    .line 956
    .local v9, "manager":Landroid/net/ConnectivityManager;
    invoke-virtual {v9}, Landroid/net/ConnectivityManager;->getBackgroundDataSetting()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->setBackgroundData(Z)V

    .line 959
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getJidResourceFromSettings()Ljava/lang/String;

    move-result-object v8

    .line 960
    .local v8, "jidResource":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 961
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->computeJIDResource()Ljava/lang/String;

    move-result-object v8

    .line 963
    :cond_2
    invoke-virtual {p0, v8}, Lcom/google/android/gtalkservice/service/GTalkService;->setJidResource(Ljava/lang/String;)V

    .line 964
    return-void

    .line 940
    .end local v7    # "intentFilter":Landroid/content/IntentFilter;
    .end local v8    # "jidResource":Ljava/lang/String;
    .end local v9    # "manager":Landroid/net/ConnectivityManager;
    :cond_3
    const/4 v0, 0x0

    goto :goto_2

    .line 901
    .end local v10    # "powerManager":Landroid/os/PowerManager;
    :catch_0
    move-exception v0

    goto/16 :goto_1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 972
    const-string v0, "GTalkService"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 973
    const-string v0, "onDestroy"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 975
    :cond_0
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 977
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->logoutAllSessions(Z)V

    .line 978
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAccountsAndSettingsMonitor:Lcom/google/android/gtalkservice/service/GTalkService$AccountsAndSettingsMonitor;

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 979
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPushMessagingRegistrar:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    if-eqz v0, :cond_1

    .line 980
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPushMessagingRegistrar:Lcom/google/android/gtalkservice/PushMessagingRegistrar;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/PushMessagingRegistrar;->cleanup()V

    .line 983
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/net/NetworkConnectivityListener;->unregisterHandler(Landroid/os/Handler;)V

    .line 984
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    invoke-virtual {v0}, Landroid/net/NetworkConnectivityListener;->stopListening()V

    .line 985
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mNetworkConnectivityListener:Landroid/net/NetworkConnectivityListener;

    .line 986
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGlsConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->unbindService(Landroid/content/ServiceConnection;)V

    .line 987
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mStatusBarNotifier:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->onServiceDestroyed()V

    .line 989
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->removeProviders()V

    .line 991
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mWorkerLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 992
    return-void
.end method

.method public onRebind(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1025
    invoke-super {p0, p1}, Landroid/app/Service;->onRebind(Landroid/content/Intent;)V

    .line 1027
    const-string v0, "GTalkService"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1028
    const-string v0, "onRebind"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1030
    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 967
    const/4 v0, 0x1

    return v0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1014
    const-string v0, "GTalkService"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1015
    const-string v0, "onUnbind"

    invoke-static {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->log(Ljava/lang/String;)V

    .line 1018
    :cond_0
    const/4 v0, 0x5

    invoke-static {v0}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 1019
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/GTalkService;->logoutAllSessions(Z)V

    .line 1020
    const/4 v0, 0x1

    return v0
.end method

.method pollAutoSyncSetting()V
    .locals 1

    .prologue
    .line 1698
    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mAutoSyncEnabled:Z

    .line 1699
    return-void
.end method

.method queryControlAutoConnectUsingAutoSync()Z
    .locals 3

    .prologue
    .line 1686
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getGservices()Landroid/provider/Settings$Gservices$QueryMap;

    move-result-object v0

    .line 1687
    .local v0, "gservices":Landroid/provider/Settings$Gservices$QueryMap;
    const-string v2, "gtalk_connect_on_auto_sync"

    invoke-virtual {v0, v2}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1689
    .local v1, "useAutoSyncStr":Ljava/lang/String;
    const-string v2, "true"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1690
    const/4 v2, 0x1

    .line 1693
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public removeConnection(Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;)V
    .locals 2
    .param p1, "connection"    # Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .prologue
    .line 1583
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 1585
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1586
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getPrimaryConnection()Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 1587
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mPrimaryConnection:Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1590
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 1600
    return-void

    .line 1590
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setGls(Lcom/google/android/googleapps/IGoogleLoginService;)V
    .locals 2
    .param p1, "gls"    # Lcom/google/android/googleapps/IGoogleLoginService;

    .prologue
    .line 1374
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mIpcLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1375
    :try_start_0
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGls:Lcom/google/android/googleapps/IGoogleLoginService;

    .line 1376
    monitor-exit v0

    .line 1377
    return-void

    .line 1376
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setHeartbeatInterval(J)V
    .locals 1
    .param p1, "interval"    # J

    .prologue
    .line 1744
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0, p1, p2}, Landroid/provider/Im$ProviderSettings$QueryMap;->setHeartbeatInterval(J)V

    .line 1745
    return-void
.end method

.method public setJidResource(Ljava/lang/String;)V
    .locals 1
    .param p1, "jidResource"    # Ljava/lang/String;

    .prologue
    .line 1760
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mJidResource:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1766
    :cond_0
    :goto_0
    return-void

    .line 1764
    :cond_1
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mJidResource:Ljava/lang/String;

    .line 1765
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/GTalkService;->saveJidResourceToSettings(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setUploadHeartbeatStat(Z)V
    .locals 1
    .param p1, "uploadStat"    # Z

    .prologue
    .line 1736
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0, p1}, Landroid/provider/Im$ProviderSettings$QueryMap;->setUploadHeartbeatStat(Z)V

    .line 1737
    return-void
.end method
