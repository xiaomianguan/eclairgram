.class Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;
.super Ljava/lang/Object;
.source "PacketWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/PacketWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ListenerWrapper"
.end annotation


# instance fields
.field private packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private packetListener:Lorg/jivesoftware/smack/PacketListener;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 0
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 650
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 651
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    .line 652
    iput-object p2, p0, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 653
    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;)Lorg/jivesoftware/smack/PacketListener;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;

    .prologue
    .line 643
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 656
    if-nez p1, :cond_0

    move v0, v1

    .line 665
    .end local p1    # "object":Ljava/lang/Object;
    :goto_0
    return v0

    .line 659
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;

    if-eqz v0, :cond_1

    .line 660
    check-cast p1, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;

    .end local p1    # "object":Ljava/lang/Object;
    iget-object v0, p1, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 662
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Lorg/jivesoftware/smack/PacketListener;

    if-eqz v0, :cond_2

    .line 663
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_2
    move v0, v1

    .line 665
    goto :goto_0
.end method

.method public notifyListener(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 1
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 669
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-interface {v0, p1}, Lorg/jivesoftware/smack/filter/PacketFilter;->accept(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 670
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$ListenerWrapper;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-interface {v0, p1}, Lorg/jivesoftware/smack/PacketListener;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 672
    :cond_1
    return-void
.end method
