.class Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;
.super Ljava/lang/Object;
.source "PacketWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/PacketWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InterceptorWrapper"
.end annotation


# instance fields
.field private packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private packetInterceptor:Lorg/jivesoftware/smack/PacketInterceptor;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 0
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 684
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 685
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->packetInterceptor:Lorg/jivesoftware/smack/PacketInterceptor;

    .line 686
    iput-object p2, p0, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 687
    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;)Lorg/jivesoftware/smack/PacketInterceptor;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;

    .prologue
    .line 678
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->packetInterceptor:Lorg/jivesoftware/smack/PacketInterceptor;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 690
    if-nez p1, :cond_0

    move v0, v1

    .line 700
    .end local p1    # "object":Ljava/lang/Object;
    :goto_0
    return v0

    .line 693
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;

    if-eqz v0, :cond_1

    .line 694
    check-cast p1, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;

    .end local p1    # "object":Ljava/lang/Object;
    iget-object v0, p1, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->packetInterceptor:Lorg/jivesoftware/smack/PacketInterceptor;

    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->packetInterceptor:Lorg/jivesoftware/smack/PacketInterceptor;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 697
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Lorg/jivesoftware/smack/PacketInterceptor;

    if-eqz v0, :cond_2

    .line 698
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->packetInterceptor:Lorg/jivesoftware/smack/PacketInterceptor;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_2
    move v0, v1

    .line 700
    goto :goto_0
.end method

.method public notifyListener(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 1
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 704
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-interface {v0, p1}, Lorg/jivesoftware/smack/filter/PacketFilter;->accept(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 705
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$InterceptorWrapper;->packetInterceptor:Lorg/jivesoftware/smack/PacketInterceptor;

    invoke-interface {v0, p1}, Lorg/jivesoftware/smack/PacketInterceptor;->interceptPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 707
    :cond_1
    return-void
.end method
