.class Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;
.super Ljava/lang/Object;
.source "ServiceDiscoveryManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V
    .locals 0

    .prologue
    .line 190
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 8
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 191
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-object v1, v0

    .line 193
    .local v1, "discoverInfo":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v6, v7, :cond_3

    .line 194
    new-instance v5, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v5}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;-><init>()V

    .line 195
    .local v5, "response":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    sget-object v6, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 196
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getFrom()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setTo(Ljava/lang/String;)V

    .line 197
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getPacketID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setPacketID(Ljava/lang/String;)V

    .line 199
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getNode()Ljava/lang/String;

    move-result-object v4

    .line 202
    .local v4, "node":Ljava/lang/String;
    if-eqz v4, :cond_0

    iget-object v6, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-static {v6, v4}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$200(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 204
    :cond_0
    new-instance v2, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    const-string v6, "client"

    invoke-static {}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getIdentityName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v6, v7}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .local v2, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    invoke-static {}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getIdentityType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->setType(Ljava/lang/String;)V

    .line 207
    invoke-virtual {v5, v2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addIdentity(Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;)V

    .line 211
    if-nez v4, :cond_2

    .line 213
    iget-object v6, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-static {v6}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$300(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Ljava/util/List;

    move-result-object v7

    monitor-enter v7

    .line 214
    :try_start_0
    iget-object v6, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-virtual {v6}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getFeatures()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 215
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addFeature(Ljava/lang/String;)V

    goto :goto_0

    .line 217
    .end local v3    # "it":Ljava/util/Iterator;
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    .restart local v3    # "it":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 231
    .end local v2    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    .end local v3    # "it":Ljava/util/Iterator;
    :cond_2
    iget-object v6, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-static {v6}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$000(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v6

    invoke-virtual {v6, v5}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 233
    .end local v4    # "node":Ljava/lang/String;
    .end local v5    # "response":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :cond_3
    return-void
.end method
