.class public Lorg/jivesoftware/smack/ProtoBufAuthentication;
.super Ljava/lang/Object;
.source "ProtoBufAuthentication.java"

# interfaces
.implements Lorg/jivesoftware/smack/UserAuthentication;


# instance fields
.field private final adaptiveHeartbeat:Z

.field private final compress:I

.field private final connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private final deviceId:Ljava/lang/String;

.field private heartbeatConfig:Lorg/jivesoftware/smack/packet/HeartbeatConfig;

.field private final heartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

.field private final lastRmqId:J

.field private final loginSettings:Ljava/util/Map;
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

.field private final rmq2S2dIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private settings:Ljava/util/Map;
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

.field private final useRmq:Z

.field private final useRmq2:Z


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;ZJZLjava/util/List;IZLorg/jivesoftware/smack/packet/HeartbeatStat;Ljava/util/Map;)V
    .locals 0
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;
    .param p2, "deviceId"    # Ljava/lang/String;
    .param p3, "useRmq"    # Z
    .param p4, "lastRmqId"    # J
    .param p6, "useRmq2"    # Z
    .param p8, "compress"    # I
    .param p9, "adaptiveHeartbeat"    # Z
    .param p10, "heartbeatStat"    # Lorg/jivesoftware/smack/packet/HeartbeatStat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/XMPPConnection;",
            "Ljava/lang/String;",
            "ZJZ",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;IZ",
            "Lorg/jivesoftware/smack/packet/HeartbeatStat;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p7, "rmq2S2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p11, "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 46
    iput-object p2, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->deviceId:Ljava/lang/String;

    .line 47
    iput-boolean p3, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->useRmq:Z

    .line 48
    iput-boolean p6, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->useRmq2:Z

    .line 49
    iput-wide p4, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->lastRmqId:J

    .line 50
    iput-object p7, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->rmq2S2dIds:Ljava/util/List;

    .line 51
    iput-object p11, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->loginSettings:Ljava/util/Map;

    .line 52
    iput p8, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->compress:I

    .line 53
    iput-boolean p9, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->adaptiveHeartbeat:Z

    .line 54
    iput-object p10, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->heartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

    .line 55
    return-void
.end method


# virtual methods
.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 24
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 75
    .local v4, "user":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 76
    .local v5, "domain":Ljava/lang/String;
    new-instance v3, Lorg/jivesoftware/smack/packet/LoginRequest;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->deviceId:Ljava/lang/String;

    move-object v8, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->useRmq:Z

    move v9, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->lastRmqId:J

    move-wide v10, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->useRmq2:Z

    move v12, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->rmq2S2dIds:Ljava/util/List;

    move-object v13, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->compress:I

    move v14, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->adaptiveHeartbeat:Z

    move v15, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->heartbeatStat:Lorg/jivesoftware/smack/packet/HeartbeatStat;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->loginSettings:Ljava/util/Map;

    move-object/from16 v17, v0

    move-object/from16 v6, p3

    move-object/from16 v7, p2

    invoke-direct/range {v3 .. v17}, Lorg/jivesoftware/smack/packet/LoginRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJZLjava/util/List;IZLorg/jivesoftware/smack/packet/HeartbeatStat;Ljava/util/Map;)V

    .line 80
    .local v3, "login":Lorg/jivesoftware/smack/packet/LoginRequest;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/LoginRequest;->getPacketID()Ljava/lang/String;

    move-result-object v20

    .line 81
    .local v20, "id":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v6, v0

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    move-object v0, v7

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v18

    .line 84
    .local v18, "collector":Lorg/jivesoftware/smack/PacketCollector;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v6, v0

    iget-object v6, v6, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v6, v3}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 88
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v6, v6

    move-object/from16 v0, v18

    move-wide v1, v6

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v22

    .line 89
    .local v22, "packet":Lorg/jivesoftware/smack/packet/Packet;
    if-nez v22, :cond_0

    .line 90
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "Authentication timed out."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 91
    :cond_0
    move-object/from16 v0, v22

    instance-of v0, v0, Lorg/jivesoftware/smack/packet/LoginResponse;

    move v6, v0

    if-nez v6, :cond_1

    .line 94
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "Expected LoginResponse!"

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 96
    :cond_1
    move-object/from16 v0, v22

    check-cast v0, Lorg/jivesoftware/smack/packet/LoginResponse;

    move-object/from16 v23, v0

    .line 97
    .local v23, "response":Lorg/jivesoftware/smack/packet/LoginResponse;
    invoke-virtual/range {v23 .. v23}, Lorg/jivesoftware/smack/packet/LoginResponse;->getJid()Ljava/lang/String;

    move-result-object v21

    .line 98
    .local v21, "jid":Ljava/lang/String;
    invoke-static/range {v21 .. v21}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 99
    invoke-virtual/range {v23 .. v23}, Lorg/jivesoftware/smack/packet/LoginResponse;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v19

    .line 100
    .local v19, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-nez v19, :cond_2

    .line 105
    new-instance v19, Lorg/jivesoftware/smack/packet/XMPPError;

    .end local v19    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    const/16 v6, 0x191

    move-object/from16 v0, v19

    move v1, v6

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(I)V

    .line 107
    .restart local v19    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_2
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    move-object v0, v6

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v6

    .line 109
    .end local v19    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_3
    invoke-virtual/range {v23 .. v23}, Lorg/jivesoftware/smack/packet/LoginResponse;->getSettings()Ljava/util/Map;

    move-result-object v6

    move-object v0, v6

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/ProtoBufAuthentication;->settings:Ljava/util/Map;

    .line 110
    invoke-virtual/range {v23 .. v23}, Lorg/jivesoftware/smack/packet/LoginResponse;->getHeartbeatConfig()Lorg/jivesoftware/smack/packet/HeartbeatConfig;

    move-result-object v6

    move-object v0, v6

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/ProtoBufAuthentication;->heartbeatConfig:Lorg/jivesoftware/smack/packet/HeartbeatConfig;

    .line 113
    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 115
    return-object v21
.end method

.method public authenticateAnonymously()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Must supply username and password."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getHeartbeatConfig()Lorg/jivesoftware/smack/packet/HeartbeatConfig;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->heartbeatConfig:Lorg/jivesoftware/smack/packet/HeartbeatConfig;

    return-object v0
.end method

.method public getServerSettings()Ljava/util/Map;
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
    .line 61
    iget-object v0, p0, Lorg/jivesoftware/smack/ProtoBufAuthentication;->settings:Ljava/util/Map;

    return-object v0
.end method
