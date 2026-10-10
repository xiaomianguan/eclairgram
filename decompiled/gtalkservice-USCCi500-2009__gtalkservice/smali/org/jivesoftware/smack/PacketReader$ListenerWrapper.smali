.class Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
.super Ljava/lang/Object;
.source "PacketReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/PacketReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ListenerWrapper"
.end annotation


# instance fields
.field private packetCollector:Lorg/jivesoftware/smack/PacketCollector;

.field private packetListener:Lorg/jivesoftware/smack/PacketListener;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/PacketReader;Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 1
    .param p1, "packetReader"    # Lorg/jivesoftware/smack/PacketReader;
    .param p2, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p3, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 1797
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1798
    iput-object p2, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    .line 1799
    new-instance v0, Lorg/jivesoftware/smack/PacketCollector;

    invoke-direct {v0, p1, p3}, Lorg/jivesoftware/smack/PacketCollector;-><init>(Lorg/jivesoftware/smack/PacketReader;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetCollector:Lorg/jivesoftware/smack/PacketCollector;

    .line 1800
    return-void
.end method

.method static synthetic access$300(Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;)Lorg/jivesoftware/smack/PacketListener;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;

    .prologue
    .line 1790
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;)Lorg/jivesoftware/smack/PacketCollector;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;

    .prologue
    .line 1790
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetCollector:Lorg/jivesoftware/smack/PacketCollector;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1827
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 1828
    iput-object v1, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetCollector:Lorg/jivesoftware/smack/PacketCollector;

    .line 1829
    iput-object v1, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    .line 1830
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1803
    if-nez p1, :cond_0

    move v0, v1

    .line 1812
    .end local p1    # "object":Ljava/lang/Object;
    :goto_0
    return v0

    .line 1806
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;

    if-eqz v0, :cond_1

    .line 1807
    check-cast p1, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;

    .end local p1    # "object":Ljava/lang/Object;
    iget-object v0, p1, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 1809
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Lorg/jivesoftware/smack/PacketListener;

    if-eqz v0, :cond_2

    .line 1810
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_2
    move v0, v1

    .line 1812
    goto :goto_0
.end method

.method public notifyListener()Z
    .locals 2

    .prologue
    .line 1816
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetCollector:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketCollector;->pollResult()Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    .line 1817
    .local v0, "packet":Lorg/jivesoftware/smack/packet/Packet;
    if-eqz v0, :cond_0

    .line 1818
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-interface {v1, v0}, Lorg/jivesoftware/smack/PacketListener;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1819
    const/4 v1, 0x1

    .line 1822
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
