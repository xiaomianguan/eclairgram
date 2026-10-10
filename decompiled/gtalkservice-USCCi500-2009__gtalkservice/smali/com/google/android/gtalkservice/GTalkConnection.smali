.class public Lcom/google/android/gtalkservice/GTalkConnection;
.super Ljava/lang/Object;
.source "GTalkConnection.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;
.implements Lcom/google/android/gtalkservice/PacketSender;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;,
        Lcom/google/android/gtalkservice/GTalkConnection$ConnectionClosedEvent;,
        Lcom/google/android/gtalkservice/GTalkConnection$ConnectionMadeEvent;,
        Lcom/google/android/gtalkservice/GTalkConnection$PendingConnectEvent;,
        Lcom/google/android/gtalkservice/GTalkConnection$ConnectionStateEvent;,
        Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;,
        Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;,
        Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;,
        Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;,
        Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;,
        Lcom/google/android/gtalkservice/GTalkConnection$MissingAuthTokenError;
    }
.end annotation


# static fields
.field private static final ASYNC_WAKELOCK_KEY:Ljava/lang/String; = "GTALK_ASYNC_CONN"

.field private static final CLEAR_WAKELOCK_TIMER_OFFSET_MS:I = 0x11170

.field private static final DEFAULT_GTALK_MAX_RETRIES_FOR_AUTH_EXPIRED:I = 0x3

.field private static final DEFAULT_GTALK_SSL_HANDSHAKE_TIMEOUT_MS:I = 0xea60

.field private static final ENABLE_ADAPTIVE_HEARTBEAT:Z = false

.field private static final EVENT_ASYNC_CONNECT:I = 0x64

.field private static final EVENT_CLOSE_CONNECTION:I = 0x12c

.field private static final EVENT_LOGOUT:I = 0xc8

.field private static final EVENT_UPDATE_ACCOUNT_STATUS:I = 0x190

.field private static final EXTRA_INTENT_ACCOUNT:Ljava/lang/String; = "account"

.field private static final EXTRA_INTENT_RESOURCE:Ljava/lang/String; = "resource"

.field private static final LOG_TAG:Ljava/lang/String; = "GTalkService"

.field private static final MIN_CONNECTION_DURATION_IN_SECS:I = 0x78

.field private static final MIN_LOGIN_ATTEMPT_INTERVAL_MS:J = 0xbb8L

.field private static final PACKET_REPLY_TIMEOUT_MS:I = 0x4e20

.field private static final RECONNECT_INTENT_ACTION:Ljava/lang/String; = "com.google.android.intent.action.GTALK_RECONNECT"

.field private static final SEND_DISCOVER_INFO:Z = false

.field private static final SIMPLE_WAKELOCK_KEY:Ljava/lang/String; = "GTALK_CONN"

.field private static final USE_BATCH_QUERY:Z = true


# instance fields
.field private mAccount:Lcom/google/android/gtalkservice/Account;

.field private mAccountId:J

.field private mAlarmManager:Landroid/app/AlarmManager;

.field private mAsyncConnWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mAuthExpiredCount:I

.field private mClearWakeLockTimer:Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;

.field private mClearWakeLockTimerFiredCount:I

.field private mConnection:Lorg/jivesoftware/smack/XMPPConnection;

.field private mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

.field private mConnectionDurations:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mConnectionHistory:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;",
            ">;"
        }
    .end annotation
.end field

.field private mConnectionStartTime:J

.field private mConnectionWrapper:Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

.field private mConnectivityManager:Landroid/net/ConnectivityManager;

.field private mContext:Landroid/content/Context;

.field private mCurrentConnectionCycle:Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

.field private mDefaultImSession:Lcom/google/android/gtalkservice/IImSession;

.field private mDelayedLoginCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/DelayedLogin;",
            ">;"
        }
    .end annotation
.end field

.field private mDeviceIdleStatusSent:Z

.field private mDiscoverInfo:Lorg/jivesoftware/smackx/packet/DiscoverInfo;

.field private mDiscoverItems:Lorg/jivesoftware/smackx/packet/DiscoverItems;

.field private mGTalkServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

.field private mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

.field private final mHeartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

.field private mImSessions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/service/ImSessionWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private mInitialReconnectDelay:J

.field private mJid:Ljava/lang/String;

.field mLastBroadcastNetworkState:Landroid/net/NetworkInfo$State;

.field mLastBroadcastNetworkType:I

.field private mLastConnectAttemptTs:J

.field private mLastConnectionAttemptSuccessful:Z

.field private mLastDataMessageReceivedTs:J

.field private mLastLoginAttemptTimeStamp:J

.field private mLastNetworkAvailable:Z

.field private mLastNetworkStateChangedTs:J

.field private mMaxReconnectDelay:J

.field private mNetworkDownAtLastCheck:Z

.field private mNetworkSuspended:Z

.field private mNumConnectionsAttempted:Ljava/lang/Integer;

.field private mNumConnectionsMade:Ljava/lang/Integer;

.field private mOpened:Z

.field private mPowerManager:Landroid/os/PowerManager;

.field private mPresence:Lcom/google/android/gtalkservice/Presence;

.field private mRandomGenerator:Ljava/util/Random;

.field private mReconnectAlarmIntent:Landroid/content/Intent;

.field private mReconnectAlarmSender:Landroid/app/PendingIntent;

.field private mReconnectAlarmSet:Z

.field private mReconnectDelay:J

.field private mReconnectReceiver:Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;

.field private mReconnectTime:J

.field private mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

.field private mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

.field private mServerAddress:Ljava/lang/String;

.field private mServiceHandler:Landroid/os/Handler;

.field private mSessionsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

.field private mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

.field private mSimpleWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mTimeOfLastNetworkOutage:J

.field private mUserBareAddress:Ljava/lang/String;

.field private mWorkerHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/service/GTalkServiceContext;Lcom/google/android/gtalkservice/Account;Landroid/os/Looper;)V
    .locals 6
    .param p1, "serviceContext"    # Lcom/google/android/gtalkservice/service/GTalkServiceContext;
    .param p2, "account"    # Lcom/google/android/gtalkservice/Account;
    .param p3, "workerLooper"    # Landroid/os/Looper;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 342
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 151
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastConnectionAttemptSuccessful:Z

    .line 154
    iput-boolean v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNetworkDownAtLastCheck:Z

    .line 155
    iput-boolean v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNetworkSuspended:Z

    .line 156
    new-instance v1, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Random;-><init>(J)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRandomGenerator:Ljava/util/Random;

    .line 166
    new-instance v1, Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;

    invoke-direct {v1, p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;Lcom/google/android/gtalkservice/GTalkConnection$1;)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mClearWakeLockTimer:Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;

    .line 174
    iput-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 184
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsMade:Ljava/lang/Integer;

    .line 185
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsAttempted:Ljava/lang/Integer;

    .line 186
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionDurations:Ljava/util/Vector;

    .line 190
    iput-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 195
    new-instance v1, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;

    invoke-direct {v1, p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;Lcom/google/android/gtalkservice/GTalkConnection$1;)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectReceiver:Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;

    .line 210
    new-instance v1, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 211
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    .line 212
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    .line 227
    sget-object v1, Landroid/net/NetworkInfo$State;->UNKNOWN:Landroid/net/NetworkInfo$State;

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkState:Landroid/net/NetworkInfo$State;

    .line 234
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    .line 238
    iput v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAuthExpiredCount:I

    .line 241
    new-instance v1, Lorg/jivesoftware/smack/packet/HeartbeatStat;

    const-wide/16 v2, 0x0

    invoke-direct {v1, v4, v2, v3, v5}, Lorg/jivesoftware/smack/packet/HeartbeatStat;-><init>(ZJLjava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

    .line 245
    iput-boolean v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDeviceIdleStatusSent:Z

    .line 343
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mImSessions:Ljava/util/ArrayList;

    .line 344
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDelayedLoginCallbacks:Ljava/util/ArrayList;

    .line 346
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mGTalkServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    .line 348
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v0

    .line 349
    .local v0, "service":Lcom/google/android/gtalkservice/service/GTalkService;
    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    .line 350
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getHandler()Landroid/os/Handler;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    .line 351
    new-instance v1, Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-direct {v1, p1, p0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;-><init>(Lcom/google/android/gtalkservice/service/GTalkServiceContext;Lcom/google/android/gtalkservice/GTalkConnection;)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .line 352
    new-instance v1, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;

    invoke-direct {v1, p0, p3}, Lcom/google/android/gtalkservice/GTalkConnection$WorkerHandler;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mWorkerHandler:Landroid/os/Handler;

    .line 354
    invoke-virtual {p0, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->setAccount(Lcom/google/android/gtalkservice/Account;)V

    .line 355
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->init()V

    .line 356
    return-void
.end method

.method static synthetic access$1008(Lcom/google/android/gtalkservice/GTalkConnection;)I
    .locals 2
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 105
    iget v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mClearWakeLockTimerFiredCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mClearWakeLockTimerFiredCount:I

    return v0
.end method

.method static synthetic access$1200(Lcom/google/android/gtalkservice/GTalkConnection;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 105
    iget-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionStartTime:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->doConnect()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/android/gtalkservice/GTalkConnection;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/google/android/gtalkservice/GTalkConnection;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 105
    iget-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccountId:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->doLogout()V

    return-void
.end method

.method static synthetic access$700(Lcom/google/android/gtalkservice/GTalkConnection;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p1, "x1"    # Z

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->closeConnection(Z)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->cancelReconnectAlarm()V

    return-void
.end method

.method private addConnectionClosedEvent(I)V
    .locals 12
    .param p1, "error"    # I

    .prologue
    const-wide/16 v10, 0x0

    .line 2658
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "addConnectionClosedEvent: mError="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 2660
    :cond_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    monitor-enter v4

    .line 2661
    :try_start_0
    new-instance v0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionClosedEvent;

    invoke-direct {v0, p1}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionClosedEvent;-><init>(I)V

    .line 2663
    .local v0, "cce":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionClosedEvent;
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mCurrentConnectionCycle:Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    invoke-virtual {v5, v0}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->appendConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V

    .line 2664
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mCurrentConnectionCycle:Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    iget-wide v6, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionStartTime:J

    cmp-long v6, v6, v10

    if-nez v6, :cond_2

    move-wide v1, v10

    :goto_0
    iput-wide v1, v5, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->mConnectionUptime:J

    .line 2669
    .local v1, "connectionDuration":J
    new-instance v5, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;Lcom/google/android/gtalkservice/GTalkConnection$1;)V

    iput-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mCurrentConnectionCycle:Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    .line 2670
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mCurrentConnectionCycle:Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2672
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 2673
    .local v3, "count":I
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getMaxConnectionHistoryRecords()I

    move-result v5

    if-le v3, v5, :cond_1

    .line 2674
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2681
    :cond_1
    cmp-long v5, v1, v10

    if-lez v5, :cond_3

    .line 2682
    iget v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkType:I

    const-wide/16 v6, 0x3e8

    div-long v6, v1, v6

    long-to-int v6, v6

    invoke-static {p1, v5, v6}, Lcom/google/android/gtalkservice/LogTag;->logConnectionClosed(III)V

    .line 2690
    :goto_1
    monitor-exit v4

    .line 2691
    return-void

    .line 2664
    .end local v1    # "connectionDuration":J
    .end local v3    # "count":I
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionStartTime:J

    sub-long/2addr v6, v8

    move-wide v1, v6

    goto :goto_0

    .line 2685
    .restart local v1    # "connectionDuration":J
    .restart local v3    # "count":I
    :cond_3
    const/4 v5, 0x1

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v6

    iget-object v7, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkState:Landroid/net/NetworkInfo$State;

    invoke-virtual {v7}, Landroid/net/NetworkInfo$State;->ordinal()I

    move-result v7

    invoke-static {v5, v6, p1, v7}, Lcom/google/android/gtalkservice/LogTag;->logConnectionEvent(IIII)V

    goto :goto_1

    .line 2690
    .end local v0    # "cce":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionClosedEvent;
    .end local v1    # "connectionDuration":J
    .end local v3    # "count":I
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method

.method private addConnectionDuration()V
    .locals 7

    .prologue
    .line 2010
    iget-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionStartTime:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 2018
    :goto_0
    return-void

    .line 2014
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionDurations:Ljava/util/Vector;

    monitor-enter v2

    .line 2015
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionStartTime:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x3e8

    div-long v0, v3, v5

    .line 2016
    .local v0, "duration":J
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionDurations:Ljava/util/Vector;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2017
    monitor-exit v2

    goto :goto_0

    .end local v0    # "duration":J
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method private addConnectionEvent(I)V
    .locals 9
    .param p1, "state"    # I

    .prologue
    .line 2621
    packed-switch p1, :pswitch_data_0

    .line 2644
    :pswitch_0
    new-instance v0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionStateEvent;

    invoke-direct {v0, p1}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionStateEvent;-><init>(I)V

    .line 2648
    .local v0, "ce":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
    :goto_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    monitor-enter v1

    .line 2649
    :try_start_0
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "addConnectionEvent: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 2650
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mCurrentConnectionCycle:Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    invoke-virtual {v2, v0}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->appendConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V

    .line 2651
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2653
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkState:Landroid/net/NetworkInfo$State;

    invoke-virtual {v3}, Landroid/net/NetworkInfo$State;->ordinal()I

    move-result v3

    invoke-static {v1, p1, v2, v3}, Lcom/google/android/gtalkservice/LogTag;->logConnectionEvent(IIII)V

    .line 2655
    return-void

    .line 2624
    .end local v0    # "ce":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
    :pswitch_1
    new-instance v0, Lcom/google/android/gtalkservice/GTalkConnection$PendingConnectEvent;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkState:Landroid/net/NetworkInfo$State;

    iget v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkType:I

    iget-boolean v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastNetworkAvailable:Z

    iget-wide v6, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectTime:J

    move v1, p1

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gtalkservice/GTalkConnection$PendingConnectEvent;-><init>(IILandroid/net/NetworkInfo$State;IZJ)V

    .line 2627
    .restart local v0    # "ce":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
    goto :goto_0

    .line 2630
    .end local v0    # "ce":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
    :pswitch_2
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v8

    .line 2632
    .local v8, "conn":Lorg/jivesoftware/smack/XMPPConnection;
    new-instance v0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionMadeEvent;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v1

    if-eqz v8, :cond_1

    invoke-virtual {v8}, Lorg/jivesoftware/smack/XMPPConnection;->getHostIpAddress()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-direct {v0, p1, v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionMadeEvent;-><init>(ILcom/google/android/gtalkservice/Presence;Ljava/lang/String;)V

    .line 2635
    .restart local v0    # "ce":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
    goto :goto_0

    .line 2632
    .end local v0    # "ce":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
    :cond_1
    const-string v2, ""

    goto :goto_1

    .line 2638
    .end local v8    # "conn":Lorg/jivesoftware/smack/XMPPConnection;
    :pswitch_3
    new-instance v0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionMadeEvent;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionMadeEvent;-><init>(ILcom/google/android/gtalkservice/Presence;Ljava/lang/String;)V

    .line 2641
    .restart local v0    # "ce":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
    goto :goto_0

    .line 2651
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 2621
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private broadcastConnected(Ljava/lang/String;)V
    .locals 3
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 1181
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GTALK_CONNECTED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1182
    .local v0, "connectedIntent":Landroid/content/Intent;
    const-string v1, "account"

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUserBareAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1183
    const-string v1, "resource"

    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1185
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1186
    return-void
.end method

.method private broadcastDisconnected(I)V
    .locals 3
    .param p1, "error"    # I

    .prologue
    .line 1190
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GTALK_DISCONNECTED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1191
    .local v0, "disconnectIntent":Landroid/content/Intent;
    const-string v1, "account"

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUserBareAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1192
    const-string v1, "err"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1193
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1194
    return-void
.end method

.method private bumpConnectionCount()V
    .locals 2

    .prologue
    .line 1995
    monitor-enter p0

    .line 1996
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsMade:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsMade:Ljava/lang/Integer;

    .line 1997
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1998
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "connections made: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsMade:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1999
    :cond_0
    return-void

    .line 1997
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private bumpConnectionsAttemptedCount()V
    .locals 2

    .prologue
    .line 2002
    monitor-enter p0

    .line 2003
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsAttempted:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsAttempted:Ljava/lang/Integer;

    .line 2004
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2005
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "attempt connection #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsAttempted:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 2006
    :cond_0
    return-void

    .line 2004
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private callDelayedLoginCallbacks(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 4
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 1239
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDelayedLoginCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1241
    .local v0, "count":I
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v3, :cond_0

    if-lez v0, :cond_0

    .line 1242
    const-string v3, "call delayed login callbacks..."

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1245
    :cond_0
    const/4 v3, 0x1

    sub-int v1, v0, v3

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 1246
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDelayedLoginCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gtalkservice/DelayedLogin;

    .line 1247
    .local v2, "loginCallback":Lcom/google/android/gtalkservice/DelayedLogin;
    invoke-interface {v2, p1}, Lcom/google/android/gtalkservice/DelayedLogin;->setupConnectionListeners(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1248
    invoke-interface {v2}, Lcom/google/android/gtalkservice/DelayedLogin;->login()V

    .line 1249
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDelayedLoginCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1245
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 1251
    .end local v2    # "loginCallback":Lcom/google/android/gtalkservice/DelayedLogin;
    :cond_1
    return-void
.end method

.method private cancelReconnectAlarm()V
    .locals 2

    .prologue
    .line 1027
    monitor-enter p0

    .line 1028
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSet:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSender:Landroid/app/PendingIntent;

    if-eqz v0, :cond_2

    .line 1029
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    const-string v0, "cancelReconnectAlarm"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1030
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSender:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 1031
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSet:Z

    .line 1035
    :cond_1
    :goto_0
    monitor-exit p0

    .line 1036
    return-void

    .line 1032
    :cond_2
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_1

    .line 1033
    const-string v0, "cancelReconnectAlarm: no alarm set"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    goto :goto_0

    .line 1035
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private checkConnection()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 1858
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1859
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1861
    :cond_0
    return-void
.end method

.method private clearHeartbeatAlarm()V
    .locals 1

    .prologue
    .line 1051
    monitor-enter p0

    .line 1052
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    if-eqz v0, :cond_0

    .line 1054
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->clearAlarm()V

    .line 1056
    :cond_0
    monitor-exit p0

    .line 1057
    return-void

    .line 1056
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private clearReconnectAlarm()V
    .locals 2

    .prologue
    .line 1013
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->cancelReconnectAlarm()V

    .line 1015
    monitor-enter p0

    .line 1016
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmIntent:Landroid/content/Intent;

    if-eqz v0, :cond_1

    .line 1017
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    const-string v0, "clearReconnectAlarm"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1018
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectReceiver:Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1019
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmIntent:Landroid/content/Intent;

    .line 1020
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSender:Landroid/app/PendingIntent;

    invoke-virtual {v0}, Landroid/app/PendingIntent;->cancel()V

    .line 1021
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSender:Landroid/app/PendingIntent;

    .line 1023
    :cond_1
    monitor-exit p0

    .line 1024
    return-void

    .line 1023
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private closeConnection(Z)V
    .locals 1
    .param p1, "notify"    # Z

    .prologue
    .line 1757
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->closeConnection(ZZ)V

    .line 1758
    return-void
.end method

.method private closeConnection(ZZ)V
    .locals 5
    .param p1, "notify"    # Z
    .param p2, "retry"    # Z

    .prologue
    const/4 v4, 0x0

    .line 1761
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "closeConnection: notify="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1763
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    .line 1764
    .local v0, "connection":Lorg/jivesoftware/smack/XMPPConnection;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v1

    .line 1766
    .local v1, "error":I
    if-eqz v0, :cond_2

    .line 1769
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPConnection;->getLocalConnectionId()I

    move-result v2

    invoke-virtual {p0, v2, v1, p1, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->connectionClosed(IIZZ)V

    .line 1771
    invoke-virtual {v0, v4}, Lorg/jivesoftware/smack/XMPPConnection;->close(Z)V

    .line 1776
    :goto_0
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v2, :cond_1

    const-string v2, "closeConnection: done "

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1777
    :cond_1
    return-void

    .line 1773
    :cond_2
    invoke-virtual {p0, v4, v1, p1, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->connectionClosed(IIZZ)V

    goto :goto_0
.end method

.method private connectionStateChanged(I)V
    .locals 13
    .param p1, "state"    # I

    .prologue
    const/4 v12, 0x1

    .line 1139
    const/4 v8, 0x0

    .line 1140
    .local v8, "singleSession":Lcom/google/android/gtalkservice/IImSession;
    const/4 v6, 0x0

    .line 1142
    .local v6, "sessionsCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/IImSession;>;"
    iget-object v11, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mImSessions:Ljava/util/ArrayList;

    monitor-enter v11

    .line 1143
    :try_start_0
    iget-object v10, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mImSessions:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 1153
    .local v9, "size":I
    if-gt v9, v12, :cond_1

    .line 1156
    monitor-exit v11

    .line 1177
    :cond_0
    :goto_0
    return-void

    .line 1157
    :cond_1
    const/4 v10, 0x2

    if-ne v9, v10, :cond_2

    .line 1159
    iget-object v10, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mImSessions:Ljava/util/ArrayList;

    const/4 v12, 0x1

    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lcom/google/android/gtalkservice/IImSession;

    move-object v8, v0

    .line 1163
    :goto_1
    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1165
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v2

    .line 1166
    .local v2, "connState":I
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v1

    .line 1168
    .local v1, "connError":I
    if-eqz v8, :cond_3

    .line 1169
    move-object v0, v8

    check-cast v0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;

    move-object v10, v0

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->getSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v4

    .line 1170
    .local v4, "imSession":Lcom/google/android/gtalkservice/ImSession;
    invoke-virtual {v4, v2, v1}, Lcom/google/android/gtalkservice/ImSession;->hostSessionConnectionStateChanged(II)V

    goto :goto_0

    .line 1161
    .end local v1    # "connError":I
    .end local v2    # "connState":I
    .end local v4    # "imSession":Lcom/google/android/gtalkservice/ImSession;
    :cond_2
    :try_start_1
    new-instance v7, Ljava/util/ArrayList;

    iget-object v10, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mImSessions:Ljava/util/ArrayList;

    invoke-direct {v7, v10}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .end local v6    # "sessionsCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/IImSession;>;"
    .local v7, "sessionsCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/IImSession;>;"
    move-object v6, v7

    .end local v7    # "sessionsCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/IImSession;>;"
    .restart local v6    # "sessionsCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gtalkservice/IImSession;>;"
    goto :goto_1

    .line 1163
    .end local v9    # "size":I
    :catchall_0
    move-exception v10

    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v10

    .line 1172
    .restart local v1    # "connError":I
    .restart local v2    # "connState":I
    .restart local v9    # "size":I
    :cond_3
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gtalkservice/IImSession;

    .line 1173
    .local v5, "session":Lcom/google/android/gtalkservice/IImSession;
    check-cast v5, Lcom/google/android/gtalkservice/service/ImSessionWrapper;

    .end local v5    # "session":Lcom/google/android/gtalkservice/IImSession;
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->getSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v4

    .line 1174
    .restart local v4    # "imSession":Lcom/google/android/gtalkservice/ImSession;
    invoke-virtual {v4, v2, v1}, Lcom/google/android/gtalkservice/ImSession;->hostSessionConnectionStateChanged(II)V

    goto :goto_2
.end method

.method private constructException(Ljava/lang/String;)Ljava/lang/IllegalStateException;
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 815
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "user="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 819
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUserBareAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 820
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 823
    if-eqz p1, :cond_2

    .line 824
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 830
    :cond_0
    :goto_0
    const-string v1, ", mState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 831
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 834
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    if-eqz v1, :cond_1

    .line 835
    const-string v1, ", mConnection.isConnected="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 836
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 839
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 825
    :cond_2
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    if-nez v1, :cond_0

    .line 826
    const-string v1, "mConnection=null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private discoverInfo(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;Ljava/lang/String;)V
    .locals 1
    .param p1, "disco"    # Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    .param p2, "serviceName"    # Ljava/lang/String;

    .prologue
    .line 1989
    :try_start_0
    invoke-virtual {p1, p2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDiscoverInfo:Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1992
    :goto_0
    return-void

    .line 1990
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private discoverItems(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;Ljava/lang/String;)V
    .locals 1
    .param p1, "disco"    # Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    .param p2, "serviceName"    # Ljava/lang/String;

    .prologue
    .line 1981
    :try_start_0
    invoke-virtual {p1, p2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDiscoverItems:Lorg/jivesoftware/smackx/packet/DiscoverItems;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1984
    :goto_0
    return-void

    .line 1982
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private doConnect()V
    .locals 42

    .prologue
    .line 1477
    const/16 v29, 0x0

    .line 1478
    .local v29, "connection":Lorg/jivesoftware/smack/XMPPConnection;
    const/16 v37, 0x0

    .line 1479
    .local v37, "xmppError":Lorg/jivesoftware/smack/packet/XMPPError;
    const/16 v30, 0x0

    .line 1483
    .local v30, "error":I
    const/4 v8, 0x0

    :try_start_0
    move v0, v8

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/google/android/gtalkservice/GTalkConnection;->mLastConnectionAttemptSuccessful:Z

    .line 1485
    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    .line 1487
    const/16 v8, 0x4e20

    invoke-static {v8}, Lorg/jivesoftware/smack/SmackConfiguration;->setPacketReplyTimeout(I)V

    .line 1490
    const/4 v8, 0x0

    invoke-static {v8}, Lorg/jivesoftware/smack/SmackConfiguration;->setKeepAliveInterval(I)V

    .line 1494
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    move-object v8, v0

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v12

    .line 1495
    .local v12, "username":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    move-object v8, v0

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/Account;->getAuthToken()Ljava/lang/String;

    move-result-object v13

    .line 1496
    .local v13, "authToken":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    move-object v8, v0

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/Account;->getDeviceId()Ljava/lang/String;

    move-result-object v15

    .line 1497
    .local v15, "deviceId":Ljava/lang/String;
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 1498
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_0

    .line 1499
    const-string v8, "doConnect: EMPTY AUTH-TOKEN, cannot make connection!"

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1501
    :cond_0
    new-instance v8, Lorg/jivesoftware/smack/XMPPException;

    new-instance v9, Lcom/google/android/gtalkservice/GTalkConnection$MissingAuthTokenError;

    const/16 v10, 0x190

    const-string v11, "empty auth-token"

    move-object v0, v9

    move-object/from16 v1, p0

    move v2, v10

    move-object v3, v11

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/GTalkConnection$MissingAuthTokenError;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;ILjava/lang/String;)V

    invoke-direct {v8, v9}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v8
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1638
    .end local v12    # "username":Ljava/lang/String;
    .end local v13    # "authToken":Ljava/lang/String;
    .end local v15    # "deviceId":Ljava/lang/String;
    :catch_0
    move-exception v8

    move-object/from16 v31, v8

    move-object/from16 v4, v29

    .line 1640
    .end local v29    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .local v4, "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .local v31, "ex":Lorg/jivesoftware/smack/XMPPException;
    :goto_0
    :try_start_1
    invoke-virtual/range {v31 .. v31}, Lorg/jivesoftware/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object v36

    .line 1641
    .local v36, "throwable":Ljava/lang/Throwable;
    move-object/from16 v0, v36

    instance-of v0, v0, Ljava/net/UnknownHostException;

    move v8, v0

    if-eqz v8, :cond_17

    .line 1642
    const/16 v30, 0x3

    .line 1643
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "doConnect: caught "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object v0, v8

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logw(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1679
    :cond_1
    :goto_1
    if-nez v30, :cond_2

    if-eqz v37, :cond_1a

    .line 1680
    :cond_2
    move-object/from16 v0, p0

    move/from16 v1, v30

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->handleDoConnectError(ILorg/jivesoftware/smack/packet/XMPPError;)V

    .line 1700
    .end local v31    # "ex":Lorg/jivesoftware/smack/XMPPException;
    .end local v36    # "throwable":Ljava/lang/Throwable;
    :cond_3
    :goto_2
    return-void

    .line 1504
    .end local v4    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .restart local v12    # "username":Ljava/lang/String;
    .restart local v13    # "authToken":Ljava/lang/String;
    .restart local v15    # "deviceId":Ljava/lang/String;
    .restart local v29    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    :cond_4
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    move-object v4, v0

    check-cast v4, Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-static {v4, v12, v13, v15}, Lcom/google/android/gtalkservice/Account;->createAccountFromSettings(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;

    move-result-object v26

    .line 1507
    .local v26, "account":Lcom/google/android/gtalkservice/Account;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    move-object v8, v0

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/Account;->getHost()Ljava/lang/String;

    move-result-object v35

    .line 1508
    .local v35, "oldHostname":Ljava/lang/String;
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/gtalkservice/Account;->getHost()Ljava/lang/String;

    move-result-object v5

    .line 1509
    .local v5, "host":Ljava/lang/String;
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/gtalkservice/Account;->getPort()I

    move-result v6

    .line 1510
    .local v6, "port":I
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/gtalkservice/Account;->getDomain()Ljava/lang/String;

    move-result-object v9

    .line 1511
    .local v9, "domain":Ljava/lang/String;
    invoke-virtual/range {v26 .. v26}, Lcom/google/android/gtalkservice/Account;->getLoginSettings()Ljava/util/Map;

    move-result-object v25

    .line 1513
    .local v25, "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    .line 1515
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5

    if-gez v6, :cond_7

    .line 1516
    :cond_5
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "EMPTY HOSTNAME or INVALID PORT("

    .end local v9    # "domain":Ljava/lang/String;
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "), cannot make connection!"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->loge(Ljava/lang/String;)V

    .line 1517
    const/4 v8, 0x0

    move v0, v8

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/google/android/gtalkservice/GTalkConnection;->mLastConnectionAttemptSuccessful:Z

    .line 1518
    new-instance v8, Lorg/jivesoftware/smack/XMPPException;

    new-instance v9, Ljava/net/UnknownHostException;

    const-string v10, "empty hostname/invalid port"

    invoke-direct {v9, v10}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    invoke-direct {v8, v9}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/Throwable;)V

    throw v8
    :try_end_2
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1655
    .end local v5    # "host":Ljava/lang/String;
    .end local v6    # "port":I
    .end local v12    # "username":Ljava/lang/String;
    .end local v13    # "authToken":Ljava/lang/String;
    .end local v15    # "deviceId":Ljava/lang/String;
    .end local v25    # "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v26    # "account":Lcom/google/android/gtalkservice/Account;
    .end local v35    # "oldHostname":Ljava/lang/String;
    :catch_1
    move-exception v8

    move-object/from16 v32, v8

    move-object/from16 v4, v29

    .line 1660
    .end local v29    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .restart local v4    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .local v32, "ex2":Ljava/lang/IllegalStateException;
    :goto_3
    :try_start_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "doConnect: caught "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object v0, v8

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logw(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1662
    const/16 v30, 0x2

    .line 1679
    if-nez v30, :cond_6

    if-eqz v37, :cond_1b

    .line 1680
    :cond_6
    move-object/from16 v0, p0

    move/from16 v1, v30

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->handleDoConnectError(ILorg/jivesoftware/smack/packet/XMPPError;)V

    goto/16 :goto_2

    .line 1521
    .end local v4    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .end local v32    # "ex2":Ljava/lang/IllegalStateException;
    .restart local v5    # "host":Ljava/lang/String;
    .restart local v6    # "port":I
    .restart local v9    # "domain":Ljava/lang/String;
    .restart local v12    # "username":Ljava/lang/String;
    .restart local v13    # "authToken":Ljava/lang/String;
    .restart local v15    # "deviceId":Ljava/lang/String;
    .restart local v25    # "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v26    # "account":Lcom/google/android/gtalkservice/Account;
    .restart local v29    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .restart local v35    # "oldHostname":Ljava/lang/String;
    :cond_7
    :try_start_4
    move-object v0, v5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9

    .line 1523
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_8

    .line 1524
    const-string v8, "doConnect: hostname changed, reset \'has_roster_requested\' flag"

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1526
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v8, v0

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/RosterManager;->clearRosterFetchFlags()V

    .line 1531
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    move-object v8, v0

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v10, "gtalk_ssl_handshake_timeout_ms"

    const v11, 0xea60

    invoke-static {v8, v10, v11}, Landroid/provider/Settings$Gservices;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    .line 1535
    .local v7, "sslHandshakeTimeout":I
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_a

    .line 1536
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "doConnect: new sslXmppConn, handshake timeout="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1541
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    move-object v8, v0

    invoke-static {v8}, Lcom/google/android/net/SSLClientSessionCacheFactory;->getCache(Landroid/content/Context;)Lorg/apache/harmony/xnet/provider/jsse/SSLClientSessionCache;

    move-result-object v27

    .line 1542
    .local v27, "cache":Lorg/apache/harmony/xnet/provider/jsse/SSLClientSessionCache;
    move v0, v7

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Landroid/net/SSLCertificateSocketFactory;->getDefault(ILorg/apache/harmony/xnet/provider/jsse/SSLClientSessionCache;)Ljavax/net/SocketFactory;

    move-result-object v10

    .line 1545
    .local v10, "socketFactory":Ljavax/net/SocketFactory;
    new-instance v4, Lorg/jivesoftware/smack/SSLXMPPConnection;

    const/4 v8, 0x1

    invoke-direct/range {v4 .. v10}, Lorg/jivesoftware/smack/SSLXMPPConnection;-><init>(Ljava/lang/String;IIZLjava/lang/String;Ljavax/net/SocketFactory;)V
    :try_end_4
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1548
    .end local v29    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .restart local v4    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    :try_start_5
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->bumpConnectionsAttemptedCount()V

    .line 1550
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mSimpleWakeLock:Landroid/os/PowerManager$WakeLock;

    move-object v8, v0

    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/XMPPConnection;->setWakeLock(Landroid/os/PowerManager$WakeLock;)V

    .line 1551
    move-object v0, v4

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 1552
    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->connect()V

    .line 1556
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v38

    const-wide/16 v40, 0x64

    div-long v38, v38, v40

    move-wide/from16 v0, v38

    long-to-int v0, v0

    move v8, v0

    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/XMPPConnection;->setLocalConnectionId(I)V

    .line 1559
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/service/GTalkService;->getJidResource()Ljava/lang/String;

    move-result-object v14

    .line 1560
    .local v14, "resource":Ljava/lang/String;
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 1561
    new-instance v8, Ljava/lang/IllegalStateException;

    const-string v9, "empty JID resource"

    .end local v9    # "domain":Ljava/lang/String;
    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1638
    .end local v10    # "socketFactory":Ljavax/net/SocketFactory;
    .end local v14    # "resource":Ljava/lang/String;
    :catch_2
    move-exception v8

    move-object/from16 v31, v8

    goto/16 :goto_0

    .line 1567
    .restart local v9    # "domain":Ljava/lang/String;
    .restart local v10    # "socketFactory":Ljavax/net/SocketFactory;
    .restart local v14    # "resource":Ljava/lang/String;
    :cond_b
    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1569
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_c

    .line 1570
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "login: username="

    .end local v9    # "domain":Ljava/lang/String;
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", resource="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1573
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    move-object v8, v0

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "gtalk_compress"

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/provider/Settings$Gservices;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .end local v10    # "socketFactory":Ljavax/net/SocketFactory;
    move-result v22

    .line 1575
    .local v22, "compress":I
    const/4 v8, 0x1

    move/from16 v0, v22

    move v1, v8

    if-ne v0, v1, :cond_d

    .line 1576
    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getConnectionConfiguration()Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-result-object v8

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCompressionEnabled(Z)V

    .line 1579
    :cond_d
    const/16 v24, 0x0

    .line 1580
    .local v24, "upload":Lorg/jivesoftware/smack/packet/HeartbeatStat;
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->shouldUploadHeartbeatStat()Z

    move-result v8

    if-eqz v8, :cond_e

    .line 1581
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

    move-object/from16 v24, v0

    .line 1582
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_e

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Heartbeat stat uploaded: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object v0, v8

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1585
    :cond_e
    const-wide/16 v17, -0x1

    .line 1586
    .local v17, "rmqLastReceived":J
    const/16 v20, 0x0

    .line 1588
    .local v20, "initialS2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v16, 0x0

    .line 1589
    .local v16, "useRmq":Z
    const/16 v19, 0x0

    .line 1591
    .local v19, "useRmq2":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    move-object v8, v0

    if-eqz v8, :cond_f

    .line 1592
    const/16 v19, 0x1

    .line 1593
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    move-object v8, v0

    invoke-virtual/range {v26 .. v26}, Lcom/google/android/gtalkservice/Account;->getRmqAckInterval()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->setAckingInterval(I)V

    .line 1594
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    move-object v8, v0

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processAndRetrieveInitialS2dIds()Ljava/util/List;

    move-result-object v20

    .line 1597
    :cond_f
    if-eqz v19, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    move-object v8, v0

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/Account;->getSupportRmqAndRmq2()Z

    move-result v8

    if-eqz v8, :cond_11

    .line 1598
    :cond_10
    const/16 v16, 0x1

    .line 1599
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    move-object v8, v0

    invoke-virtual/range {v26 .. v26}, Lcom/google/android/gtalkservice/Account;->getRmqAckInterval()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/google/android/gtalkservice/rmq/RmqManager;->setAckingInterval(I)V

    .line 1600
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    move-object v8, v0

    invoke-virtual {v8}, Lcom/google/android/gtalkservice/rmq/RmqManager;->getLastReceivedRmqIdFromServer()J

    move-result-wide v17

    .line 1603
    :cond_11
    const/16 v21, 0x0

    const/16 v23, 0x0

    move-object v11, v4

    invoke-virtual/range {v11 .. v25}, Lorg/jivesoftware/smack/XMPPConnection;->login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJZLjava/util/List;ZIZLorg/jivesoftware/smack/packet/HeartbeatStat;Ljava/util/Map;)V

    .line 1618
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

    move-object v8, v0

    const/4 v9, 0x0

    iput-boolean v9, v8, Lorg/jivesoftware/smack/packet/HeartbeatStat;->timeout:Z

    .line 1619
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

    move-object v8, v0

    const/4 v9, 0x0

    iput-object v9, v8, Lorg/jivesoftware/smack/packet/HeartbeatStat;->ip:Ljava/lang/String;

    .line 1621
    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getHeartbeatConfig()Lorg/jivesoftware/smack/packet/HeartbeatConfig;

    move-result-object v28

    .line 1622
    .local v28, "config":Lorg/jivesoftware/smack/packet/HeartbeatConfig;
    if-eqz v28, :cond_14

    .line 1623
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_12

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Server sent heartbeat config: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object v0, v8

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1625
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

    move-object v8, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/jivesoftware/smack/packet/HeartbeatConfig;->ip:Ljava/lang/String;

    move-object v9, v0

    iput-object v9, v8, Lorg/jivesoftware/smack/packet/HeartbeatStat;->ip:Ljava/lang/String;

    .line 1627
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/jivesoftware/smack/packet/HeartbeatConfig;->uploadStat:Ljava/lang/Boolean;

    move-object v8, v0

    if-eqz v8, :cond_13

    .line 1628
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v8

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/jivesoftware/smack/packet/HeartbeatConfig;->uploadStat:Ljava/lang/Boolean;

    move-object v9, v0

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-virtual {v8, v9}, Lcom/google/android/gtalkservice/service/GTalkService;->setUploadHeartbeatStat(Z)V

    .line 1631
    :cond_13
    move-object/from16 v0, v28

    iget-wide v0, v0, Lorg/jivesoftware/smack/packet/HeartbeatConfig;->interval:J

    move-wide/from16 v38, v0

    const-wide/16 v40, 0x0

    cmp-long v8, v38, v40

    if-lez v8, :cond_14

    .line 1632
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v8

    move-object/from16 v0, v28

    iget-wide v0, v0, Lorg/jivesoftware/smack/packet/HeartbeatConfig;->interval:J

    move-wide/from16 v38, v0

    move-object v0, v8

    move-wide/from16 v1, v38

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService;->setHeartbeatInterval(J)V

    .line 1636
    :cond_14
    const/4 v8, 0x3

    move-object/from16 v0, p0

    move v1, v8

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionState(I)V
    :try_end_5
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1679
    if-nez v30, :cond_15

    if-eqz v37, :cond_16

    .line 1680
    :cond_15
    move-object/from16 v0, p0

    move/from16 v1, v30

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->handleDoConnectError(ILorg/jivesoftware/smack/packet/XMPPError;)V

    goto/16 :goto_2

    .line 1685
    :cond_16
    const/4 v8, 0x0

    move-object/from16 v0, p0

    move v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->updateAuthErrorStats(I)V

    .line 1691
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    move-object v8, v0

    const/16 v9, 0xc8

    invoke-virtual {v8, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v34

    .line 1693
    .local v34, "message":Landroid/os/Message;
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1694
    invoke-virtual/range {v34 .. v34}, Landroid/os/Message;->sendToTarget()V

    .line 1696
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_3

    .line 1697
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "doConnect: DONE. JID received from server = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1644
    .end local v5    # "host":Ljava/lang/String;
    .end local v6    # "port":I
    .end local v7    # "sslHandshakeTimeout":I
    .end local v12    # "username":Ljava/lang/String;
    .end local v13    # "authToken":Ljava/lang/String;
    .end local v14    # "resource":Ljava/lang/String;
    .end local v15    # "deviceId":Ljava/lang/String;
    .end local v16    # "useRmq":Z
    .end local v17    # "rmqLastReceived":J
    .end local v19    # "useRmq2":Z
    .end local v20    # "initialS2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v22    # "compress":I
    .end local v24    # "upload":Lorg/jivesoftware/smack/packet/HeartbeatStat;
    .end local v25    # "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v26    # "account":Lcom/google/android/gtalkservice/Account;
    .end local v27    # "cache":Lorg/apache/harmony/xnet/provider/jsse/SSLClientSessionCache;
    .end local v28    # "config":Lorg/jivesoftware/smack/packet/HeartbeatConfig;
    .end local v34    # "message":Landroid/os/Message;
    .end local v35    # "oldHostname":Ljava/lang/String;
    .restart local v31    # "ex":Lorg/jivesoftware/smack/XMPPException;
    .restart local v36    # "throwable":Ljava/lang/Throwable;
    :cond_17
    :try_start_6
    move-object/from16 v0, v36

    instance-of v0, v0, Ljava/io/IOException;

    move v8, v0

    if-eqz v8, :cond_19

    .line 1645
    const/16 v30, 0x2

    .line 1646
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "doConnect: caught "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object v0, v8

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logw(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_1

    .line 1679
    .end local v31    # "ex":Lorg/jivesoftware/smack/XMPPException;
    .end local v36    # "throwable":Ljava/lang/Throwable;
    :catchall_0
    move-exception v8

    :goto_4
    if-nez v30, :cond_18

    if-eqz v37, :cond_1e

    .line 1680
    :cond_18
    move-object/from16 v0, p0

    move/from16 v1, v30

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->handleDoConnectError(ILorg/jivesoftware/smack/packet/XMPPError;)V

    goto/16 :goto_2

    .line 1648
    .restart local v31    # "ex":Lorg/jivesoftware/smack/XMPPException;
    .restart local v36    # "throwable":Ljava/lang/Throwable;
    :cond_19
    :try_start_7
    invoke-virtual/range {v31 .. v31}, Lorg/jivesoftware/smack/XMPPException;->getXMPPError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v37

    .line 1649
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "xmppError = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object v0, v8

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual/range {v31 .. v31}, Lorg/jivesoftware/smack/XMPPException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->loge(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1651
    if-nez v37, :cond_1

    .line 1652
    const/16 v30, 0xa

    goto/16 :goto_1

    .line 1685
    :cond_1a
    const/4 v8, 0x0

    move-object/from16 v0, p0

    move v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->updateAuthErrorStats(I)V

    .line 1691
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    move-object v8, v0

    const/16 v9, 0xc8

    invoke-virtual {v8, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v34

    .line 1693
    .restart local v34    # "message":Landroid/os/Message;
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1694
    invoke-virtual/range {v34 .. v34}, Landroid/os/Message;->sendToTarget()V

    .line 1696
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_3

    .line 1697
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "doConnect: DONE. JID received from server = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1685
    .end local v31    # "ex":Lorg/jivesoftware/smack/XMPPException;
    .end local v34    # "message":Landroid/os/Message;
    .end local v36    # "throwable":Ljava/lang/Throwable;
    .restart local v32    # "ex2":Ljava/lang/IllegalStateException;
    :cond_1b
    const/4 v8, 0x0

    move-object/from16 v0, p0

    move v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->updateAuthErrorStats(I)V

    .line 1691
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    move-object v8, v0

    const/16 v9, 0xc8

    invoke-virtual {v8, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v34

    .line 1693
    .restart local v34    # "message":Landroid/os/Message;
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1694
    invoke-virtual/range {v34 .. v34}, Landroid/os/Message;->sendToTarget()V

    .line 1696
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_3

    .line 1697
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "doConnect: DONE. JID received from server = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1675
    .end local v4    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .end local v32    # "ex2":Ljava/lang/IllegalStateException;
    .end local v34    # "message":Landroid/os/Message;
    .restart local v29    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    :catch_3
    move-exception v8

    move-object/from16 v33, v8

    move-object/from16 v4, v29

    .line 1676
    .end local v29    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .restart local v4    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .local v33, "ex3":Ljava/lang/Exception;
    :goto_5
    :try_start_8
    const-string v8, "doConnect: caught "

    move-object/from16 v0, p0

    move-object v1, v8

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->loge(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 1677
    const/16 v30, 0xa

    .line 1679
    if-nez v30, :cond_1c

    if-eqz v37, :cond_1d

    .line 1680
    :cond_1c
    move-object/from16 v0, p0

    move/from16 v1, v30

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->handleDoConnectError(ILorg/jivesoftware/smack/packet/XMPPError;)V

    goto/16 :goto_2

    .line 1685
    :cond_1d
    const/4 v8, 0x0

    move-object/from16 v0, p0

    move v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->updateAuthErrorStats(I)V

    .line 1691
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    move-object v8, v0

    const/16 v9, 0xc8

    invoke-virtual {v8, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v34

    .line 1693
    .restart local v34    # "message":Landroid/os/Message;
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1694
    invoke-virtual/range {v34 .. v34}, Landroid/os/Message;->sendToTarget()V

    .line 1696
    sget-boolean v8, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v8, :cond_3

    .line 1697
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "doConnect: DONE. JID received from server = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1685
    .end local v33    # "ex3":Ljava/lang/Exception;
    .end local v34    # "message":Landroid/os/Message;
    :cond_1e
    const/4 v9, 0x0

    move-object/from16 v0, p0

    move v1, v9

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->updateAuthErrorStats(I)V

    .line 1691
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    move-object v9, v0

    const/16 v10, 0xc8

    invoke-virtual {v9, v10}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v34

    .line 1693
    .restart local v34    # "message":Landroid/os/Message;
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1694
    invoke-virtual/range {v34 .. v34}, Landroid/os/Message;->sendToTarget()V

    .line 1696
    sget-boolean v9, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v9, :cond_1f

    .line 1697
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "doConnect: DONE. JID received from server = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p0

    move-object v1, v9

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1699
    :cond_1f
    throw v8

    .line 1679
    .end local v4    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .end local v34    # "message":Landroid/os/Message;
    .restart local v29    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    :catchall_1
    move-exception v8

    move-object/from16 v4, v29

    .end local v29    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .restart local v4    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    goto/16 :goto_4

    .line 1675
    .restart local v5    # "host":Ljava/lang/String;
    .restart local v6    # "port":I
    .restart local v7    # "sslHandshakeTimeout":I
    .restart local v12    # "username":Ljava/lang/String;
    .restart local v13    # "authToken":Ljava/lang/String;
    .restart local v15    # "deviceId":Ljava/lang/String;
    .restart local v25    # "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v26    # "account":Lcom/google/android/gtalkservice/Account;
    .restart local v27    # "cache":Lorg/apache/harmony/xnet/provider/jsse/SSLClientSessionCache;
    .restart local v35    # "oldHostname":Ljava/lang/String;
    :catch_4
    move-exception v8

    move-object/from16 v33, v8

    goto/16 :goto_5

    .line 1655
    :catch_5
    move-exception v8

    move-object/from16 v32, v8

    goto/16 :goto_3
.end method

.method private doLogout()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 619
    iput-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mOpened:Z

    .line 621
    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    .line 622
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->closeConnection(Z)V

    .line 623
    return-void
.end method

.method private getImSession(Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IImSession;
    .locals 5
    .param p1, "providerName"    # Ljava/lang/String;
    .param p2, "providerId"    # J
    .param p4, "createIfNotExist"    # Z

    .prologue
    .line 2173
    invoke-direct {p0, p2, p3}, Lcom/google/android/gtalkservice/GTalkConnection;->internalGetImSessionByProviderId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v0

    .line 2174
    .local v0, "imSession":Lcom/google/android/gtalkservice/IImSession;
    if-nez v0, :cond_0

    if-nez p4, :cond_1

    :cond_0
    move-object v3, v0

    .line 2197
    :goto_0
    return-object v3

    .line 2178
    :cond_1
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-static {p1, p2, p3, v3}, Lcom/google/android/gtalkservice/ImSession;->createImSession(Ljava/lang/String;JLcom/google/android/gtalkservice/GTalkConnectionContext;)Lcom/google/android/gtalkservice/ImSession;

    move-result-object v1

    .line 2183
    .local v1, "session":Lcom/google/android/gtalkservice/ImSession;
    if-nez v1, :cond_2

    .line 2184
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "create IM session for providerName="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " returned null!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->loge(Ljava/lang/String;)V

    .line 2185
    const/4 v3, 0x0

    goto :goto_0

    .line 2188
    :cond_2
    new-instance v2, Lcom/google/android/gtalkservice/service/ImSessionWrapper;

    invoke-direct {v2, v1}, Lcom/google/android/gtalkservice/service/ImSessionWrapper;-><init>(Lcom/google/android/gtalkservice/ImSession;)V

    .line 2190
    .local v2, "sessionWrapper":Lcom/google/android/gtalkservice/service/ImSessionWrapper;
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 2192
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mImSessions:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2194
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v3, v2

    .line 2197
    goto :goto_0

    .line 2194
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3
.end method

.method private getMaxConnectionHistoryRecords()I
    .locals 2

    .prologue
    .line 695
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccount()Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 697
    .local v0, "acct":Lcom/google/android/gtalkservice/Account;
    if-nez v0, :cond_0

    .line 698
    const/16 v1, 0xa

    .line 701
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getMaxConnectionHistoryRecords()I

    move-result v1

    goto :goto_0
.end method

.method private handleDoConnectError(ILorg/jivesoftware/smack/packet/XMPPError;)V
    .locals 9
    .param p1, "error"    # I
    .param p2, "xmppError"    # Lorg/jivesoftware/smack/packet/XMPPError;

    .prologue
    const/4 v2, 0x1

    const/4 v8, 0x0

    const-string v4, "doConnect: connection failed, release wakelock"

    const-string v3, "Repeating AUTH EXPIRED failures. Stop retrying."

    .line 1703
    const/4 v6, 0x0

    .line 1705
    .local v6, "reachedAuthExpiredThreshold":Z
    if-eqz p2, :cond_0

    .line 1706
    :try_start_0
    invoke-direct {p0, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->translateXMPPError(Lorg/jivesoftware/smack/packet/XMPPError;)I

    move-result p1

    .line 1707
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "run: translateXMPPError => "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1712
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->updateAuthErrorStats(I)V

    .line 1713
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->reachedRetryThresholdForAuthExpiration()Z

    move-result v6

    .line 1715
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    .line 1716
    const/4 v0, 0x1

    if-nez v6, :cond_5

    move v1, v2

    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->closeConnection(ZZ)V

    .line 1722
    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-ne p1, v0, :cond_2

    if-nez v6, :cond_2

    .line 1725
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->requestToRefreshAutoToken()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1730
    :cond_2
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugWakeLock:Z

    if-eqz v0, :cond_3

    const-string v0, "doConnect: connection failed, release wakelock"

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1734
    :cond_3
    if-eqz v6, :cond_4

    .line 1735
    const-string v0, "Repeating AUTH EXPIRED failures. Stop retrying."

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->logw(Ljava/lang/String;)V

    .line 1736
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mGTalkServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getGtalkProviderId()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->notifyAuthError(JLjava/lang/String;J)V

    .line 1738
    invoke-direct {p0, v8}, Lcom/google/android/gtalkservice/GTalkConnection;->updateAuthErrorStats(I)V

    .line 1740
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseAsyncWakeLock()V

    .line 1742
    return-void

    :cond_5
    move v1, v8

    .line 1716
    goto :goto_0

    .line 1730
    :catchall_0
    move-exception v0

    move-object v7, v0

    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugWakeLock:Z

    if-eqz v0, :cond_6

    const-string v0, "doConnect: connection failed, release wakelock"

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1734
    :cond_6
    if-eqz v6, :cond_7

    .line 1735
    const-string v0, "Repeating AUTH EXPIRED failures. Stop retrying."

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->logw(Ljava/lang/String;)V

    .line 1736
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mGTalkServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getGtalkProviderId()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->notifyAuthError(JLjava/lang/String;J)V

    .line 1738
    invoke-direct {p0, v8}, Lcom/google/android/gtalkservice/GTalkConnection;->updateAuthErrorStats(I)V

    .line 1740
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseAsyncWakeLock()V

    throw v7
.end method

.method private init()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 359
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    const-string v4, "init"

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 361
    :cond_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    const-string v5, "alarm"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/AlarmManager;

    iput-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAlarmManager:Landroid/app/AlarmManager;

    .line 362
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    const-string v5, "connectivity"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/ConnectivityManager;

    iput-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 365
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    const-string v5, "power"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/PowerManager;

    iput-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mPowerManager:Landroid/os/PowerManager;

    .line 367
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mPowerManager:Landroid/os/PowerManager;

    const-string v5, "GTALK_ASYNC_CONN"

    invoke-virtual {v4, v7, v5}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAsyncConnWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 370
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mPowerManager:Landroid/os/PowerManager;

    const-string v5, "GTALK_CONN"

    invoke-virtual {v4, v7, v5}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSimpleWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 372
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSimpleWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v4, v7}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 374
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Account;->getActiveHeartbeatInterval()I

    move-result v4

    if-lez v4, :cond_1

    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Account;->getIdleHeartbeatInterval()I

    move-result v4

    if-lez v4, :cond_1

    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Account;->getSyncHeartbeatInterval()I

    move-result v4

    if-lez v4, :cond_1

    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Account;->getNosyncHeartbeatInterval()I

    move-result v4

    if-lez v4, :cond_1

    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Account;->getHeartbeatAckTimeout()I

    move-result v4

    if-lez v4, :cond_1

    .line 379
    new-instance v4, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-direct {v4, v5, v6, p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;-><init>(Landroid/content/Context;Landroid/app/AlarmManager;Lcom/google/android/gtalkservice/GTalkConnection;)V

    iput-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 385
    :cond_1
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v5

    invoke-static {v4, v5, v6}, Lcom/google/android/gtalkservice/DatabaseHelper;->isAccountLastOnline(Landroid/content/ContentResolver;J)Z

    move-result v0

    .line 387
    .local v0, "available":Z
    new-instance v4, Lcom/google/android/gtalkservice/Presence;

    sget-object v5, Lcom/google/android/gtalkservice/Presence$Show;->NONE:Lcom/google/android/gtalkservice/Presence$Show;

    invoke-direct {v4, v0, v5, v9}, Lcom/google/android/gtalkservice/Presence;-><init>(ZLcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    iput-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mPresence:Lcom/google/android/gtalkservice/Presence;

    .line 391
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "init: initialized presence to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mPresence:Lcom/google/android/gtalkservice/Presence;

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/Presence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 393
    :cond_2
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Account;->getUseRmq2()Z

    move-result v3

    .line 394
    .local v3, "useRmq2":Z
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Account;->getSupportRmqAndRmq2()Z

    move-result v2

    .line 396
    .local v2, "supportRmqAndRmq2":Z
    if-eqz v3, :cond_4

    .line 397
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_3

    const-string v4, "init: use RMQ2 protocol"

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 398
    :cond_3
    new-instance v4, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;-><init>(Lcom/google/android/gtalkservice/PacketSender;Landroid/content/ContentResolver;)V

    iput-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 399
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    invoke-static {v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->setIncludeStreamId(Z)V

    .line 400
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    invoke-virtual {v4, v5}, Lcom/google/android/gtalkservice/IQPacketManager;->setRmq2Manager(Lcom/google/android/gtalkservice/rmq/Rmq2Manager;)V

    .line 403
    :cond_4
    if-eqz v3, :cond_5

    if-eqz v2, :cond_7

    .line 404
    :cond_5
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_6

    const-string v4, "init: use RMQ protocol"

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 405
    :cond_6
    new-instance v4, Lcom/google/android/gtalkservice/rmq/RmqManager;

    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lcom/google/android/gtalkservice/rmq/RmqManager;-><init>(Lcom/google/android/gtalkservice/PacketSender;Landroid/content/ContentResolver;)V

    iput-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 406
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    invoke-virtual {v4, v5}, Lcom/google/android/gtalkservice/IQPacketManager;->setRmqManager(Lcom/google/android/gtalkservice/rmq/RmqManager;)V

    .line 410
    :cond_7
    const-string v4, "GTalk"

    invoke-virtual {p0, v4, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->getImSessionForProvider(Ljava/lang/String;Z)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    .line 412
    .local v1, "imSession":Lcom/google/android/gtalkservice/IImSession;
    monitor-enter p0

    .line 413
    :try_start_0
    iput-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDefaultImSession:Lcom/google/android/gtalkservice/IImSession;

    .line 414
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 416
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_8

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "init: created defaultImSession "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDefaultImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 418
    :cond_8
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    invoke-virtual {v4, v5}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->init(Landroid/os/Handler;)V

    .line 420
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    monitor-enter v4

    .line 421
    :try_start_1
    new-instance v5, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;Lcom/google/android/gtalkservice/GTalkConnection$1;)V

    iput-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mCurrentConnectionCycle:Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    .line 422
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mCurrentConnectionCycle:Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 423
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 425
    invoke-virtual {p0, v8}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionState(I)V

    .line 426
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mTimeOfLastNetworkOutage:J

    .line 427
    invoke-virtual {p0, v8}, Lcom/google/android/gtalkservice/GTalkConnection;->resetReconnectionTimer(Z)V

    .line 428
    return-void

    .line 414
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 423
    :catchall_1
    move-exception v5

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v5
.end method

.method private internalGetImSessionByProviderId(J)Lcom/google/android/gtalkservice/IImSession;
    .locals 7
    .param p1, "serviceProviderId"    # J

    .prologue
    .line 2201
    const/4 v3, 0x0

    .line 2203
    .local v3, "retVal":Lcom/google/android/gtalkservice/IImSession;
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 2205
    :try_start_0
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mImSessions:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gtalkservice/service/ImSessionWrapper;

    .line 2206
    .local v4, "session":Lcom/google/android/gtalkservice/service/ImSessionWrapper;
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->getServiceProviderId()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2208
    .local v1, "providerId":J
    cmp-long v5, v1, p1

    if-nez v5, :cond_0

    .line 2211
    move-object v3, v4

    .line 2216
    .end local v1    # "providerId":J
    .end local v4    # "session":Lcom/google/android/gtalkservice/service/ImSessionWrapper;
    :cond_1
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 2219
    return-object v3

    .line 2216
    .end local v0    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v5
.end method

.method private lastConnectionWasOfMinimumDuration()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 517
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionDurations:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_0

    move v0, v4

    .line 518
    .end local p0    # "this":Lcom/google/android/gtalkservice/GTalkConnection;
    :goto_0
    return v0

    .restart local p0    # "this":Lcom/google/android/gtalkservice/GTalkConnection;
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionDurations:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/gtalkservice/GTalkConnection;
    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x78

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    move v0, v4

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 2402
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GTalkConnection."

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

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2403
    return-void
.end method

.method private logconn(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 2422
    const-string v0, "GTalkService/c"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GTalkConnection."

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

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2423
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 2414
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ERROR: GTalkConnection."

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

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2415
    return-void
.end method

.method private loge(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 2418
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ERROR: GTalkConnection."

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

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2419
    return-void
.end method

.method private logi(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 2406
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GTalkConnection."

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

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2407
    return-void
.end method

.method private logw(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 2410
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GTalkConnection."

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

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2411
    return-void
.end method

.method private postCrashMessage()V
    .locals 3

    .prologue
    .line 1752
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    const/16 v2, 0x3e8

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1753
    .local v0, "msg":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1754
    return-void
.end method

.method private reachedRetryThresholdForAuthExpiration()Z
    .locals 4

    .prologue
    .line 2723
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "gtalk_max_retries_for_auth_expired"

    const/4 v3, 0x3

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Gservices;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 2726
    .local v0, "threshold":I
    iget v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAuthExpiredCount:I

    if-lt v1, v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private requestBatchQuery(Z)V
    .locals 7
    .param p1, "online"    # Z

    .prologue
    .line 1303
    new-instance v1, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;-><init>()V

    .line 1305
    .local v1, "query":Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;
    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->setIsOnline(Z)V

    .line 1307
    if-nez p1, :cond_0

    .line 1308
    const/4 v5, 0x0

    invoke-virtual {p0, v1, v5}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;Z)Z

    .line 1365
    :goto_0
    return-void

    .line 1312
    :cond_0
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v2

    .line 1313
    .local v2, "rosterMgr":Lcom/google/android/gtalkservice/RosterManager;
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/RosterManager;->hasRequestedRoster()Z

    move-result v5

    if-nez v5, :cond_1

    .line 1314
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->setupOnlinePacketListeners()V

    .line 1316
    invoke-static {}, Lcom/google/android/gtalkservice/service/GTalkService;->isUserIdle()Z

    move-result v5

    invoke-virtual {v1, v5}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->setDeviceIdle(Z)V

    .line 1317
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/service/GTalkService;->getShowMobileIndicator()Z

    move-result v5

    invoke-virtual {v1, v5}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->setShowMobileIndicator(Z)V

    .line 1318
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/RosterManager;->getRosterEtag()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->setRosterEtag(Ljava/lang/String;)V

    .line 1319
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getOtrManager()Lcom/google/android/gtalkservice/OtrManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/OtrManager;->getOtrEtag()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->setOtrEtag(Ljava/lang/String;)V

    .line 1320
    const/4 v5, 0x2

    invoke-virtual {v1, v5}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->setSharedStatusVersion(I)V

    .line 1321
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->setVCardQUeryStanzaId(Ljava/lang/String;)V

    .line 1323
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getVCardManager()Lcom/google/android/gtalkservice/VCardMgr;

    move-result-object v4

    .line 1324
    .local v4, "vcardMgr":Lcom/google/android/gtalkservice/VCardMgr;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v3

    .line 1325
    .local v3, "username":Ljava/lang/String;
    invoke-virtual {v4, v3}, Lcom/google/android/gtalkservice/VCardMgr;->getStoredAvatarHashForContact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1326
    .local v0, "avatarHash":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->setAvatarHash(Ljava/lang/String;)V

    .line 1327
    invoke-virtual {v4, v3}, Lcom/google/android/gtalkservice/VCardMgr;->addToNotificationMap(Ljava/lang/String;)V

    .line 1329
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Lcom/google/android/gtalkservice/RosterManager;->setHasRequestedRoster(Z)V

    .line 1331
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v5

    new-instance v6, Lcom/google/android/gtalkservice/GTalkConnection$1;

    invoke-direct {v6, p0, v3, v4}, Lcom/google/android/gtalkservice/GTalkConnection$1;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;Lcom/google/android/gtalkservice/VCardMgr;)V

    invoke-virtual {v5, v1, v6}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;)V

    .line 1363
    .end local v0    # "avatarHash":Ljava/lang/String;
    .end local v3    # "username":Ljava/lang/String;
    .end local v4    # "vcardMgr":Lcom/google/android/gtalkservice/VCardMgr;
    :cond_1
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v5, :cond_2

    const-string v5, "requestBatchQuery: setConnectionState(ONLINE)"

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1364
    :cond_2
    const/4 v5, 0x4

    invoke-virtual {p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionState(I)V

    goto :goto_0
.end method

.method private requestRosterAndSendInitialPresence()V
    .locals 2

    .prologue
    .line 1377
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v0

    .line 1378
    .local v0, "rosterMgr":Lcom/google/android/gtalkservice/RosterManager;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/RosterManager;->hasRequestedRoster()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1379
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->setupOnlinePacketListeners()V

    .line 1381
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/RosterManager;->requestRoster()Z

    .line 1386
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->requestSharedPresence()V

    .line 1389
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendInitialPresence()V

    .line 1392
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ImSession;->loadVCard()V

    .line 1395
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getOtrManager()Lcom/google/android/gtalkservice/OtrManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/OtrManager;->queryStatus()V

    .line 1398
    :cond_0
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v1, :cond_1

    .line 1399
    const-string v1, "requestRosterAndSendInitialPresence: setConnectionState(ONLINE)"

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1401
    :cond_1
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionState(I)V

    .line 1402
    return-void
.end method

.method private requestSharedPresence()V
    .locals 2

    .prologue
    .line 1444
    new-instance v0, Lcom/google/android/gtalkservice/extensions/SharedStatus;

    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/extensions/SharedStatus;-><init>(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1445
    .local v0, "request":Lcom/google/android/gtalkservice/extensions/SharedStatus;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUserBareAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/extensions/SharedStatus;->setTo(Ljava/lang/String;)V

    .line 1447
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    const-string v1, "request shared presence status"

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1448
    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacketOverMcsConnection(Lorg/jivesoftware/smack/packet/Packet;)Z

    .line 1449
    return-void
.end method

.method private sendConnectionClosedMessage(II)V
    .locals 3
    .param p1, "connectionId"    # I
    .param p2, "error"    # I

    .prologue
    .line 1850
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    const/16 v2, 0x12c

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1851
    .local v0, "msg":Landroid/os/Message;
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1852
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 1853
    iput p1, v0, Landroid/os/Message;->arg2:I

    .line 1854
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1855
    return-void
.end method

.method private sendInitialPresence()V
    .locals 5

    .prologue
    .line 1420
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    .line 1421
    .local v0, "imSession":Lcom/google/android/gtalkservice/ImSession;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getIntendedPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v1

    .line 1422
    .local v1, "intendedPresence":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v2

    .line 1424
    .local v2, "isAvailable":Z
    new-instance v3, Lcom/google/android/gtalkservice/Presence;

    invoke-direct {v3}, Lcom/google/android/gtalkservice/Presence;-><init>()V

    .line 1425
    .local v3, "presence":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v3, v2}, Lcom/google/android/gtalkservice/Presence;->setAvailable(Z)V

    .line 1432
    if-eqz v2, :cond_0

    .line 1433
    invoke-static {}, Lcom/google/android/gtalkservice/service/GTalkService;->isUserIdle()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1434
    sget-object v4, Lcom/google/android/gtalkservice/Presence$Show;->AWAY:Lcom/google/android/gtalkservice/Presence$Show;

    invoke-virtual {v3, v4}, Lcom/google/android/gtalkservice/Presence;->setShow(Lcom/google/android/gtalkservice/Presence$Show;)V

    .line 1440
    :cond_0
    :goto_0
    invoke-virtual {v0, v3}, Lcom/google/android/gtalkservice/ImSession;->sendPresence(Lcom/google/android/gtalkservice/Presence;)V

    .line 1441
    return-void

    .line 1436
    :cond_1
    sget-object v4, Lcom/google/android/gtalkservice/Presence$Show;->NONE:Lcom/google/android/gtalkservice/Presence$Show;

    invoke-virtual {v3, v4}, Lcom/google/android/gtalkservice/Presence;->setShow(Lcom/google/android/gtalkservice/Presence$Show;)V

    goto :goto_0
.end method

.method private sendRosterRequestIfAsked()V
    .locals 2

    .prologue
    .line 1285
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ImSession;->getIntendedPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v0

    .line 1287
    .local v0, "intendedPresence":Lcom/google/android/gtalkservice/Presence;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1289
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->requestBatchQuery(Z)V

    .line 1300
    :goto_0
    return-void

    .line 1295
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->requestBatchQuery(Z)V

    goto :goto_0
.end method

.method private setConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 642
    monitor-enter p0

    .line 643
    :try_start_0
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 644
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 646
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 649
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    if-eqz v0, :cond_0

    .line 650
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 652
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->setRmq2Manager(Lcom/google/android/gtalkservice/rmq/Rmq2Manager;)V

    .line 654
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    if-eqz v0, :cond_1

    .line 655
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/rmq/RmqManager;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 657
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->setRmqManager(Lcom/google/android/gtalkservice/rmq/RmqManager;)V

    .line 659
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 660
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getDataMessageManager()Lcom/google/android/gtalkservice/DataMessageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/DataMessageManager;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 662
    :cond_2
    return-void

    .line 644
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private setJid(Ljava/lang/String;)V
    .locals 0
    .param p1, "jid"    # Ljava/lang/String;

    .prologue
    .line 673
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mJid:Ljava/lang/String;

    .line 674
    return-void
.end method

.method private setNodeProvider(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V
    .locals 4
    .param p1, "sdm"    # Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    .prologue
    .line 1954
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1956
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->getShowMobileIndicator()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1957
    const-string v2, "http://www.android.com/gtalk/client/caps"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1962
    :goto_0
    const/16 v2, 0x23

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1963
    const-string v2, "pmuc-v1"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1965
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1967
    .local v1, "node":Ljava/lang/String;
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setNodeProvider for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1968
    :cond_0
    new-instance v2, Lcom/google/android/gtalkservice/GTalkConnection$2;

    invoke-direct {v2, p0}, Lcom/google/android/gtalkservice/GTalkConnection$2;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;)V

    invoke-virtual {p1, v1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->setNodeInformationProvider(Ljava/lang/String;Lorg/jivesoftware/smackx/NodeInformationProvider;)V

    .line 1973
    return-void

    .line 1959
    .end local v1    # "node":Ljava/lang/String;
    :cond_1
    const-string v2, "http://www.android.com/gtalk/client/caps2"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private setReconnectAlarm()V
    .locals 7

    .prologue
    const-wide/16 v5, 0x2

    const-string v0, "com.google.android.intent.action.GTALK_RECONNECT"

    .line 960
    monitor-enter p0

    .line 961
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSet:Z

    if-eqz v0, :cond_1

    .line 962
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    const-string v0, "setReconnectAlarm: alarm already set"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 963
    :cond_0
    monitor-exit p0

    .line 1010
    :goto_0
    return-void

    .line 966
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmIntent:Landroid/content/Intent;

    if-nez v0, :cond_3

    .line 967
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_2

    const-string v0, "setReconnectAlarm: initialize alarm intents"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 968
    :cond_2
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectReceiver:Lcom/google/android/gtalkservice/GTalkConnection$ReconnectReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "com.google.android.intent.action.GTALK_RECONNECT"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 971
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.intent.action.GTALK_RECONNECT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmIntent:Landroid/content/Intent;

    .line 972
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmIntent:Landroid/content/Intent;

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSender:Landroid/app/PendingIntent;

    .line 983
    :cond_3
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastConnectionAttemptSuccessful:Z

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->lastConnectionWasOfMinimumDuration()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 984
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_4

    .line 985
    const-string v0, "setReconnectAlarm: resetting connection timer because the last connection attempt was successful and of minimum duration"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 990
    :cond_4
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->resetReconnectionTimer(Z)V

    .line 993
    :cond_5
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setReconnectAlarm: retry in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectDelay:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ms"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 996
    :cond_6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectDelay:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectTime:J

    .line 998
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAlarmManager:Landroid/app/AlarmManager;

    const/4 v1, 0x2

    iget-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectTime:J

    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSender:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 1002
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectAlarmSet:Z

    .line 1005
    iget-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectDelay:J

    mul-long/2addr v0, v5

    iget-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mMaxReconnectDelay:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_7

    .line 1006
    iget-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectDelay:J

    mul-long/2addr v0, v5

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectDelay:J

    .line 1009
    :cond_7
    monitor-exit p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private setServerAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 682
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mServerAddress:Ljava/lang/String;

    .line 683
    return-void
.end method

.method private setUserBareAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 691
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mUserBareAddress:Ljava/lang/String;

    .line 692
    return-void
.end method

.method private setupOnlinePacketListeners()V
    .locals 2

    .prologue
    .line 1405
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    .line 1407
    .local v0, "connection":Lorg/jivesoftware/smack/XMPPConnection;
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gtalkservice/RosterManager;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1408
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getSubscriptionManager()Lcom/google/android/gtalkservice/SubscriptionManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gtalkservice/SubscriptionManager;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1409
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getOtrManager()Lcom/google/android/gtalkservice/OtrManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gtalkservice/OtrManager;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1410
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getVCardManager()Lcom/google/android/gtalkservice/VCardMgr;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gtalkservice/VCardMgr;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1411
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gtalkservice/ImSession;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1412
    return-void
.end method

.method private shouldUploadHeartbeatStat()Z
    .locals 1

    .prologue
    .line 1469
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    if-eqz v0, :cond_0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private startHeartbeatAlarm(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 1040
    monitor-enter p0

    .line 1041
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    if-eqz v0, :cond_0

    .line 1043
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->setConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1044
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->startAlarm()V

    .line 1045
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->setHeartbeatAlarm(Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;)V

    .line 1047
    :cond_0
    monitor-exit p0

    .line 1048
    return-void

    .line 1047
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private translateXMPPError(Lorg/jivesoftware/smack/packet/XMPPError;)I
    .locals 3
    .param p1, "xmppError"    # Lorg/jivesoftware/smack/packet/XMPPError;

    .prologue
    .line 1201
    const/4 v0, 0x0

    .line 1202
    .local v0, "error":I
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/XMPPError;->getCode()I

    move-result v1

    .line 1204
    .local v1, "errorCode":I
    if-eqz v1, :cond_0

    .line 1205
    const/16 v2, 0x190

    if-lt v1, v2, :cond_2

    const/16 v2, 0x197

    if-gt v1, v2, :cond_2

    .line 1209
    instance-of v2, p1, Lcom/google/android/gtalkservice/GTalkConnection$MissingAuthTokenError;

    if-eqz v2, :cond_1

    .line 1210
    const/4 v0, 0x4

    .line 1225
    :cond_0
    :goto_0
    return v0

    .line 1212
    :cond_1
    const/4 v0, 0x5

    goto :goto_0

    .line 1214
    :cond_2
    const/16 v2, 0x1f6

    if-eq v1, v2, :cond_3

    const/16 v2, 0x1f8

    if-ne v1, v2, :cond_4

    .line 1215
    :cond_3
    const/4 v0, 0x7

    goto :goto_0

    .line 1217
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUpdatedNetworkAvailable()Z

    move-result v2

    if-nez v2, :cond_5

    .line 1218
    const/4 v0, 0x1

    goto :goto_0

    .line 1220
    :cond_5
    const/4 v0, 0x2

    goto :goto_0
.end method

.method private updateAuthErrorStats(I)V
    .locals 1
    .param p1, "error"    # I

    .prologue
    .line 2715
    const/4 v0, 0x5

    if-ne p1, v0, :cond_1

    .line 2716
    iget v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAuthExpiredCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAuthExpiredCount:I

    .line 2720
    :cond_0
    :goto_0
    return-void

    .line 2717
    :cond_1
    if-nez p1, :cond_0

    .line 2718
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAuthExpiredCount:I

    goto :goto_0
.end method


# virtual methods
.method public acquireAsyncWakeLock()V
    .locals 4

    .prologue
    .line 499
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAsyncConnWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v0

    .line 500
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAsyncConnWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 501
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 503
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mClearWakeLockTimer:Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;

    const-wide/32 v2, 0x11170

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 504
    return-void

    .line 501
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public acquireSimpleWakeLock()V
    .locals 1

    .prologue
    .line 485
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSimpleWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 486
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugWakeLock:Z

    if-eqz v0, :cond_0

    .line 487
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSimpleWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 489
    :cond_0
    return-void
.end method

.method public addConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V
    .locals 2
    .param p1, "e"    # Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;

    .prologue
    .line 2694
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "addConnectionEvent "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 2696
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    monitor-enter v0

    .line 2697
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mCurrentConnectionCycle:Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->appendConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V

    .line 2698
    monitor-exit v0

    .line 2699
    return-void

    .line 2698
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public addDelayedLoginCallback(Lcom/google/android/gtalkservice/DelayedLogin;)V
    .locals 1
    .param p1, "callback"    # Lcom/google/android/gtalkservice/DelayedLogin;

    .prologue
    .line 1229
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDelayedLoginCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1230
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDelayedLoginCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1232
    :cond_0
    return-void
.end method

.method public asyncUpdateAccountStatus()V
    .locals 3

    .prologue
    .line 626
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mWorkerHandler:Landroid/os/Handler;

    const/16 v2, 0x190

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 627
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mWorkerHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 628
    return-void
.end method

.method public clearStats()V
    .locals 1

    .prologue
    .line 2104
    monitor-enter p0

    .line 2105
    const/4 v0, 0x0

    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsMade:Ljava/lang/Integer;

    .line 2106
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsAttempted:Ljava/lang/Integer;

    .line 2107
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionDurations:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->clear()V

    .line 2108
    monitor-exit p0

    .line 2109
    return-void

    .line 2108
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public connect()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 894
    invoke-static {}, Lcom/google/android/gtalkservice/LogTag;->queryLoggingLevel()V

    .line 897
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->cancelReconnectAlarm()V

    .line 899
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastConnectAttemptTs:J

    .line 903
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 904
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v1, :cond_0

    const-string v1, "connect: first close existing connection!"

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 905
    :cond_0
    invoke-virtual {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    .line 906
    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->closeConnection(Z)V

    .line 911
    :cond_1
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionState(I)V

    .line 913
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUpdatedNetworkAvailable()Z

    move-result v1

    if-nez v1, :cond_3

    .line 914
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v1, :cond_2

    .line 915
    const-string v1, "connect: network unavailable, set state=PENDING, err=NO_NETWORK"

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 926
    :cond_2
    invoke-virtual {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    .line 927
    invoke-virtual {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionState(I)V

    move v1, v3

    .line 942
    :goto_0
    return v1

    .line 931
    :cond_3
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-nez v1, :cond_4

    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebugWakeLock:Z

    if-eqz v1, :cond_5

    .line 932
    :cond_4
    const-string v1, "connect: acquire wakelock, async connect..."

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 937
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->acquireAsyncWakeLock()V

    .line 939
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mWorkerHandler:Landroid/os/Handler;

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 940
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mWorkerHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    move v1, v4

    .line 942
    goto :goto_0
.end method

.method public connectionClosed(I)V
    .locals 1
    .param p1, "connectionId"    # I

    .prologue
    .line 1846
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendConnectionClosedMessage(II)V

    .line 1847
    return-void
.end method

.method public connectionClosed(IIZ)V
    .locals 1
    .param p1, "connectionId"    # I
    .param p2, "error"    # I
    .param p3, "notify"    # Z

    .prologue
    .line 1060
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->connectionClosed(IIZZ)V

    .line 1061
    return-void
.end method

.method public connectionClosed(IIZZ)V
    .locals 4
    .param p1, "connectionId"    # I
    .param p2, "error"    # I
    .param p3, "notify"    # Z
    .param p4, "allowRetry"    # Z

    .prologue
    const/4 v2, 0x0

    .line 1081
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->acquireSimpleWakeLock()V

    .line 1084
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    .line 1085
    .local v0, "connection":Lorg/jivesoftware/smack/XMPPConnection;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPConnection;->getLocalConnectionId()I

    move-result v2

    move v1, v2

    .line 1086
    .local v1, "newConnectionId":I
    :goto_0
    if-eq p1, v1, :cond_2

    .line 1087
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v2, :cond_0

    .line 1088
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "connectionClosed called for old conn(id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "), new connection id is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", ignore"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1128
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseSimpleWakeLock()V

    .line 1130
    :goto_1
    return-void

    .end local v1    # "newConnectionId":I
    :cond_1
    move v1, v2

    .line 1085
    goto :goto_0

    .line 1094
    .restart local v1    # "newConnectionId":I
    :cond_2
    :try_start_1
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v2, :cond_3

    .line 1095
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "connectionClosed: connId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", error="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Lcom/google/android/gtalkservice/ConnectionError;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1100
    :cond_3
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1104
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/RosterManager;->clearRosterFetchFlags()V

    .line 1106
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->clearHeartbeatAlarm()V

    .line 1108
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->addConnectionDuration()V

    .line 1109
    invoke-direct {p0, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->addConnectionClosedEvent(I)V

    .line 1111
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isSessionOpen()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-static {p2}, Lcom/google/android/gtalkservice/ConnectionError;->isAuthenticationError(I)Z

    move-result v2

    if-nez v2, :cond_5

    if-eqz p4, :cond_5

    .line 1112
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->retryConnection(Z)V

    .line 1120
    :goto_2
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/ChatMgr;->rejoinRoomsForGroupChats()V

    .line 1122
    if-eqz p3, :cond_4

    .line 1123
    invoke-direct {p0, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->broadcastDisconnected(I)V

    .line 1126
    :cond_4
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionStartTime:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1128
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseSimpleWakeLock()V

    goto :goto_1

    .line 1114
    :cond_5
    const/4 v2, 0x0

    :try_start_2
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionState(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 1128
    .end local v0    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .end local v1    # "newConnectionId":I
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseSimpleWakeLock()V

    throw v2
.end method

.method public connectionClosedOnError(ILjava/lang/Exception;)V
    .locals 9
    .param p1, "connectionId"    # I
    .param p2, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 1789
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v7, :cond_0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "connectionClosedOnError: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1791
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v2

    .line 1795
    .local v2, "error":I
    const/4 v7, 0x1

    if-eq v2, v7, :cond_3

    const/4 v7, 0x6

    if-eq v2, v7, :cond_3

    const/4 v7, 0x5

    if-eq v2, v7, :cond_3

    .line 1798
    instance-of v7, p2, Lorg/jivesoftware/smack/XMPPException;

    if-eqz v7, :cond_5

    .line 1799
    move-object v0, p2

    check-cast v0, Lorg/jivesoftware/smack/XMPPException;

    move-object v6, v0

    .line 1800
    .local v6, "xmppEx":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPException;->getXMPPError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    .line 1801
    .local v5, "xmppError":Lorg/jivesoftware/smack/packet/XMPPError;
    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPException;->getWrappedThrowable()Ljava/lang/Throwable;

    move-result-object v3

    .line 1803
    .local v3, "ex":Ljava/lang/Throwable;
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v7, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "connectionClosedOnError: xmppError = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", ex="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1806
    :cond_1
    if-eqz v5, :cond_4

    .line 1807
    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection;->translateXMPPError(Lorg/jivesoftware/smack/packet/XMPPError;)I

    move-result v2

    .line 1825
    .end local v3    # "ex":Ljava/lang/Throwable;
    .end local v5    # "xmppError":Lorg/jivesoftware/smack/packet/XMPPError;
    .end local v6    # "xmppEx":Lorg/jivesoftware/smack/XMPPException;
    :cond_2
    :goto_0
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    .line 1832
    :cond_3
    invoke-direct {p0, p1, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->sendConnectionClosedMessage(II)V

    .line 1833
    return-void

    .line 1809
    .restart local v3    # "ex":Ljava/lang/Throwable;
    .restart local v5    # "xmppError":Lorg/jivesoftware/smack/packet/XMPPError;
    .restart local v6    # "xmppEx":Lorg/jivesoftware/smack/XMPPException;
    :cond_4
    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPException;->getStreamError()Lorg/jivesoftware/smack/packet/StreamError;

    move-result-object v4

    .line 1810
    .local v4, "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    if-eqz v4, :cond_2

    .line 1811
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/StreamError;->getCode()Ljava/lang/String;

    move-result-object v1

    .line 1812
    .local v1, "code":Ljava/lang/String;
    const-string v7, "host-unknown"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1813
    const/4 v2, 0x3

    goto :goto_0

    .line 1817
    .end local v1    # "code":Ljava/lang/String;
    .end local v3    # "ex":Ljava/lang/Throwable;
    .end local v4    # "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    .end local v5    # "xmppError":Lorg/jivesoftware/smack/packet/XMPPError;
    .end local v6    # "xmppEx":Lorg/jivesoftware/smack/XMPPException;
    :cond_5
    instance-of v7, p2, Ljava/io/IOException;

    if-nez v7, :cond_6

    instance-of v7, p2, Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;

    if-eqz v7, :cond_7

    .line 1819
    :cond_6
    const/4 v2, 0x2

    goto :goto_0

    .line 1822
    :cond_7
    const/16 v2, 0xa

    goto :goto_0
.end method

.method public connectionEstablished()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const-string v5, "connectionEstablished: release wakelock"

    .line 1869
    :try_start_0
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    const-string v3, "connectionEstablished"

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1871
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    .line 1873
    .local v0, "connection":Lorg/jivesoftware/smack/XMPPConnection;
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->checkConnection()V

    .line 1875
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionStartTime:J

    .line 1876
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->bumpConnectionCount()V

    .line 1878
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPConnection;->getServiceName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->setServerAddress(Ljava/lang/String;)V

    .line 1880
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v1

    .line 1881
    .local v1, "connectionUser":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->setJid(Ljava/lang/String;)V

    .line 1882
    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->setUserBareAddress(Ljava/lang/String;)V

    .line 1885
    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1886
    .local v2, "resource":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/google/android/gtalkservice/service/GTalkService;->setJidResource(Ljava/lang/String;)V

    .line 1888
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastConnectionAttemptSuccessful:Z

    .line 1889
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->broadcastConnected(Ljava/lang/String;)V

    .line 1895
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/google/android/gtalkservice/IQPacketManager;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1896
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getHttpResponseManager()Lcom/google/android/gtalkservice/HttpResponseManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/google/android/gtalkservice/HttpResponseManager;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1932
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->checkConnection()V

    .line 1935
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v3, :cond_1

    const-string v3, "connectionEstablished: sendRosterRequestIfAsked"

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 1936
    :cond_1
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendRosterRequestIfAsked()V

    .line 1939
    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->callDelayedLoginCallbacks(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1943
    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->startHeartbeatAlarm(Lorg/jivesoftware/smack/XMPPConnection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1948
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebugWakeLock:Z

    if-eqz v3, :cond_2

    const-string v3, "connectionEstablished: release wakelock"

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1949
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseAsyncWakeLock()V

    .line 1951
    return-void

    .line 1948
    .end local v0    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    .end local v1    # "connectionUser":Ljava/lang/String;
    .end local v2    # "resource":Ljava/lang/String;
    :catchall_0
    move-exception v3

    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebugWakeLock:Z

    if-eqz v4, :cond_3

    const-string v4, "connectionEstablished: release wakelock"

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1949
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseAsyncWakeLock()V

    throw v3
.end method

.method public dump(Ljava/io/PrintWriter;)V
    .locals 22
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 2295
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Host: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gtalkservice/Account;->getHost()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object/from16 v18, v0

    if-eqz v18, :cond_3

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, " ("

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/XMPPConnection;->getHostIpAddress()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ")"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    :goto_0
    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2297
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Port: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gtalkservice/Account;->getPort()I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2299
    const-string v17, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2300
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "JID: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getJid()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2301
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Device ID: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gtalkservice/Account;->getDeviceId()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2303
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v4

    .line 2305
    .local v4, "connected":Z
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Session: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isSessionOpen()Z

    move-result v18

    if-eqz v18, :cond_4

    const-string v18, "open"

    :goto_1
    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2306
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Connected: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2307
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v10

    .line 2309
    .local v10, "imSession":Lcom/google/android/gtalkservice/ImSession;
    if-eqz v10, :cond_0

    .line 2310
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Connection state: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/ImSession;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gtalkservice/ConnectionState;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2311
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "connection error: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/ImSession;->getConnectionError()Lcom/google/android/gtalkservice/ConnectionError;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gtalkservice/ConnectionError;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2312
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Presence: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/ImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gtalkservice/Presence;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2313
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Intended presence: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/ImSession;->getIntendedPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/gtalkservice/Presence;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2315
    invoke-virtual {v10}, Lcom/google/android/gtalkservice/ImSession;->getSharedPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v14

    .line 2316
    .local v14, "p":Lcom/google/android/gtalkservice/Presence;
    if-eqz v14, :cond_0

    .line 2317
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Save shared presence: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v14}, Lcom/google/android/gtalkservice/Presence;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2321
    .end local v14    # "p":Lcom/google/android/gtalkservice/Presence;
    :cond_0
    const-string v17, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2322
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Last network state notification: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkType:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkState:Landroid/net/NetworkInfo$State;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2324
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Last network available: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastNetworkAvailable:Z

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2325
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Current network available: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isNetworkAvailable()Z

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2327
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    .line 2328
    .local v12, "now":J
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Last network state notification time: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastNetworkStateChangedTs:J

    move-wide/from16 v18, v0

    sub-long v18, v12, v18

    const-wide/16 v20, 0x3e8

    div-long v18, v18, v20

    invoke-static/range {v18 .. v19}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " ago"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2330
    const-string v17, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2331
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Last connect attempt time: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastConnectAttemptTs:J

    move-wide/from16 v18, v0

    sub-long v18, v12, v18

    const-wide/16 v20, 0x3e8

    div-long v18, v18, v20

    invoke-static/range {v18 .. v19}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " ago"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2334
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectTime:J

    move-wide/from16 v17, v0

    sub-long v5, v17, v12

    .line 2335
    .local v5, "diff":J
    const-wide/16 v17, 0x0

    cmp-long v17, v5, v17

    if-lez v17, :cond_5

    .line 2336
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Next reconnect alarm will trigger in "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-wide/16 v18, 0x3e8

    div-long v18, v5, v18

    invoke-static/range {v18 .. v19}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2342
    :goto_2
    const-string v17, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2343
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "ClearWakeLockTimer fired count: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mClearWakeLockTimerFiredCount:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2344
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Connections made/attempts: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getNumberOfConnectionsMade()Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x2f

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getNumberOfConnectionsAttempted()Ljava/lang/Integer;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2347
    if-eqz v4, :cond_1

    .line 2348
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Connection uptime: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionUptime()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2350
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Last server activity: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getLastActivityFromServerTime()J

    move-result-wide v18

    sub-long v18, v12, v18

    const-wide/16 v20, 0x3e8

    div-long v18, v18, v20

    invoke-static/range {v18 .. v19}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2353
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Last device activity: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getLastActivityToServerTime()J

    move-result-wide v18

    sub-long v18, v12, v18

    const-wide/16 v20, 0x3e8

    div-long v18, v18, v20

    invoke-static/range {v18 .. v19}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2358
    :cond_1
    const-string v17, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2359
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    move-object/from16 v17, v0

    if-eqz v17, :cond_2

    .line 2360
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->dump(Ljava/io/PrintWriter;)V

    .line 2363
    :cond_2
    const-string v17, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2364
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastDataMessageReceivedTs:J

    move-wide/from16 v17, v0

    const-wide/16 v19, 0x0

    cmp-long v17, v17, v19

    if-eqz v17, :cond_6

    .line 2365
    new-instance v11, Landroid/text/format/Time;

    invoke-direct {v11}, Landroid/text/format/Time;-><init>()V

    .line 2366
    .local v11, "lastDataMessageReceived":Landroid/text/format/Time;
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastDataMessageReceivedTs:J

    move-wide/from16 v17, v0

    move-object v0, v11

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Landroid/text/format/Time;->set(J)V

    .line 2368
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastDataMessageReceivedTs:J

    move-wide/from16 v19, v0

    sub-long v17, v17, v19

    const-wide/16 v19, 0x3e8

    div-long v15, v17, v19

    .line 2369
    .local v15, "timeElapsed":J
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Last data msg received at "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "%H:%M:%S"

    move-object v0, v11

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/text/format/Time;->format(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " ("

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-static/range {v15 .. v16}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " ago)"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2375
    .end local v11    # "lastDataMessageReceived":Landroid/text/format/Time;
    .end local v15    # "timeElapsed":J
    :goto_3
    const-string v17, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2376
    const-string v17, "Connection History"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2377
    const-string v17, "------------------"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2379
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    monitor-enter v17

    .line 2380
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    neg-int v0, v0

    move/from16 v18, v0

    add-int/lit8 v7, v18, 0x1

    .line 2381
    .local v7, "i":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionHistory:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    move v8, v7

    .end local v7    # "i":I
    .local v8, "i":I
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;

    .line 2382
    .local v3, "clc":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "conn #("

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "i":I
    .restart local v7    # "i":I
    move-object/from16 v0, v18

    move v1, v8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "):"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2383
    move-object v0, v3

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->dump(Ljava/io/PrintWriter;)V

    .line 2384
    const-string v18, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v8, v7

    .end local v7    # "i":I
    .restart local v8    # "i":I
    goto :goto_4

    .line 2295
    .end local v3    # "clc":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;
    .end local v4    # "connected":Z
    .end local v5    # "diff":J
    .end local v8    # "i":I
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v10    # "imSession":Lcom/google/android/gtalkservice/ImSession;
    .end local v12    # "now":J
    :cond_3
    const-string v18, ""

    goto/16 :goto_0

    .line 2305
    .restart local v4    # "connected":Z
    :cond_4
    const-string v18, "closed"

    goto/16 :goto_1

    .line 2339
    .restart local v5    # "diff":J
    .restart local v10    # "imSession":Lcom/google/android/gtalkservice/ImSession;
    .restart local v12    # "now":J
    :cond_5
    const-string v17, "No reconnect alarm set"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 2372
    :cond_6
    const-string v17, "Never received a data msg!"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 2386
    .restart local v8    # "i":I
    .restart local v9    # "i$":Ljava/util/Iterator;
    :cond_7
    :try_start_1
    monitor-exit v17
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2388
    const-string v17, "GTalkService"

    const/16 v18, 0x2

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 2389
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object/from16 v17, v0

    if-eqz v17, :cond_8

    .line 2390
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->dump(Ljava/io/PrintWriter;)V

    .line 2393
    :cond_8
    return-void

    .line 2386
    .end local v8    # "i":I
    .end local v9    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v18

    :try_start_2
    monitor-exit v17
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v18
.end method

.method public getAccount()Lcom/google/android/gtalkservice/Account;
    .locals 1

    .prologue
    .line 435
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    return-object v0
.end method

.method public getAccountId()J
    .locals 2

    .prologue
    .line 1197
    iget-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccountId:J

    return-wide v0
.end method

.method public getConnection()Lorg/jivesoftware/smack/XMPPConnection;
    .locals 1

    .prologue
    .line 636
    monitor-enter p0

    .line 637
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    monitor-exit p0

    return-object v0

    .line 638
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getConnectionDurationAverage()Ljava/lang/Integer;
    .locals 8

    .prologue
    .line 2050
    const-wide/16 v0, 0x0

    .line 2052
    .local v0, "avg":J
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionDurations:Ljava/util/Vector;

    monitor-enter v5

    .line 2053
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionDurations:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v3

    .line 2054
    .local v3, "size":I
    if-eqz v3, :cond_1

    .line 2055
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 2056
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionDurations:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v0, v6

    .line 2055
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2058
    :cond_0
    int-to-long v6, v3

    div-long/2addr v0, v6

    .line 2060
    .end local v2    # "i":I
    :cond_1
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2062
    long-to-int v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    return-object v4

    .line 2060
    .end local v3    # "size":I
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4
.end method

.method public getConnectionError()I
    .locals 1

    .prologue
    .line 726
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getConnectionError()Lcom/google/android/gtalkservice/ConnectionError;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ConnectionError;->getError()I

    move-result v0

    return v0
.end method

.method public getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;
    .locals 1

    .prologue
    .line 713
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionUptime()I
    .locals 4

    .prologue
    .line 2071
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2072
    const/4 v0, 0x0

    .line 2075
    :goto_0
    return v0

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionStartTime:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    div-int/lit16 v0, v0, 0x3e8

    goto :goto_0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 477
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getDefaultImSession()Lcom/google/android/gtalkservice/IImSession;
    .locals 1

    .prologue
    .line 2223
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDefaultImSession:Lcom/google/android/gtalkservice/IImSession;

    return-object v0
.end method

.method public getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;
    .locals 1

    .prologue
    .line 2227
    iget-object p0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDefaultImSession:Lcom/google/android/gtalkservice/IImSession;

    .end local p0    # "this":Lcom/google/android/gtalkservice/GTalkConnection;
    check-cast p0, Lcom/google/android/gtalkservice/service/ImSessionWrapper;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->getSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    return-object v0
.end method

.method public getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;
    .locals 1

    .prologue
    .line 550
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mGTalkServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v0

    return-object v0
.end method

.method public getHeartbeatStat()Lorg/jivesoftware/smack/packet/HeartbeatStat;
    .locals 1

    .prologue
    .line 431
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

    return-object v0
.end method

.method public getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;
    .locals 7
    .param p1, "accountId"    # J

    .prologue
    .line 2148
    const-wide/16 v5, 0x0

    cmp-long v5, p1, v5

    if-gtz v5, :cond_0

    .line 2149
    const/4 v5, 0x0

    .line 2168
    :goto_0
    return-object v5

    .line 2152
    :cond_0
    const/4 v3, 0x0

    .line 2154
    .local v3, "retVal":Lcom/google/android/gtalkservice/IImSession;
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 2156
    :try_start_0
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mImSessions:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gtalkservice/service/ImSessionWrapper;

    .line 2157
    .local v4, "session":Lcom/google/android/gtalkservice/service/ImSessionWrapper;
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->getAccountId()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2159
    .local v1, "id":J
    cmp-long v5, v1, p1

    if-nez v5, :cond_1

    .line 2160
    move-object v3, v4

    .line 2165
    .end local v1    # "id":J
    .end local v4    # "session":Lcom/google/android/gtalkservice/service/ImSessionWrapper;
    :cond_2
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v5, v3

    .line 2168
    goto :goto_0

    .line 2165
    .end local v0    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v5
.end method

.method public getImSessionForProvider(Ljava/lang/String;Z)Lcom/google/android/gtalkservice/IImSession;
    .locals 4
    .param p1, "providerName"    # Ljava/lang/String;
    .param p2, "createIfNotExist"    # Z

    .prologue
    .line 2116
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getImSessionForProvider "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 2118
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-static {v2, p1}, Landroid/provider/Im$Provider;->getProviderIdForName(Landroid/content/ContentResolver;Ljava/lang/String;)J

    move-result-wide v0

    .line 2122
    .local v0, "providerId":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    .line 2123
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getImSessionForProvider called with unsupported provider "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->loge(Ljava/lang/String;)V

    .line 2124
    const/4 v2, 0x0

    .line 2127
    :goto_0
    return-object v2

    :cond_1
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/google/android/gtalkservice/GTalkConnection;->getImSession(Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v2

    goto :goto_0
.end method

.method public getImSessionForProviderId(JZ)Lcom/google/android/gtalkservice/IImSession;
    .locals 3
    .param p1, "providerId"    # J
    .param p3, "createIfNotExist"    # Z

    .prologue
    .line 2132
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-gtz v1, :cond_0

    .line 2133
    const/4 v1, 0x0

    .line 2141
    :goto_0
    return-object v1

    .line 2136
    :cond_0
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getImSessionForProviderId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 2138
    :cond_1
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1, p1, p2}, Landroid/provider/Im$Provider;->getProviderNameForId(Landroid/content/ContentResolver;J)Ljava/lang/String;

    move-result-object v0

    .line 2141
    .local v0, "providerName":Ljava/lang/String;
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/google/android/gtalkservice/GTalkConnection;->getImSession(Ljava/lang/String;JZ)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    goto :goto_0
.end method

.method public getJid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 669
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mJid:Ljava/lang/String;

    return-object v0
.end method

.method public getLastActivityFromServerTime()J
    .locals 2

    .prologue
    .line 2083
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    if-nez v0, :cond_1

    .line 2084
    :cond_0
    const-wide/16 v0, -0x1

    .line 2086
    :goto_0
    return-wide v0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPConnection;->getLastActivityFromServerTime()J

    move-result-wide v0

    goto :goto_0
.end method

.method public getLastActivityToServerTime()J
    .locals 2

    .prologue
    .line 2094
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    if-nez v0, :cond_1

    .line 2095
    :cond_0
    const-wide/16 v0, -0x1

    .line 2097
    :goto_0
    return-wide v0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPConnection;->getLastActivityToServerTime()J

    move-result-wide v0

    goto :goto_0
.end method

.method public getLastBroadcastNetworkType()I
    .locals 1

    .prologue
    .line 554
    iget v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkType:I

    return v0
.end method

.method public getNumberOfConnectionsAttempted()Ljava/lang/Integer;
    .locals 3

    .prologue
    .line 2036
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsAttempted:Ljava/lang/Integer;

    monitor-enter v1

    .line 2037
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsAttempted:Ljava/lang/Integer;

    .line 2038
    .local v0, "numConnections":Ljava/lang/Integer;
    monitor-exit v1

    .line 2039
    return-object v0

    .line 2038
    .end local v0    # "numConnections":Ljava/lang/Integer;
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getNumberOfConnectionsMade()Ljava/lang/Integer;
    .locals 3

    .prologue
    .line 2028
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsMade:Ljava/lang/Integer;

    monitor-enter v1

    .line 2029
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNumConnectionsMade:Ljava/lang/Integer;

    .line 2030
    .local v0, "numConnections":Ljava/lang/Integer;
    monitor-exit v1

    .line 2031
    return-object v0

    .line 2030
    .end local v0    # "numConnections":Ljava/lang/Integer;
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getPresence()Lcom/google/android/gtalkservice/Presence;
    .locals 1

    .prologue
    .line 1257
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mPresence:Lcom/google/android/gtalkservice/Presence;

    return-object v0
.end method

.method getServerAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 678
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mServerAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .locals 1

    .prologue
    .line 481
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    return-object v0
.end method

.method public getUpdatedNetworkAvailable()Z
    .locals 1

    .prologue
    .line 795
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isNetworkAvailable()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastNetworkAvailable:Z

    .line 796
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastNetworkAvailable:Z

    return v0
.end method

.method getUserBareAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 687
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mUserBareAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 665
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mUserBareAddress:Ljava/lang/String;

    return-object v0
.end method

.method public heartbeatSettingsChanged(Lcom/google/android/gtalkservice/Account;)V
    .locals 1
    .param p1, "newAccount"    # Lcom/google/android/gtalkservice/Account;

    .prologue
    .line 561
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/Account;->copyHeartbeatSettings(Lcom/google/android/gtalkservice/Account;)V

    .line 563
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_0

    .line 564
    const-string v0, "heartbeatSettingsChanged: copy heartbeat config"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 565
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 567
    :cond_0
    return-void
.end method

.method public isConnected()Z
    .locals 2

    .prologue
    .line 721
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    .line 722
    .local v0, "connection":Lorg/jivesoftware/smack/XMPPConnection;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isNetworkAvailable()Z
    .locals 7

    .prologue
    .line 800
    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v5}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v4

    .line 801
    .local v4, "networks":[Landroid/net/NetworkInfo;
    move-object v0, v4

    .local v0, "arr$":[Landroid/net/NetworkInfo;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 802
    .local v3, "network":Landroid/net/NetworkInfo;
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v5

    sget-object v6, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v5, v6, :cond_0

    .line 803
    const/4 v5, 0x1

    .line 807
    .end local v3    # "network":Landroid/net/NetworkInfo;
    :goto_1
    return v5

    .line 801
    .restart local v3    # "network":Landroid/net/NetworkInfo;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 807
    .end local v3    # "network":Landroid/net/NetworkInfo;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public isSessionOpen()Z
    .locals 1

    .prologue
    .line 811
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mOpened:Z

    return v0
.end method

.method public login()V
    .locals 6

    .prologue
    const/4 v4, 0x1

    .line 570
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v2, :cond_0

    const-string v2, "login"

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 571
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 573
    .local v0, "now":J
    new-instance v2, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;-><init>(I)V

    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->addConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V

    .line 577
    invoke-static {v4}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 579
    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastLoginAttemptTimeStamp:J

    .line 582
    iput-boolean v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mOpened:Z

    .line 584
    iget-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastLoginAttemptTimeStamp:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    .line 585
    iget-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastLoginAttemptTimeStamp:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    .line 586
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_1

    const-string v2, "too many login attempts, delay connecting"

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->logw(Ljava/lang/String;)V

    .line 587
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->retryConnection(Z)V

    .line 593
    :goto_0
    return-void

    .line 592
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->connect()Z

    goto :goto_0
.end method

.method public logout()V
    .locals 3

    .prologue
    .line 597
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v1, :cond_0

    const-string v1, "logout: clear alarms & send msg to async logout."

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 599
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->clearReconnectAlarm()V

    .line 600
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->clearHeartbeatAlarm()V

    .line 602
    new-instance v1, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;-><init>(I)V

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->addConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V

    .line 606
    const/4 v1, 0x2

    invoke-static {v1}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 608
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mWorkerHandler:Landroid/os/Handler;

    const/16 v2, 0xc8

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 609
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mWorkerHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 614
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionWrapper:Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/service/GTalkService;->removeConnection(Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;)V

    .line 615
    return-void
.end method

.method public logoutIfNotUsed()V
    .locals 4

    .prologue
    .line 2236
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    const-string v2, "logoutIfNotUsed"

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 2239
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 2241
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mImSessions:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/service/ImSessionWrapper;

    .line 2242
    .local v1, "session":Lcom/google/android/gtalkservice/service/ImSessionWrapper;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/ImSessionWrapper;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/ConnectionState;->isOnline()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2243
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_2

    .line 2244
    const-string v2, "logoutIfNotUsed: found online session(s), bail"

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2250
    :cond_2
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 2261
    .end local v1    # "session":Lcom/google/android/gtalkservice/service/ImSessionWrapper;
    :cond_3
    :goto_0
    return-void

    .line 2250
    :cond_4
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 2255
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->autoConnect()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2256
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_3

    const-string v2, "logoutIfNotUsed: autoConnect=true, bail"

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 2250
    .end local v0    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSessionsReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .line 2260
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->logout()V

    goto :goto_0
.end method

.method public networkStateChanged(Landroid/net/NetworkInfo$State;I)V
    .locals 6
    .param p1, "networkState"    # Landroid/net/NetworkInfo$State;
    .param p2, "networkType"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 736
    monitor-enter p0

    .line 737
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSession()Lcom/google/android/gtalkservice/IImSession;

    move-result-object v2

    if-nez v2, :cond_0

    .line 738
    monitor-exit p0

    .line 792
    :goto_0
    return-void

    .line 740
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 742
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v0

    .line 744
    .local v0, "connectionState":Lcom/google/android/gtalkservice/ConnectionState;
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "networkStateChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", conn_state="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", connected="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 748
    :cond_1
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkState:Landroid/net/NetworkInfo$State;

    .line 749
    iput p2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkType:I

    .line 750
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastNetworkStateChangedTs:J

    .line 752
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUpdatedNetworkAvailable()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 753
    iput-boolean v5, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNetworkDownAtLastCheck:Z

    .line 754
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnectionError()I

    move-result v2

    if-ne v2, v4, :cond_2

    .line 756
    invoke-virtual {p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    .line 758
    :cond_2
    iget-boolean v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNetworkSuspended:Z

    if-nez v2, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 766
    :cond_3
    invoke-virtual {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->retryConnection(Z)V

    .line 769
    invoke-virtual {p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection;->resetReconnectionTimer(Z)V

    .line 791
    :cond_4
    :goto_1
    sget-object v2, Landroid/net/NetworkInfo$State;->SUSPENDED:Landroid/net/NetworkInfo$State;

    if-ne p1, v2, :cond_9

    move v2, v4

    :goto_2
    iput-boolean v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNetworkSuspended:Z

    goto :goto_0

    .line 740
    .end local v0    # "connectionState":Lcom/google/android/gtalkservice/ConnectionState;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 770
    .restart local v0    # "connectionState":Lcom/google/android/gtalkservice/ConnectionState;
    :cond_5
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v2

    if-ne v2, v4, :cond_4

    .line 771
    invoke-virtual {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->resetReconnectionTimer(Z)V

    .line 772
    invoke-virtual {p0, v5}, Lcom/google/android/gtalkservice/GTalkConnection;->retryConnection(Z)V

    goto :goto_1

    .line 775
    :cond_6
    iget-boolean v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNetworkDownAtLastCheck:Z

    if-nez v2, :cond_7

    .line 776
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mTimeOfLastNetworkOutage:J

    .line 777
    iput-boolean v4, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mNetworkDownAtLastCheck:Z

    .line 779
    :cond_7
    invoke-virtual {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    .line 782
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v2

    const/4 v3, 0x3

    if-lt v2, v3, :cond_4

    .line 783
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_8

    .line 784
    const-string v2, "FORCE closing the GTalk connection because network interface is down"

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 786
    :cond_8
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mWorkerHandler:Landroid/os/Handler;

    const/16 v3, 0x12c

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 787
    .local v1, "msg":Landroid/os/Message;
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mWorkerHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    .end local v1    # "msg":Landroid/os/Message;
    :cond_9
    move v2, v5

    .line 791
    goto :goto_2
.end method

.method public notifyLastDataMessageReceived()V
    .locals 2

    .prologue
    .line 2291
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mLastDataMessageReceivedTs:J

    .line 2292
    return-void
.end method

.method onImSessionLoggedOut()V
    .locals 0

    .prologue
    .line 2232
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->logoutIfNotUsed()V

    .line 2233
    return-void
.end method

.method public releaseAsyncWakeLock()V
    .locals 2

    .prologue
    .line 507
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAsyncConnWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v0

    .line 508
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAsyncConnWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 509
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAsyncConnWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 511
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 513
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mClearWakeLockTimer:Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 514
    return-void

    .line 511
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public releaseSimpleWakeLock()V
    .locals 1

    .prologue
    .line 492
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSimpleWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 493
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugWakeLock:Z

    if-eqz v0, :cond_0

    .line 494
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mSimpleWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 496
    :cond_0
    return-void
.end method

.method public removedDelayedLoginCallback(Lcom/google/android/gtalkservice/DelayedLogin;)V
    .locals 1
    .param p1, "callback"    # Lcom/google/android/gtalkservice/DelayedLogin;

    .prologue
    .line 1235
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDelayedLoginCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1236
    return-void
.end method

.method public requestRoster()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 1269
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    new-instance v1, Lcom/google/android/gtalkservice/Presence;

    sget-object v2, Lcom/google/android/gtalkservice/Presence$Show;->NONE:Lcom/google/android/gtalkservice/Presence$Show;

    const/4 v3, 0x0

    invoke-direct {v1, v4, v2, v3}, Lcom/google/android/gtalkservice/Presence;-><init>(ZLcom/google/android/gtalkservice/Presence$Show;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/ImSession;->setPresence(Lcom/google/android/gtalkservice/Presence;)Z

    .line 1274
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1276
    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->requestBatchQuery(Z)V

    .line 1281
    :cond_0
    return-void
.end method

.method public requestToRefreshAutoToken()V
    .locals 3

    .prologue
    .line 1745
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    const-string v1, "auth failed, ask to refresh auto token"

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 1746
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mServiceHandler:Landroid/os/Handler;

    const/16 v2, 0x190

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1747
    .local v0, "message":Landroid/os/Message;
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1748
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1749
    return-void
.end method

.method public resetReconnectionTimer(Z)V
    .locals 5
    .param p1, "checkNetworkDowntime"    # Z

    .prologue
    const-string v4, " ms"

    .line 529
    if-eqz p1, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mTimeOfLastNetworkOutage:J

    sub-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Account;->getShortNetworkDowntime()I

    move-result v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 531
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getMinReconnectDelayLong()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRandomGenerator:Ljava/util/Random;

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Account;->getReconnectVariantLong()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    add-int/2addr v0, v1

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mInitialReconnectDelay:J

    .line 533
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resetReconnectionTimer: to long initial value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mInitialReconnectDelay:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ms"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 541
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getMaxReconnectDelay()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mMaxReconnectDelay:J

    .line 543
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resetReconnectionTimer: initial_delay="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mInitialReconnectDelay:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", max_delay="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mMaxReconnectDelay:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 546
    :cond_1
    iget-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mInitialReconnectDelay:J

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mReconnectDelay:J

    .line 547
    return-void

    .line 536
    :cond_2
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getMinReconnectDelayShort()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRandomGenerator:Ljava/util/Random;

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Account;->getReconnectVariantShort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    add-int/2addr v0, v1

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mInitialReconnectDelay:J

    .line 538
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resetReconnectionTimer: to short initial value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mInitialReconnectDelay:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ms"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public retryConnection(Z)V
    .locals 1
    .param p1, "now"    # Z

    .prologue
    .line 946
    if-eqz p1, :cond_1

    .line 947
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    const-string v0, "retryConnection now"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 948
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->connect()Z

    .line 957
    :goto_0
    return-void

    .line 950
    :cond_1
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_2

    const-string v0, "retryConnection later"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->logconn(Ljava/lang/String;)V

    .line 954
    :cond_2
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->setReconnectAlarm()V

    .line 955
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionState(I)V

    goto :goto_0
.end method

.method public sendDeviceIdleIfInactive()V
    .locals 1

    .prologue
    .line 2264
    invoke-static {}, Lcom/google/android/gtalkservice/service/GTalkService;->isUserIdle()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2265
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendDeviceIdleStatus(Z)V

    .line 2267
    :cond_0
    return-void
.end method

.method public sendDeviceIdleStatus(Z)V
    .locals 4
    .param p1, "idle"    # Z

    .prologue
    const/4 v3, 0x1

    .line 2271
    if-eqz p1, :cond_0

    iget-boolean v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDeviceIdleStatusSent:Z

    if-eqz v2, :cond_0

    .line 2288
    :goto_0
    return-void

    .line 2274
    :cond_0
    new-instance v1, Lcom/google/android/gtalkservice/extensions/Idle;

    invoke-direct {v1}, Lcom/google/android/gtalkservice/extensions/Idle;-><init>()V

    .line 2275
    .local v1, "packet":Lcom/google/android/gtalkservice/extensions/Idle;
    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/extensions/Idle;->setIdle(Z)V

    .line 2276
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->getShowAwayOnIdle()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/extensions/Idle;->setSendAwayPresenceWhenIdle(Z)V

    .line 2277
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v0

    .line 2279
    .local v0, "iqMgr":Lcom/google/android/gtalkservice/IQPacketManager;
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V

    .line 2280
    if-eqz p1, :cond_1

    .line 2282
    iput-boolean v3, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDeviceIdleStatusSent:Z

    goto :goto_0

    .line 2286
    :cond_1
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mDeviceIdleStatusSent:Z

    goto :goto_0
.end method

.method public sendHeartbeatToServer()V
    .locals 2

    .prologue
    .line 1452
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1453
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "not connected!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1456
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    if-nez v0, :cond_1

    .line 1457
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no heartbeat interval set!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1460
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->sendHeartbeatToServer()V

    .line 1461
    return-void
.end method

.method public sendHttpRequest([BLcom/google/android/gtalkservice/IHttpRequestCallback;)V
    .locals 6
    .param p1, "request"    # [B
    .param p2, "cb"    # Lcom/google/android/gtalkservice/IHttpRequestCallback;

    .prologue
    const-string v5, "GTalkService"

    .line 2703
    :try_start_0
    new-instance v1, Lorg/jivesoftware/smack/packet/HttpRequest;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smack/packet/HttpRequest;-><init>([B)V

    .line 2704
    .local v1, "req":Lorg/jivesoftware/smack/packet/HttpRequest;
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getHttpResponseManager()Lcom/google/android/gtalkservice/HttpResponseManager;

    move-result-object v2

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/HttpRequest;->getPacketID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, p2}, Lcom/google/android/gtalkservice/HttpResponseManager;->addPending(Ljava/lang/String;Lcom/google/android/gtalkservice/IHttpRequestCallback;)V

    .line 2705
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_0

    .line 2706
    const-string v2, "GTalkService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "req is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/HttpRequest;->toXML()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2708
    :cond_0
    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2712
    .end local v1    # "req":Lorg/jivesoftware/smack/packet/HttpRequest;
    :goto_0
    return-void

    .line 2709
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 2710
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "GTalkService"

    const-string v2, "caught exception"

    invoke-static {v5, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    .locals 1
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 843
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;Z)Z

    move-result v0

    return v0
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/Packet;Z)Z
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;
    .param p2, "storeInRmq"    # Z

    .prologue
    .line 849
    if-eqz p2, :cond_1

    .line 851
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    if-eqz v1, :cond_0

    .line 852
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->send(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v0

    .line 860
    .local v0, "retVal":Z
    :goto_0
    return v0

    .line 854
    .end local v0    # "retVal":Z
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/rmq/RmqManager;->send(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v0

    .restart local v0    # "retVal":Z
    goto :goto_0

    .line 857
    .end local v0    # "retVal":Z
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacketOverMcsConnection(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v0

    .restart local v0    # "retVal":Z
    goto :goto_0
.end method

.method public sendPacketOverMcsConnection(Lorg/jivesoftware/smack/packet/Packet;)Z
    .locals 6
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 864
    const/4 v3, 0x0

    .line 865
    .local v3, "retVal":Z
    const/4 v2, 0x0

    .line 866
    .local v2, "exception":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    .line 867
    .local v0, "connection":Lorg/jivesoftware/smack/XMPPConnection;
    if-eqz v0, :cond_1

    .line 869
    :try_start_0
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 870
    const/4 v3, 0x1

    .line 878
    :goto_0
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    if-eqz v2, :cond_0

    .line 879
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "send packet "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " caught "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->log(Ljava/lang/String;)V

    .line 882
    :cond_0
    return v3

    .line 871
    :catch_0
    move-exception v1

    .line 872
    .local v1, "ex":Ljava/lang/IllegalStateException;
    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->constructException(Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object v2

    .line 873
    goto :goto_0

    .line 875
    .end local v1    # "ex":Ljava/lang/IllegalStateException;
    :cond_1
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->constructException(Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object v2

    goto :goto_0
.end method

.method public setAccount(Lcom/google/android/gtalkservice/Account;)V
    .locals 8
    .param p1, "account"    # Lcom/google/android/gtalkservice/Account;

    .prologue
    .line 439
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    .line 441
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccount:Lcom/google/android/gtalkservice/Account;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v3

    .line 445
    .local v3, "username":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 446
    .local v7, "jid":Ljava/lang/StringBuilder;
    const/16 v1, 0x2f

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 447
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->getJidResource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->setJid(Ljava/lang/String;)V

    .line 453
    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->setUserBareAddress(Ljava/lang/String;)V

    .line 455
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 458
    .local v0, "resolver":Landroid/content/ContentResolver;
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGtalkProviderId()J

    move-result-wide v1

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->addOrUpdateAccount(Landroid/content/ContentResolver;JLjava/lang/String;Ljava/lang/String;Z)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mAccountId:J
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 470
    :goto_0
    return-void

    .line 463
    :catch_0
    move-exception v1

    move-object v6, v1

    .line 464
    .local v6, "ex":Landroid/database/SQLException;
    const-string v1, "GTalkService"

    const-string v2, "addOrUpdateAccount caught "

    invoke-static {v1, v2, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public setConnectionError(I)V
    .locals 1
    .param p1, "error"    # I

    .prologue
    .line 730
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->setConnectionError(I)Z

    .line 731
    return-void
.end method

.method public setConnectionState(I)V
    .locals 2
    .param p1, "state"    # I

    .prologue
    .line 705
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/ImSession;->setConnectionState(I)Z

    move-result v0

    .line 706
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 707
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->addConnectionEvent(I)V

    .line 709
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->connectionStateChanged(I)V

    .line 710
    return-void
.end method

.method public setPresence(Lcom/google/android/gtalkservice/Presence;)V
    .locals 0
    .param p1, "presence"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    .line 1264
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mPresence:Lcom/google/android/gtalkservice/Presence;

    .line 1265
    return-void
.end method

.method public setSessionWrapper(Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;)V
    .locals 0
    .param p1, "wrapper"    # Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .prologue
    .line 473
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection;->mConnectionWrapper:Lcom/google/android/gtalkservice/service/GTalkConnectionWrapper;

    .line 474
    return-void
.end method
