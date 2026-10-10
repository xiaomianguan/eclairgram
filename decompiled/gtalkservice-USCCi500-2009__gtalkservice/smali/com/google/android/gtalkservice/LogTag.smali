.class public Lcom/google/android/gtalkservice/LogTag;
.super Ljava/lang/Object;
.source "LogTag.java"


# static fields
.field public static final CONNECTION_EVENT_TYPE_ATTEMPT_FAILED:I = 0x1

.field public static final CONNECTION_EVENT_TYPE_STATE:I = 0x0

.field public static final CONN_TAG:Ljava/lang/String; = "GTalkService/c"

.field public static final EVENT_LOG_CONNECTION:I = 0xaf1

.field public static final EVENT_LOG_CONNECTION_CLOSE:I = 0xfa0

.field public static final EVENT_LOG_GTALKSERVICE:I = 0xaf0

.field public static final EVENT_LOG_HEARTBEAT_RESET:I = 0xfa1

.field public static final EVENT_TYPE_ANDROID_ID_ZERO:I = 0x9

.field public static final EVENT_TYPE_CLEAR_WAKELOCK_ALARM_FIRED:I = 0x8

.field public static final EVENT_TYPE_CREATE_CONNECTION:I = 0x0

.field public static final EVENT_TYPE_DEVICE_STORAGE_LOW:I = 0x6

.field public static final EVENT_TYPE_DEVICE_STORAGE_OK:I = 0x7

.field public static final EVENT_TYPE_LOGIN:I = 0x1

.field public static final EVENT_TYPE_LOGOUT:I = 0x2

.field public static final EVENT_TYPE_ON_CREATE:I = 0x3

.field public static final EVENT_TYPE_ON_DESTROY:I = 0x4

.field public static final EVENT_TYPE_ON_UNBIND:I = 0x5

.field public static final PRESENCE_TAG:Ljava/lang/String; = "GTalkService/p"

.field public static final RMQ_TAG:Ljava/lang/String; = "Rmq"

.field public static final TAG:Ljava/lang/String; = "GTalkService"

.field public static final WAKELOCK_TAG:Ljava/lang/String; = "GTalkService/wake"

.field public static sDebug:Z

.field public static sDebugConnection:Z

.field public static sDebugPresence:Z

.field public static sDebugRmq:Z

.field public static sDebugWakeLock:Z

.field public static sVerbose:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 29
    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    .line 30
    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    .line 31
    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugPresence:Z

    .line 32
    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    .line 33
    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    .line 34
    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugWakeLock:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static logConnectionClosed(III)V
    .locals 5
    .param p0, "error"    # I
    .param p1, "networkType"    # I
    .param p2, "connDuration"    # I

    .prologue
    .line 93
    shl-int/lit8 v1, p1, 0x8

    add-int v0, v1, p0

    .line 94
    .local v0, "status":I
    const/16 v1, 0xfa0

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 95
    return-void
.end method

.method public static logConnectionEvent(IIII)V
    .locals 3
    .param p0, "eventType"    # I
    .param p1, "state"    # I
    .param p2, "error"    # I
    .param p3, "networkState"    # I

    .prologue
    .line 78
    shl-int/lit8 v1, p0, 0x18

    shl-int/lit8 v2, p1, 0x10

    add-int/2addr v1, v2

    shl-int/lit8 v2, p2, 0x8

    add-int/2addr v1, v2

    add-int v0, v1, p3

    .line 81
    .local v0, "status":I
    const/16 v1, 0xaf1

    invoke-static {v1, v0}, Landroid/util/EventLog;->writeEvent(II)I

    .line 82
    return-void
.end method

.method public static logEvent(I)V
    .locals 1
    .param p0, "eventType"    # I

    .prologue
    .line 73
    const/16 v0, 0xaf0

    invoke-static {v0, p0}, Landroid/util/EventLog;->writeEvent(II)I

    .line 74
    return-void
.end method

.method public static logHeartbeatReset(IILjava/lang/String;)V
    .locals 5
    .param p0, "interval"    # I
    .param p1, "networkType"    # I
    .param p2, "hostIpAddr"    # Ljava/lang/String;

    .prologue
    .line 106
    shl-int/lit8 v1, p1, 0x10

    add-int v0, v1, p0

    .line 107
    .local v0, "interval_and_nt":I
    const/16 v1, 0xfa1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v1, v2}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 108
    return-void
.end method

.method public static queryLoggingLevel()V
    .locals 3

    .prologue
    const/4 v1, 0x3

    const-string v2, "GTalkService"

    .line 37
    const-string v0, "GTalkService"

    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    .line 38
    const-string v0, "GTalkService"

    const/4 v0, 0x2

    invoke-static {v2, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    .line 39
    const-string v0, "GTalkService/c"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    .line 40
    const-string v0, "GTalkService/p"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugPresence:Z

    .line 41
    const-string v0, "Rmq"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    .line 42
    const-string v0, "GTalkService/wake"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugWakeLock:Z

    .line 43
    return-void
.end method
