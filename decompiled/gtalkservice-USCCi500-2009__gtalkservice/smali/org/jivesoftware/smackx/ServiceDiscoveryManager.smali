.class public Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
.super Ljava/lang/Object;
.source "ServiceDiscoveryManager.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Smack"

.field private static identityName:Ljava/lang/String;

.field private static identityType:Ljava/lang/String;

.field private static instances:Ljava/util/Map;


# instance fields
.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private features:Ljava/util/List;

.field private nodeInformationProviders:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const-string v0, "Android"

    sput-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identityName:Ljava/lang/String;

    .line 47
    const-string v0, "phone"

    sput-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identityType:Ljava/lang/String;

    .line 49
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->instances:Ljava/util/Map;

    .line 57
    new-instance v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$1;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$1;-><init>()V

    invoke-static {v0}, Lorg/jivesoftware/smack/XMPPConnection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionEstablishedListener;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    .line 53
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->nodeInformationProviders:Ljava/util/Map;

    .line 72
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 73
    invoke-direct {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->init()V

    .line 74
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Lorg/jivesoftware/smack/XMPPConnection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    return-object v0
.end method

.method static synthetic access$100()Ljava/util/Map;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->instances:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getNodeInformationProvider(Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    return-object v0
.end method

.method public static getIdentityName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    sget-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identityName:Ljava/lang/String;

    return-object v0
.end method

.method public static getIdentityType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    sget-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identityType:Ljava/lang/String;

    return-object v0
.end method

.method public static getInstanceFor(Lorg/jivesoftware/smack/XMPPConnection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    .locals 1
    .param p0, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 83
    sget-object v0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->instances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "connection":Lorg/jivesoftware/smack/XMPPConnection;
    check-cast p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    return-object p0
.end method

.method private getNodeInformationProvider(Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;
    .locals 1
    .param p1, "node"    # Ljava/lang/String;

    .prologue
    .line 250
    if-nez p1, :cond_0

    .line 251
    const/4 v0, 0x0

    .line 253
    .end local p0    # "this":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    :goto_0
    return-object v0

    .restart local p0    # "this":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->nodeInformationProviders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    check-cast p0, Lorg/jivesoftware/smackx/NodeInformationProvider;

    move-object v0, p0

    goto :goto_0
.end method

.method private init()V
    .locals 4

    .prologue
    .line 138
    sget-object v2, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->instances:Ljava/util/Map;

    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-interface {v2, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v3, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;-><init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/XMPPConnection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 154
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    invoke-direct {v0, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 155
    .local v0, "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;-><init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V

    .line 184
    .local v1, "packetListener":Lorg/jivesoftware/smack/PacketListener;
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v2, v1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 188
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    .end local v0    # "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    const-class v2, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v0, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 189
    .restart local v0    # "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v1, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;

    .end local v1    # "packetListener":Lorg/jivesoftware/smack/PacketListener;
    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;-><init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V

    .line 235
    .restart local v1    # "packetListener":Lorg/jivesoftware/smack/PacketListener;
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v2, v1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 236
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 514
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ServDisc] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    return-void
.end method

.method private logv(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 510
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ServDisc] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    return-void
.end method

.method public static setIdentityName(Ljava/lang/String;)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 105
    sput-object p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identityName:Ljava/lang/String;

    .line 106
    return-void
.end method

.method public static setIdentityType(Ljava/lang/String;)V
    .locals 0
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    .line 129
    sput-object p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->identityType:Ljava/lang/String;

    .line 130
    return-void
.end method


# virtual methods
.method public addFeature(Ljava/lang/String;)V
    .locals 2
    .param p1, "feature"    # Ljava/lang/String;

    .prologue
    .line 310
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    monitor-enter v0

    .line 311
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 312
    monitor-exit v0

    .line 313
    return-void

    .line 312
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public canPublishItems(Ljava/lang/String;)Z
    .locals 2
    .param p1, "entityID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 455
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    .line 456
    .local v0, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const-string v1, "http://jabber.org/protocol/disco#publish"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .locals 1
    .param p1, "entityID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 349
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v0

    return-object v0
.end method

.method public discoverInfo(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .locals 6
    .param p1, "entityID"    # Ljava/lang/String;
    .param p2, "node"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 364
    new-instance v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;-><init>()V

    .line 365
    .local v1, "disco":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 366
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setTo(Ljava/lang/String;)V

    .line 367
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setNode(Ljava/lang/String;)V

    .line 370
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 373
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    const-string v3, "discoverInfo: send disco info"

    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->logv(Ljava/lang/String;)V

    .line 374
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "    "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->toXML()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->logv(Ljava/lang/String;)V

    .line 376
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 379
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v0, v3, v4}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 381
    .local v2, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 382
    if-nez v2, :cond_0

    .line 383
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string v4, "No response from the server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 385
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v3, v4, :cond_1

    .line 386
    const-string v3, "discoverInfo: got IQ error"

    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->loge(Ljava/lang/String;)V

    .line 387
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 389
    :cond_1
    check-cast v2, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .end local v2    # "result":Lorg/jivesoftware/smack/packet/IQ;
    return-object v2
.end method

.method public discoverItems(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;
    .locals 1
    .param p1, "entityID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 400
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v0

    return-object v0
.end method

.method public discoverItems(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;
    .locals 6
    .param p1, "entityID"    # Ljava/lang/String;
    .param p2, "node"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 415
    new-instance v1, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;-><init>()V

    .line 416
    .local v1, "disco":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 417
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setTo(Ljava/lang/String;)V

    .line 418
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setNode(Ljava/lang/String;)V

    .line 420
    const-string v3, "discoverItems: send disco "

    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->logv(Ljava/lang/String;)V

    .line 421
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "    "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->toXML()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->logv(Ljava/lang/String;)V

    .line 424
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 427
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 430
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v0, v3, v4}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 432
    .local v2, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 433
    if-nez v2, :cond_0

    .line 434
    const-string v3, "discoverItems: timed out"

    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->loge(Ljava/lang/String;)V

    .line 435
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string v4, "No response from the server."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 437
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v3, v4, :cond_1

    .line 438
    const-string v3, "discoverItems: got IQ error"

    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->loge(Ljava/lang/String;)V

    .line 439
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 441
    :cond_1
    check-cast v2, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    .end local v2    # "result":Lorg/jivesoftware/smack/packet/IQ;
    return-object v2
.end method

.method public getFeatures()Ljava/util/Iterator;
    .locals 3

    .prologue
    .line 293
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    monitor-enter v0

    .line 294
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 295
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public includesFeature(Ljava/lang/String;)Z
    .locals 2
    .param p1, "feature"    # Ljava/lang/String;

    .prologue
    .line 336
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    monitor-enter v0

    .line 337
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    monitor-exit v0

    return v1

    .line 338
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public publishItems(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverItems;)V
    .locals 5
    .param p1, "entityID"    # Ljava/lang/String;
    .param p2, "node"    # Ljava/lang/String;
    .param p3, "discoverItems"    # Lorg/jivesoftware/smackx/packet/DiscoverItems;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 487
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p3, v2}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 488
    invoke-virtual {p3, p1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setTo(Ljava/lang/String;)V

    .line 489
    invoke-virtual {p3, p2}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setNode(Ljava/lang/String;)V

    .line 492
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 495
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v2, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v2, p3}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 498
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/IQ;

    .line 500
    .local v1, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 501
    if-nez v1, :cond_0

    .line 502
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string v3, "No response from the server."

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 504
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v2

    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v2, v3, :cond_1

    .line 505
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v2

    .line 507
    :cond_1
    return-void
.end method

.method public publishItems(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverItems;)V
    .locals 1
    .param p1, "entityID"    # Ljava/lang/String;
    .param p2, "discoverItems"    # Lorg/jivesoftware/smackx/packet/DiscoverItems;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 471
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->publishItems(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverItems;)V

    .line 472
    return-void
.end method

.method public removeFeature(Ljava/lang/String;)V
    .locals 2
    .param p1, "feature"    # Ljava/lang/String;

    .prologue
    .line 324
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    monitor-enter v0

    .line 325
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->features:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 326
    monitor-exit v0

    .line 327
    return-void

    .line 326
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public removeNodeInformationProvider(Ljava/lang/String;)V
    .locals 1
    .param p1, "node"    # Ljava/lang/String;

    .prologue
    .line 284
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->nodeInformationProviders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    return-void
.end method

.method public setNodeInformationProvider(Ljava/lang/String;Lorg/jivesoftware/smackx/NodeInformationProvider;)V
    .locals 1
    .param p1, "node"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/jivesoftware/smackx/NodeInformationProvider;

    .prologue
    .line 270
    iget-object v0, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->nodeInformationProviders:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    return-void
.end method
