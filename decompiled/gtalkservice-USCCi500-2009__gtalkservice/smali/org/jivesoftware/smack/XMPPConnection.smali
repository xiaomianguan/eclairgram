.class public Lorg/jivesoftware/smack/XMPPConnection;
.super Ljava/lang/Object;
.source "XMPPConnection.java"


# static fields
.field public static final CURRENT_VERSION:B = 0x4t

.field public static DEBUG_ENABLED:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "Smack"

.field public static final VERSION_1:B = 0x1t

.field public static final VERSION_2:B = 0x2t

.field public static final VERSION_3:B = 0x3t

.field public static final VERSION_4:B = 0x4t

.field public static final VERSION_NOT_SUPPORTED:B

.field private static connectionEstablishedListeners:Ljava/util/List;


# instance fields
.field private anonymous:Z

.field private authenticated:Z

.field chats:Ljava/util/Map;

.field private compressionMethods:Ljava/util/Collection;

.field private configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

.field private connected:Z

.field connectionID:Ljava/lang/String;

.field private heartbeatConfig:Lorg/jivesoftware/smack/packet/HeartbeatConfig;

.field host:Ljava/lang/String;

.field private localConnectionId:I

.field private loginSettings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

.field private mLock:Ljava/lang/Object;

.field mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

.field mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field packetReader:Lorg/jivesoftware/smack/PacketReader;

.field packetWriter:Lorg/jivesoftware/smack/PacketWriter;

.field port:I

.field reader:Ljava/io/InputStream;

.field roster:Lorg/jivesoftware/smack/Roster;

.field private saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

.field serviceName:Ljava/lang/String;

.field socket:Ljava/net/Socket;

.field useProtoBuf:Z

.field private user:Ljava/lang/String;

.field private usingCompression:Z

.field private usingTLS:Z

.field writer:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x0

    sput-boolean v0, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z

    .line 108
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablishedListeners:Ljava/util/List;

    .line 114
    :try_start_0
    const-string v0, "smack.debugEnabled"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :goto_0
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getVersion()Ljava/lang/String;

    .line 121
    return-void

    .line 116
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 407
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 142
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 143
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 144
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 145
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 150
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    .line 166
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 167
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 168
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 170
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 171
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    .line 176
    new-instance v0, Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/SASLAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 187
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->chats:Ljava/util/Map;

    .line 408
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 142
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 143
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 144
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 145
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 150
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    .line 166
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 167
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 168
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 170
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 171
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    .line 176
    new-instance v1, Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/SASLAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 187
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->chats:Ljava/util/Map;

    .line 258
    new-instance v0, Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {v0, p1, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;-><init>(Ljava/lang/String;I)V

    .line 259
    .local v0, "config":Lorg/jivesoftware/smack/ConnectionConfiguration;
    invoke-virtual {v0, v4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setTLSEnabled(Z)V

    .line 260
    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCompressionEnabled(Z)V

    .line 261
    invoke-virtual {v0, v4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setSASLAuthenticationEnabled(Z)V

    .line 262
    sget-boolean v1, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setDebuggerEnabled(Z)V

    .line 264
    invoke-direct {p0, v0, v3}, Lorg/jivesoftware/smack/XMPPConnection;->connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/net/SocketFactory;)V

    .line 265
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "serviceName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 142
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 143
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 144
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 145
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 150
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    .line 166
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 167
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 168
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 170
    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 171
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    .line 176
    new-instance v1, Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/SASLAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 187
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->chats:Ljava/util/Map;

    .line 281
    new-instance v0, Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {v0, p1, p2, p3}, Lorg/jivesoftware/smack/ConnectionConfiguration;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 282
    .local v0, "config":Lorg/jivesoftware/smack/ConnectionConfiguration;
    invoke-virtual {v0, v4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setTLSEnabled(Z)V

    .line 283
    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCompressionEnabled(Z)V

    .line 284
    invoke-virtual {v0, v4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setSASLAuthenticationEnabled(Z)V

    .line 285
    sget-boolean v1, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setDebuggerEnabled(Z)V

    .line 287
    invoke-direct {p0, v0, v3}, Lorg/jivesoftware/smack/XMPPConnection;->connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/net/SocketFactory;)V

    .line 288
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljavax/net/SocketFactory;)V
    .locals 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "serviceName"    # Ljava/lang/String;
    .param p4, "socketFactory"    # Ljavax/net/SocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 142
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 143
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 144
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 145
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 150
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    .line 166
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 167
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 168
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 170
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 171
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    .line 176
    new-instance v1, Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/SASLAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 187
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->chats:Ljava/util/Map;

    .line 313
    new-instance v0, Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {v0, p1, p2, p3}, Lorg/jivesoftware/smack/ConnectionConfiguration;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 314
    .local v0, "config":Lorg/jivesoftware/smack/ConnectionConfiguration;
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setTLSEnabled(Z)V

    .line 315
    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCompressionEnabled(Z)V

    .line 316
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setSASLAuthenticationEnabled(Z)V

    .line 317
    sget-boolean v1, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setDebuggerEnabled(Z)V

    .line 319
    invoke-direct {p0, v0, p4}, Lorg/jivesoftware/smack/XMPPConnection;->connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/net/SocketFactory;)V

    .line 320
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;ZLjavax/net/SocketFactory;)V
    .locals 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "serviceName"    # Ljava/lang/String;
    .param p4, "useProtoBuf"    # Z
    .param p5, "socketFactory"    # Ljavax/net/SocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 142
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 143
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 144
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 145
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 150
    iput-boolean v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    .line 166
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 167
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 168
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 170
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 171
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    .line 176
    new-instance v1, Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/SASLAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 187
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->chats:Ljava/util/Map;

    .line 327
    new-instance v0, Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {v0, p1, p2, p3}, Lorg/jivesoftware/smack/ConnectionConfiguration;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 328
    .local v0, "config":Lorg/jivesoftware/smack/ConnectionConfiguration;
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setTLSEnabled(Z)V

    .line 329
    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCompressionEnabled(Z)V

    .line 330
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setSASLAuthenticationEnabled(Z)V

    .line 331
    sget-boolean v1, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setDebuggerEnabled(Z)V

    .line 332
    invoke-virtual {v0, p4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setUseProtoBuf(Z)V

    .line 334
    invoke-direct {p0, v0, p5}, Lorg/jivesoftware/smack/XMPPConnection;->connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/net/SocketFactory;)V

    .line 335
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V
    .locals 2
    .param p1, "config"    # Lorg/jivesoftware/smack/ConnectionConfiguration;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 337
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 142
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 143
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 144
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 145
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 150
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    .line 166
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 167
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 168
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 170
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 171
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    .line 176
    new-instance v0, Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/SASLAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 187
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->chats:Ljava/util/Map;

    .line 339
    invoke-direct {p0, p1, v1}, Lorg/jivesoftware/smack/XMPPConnection;->connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/net/SocketFactory;)V

    .line 340
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/net/SocketFactory;)V
    .locals 2
    .param p1, "config"    # Lorg/jivesoftware/smack/ConnectionConfiguration;
    .param p2, "socketFactory"    # Ljavax/net/SocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 343
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 142
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 143
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 144
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 145
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 150
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    .line 166
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 167
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 168
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 170
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 171
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    .line 176
    new-instance v0, Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/SASLAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 187
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->chats:Ljava/util/Map;

    .line 345
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/XMPPConnection;->connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/net/SocketFactory;)V

    .line 346
    return-void
.end method

.method public static addConnectionListener(Lorg/jivesoftware/smack/ConnectionEstablishedListener;)V
    .locals 2
    .param p0, "connectionEstablishedListener"    # Lorg/jivesoftware/smack/ConnectionEstablishedListener;

    .prologue
    .line 1137
    sget-object v0, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablishedListeners:Ljava/util/List;

    monitor-enter v0

    .line 1138
    :try_start_0
    sget-object v1, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablishedListeners:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1139
    sget-object v1, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablishedListeners:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1141
    :cond_0
    monitor-exit v0

    .line 1142
    return-void

    .line 1141
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private checkConnection()V
    .locals 2

    .prologue
    .line 1179
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1180
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "XMPP not connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1182
    :cond_0
    return-void
.end method

.method private connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/net/SocketFactory;)V
    .locals 8
    .param p1, "config"    # Lorg/jivesoftware/smack/ConnectionConfiguration;
    .param p2, "socketFactory"    # Ljavax/net/SocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const-string v7, ":"

    const-string v6, "."

    .line 350
    invoke-virtual {p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getHost()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->host:Ljava/lang/String;

    .line 351
    invoke-virtual {p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getPort()I

    move-result v3

    iput v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->port:I

    .line 353
    const-string v3, "Smack"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    .line 355
    .local v1, "printLog":Z
    if-eqz v1, :cond_0

    .line 356
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "create socket connection("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->host:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->port:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/jivesoftware/smack/XMPPConnection;->log(Ljava/lang/String;)V

    .line 359
    :cond_0
    if-nez p2, :cond_2

    .line 360
    new-instance v3, Ljava/net/Socket;

    iget-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->host:Ljava/lang/String;

    iget v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->port:I

    invoke-direct {v3, v4, v5}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 379
    :goto_0
    invoke-virtual {p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getUseProtoBuf()Z

    move-result v3

    iput-boolean v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    .line 380
    invoke-virtual {p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getServiceName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    .line 384
    :try_start_1
    invoke-virtual {p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/ConnectionConfiguration;

    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_2

    .line 390
    :goto_1
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->init()V

    .line 394
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lorg/jivesoftware/smack/XMPPConnection;->setConnected(Z)V

    .line 397
    if-eqz v1, :cond_1

    .line 398
    const-string v3, "socket connection made!"

    invoke-direct {p0, v3}, Lorg/jivesoftware/smack/XMPPConnection;->log(Ljava/lang/String;)V

    .line 400
    :cond_1
    return-void

    .line 363
    :cond_2
    :try_start_2
    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->host:Ljava/lang/String;

    iget v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->port:I

    invoke-virtual {p2, v3, v4}, Ljavax/net/SocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 366
    :catch_0
    move-exception v3

    move-object v2, v3

    .line 367
    .local v2, "uhe":Ljava/net/UnknownHostException;
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not connect to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->port:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lorg/jivesoftware/smack/packet/XMPPError;

    const/16 v6, 0x194

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(I)V

    invoke-direct {v3, v4, v5, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V

    throw v3

    .line 372
    .end local v2    # "uhe":Ljava/net/UnknownHostException;
    :catch_1
    move-exception v3

    move-object v0, v3

    .line 373
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "XMPPError connecting to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->port:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lorg/jivesoftware/smack/packet/XMPPError;

    const/16 v6, 0x1f6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(I)V

    invoke-direct {v3, v4, v5, v0}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V

    throw v3

    .line 386
    .end local v0    # "ioe":Ljava/io/IOException;
    :catch_2
    move-exception v3

    goto/16 :goto_1
.end method

.method private static connectionEstablished(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 4
    .param p0, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 1404
    const/4 v1, 0x0

    .line 1405
    .local v1, "listeners":[Lorg/jivesoftware/smack/ConnectionEstablishedListener;
    sget-object v2, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablishedListeners:Ljava/util/List;

    monitor-enter v2

    .line 1406
    :try_start_0
    sget-object v3, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablishedListeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-array v1, v3, [Lorg/jivesoftware/smack/ConnectionEstablishedListener;

    .line 1407
    sget-object v3, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablishedListeners:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 1408
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1409
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 1410
    aget-object v2, v1, v0

    invoke-interface {v2, p0}, Lorg/jivesoftware/smack/ConnectionEstablishedListener;->connectionEstablished(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 1409
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1408
    .end local v0    # "i":I
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 1412
    .restart local v0    # "i":I
    :cond_0
    return-void
.end method

.method private hasAvailableCompressionMethod(Ljava/lang/String;)Z
    .locals 1
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 1514
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionMethods:Ljava/util/Collection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionMethods:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private init()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1161
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initReaderAndWriter()V

    .line 1163
    new-instance v0, Lorg/jivesoftware/smack/PacketWriter;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketWriter;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    .line 1164
    new-instance v0, Lorg/jivesoftware/smack/PacketReader;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketReader;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    .line 1176
    return-void
.end method

.method private initReaderAndWriter()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const-string v3, "Smack"

    .line 1278
    :try_start_0
    iget-boolean v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingCompression:Z

    if-nez v3, :cond_1

    .line 1279
    new-instance v3, Ljava/io/BufferedInputStream;

    iget-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v4}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    const/16 v5, 0x2000

    invoke-direct {v3, v4, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/InputStream;

    .line 1280
    new-instance v3, Ljava/io/BufferedOutputStream;

    iget-object v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v4}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    const/16 v5, 0x2000

    invoke-direct {v3, v4, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/OutputStream;

    .line 1398
    :cond_0
    :goto_0
    return-void

    .line 1283
    :cond_1
    const-string v3, "Smack"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1284
    const-string v3, "Starting compression"

    invoke-direct {p0, v3}, Lorg/jivesoftware/smack/XMPPConnection;->log(Ljava/lang/String;)V

    .line 1287
    :cond_2
    new-instance v0, Lcom/google/android/gtalkservice/extensions/FlushableDeflaterOutputStream;

    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/google/android/gtalkservice/extensions/FlushableDeflaterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1288
    .local v0, "dos":Ljava/io/OutputStream;
    new-instance v3, Ljava/io/BufferedOutputStream;

    const/16 v4, 0x2000

    invoke-direct {v3, v0, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/OutputStream;

    .line 1290
    new-instance v1, Ljava/util/zip/InflaterInputStream;

    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1291
    .local v1, "iis":Ljava/util/zip/InflaterInputStream;
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/InputStream;

    .line 1292
    const-string v3, "Smack"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1293
    const-string v3, "compression started"

    invoke-direct {p0, v3}, Lorg/jivesoftware/smack/XMPPConnection;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1332
    .end local v0    # "dos":Ljava/io/OutputStream;
    .end local v1    # "iis":Ljava/util/zip/InflaterInputStream;
    :catch_0
    move-exception v3

    move-object v2, v3

    .line 1333
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string v4, "XMPPError establishing connection with server."

    new-instance v5, Lorg/jivesoftware/smack/packet/XMPPError;

    const/16 v6, 0x1f6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(I)V

    invoke-direct {v3, v4, v5, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1723
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[XMPPConn] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1724
    return-void
.end method

.method public static removeConnectionListener(Lorg/jivesoftware/smack/ConnectionEstablishedListener;)V
    .locals 2
    .param p0, "connectionEstablishedListener"    # Lorg/jivesoftware/smack/ConnectionEstablishedListener;

    .prologue
    .line 1150
    sget-object v0, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablishedListeners:Ljava/util/List;

    monitor-enter v0

    .line 1151
    :try_start_0
    sget-object v1, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablishedListeners:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1152
    monitor-exit v0

    .line 1153
    return-void

    .line 1152
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private setAuthenticated(Z)V
    .locals 2
    .param p1, "flag"    # Z

    .prologue
    .line 888
    const-string v0, "Smack"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 889
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setAuthenticated: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->log(Ljava/lang/String;)V

    .line 892
    :cond_0
    iput-boolean p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 893
    return-void
.end method

.method private setConnected(Z)V
    .locals 2
    .param p1, "flag"    # Z

    .prologue
    .line 861
    const-string v0, "Smack"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 862
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setConnected: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->log(Ljava/lang/String;)V

    .line 865
    :cond_0
    iput-boolean p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 866
    return-void
.end method

.method private useCompression()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1546
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    if-eqz v0, :cond_0

    move v0, v1

    .line 1577
    :goto_0
    return v0

    .line 1551
    :cond_0
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    if-eqz v0, :cond_1

    .line 1552
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Compression should be negotiated before authentication."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1566
    :cond_1
    const-string v0, "zlib"

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->hasAvailableCompressionMethod(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1567
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketWriter;->requestStreamCompression()V

    .line 1569
    monitor-enter p0

    .line 1571
    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v0

    mul-int/lit8 v0, v0, 0x5

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1574
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1575
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingCompression:Z

    goto :goto_0

    .line 1574
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_2
    move v0, v1

    .line 1577
    goto :goto_0

    .line 1573
    :catch_0
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method public acquireWakeLock()V
    .locals 1

    .prologue
    .line 1676
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    .line 1677
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 1679
    :cond_0
    return-void
.end method

.method public addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V
    .locals 1
    .param p1, "connectionListener"    # Lorg/jivesoftware/smack/ConnectionListener;

    .prologue
    .line 1118
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketReader;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 1119
    return-void
.end method

.method public addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 2
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 1032
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1033
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1035
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0, p1, p2}, Lorg/jivesoftware/smack/PacketReader;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)Z

    .line 1036
    return-void
.end method

.method public addPacketWriterInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 2
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 1085
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1086
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1088
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1, p2}, Lorg/jivesoftware/smack/PacketWriter;->addPacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 1089
    return-void
.end method

.method public addPacketWriterListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 2
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 1059
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1060
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1062
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1, p2}, Lorg/jivesoftware/smack/PacketWriter;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 1063
    return-void
.end method

.method public clearRoster()V
    .locals 2

    .prologue
    .line 759
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 760
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 761
    monitor-exit v0

    .line 762
    return-void

    .line 761
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public close()V
    .locals 1

    .prologue
    .line 905
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->close(Z)V

    .line 906
    return-void
.end method

.method public close(Z)V
    .locals 4
    .param p1, "notifyConnectionClosed"    # Z

    .prologue
    .line 914
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 982
    :goto_0
    return-void

    .line 920
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    monitor-enter v0

    .line 921
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    if-nez v1, :cond_1

    .line 922
    const-string v1, "close: socket already closed, bail"

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->log(Ljava/lang/String;)V

    .line 923
    monitor-exit v0

    goto :goto_0

    .line 981
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 926
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "close connection, notifyClosed="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->log(Ljava/lang/String;)V

    .line 929
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 930
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/PacketReader;->shutdown(Z)V

    .line 931
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketWriter;->shutdown()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 935
    const-wide/16 v1, 0x96

    :try_start_2
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 965
    :goto_1
    const/4 v1, 0x0

    :try_start_3
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/InputStream;

    .line 966
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/OutputStream;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 972
    :try_start_4
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    if-eqz v1, :cond_2

    .line 973
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 977
    :cond_2
    const/4 v1, 0x0

    :try_start_5
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    .line 978
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->setAuthenticated(Z)V

    .line 979
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->setConnected(Z)V

    .line 981
    :goto_2
    monitor-exit v0

    goto :goto_0

    .line 975
    :catch_0
    move-exception v1

    .line 977
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    .line 978
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->setAuthenticated(Z)V

    .line 979
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->setConnected(Z)V

    goto :goto_2

    .line 977
    :catchall_1
    move-exception v1

    const/4 v2, 0x0

    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    .line 978
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lorg/jivesoftware/smack/XMPPConnection;->setAuthenticated(Z)V

    .line 979
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lorg/jivesoftware/smack/XMPPConnection;->setConnected(Z)V

    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 937
    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public connect()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 1192
    :try_start_0
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->checkConnection()V

    .line 1195
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketWriter;->startup()V

    .line 1198
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketReader;->startup()V

    .line 1206
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketWriter;->startKeepAliveProcess()V

    .line 1209
    invoke-static {p0}, Lorg/jivesoftware/smack/XMPPConnection;->connectionEstablished(Lorg/jivesoftware/smack/XMPPConnection;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1274
    return-void

    .line 1241
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1246
    .local v0, "ex":Lorg/jivesoftware/smack/XMPPException;
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->close(Z)V

    .line 1272
    throw v0
.end method

.method public createChat(Ljava/lang/String;)Lorg/jivesoftware/smack/Chat;
    .locals 2
    .param p1, "participant"    # Ljava/lang/String;

    .prologue
    .line 827
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 828
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 830
    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/Chat;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smack/Chat;-><init>(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;)V

    return-object v0
.end method

.method public createGroupChat(Ljava/lang/String;)Lorg/jivesoftware/smack/GroupChat;
    .locals 2
    .param p1, "room"    # Ljava/lang/String;

    .prologue
    .line 845
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 846
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 848
    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/GroupChat;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smack/GroupChat;-><init>(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;)V

    return-object v0
.end method

.method public createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;
    .locals 1
    .param p1, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 1108
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketReader;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    return-object v0
.end method

.method public dump(Ljava/io/PrintWriter;)V
    .locals 2
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    const-string v1, "----------"

    .line 1712
    const-string v0, "PacketReader"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1713
    const-string v0, "----------"

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1714
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketReader;->dump(Ljava/io/PrintWriter;)V

    .line 1716
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1717
    const-string v0, "PacketWriter"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1718
    const-string v0, "----------"

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1719
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketWriter;->dump(Ljava/io/PrintWriter;)V

    .line 1720
    return-void
.end method

.method public getConnectionConfiguration()Lorg/jivesoftware/smack/ConnectionConfiguration;
    .locals 1

    .prologue
    .line 1730
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    return-object v0
.end method

.method public getConnectionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 418
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    return-object v0
.end method

.method public getHeartbeatConfig()Lorg/jivesoftware/smack/packet/HeartbeatConfig;
    .locals 1

    .prologue
    .line 481
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->heartbeatConfig:Lorg/jivesoftware/smack/packet/HeartbeatConfig;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 438
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getHostIpAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 452
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastActivityFromServerTime()J
    .locals 2

    .prologue
    .line 1623
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketReader;->getLastActive()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLastActivityToServerTime()J
    .locals 2

    .prologue
    .line 1627
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketWriter;->getLastActive()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalConnectionId()I
    .locals 1

    .prologue
    .line 1692
    iget v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->localConnectionId:I

    return v0
.end method

.method public getLoginSettings()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 474
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->loginSettings:Ljava/util/Map;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 448
    iget v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->port:I

    return v0
.end method

.method public getRmq2Manager()Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    .locals 1

    .prologue
    .line 1704
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    return-object v0
.end method

.method public getRmqManager()Lcom/google/android/gtalkservice/rmq/RmqManager;
    .locals 1

    .prologue
    .line 1708
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    return-object v0
.end method

.method public getRoster()Lorg/jivesoftware/smack/Roster;
    .locals 2

    .prologue
    .line 738
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 739
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    monitor-exit v0

    return-object v1

    .line 740
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;
    .locals 1

    .prologue
    .line 1436
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    return-object v0
.end method

.method public getServiceName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    return-object v0
.end method

.method public getSocketConnection()Ljava/net/Socket;
    .locals 1

    .prologue
    .line 988
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 463
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isAuthenticated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 464
    const/4 v0, 0x0

    .line 466
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    goto :goto_0
.end method

.method public isAnonymous()Z
    .locals 1

    .prologue
    .line 901
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    return v0
.end method

.method public isAuthenticated()Z
    .locals 1

    .prologue
    .line 884
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    return v0
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 857
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    return v0
.end method

.method public isSecureConnection()Z
    .locals 1

    .prologue
    .line 875
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isUsingTLS()Z

    move-result v0

    return v0
.end method

.method public isUsingCompression()Z
    .locals 1

    .prologue
    .line 1528
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingCompression:Z

    return v0
.end method

.method public isUsingTLS()Z
    .locals 1

    .prologue
    .line 1425
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    return v0
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 495
    const-string v0, "Smack"

    invoke-virtual {p0, p1, p2, v0}, Lorg/jivesoftware/smack/XMPPConnection;->login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 496
    return-void
.end method

.method public declared-synchronized login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 15
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 514
    monitor-enter p0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    :try_start_0
    invoke-virtual/range {v0 .. v14}, Lorg/jivesoftware/smack/XMPPConnection;->login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJZLjava/util/List;ZIZLorg/jivesoftware/smack/packet/HeartbeatStat;Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 521
    monitor-exit p0

    return-void

    .line 514
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJZLjava/util/List;ZIZLorg/jivesoftware/smack/packet/HeartbeatStat;Ljava/util/Map;)V
    .locals 18
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;
    .param p4, "deviceId"    # Ljava/lang/String;
    .param p5, "useRmq"    # Z
    .param p6, "lastRmqId"    # J
    .param p8, "useRmq2"    # Z
    .param p10, "sendPresence"    # Z
    .param p11, "compress"    # I
    .param p12, "adaptiveHeartbeat"    # Z
    .param p13, "heartbeatStat"    # Lorg/jivesoftware/smack/packet/HeartbeatStat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZJZ",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;ZIZ",
            "Lorg/jivesoftware/smack/packet/HeartbeatStat;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 562
    .local p9, "rmq2S2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p14, "loginSettingsRequest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v5

    if-nez v5, :cond_0

    .line 563
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Not connected to server."

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 562
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 565
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    move v5, v0

    if-eqz v5, :cond_1

    .line 566
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Already logged in to server."

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 569
    :cond_1
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 571
    const/16 v17, 0x0

    .line 572
    .local v17, "response":Ljava/lang/String;
    const-string v5, "Smack"

    const/4 v6, 0x3

    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v16

    .line 574
    .local v16, "printLog":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    move v5, v0

    if-eqz v5, :cond_6

    .line 575
    if-eqz v16, :cond_2

    .line 576
    const-string v5, "Smack"

    const-string v6, "[XMPPConn] login: use PB to authenticate"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 578
    :cond_2
    new-instance v4, Lorg/jivesoftware/smack/ProtoBufAuthentication;

    move-object/from16 v5, p0

    move-object/from16 v6, p4

    move/from16 v7, p5

    move-wide/from16 v8, p6

    move/from16 v10, p8

    move-object/from16 v11, p9

    move/from16 v12, p11

    move/from16 v13, p12

    move-object/from16 v14, p13

    move-object/from16 v15, p14

    invoke-direct/range {v4 .. v15}, Lorg/jivesoftware/smack/ProtoBufAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;ZJZLjava/util/List;IZLorg/jivesoftware/smack/packet/HeartbeatStat;Ljava/util/Map;)V

    .line 581
    .local v4, "auth":Lorg/jivesoftware/smack/ProtoBufAuthentication;
    move-object v0, v4

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/jivesoftware/smack/ProtoBufAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 582
    invoke-virtual {v4}, Lorg/jivesoftware/smack/ProtoBufAuthentication;->getServerSettings()Ljava/util/Map;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->loginSettings:Ljava/util/Map;

    .line 583
    invoke-virtual {v4}, Lorg/jivesoftware/smack/ProtoBufAuthentication;->getHeartbeatConfig()Lorg/jivesoftware/smack/packet/HeartbeatConfig;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->heartbeatConfig:Lorg/jivesoftware/smack/packet/HeartbeatConfig;

    .line 606
    .end local v4    # "auth":Lorg/jivesoftware/smack/ProtoBufAuthentication;
    :goto_0
    if-eqz v17, :cond_a

    .line 607
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 609
    invoke-static/range {v17 .. v17}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    .line 611
    if-eqz v16, :cond_3

    .line 612
    const-string v5, "Smack"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[XMPPConn] login: got servicename from response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    move-object v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 639
    :cond_3
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object v5, v0

    invoke-virtual {v5}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isCompressionEnabled()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 640
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/XMPPConnection;->useCompression()Z

    .line 662
    :cond_4
    if-eqz v16, :cond_5

    .line 663
    const-string v5, "Smack"

    const-string v6, "[XMPPConn] login: authenticated"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 667
    :cond_5
    const/4 v5, 0x1

    move v0, v5

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 668
    const/4 v5, 0x0

    move v0, v5

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 669
    monitor-exit p0

    return-void

    .line 585
    :cond_6
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object v5, v0

    invoke-virtual {v5}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSASLAuthenticationEnabled()Z

    move-result v5

    if-eqz v5, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    move-object v5, v0

    invoke-virtual {v5}, Lorg/jivesoftware/smack/SASLAuthentication;->hasNonAnonymousAuthentication()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 588
    if-eqz v16, :cond_7

    .line 589
    const-string v5, "Smack"

    const-string v6, "[XMPPConn] login: use SASL to authenticate"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    goto/16 :goto_0

    .line 596
    :cond_8
    if-eqz v16, :cond_9

    .line 597
    const-string v5, "Smack"

    const-string v6, "[XMPPConn] login: use NonSASL to authenticate"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    :cond_9
    new-instance v5, Lorg/jivesoftware/smack/NonSASLAuthentication;

    move-object v0, v5

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    move-object v0, v5

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    goto/16 :goto_0

    .line 621
    :cond_a
    const-string v5, "@"

    move-object/from16 v0, p1

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_c

    .line 622
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object v0, v5

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    move-object v6, v0

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 633
    :cond_b
    :goto_2
    if-eqz p3, :cond_3

    .line 634
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    move-object v6, v0

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    goto/16 :goto_1

    .line 624
    :cond_c
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 625
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    .line 627
    if-eqz v16, :cond_b

    .line 628
    const-string v5, "Smack"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[XMPPConn] login: get servicename from username "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    move-object v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2
.end method

.method public declared-synchronized loginAnonymously()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 682
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v1

    if-nez v1, :cond_0

    .line 683
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Not connected to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 682
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 685
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    if-eqz v1, :cond_1

    .line 686
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Already logged in to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 689
    :cond_1
    const/4 v0, 0x0

    .line 690
    .local v0, "response":Ljava/lang/String;
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSASLAuthenticationEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/SASLAuthentication;->hasAnonymousAuthentication()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 692
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticateAnonymously()Ljava/lang/String;

    move-result-object v0

    .line 700
    :goto_0
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 702
    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    .line 705
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isCompressionEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 706
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->useCompression()Z

    .line 710
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->clearRoster()V

    .line 713
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 716
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 717
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 728
    monitor-exit p0

    return-void

    .line 696
    :cond_3
    :try_start_2
    new-instance v1, Lorg/jivesoftware/smack/NonSASLAuthentication;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    invoke-virtual {v1}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticateAnonymously()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    goto :goto_0
.end method

.method public markPacketReception()V
    .locals 1

    .prologue
    .line 1656
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    if-eqz v0, :cond_0

    .line 1657
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->markPacketReception()V

    .line 1659
    :cond_0
    return-void
.end method

.method public markPacketTransmission()V
    .locals 1

    .prologue
    .line 1666
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    if-eqz v0, :cond_0

    .line 1667
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->markPacketTransmission()V

    .line 1669
    :cond_0
    return-void
.end method

.method public maybeSendHeartbeat(I)V
    .locals 2
    .param p1, "delay"    # I

    .prologue
    .line 1018
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1019
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1021
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketWriter;->maybeSendHeartbeat(I)V

    .line 1022
    return-void
.end method

.method proceedTLSReceived()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const-string v2, "Smack"

    .line 1458
    const-string v1, "Smack"

    const/4 v1, 0x3

    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1459
    const-string v1, "Smack"

    const-string v1, "[XMPPConn] proceedTLSReceived: bind TLS to socket"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1476
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    .line 1477
    .local v0, "plain":Ljava/net/Socket;
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v1

    check-cast v1, Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/net/Socket;->getPort()I

    move-result v3

    invoke-virtual {v1, v0, v2, v3, v4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    .line 1480
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 1485
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initReaderAndWriter()V

    .line 1487
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    check-cast v1, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 1490
    iput-boolean v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 1493
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/OutputStream;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/PacketWriter;->setOutputStream(Ljava/io/OutputStream;)V

    .line 1495
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 1496
    return-void
.end method

.method public releaseWakeLock()V
    .locals 1

    .prologue
    .line 1682
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    .line 1683
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1685
    :cond_0
    return-void
.end method

.method public removeConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V
    .locals 1
    .param p1, "connectionListener"    # Lorg/jivesoftware/smack/ConnectionListener;

    .prologue
    .line 1127
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketReader;->removeConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 1128
    return-void
.end method

.method public removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 1
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 1044
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketReader;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 1045
    return-void
.end method

.method public removePacketWriterInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V
    .locals 1
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;

    .prologue
    .line 1097
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketWriter;->removePacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V

    .line 1098
    return-void
.end method

.method public removePacketWriterListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 1
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 1071
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketWriter;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 1072
    return-void
.end method

.method public requestRoster()V
    .locals 2

    .prologue
    .line 748
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 749
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    if-eqz v1, :cond_0

    .line 751
    monitor-exit v0

    .line 756
    :goto_0
    return-void

    .line 753
    :cond_0
    new-instance v1, Lorg/jivesoftware/smack/Roster;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/Roster;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 754
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 755
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Roster;->reload()V

    goto :goto_0

    .line 754
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public resetConnection(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 1648
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    .line 1649
    return-void
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 1004
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1005
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1007
    :cond_0
    if-nez p1, :cond_1

    .line 1008
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Packet is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1010
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1011
    return-void
.end method

.method setAvailableCompressionMethods(Ljava/util/Collection;)V
    .locals 0
    .param p1, "methods"    # Ljava/util/Collection;

    .prologue
    .line 1504
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionMethods:Ljava/util/Collection;

    .line 1505
    return-void
.end method

.method public setHeartbeatAlarm(Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;)V
    .locals 0
    .param p1, "alarm"    # Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .prologue
    .line 1639
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mGTalkHeartbeatAlarm:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;

    .line 1640
    return-void
.end method

.method public setLocalConnectionId(I)V
    .locals 0
    .param p1, "ts"    # I

    .prologue
    .line 1688
    iput p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->localConnectionId:I

    .line 1689
    return-void
.end method

.method public setRmq2Manager(Lcom/google/android/gtalkservice/rmq/Rmq2Manager;)V
    .locals 0
    .param p1, "rmq2Mgr"    # Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .prologue
    .line 1696
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 1697
    return-void
.end method

.method public setRmqManager(Lcom/google/android/gtalkservice/rmq/RmqManager;)V
    .locals 0
    .param p1, "rmqMgr"    # Lcom/google/android/gtalkservice/rmq/RmqManager;

    .prologue
    .line 1700
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 1701
    return-void
.end method

.method public setUseProtoBuf(Z)V
    .locals 0
    .param p1, "useProtoBuf"    # Z

    .prologue
    .line 157
    iput-boolean p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    .line 158
    return-void
.end method

.method public setWakeLock(Landroid/os/PowerManager$WakeLock;)V
    .locals 0
    .param p1, "wakeLock"    # Landroid/os/PowerManager$WakeLock;

    .prologue
    .line 1672
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 1673
    return-void
.end method

.method public shouldUseProtoBuf()Z
    .locals 1

    .prologue
    .line 153
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    return v0
.end method

.method public startStreamCompression()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1585
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->startStreamCompression(Z)V

    .line 1586
    return-void
.end method

.method public startStreamCompression(Z)V
    .locals 2
    .param p1, "notify"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1595
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingCompression:Z

    .line 1597
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initReaderAndWriter()V

    .line 1600
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/OutputStream;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/PacketWriter;->setOutputStream(Ljava/io/OutputStream;)V

    .line 1602
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    if-nez v0, :cond_0

    .line 1605
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 1608
    :cond_0
    if-eqz p1, :cond_1

    .line 1609
    monitor-enter p0

    .line 1610
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 1611
    monitor-exit p0

    .line 1613
    :cond_1
    return-void

    .line 1611
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method startTLSReceived()V
    .locals 1

    .prologue
    .line 1444
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isTLSEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1449
    :goto_0
    return-void

    .line 1448
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketWriter;->sendStartTLS()V

    goto :goto_0
.end method

.method streamCompressionDenied()V
    .locals 1

    .prologue
    .line 1617
    monitor-enter p0

    .line 1618
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 1619
    monitor-exit p0

    .line 1620
    return-void

    .line 1619
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public waitForRosterInitialized()Z
    .locals 9

    .prologue
    .line 765
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->getRoster()Lorg/jivesoftware/smack/Roster;

    move-result-object v0

    .line 767
    .local v0, "localRoster":Lorg/jivesoftware/smack/Roster;
    if-nez v0, :cond_0

    .line 768
    const/4 v7, 0x0

    .line 801
    :goto_0
    return v7

    .line 778
    :cond_0
    iget-boolean v7, v0, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    if-nez v7, :cond_2

    .line 780
    :try_start_0
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 781
    :try_start_1
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v5, v7

    .line 783
    .local v5, "waitTime":J
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    .line 784
    .local v3, "start":J
    :goto_1
    iget-boolean v7, v0, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    if-nez v7, :cond_1

    .line 785
    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    if-gtz v7, :cond_3

    .line 794
    :cond_1
    monitor-exit v0

    .line 801
    .end local v3    # "start":J
    .end local v5    # "waitTime":J
    :cond_2
    :goto_2
    const/4 v7, 0x1

    goto :goto_0

    .line 788
    .restart local v3    # "start":J
    .restart local v5    # "waitTime":J
    :cond_3
    invoke-virtual {v0, v5, v6}, Ljava/lang/Object;->wait(J)V

    .line 790
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 791
    .local v1, "now":J
    sub-long v7, v1, v3

    sub-long/2addr v5, v7

    .line 792
    move-wide v3, v1

    .line 793
    goto :goto_1

    .line 794
    .end local v1    # "now":J
    .end local v3    # "start":J
    .end local v5    # "waitTime":J
    :catchall_0
    move-exception v7

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v7
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 796
    :catch_0
    move-exception v7

    goto :goto_2
.end method

.method write(Ljava/lang/String;)V
    .locals 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 992
    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 993
    .local v0, "utfBytes":[B
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/OutputStream;

    monitor-enter v1

    .line 994
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/OutputStream;

    invoke-virtual {v2, v0}, Ljava/io/OutputStream;->write([B)V

    .line 995
    monitor-exit v1

    .line 996
    return-void

    .line 995
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
