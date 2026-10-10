.class Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;
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
    .line 156
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 7
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 157
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-object v1, v0

    .line 159
    .local v1, "discoverItems":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v4, v5, :cond_2

    .line 160
    new-instance v3, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;-><init>()V

    .line 161
    .local v3, "response":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 162
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getFrom()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setTo(Ljava/lang/String;)V

    .line 163
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setPacketID(Ljava/lang/String;)V

    .line 167
    iget-object v4, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getNode()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$200(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 168
    iget-object v4, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getNode()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$200(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;

    move-result-object v4

    invoke-interface {v4}, Lorg/jivesoftware/smackx/NodeInformationProvider;->getNodeItems()Ljava/util/Iterator;

    move-result-object v2

    .line 170
    .local v2, "items":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 171
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->addItem(Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;)V

    goto :goto_0

    .line 173
    .end local v2    # "items":Ljava/util/Iterator;
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getNode()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 176
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getNode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setNode(Ljava/lang/String;)V

    .line 177
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 178
    new-instance v4, Lorg/jivesoftware/smack/packet/XMPPError;

    const/16 v5, 0x194

    const-string v6, "item-not-found"

    invoke-direct {v4, v5, v6}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 180
    :cond_1
    iget-object v4, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-static {v4}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$000(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v4

    invoke-virtual {v4, v3}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 182
    .end local v3    # "response":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    :cond_2
    return-void
.end method
