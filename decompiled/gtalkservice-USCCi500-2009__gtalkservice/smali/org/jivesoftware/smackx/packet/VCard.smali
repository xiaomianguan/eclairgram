.class public Lorg/jivesoftware/smackx/packet/VCard;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "VCard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/VCard$ContentBuilder;,
        Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Smack"

.field private static final _debug:Z


# instance fields
.field private avatar:[B

.field private emailHome:Ljava/lang/String;

.field private emailWork:Ljava/lang/String;

.field private encoded_avatar:Ljava/lang/String;

.field private firstName:Ljava/lang/String;

.field private hasModified:Z

.field private homeAddr:Ljava/util/Map;

.field private homePhones:Ljava/util/Map;

.field private lastName:Ljava/lang/String;

.field private localAvatarHash:Ljava/lang/String;

.field private middleName:Ljava/lang/String;

.field private modified:Z

.field private organization:Ljava/lang/String;

.field private organizationUnit:Ljava/lang/String;

.field private otherSimpleFields:Ljava/util/Map;

.field private otherUnescapableFields:Ljava/util/Map;

.field private workAddr:Ljava/util/Map;

.field private workPhones:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 137
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    .line 101
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    .line 110
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    .line 125
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->localAvatarHash:Ljava/lang/String;

    .line 132
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    .line 135
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    .line 138
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/packet/VCard;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasContent()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$1200(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$1300(Lorg/jivesoftware/smackx/packet/VCard;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasOrganizationFields()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1500(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1600(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1800(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1900(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/packet/VCard;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasNameField()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$600(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$700(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$800(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    return-object v0
.end method

.method private checkAuthenticated(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 665
    if-nez p1, :cond_0

    .line 666
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No connection was provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 668
    :cond_0
    invoke-virtual {p1}, Lorg/jivesoftware/smack/XMPPConnection;->isAuthenticated()Z

    move-result v0

    if-nez v0, :cond_1

    .line 669
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Connection is not authenticated"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 671
    :cond_1
    invoke-virtual {p1}, Lorg/jivesoftware/smack/XMPPConnection;->isAnonymous()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 672
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Connection cannot be anonymous"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 674
    :cond_2
    return-void
.end method

.method private copyFieldsFrom(Lorg/jivesoftware/smackx/packet/VCard;)V
    .locals 1
    .param p1, "result"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 642
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    .line 643
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    .line 644
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    .line 645
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    .line 647
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    .line 648
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    .line 649
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    .line 651
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    .line 652
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    .line 654
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    .line 655
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    .line 657
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->avatar:[B

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->avatar:[B

    .line 658
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->encoded_avatar:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->encoded_avatar:Ljava/lang/String;

    .line 660
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    .line 661
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    .line 662
    return-void
.end method

.method private doLoad(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;)V
    .locals 8
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;
    .param p2, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 560
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/packet/VCard;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 562
    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v1

    .line 564
    .local v1, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p1, p0}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 566
    const/4 v3, 0x0

    .line 568
    .local v3, "result":Lorg/jivesoftware/smackx/packet/VCard;
    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v1, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lorg/jivesoftware/smackx/packet/VCard;

    move-object v3, v0

    .line 570
    if-nez v3, :cond_1

    .line 571
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    new-instance v5, Lorg/jivesoftware/smack/packet/XMPPError;

    const/16 v6, 0x198

    const-string v7, "Timeout getting VCard information"

    invoke-direct {v5, v6, v7}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(ILjava/lang/String;)V

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 577
    :catch_0
    move-exception v4

    move-object v2, v4

    .line 578
    .local v2, "e":Ljava/lang/ClassCastException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "No VCard for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 583
    .end local v2    # "e":Ljava/lang/ClassCastException;
    :cond_0
    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/packet/VCard;->copyFieldsFrom(Lorg/jivesoftware/smackx/packet/VCard;)V

    .line 584
    return-void

    .line 573
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/VCard;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 574
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/VCard;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method public static getBytes(Ljava/net/URL;)[B
    .locals 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 420
    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 421
    .local v1, "path":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 422
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 423
    invoke-static {v0}, Lorg/jivesoftware/smackx/packet/VCard;->getFileBytes(Ljava/io/File;)[B

    move-result-object v2

    .line 426
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static getFileBytes(Ljava/io/File;)[B
    .locals 7
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 430
    const/4 v0, 0x0

    .line 432
    .local v0, "bis":Ljava/io/BufferedInputStream;
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 v6, 0x2000

    invoke-direct {v1, v5, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 433
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .local v1, "bis":Ljava/io/BufferedInputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v5

    long-to-int v3, v5

    .line 434
    .local v3, "bytes":I
    new-array v2, v3, [B

    .line 435
    .local v2, "buffer":[B
    invoke-virtual {v1, v2}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v4

    .line 436
    .local v4, "readBytes":I
    array-length v5, v2

    if-eq v4, v5, :cond_1

    .line 437
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Entire file not read"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 441
    .end local v2    # "buffer":[B
    .end local v3    # "bytes":I
    .end local v4    # "readBytes":I
    :catchall_0
    move-exception v5

    move-object v0, v1

    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    :goto_0
    if-eqz v0, :cond_0

    .line 442
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    :cond_0
    throw v5

    .line 441
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v2    # "buffer":[B
    .restart local v3    # "bytes":I
    .restart local v4    # "readBytes":I
    :cond_1
    if-eqz v1, :cond_2

    .line 442
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    :cond_2
    return-object v2

    .line 441
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "buffer":[B
    .end local v3    # "bytes":I
    .end local v4    # "readBytes":I
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    :catchall_1
    move-exception v5

    goto :goto_0
.end method

.method private hasContent()Z
    .locals 1

    .prologue
    .line 678
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasNameField()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasOrganizationFields()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private hasNameField()Z
    .locals 1

    .prologue
    .line 692
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private hasOrganizationFields()Z
    .locals 1

    .prologue
    .line 696
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private logv(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 975
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[VCard] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 976
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 702
    if-ne p0, p1, :cond_0

    const/4 v2, 0x1

    .line 742
    :goto_0
    return v2

    .line 703
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    :cond_1
    move v2, v4

    goto :goto_0

    .line 705
    :cond_2
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smackx/packet/VCard;

    move-object v1, v0

    .line 707
    .local v1, "vCard":Lorg/jivesoftware/smackx/packet/VCard;
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    :cond_3
    move v2, v4

    .line 708
    goto :goto_0

    .line 707
    :cond_4
    iget-object v2, v1, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 710
    :cond_5
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    :cond_6
    move v2, v4

    .line 711
    goto :goto_0

    .line 710
    :cond_7
    iget-object v2, v1, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    if-nez v2, :cond_6

    .line 713
    :cond_8
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    :cond_9
    move v2, v4

    .line 714
    goto :goto_0

    .line 713
    :cond_a
    iget-object v2, v1, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    if-nez v2, :cond_9

    .line 716
    :cond_b
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    move v2, v4

    .line 717
    goto :goto_0

    .line 719
    :cond_c
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    move v2, v4

    .line 720
    goto :goto_0

    .line 722
    :cond_d
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    if-eqz v2, :cond_f

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    :cond_e
    move v2, v4

    .line 723
    goto :goto_0

    .line 722
    :cond_f
    iget-object v2, v1, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    if-nez v2, :cond_e

    .line 725
    :cond_10
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    if-eqz v2, :cond_12

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_13

    :cond_11
    move v2, v4

    .line 726
    goto/16 :goto_0

    .line 725
    :cond_12
    iget-object v2, v1, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    if-nez v2, :cond_11

    .line 728
    :cond_13
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    if-eqz v2, :cond_15

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    :cond_14
    move v2, v4

    .line 730
    goto/16 :goto_0

    .line 728
    :cond_15
    iget-object v2, v1, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    if-nez v2, :cond_14

    .line 732
    :cond_16
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    if-eqz v2, :cond_18

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_19

    :cond_17
    move v2, v4

    .line 734
    goto/16 :goto_0

    .line 732
    :cond_18
    iget-object v2, v1, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    if-nez v2, :cond_17

    .line 736
    :cond_19
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1a

    move v2, v4

    .line 737
    goto/16 :goto_0

    .line 739
    :cond_1a
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1b

    move v2, v4

    .line 740
    goto/16 :goto_0

    .line 742
    :cond_1b
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    iget-object v3, v1, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto/16 :goto_0
.end method

.method public getAddressFieldHome(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "addrField"    # Ljava/lang/String;

    .prologue
    .line 257
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smackx/packet/VCard;
    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getAddressFieldWork(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "addrField"    # Ljava/lang/String;

    .prologue
    .line 277
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smackx/packet/VCard;
    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getAvatar()[B
    .locals 1

    .prologue
    .line 399
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->avatar:[B

    if-eqz v0, :cond_0

    .line 400
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->avatar:[B

    .line 407
    :goto_0
    return-object v0

    .line 403
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->encoded_avatar:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 404
    const/4 v0, 0x0

    goto :goto_0

    .line 407
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->encoded_avatar:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Base64Utils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    goto :goto_0
.end method

.method public getAvatarBase64Encoded()Ljava/lang/String;
    .locals 1

    .prologue
    .line 411
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->encoded_avatar:Ljava/lang/String;

    return-object v0
.end method

.method public getAvatarHash()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 453
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->getAvatar()[B

    move-result-object v0

    .line 454
    .local v0, "bytes":[B
    if-nez v0, :cond_0

    move-object v3, v4

    .line 468
    :goto_0
    return-object v3

    .line 460
    :cond_0
    :try_start_0
    const-string v3, "SHA-1"

    invoke-static {v3}, Landroid/security/MessageDigest;->getInstance(Ljava/lang/String;)Landroid/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 467
    .local v1, "digest":Landroid/security/MessageDigest;
    invoke-virtual {v1, v0}, Landroid/security/MessageDigest;->update([B)V

    .line 468
    invoke-virtual {v1}, Landroid/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smack/util/StringUtils;->encodeHex([B)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 462
    .end local v1    # "digest":Landroid/security/MessageDigest;
    :catch_0
    move-exception v3

    move-object v2, v3

    .line 463
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v2}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    move-object v3, v4

    .line 464
    goto :goto_0
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 2

    .prologue
    .line 587
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 588
    .local v0, "sb":Ljava/lang/StringBuffer;
    new-instance v1, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;

    invoke-direct {v1, p0, v0}, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;-><init>(Lorg/jivesoftware/smackx/packet/VCard;Ljava/lang/StringBuffer;)V

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;->write()V

    .line 589
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getEmailHome()Ljava/lang/String;
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    return-object v0
.end method

.method public getEmailWork()Ljava/lang/String;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    return-object v0
.end method

.method protected getExtensionProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 597
    new-instance v0, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v4, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->EXTENSION:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v0, v4}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 598
    .local v0, "extension":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual {v0, v5, v7}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 601
    new-instance v3, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v4, Lcom/google/android/gtalkservice/proto/GtalkExtensionsMessageTypes;->VCARD:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v3, v4}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 603
    .local v3, "vcard":Lcom/google/common/io/protocol/ProtoBuf;
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/VCard;->avatar:[B

    if-eqz v4, :cond_1

    .line 605
    new-instance v2, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v4, Lcom/google/android/gtalkservice/proto/GtalkExtensionsMessageTypes;->PHOTO:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v2, v4}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 606
    .local v2, "photo":Lcom/google/common/io/protocol/ProtoBuf;
    const-string v4, "image/jpeg"

    invoke-virtual {v2, v5, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 607
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/VCard;->avatar:[B

    invoke-virtual {v2, v6, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setBytes(I[B)V

    .line 608
    const/4 v4, 0x3

    invoke-virtual {v3, v4, v2}, Lcom/google/common/io/protocol/ProtoBuf;->addProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 617
    .end local v2    # "photo":Lcom/google/common/io/protocol/ProtoBuf;
    :cond_0
    :goto_0
    invoke-virtual {v0, v6, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 618
    return-object v0

    .line 611
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->getLocalAvatarHash()Ljava/lang/String;

    move-result-object v1

    .line 612
    .local v1, "localHash":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 613
    invoke-virtual {v3, v7, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public getField(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 147
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smackx/packet/VCard;
    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getFirstName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    return-object v0
.end method

.method public getJabberId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 227
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    const-string v1, "JABBERID"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smackx/packet/VCard;
    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getLastName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalAvatarHash()Ljava/lang/String;
    .locals 1

    .prologue
    .line 480
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->localAvatarHash:Ljava/lang/String;

    return-object v0
.end method

.method public getMiddleName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    return-object v0
.end method

.method public getNickName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 203
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    const-string v1, "NICKNAME"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smackx/packet/VCard;
    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getOrganization()Ljava/lang/String;
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    return-object v0
.end method

.method public getOrganizationUnit()Ljava/lang/String;
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneHome(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "phoneType"    # Ljava/lang/String;

    .prologue
    .line 307
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smackx/packet/VCard;
    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public getPhoneWork(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "phoneType"    # Ljava/lang/String;

    .prologue
    .line 326
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smackx/packet/VCard;
    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public hasModified()Z
    .locals 1

    .prologue
    .line 507
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->hasModified:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 748
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 749
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 750
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 751
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 752
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_0
    add-int v0, v1, v2

    .line 753
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int v0, v1, v2

    .line 754
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int v0, v1, v2

    .line 755
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_3
    add-int v0, v1, v2

    .line 756
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_4
    add-int v0, v1, v2

    .line 757
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_5
    add-int v0, v1, v2

    .line 758
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_6
    add-int v0, v1, v2

    .line 759
    mul-int/lit8 v1, v0, 0x1d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 760
    return v0

    :cond_0
    move v2, v3

    .line 752
    goto :goto_0

    :cond_1
    move v2, v3

    .line 753
    goto :goto_1

    :cond_2
    move v2, v3

    .line 754
    goto :goto_2

    :cond_3
    move v2, v3

    .line 755
    goto :goto_3

    :cond_4
    move v2, v3

    .line 756
    goto :goto_4

    :cond_5
    move v2, v3

    .line 757
    goto :goto_5

    :cond_6
    move v2, v3

    .line 758
    goto :goto_6
.end method

.method public isModified()Z
    .locals 1

    .prologue
    .line 495
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->modified:Z

    return v0
.end method

.method public load(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 543
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/VCard;->checkAuthenticated(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 545
    invoke-virtual {p1}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/VCard;->setFrom(Ljava/lang/String;)V

    .line 546
    invoke-virtual {p1}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/packet/VCard;->doLoad(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;)V

    .line 547
    return-void
.end method

.method public load(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;)V
    .locals 0
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;
    .param p2, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 553
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/VCard;->checkAuthenticated(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 555
    invoke-virtual {p0, p2}, Lorg/jivesoftware/smackx/packet/VCard;->setTo(Ljava/lang/String;)V

    .line 556
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/packet/VCard;->doLoad(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;)V

    .line 557
    return-void
.end method

.method public save(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 4
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 519
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/VCard;->checkAuthenticated(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 521
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/packet/VCard;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 522
    invoke-virtual {p1}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/packet/VCard;->setFrom(Ljava/lang/String;)V

    .line 523
    new-instance v2, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->getPacketID()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 524
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p1, p0}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 526
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    .line 529
    .local v1, "response":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 530
    if-nez v1, :cond_0

    .line 531
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string v3, "No response from server on status set."

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 533
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 534
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v2

    .line 536
    :cond_1
    return-void
.end method

.method public setAddressFieldHome(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "addrField"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 267
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    return-void
.end method

.method public setAddressFieldWork(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "addrField"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 287
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    return-void
.end method

.method public setAvatar(Ljava/net/URL;)V
    .locals 3
    .param p1, "avatarURL"    # Ljava/net/URL;

    .prologue
    .line 335
    const/4 v2, 0x0

    new-array v0, v2, [B

    .line 337
    .local v0, "bytes":[B
    :try_start_0
    invoke-static {p1}, Lorg/jivesoftware/smackx/packet/VCard;->getBytes(Ljava/net/URL;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 343
    :goto_0
    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->avatar:[B

    .line 344
    return-void

    .line 339
    :catch_0
    move-exception v1

    .line 340
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public setAvatar([B)V
    .locals 0
    .param p1, "bytes"    # [B

    .prologue
    .line 352
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->avatar:[B

    .line 353
    return-void
.end method

.method public setAvatarForUpload([B)V
    .locals 0
    .param p1, "bytes"    # [B

    .prologue
    .line 356
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->avatar:[B

    .line 363
    return-void
.end method

.method public setEmailHome(Ljava/lang/String;)V
    .locals 0
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 215
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    .line 216
    return-void
.end method

.method public setEmailWork(Ljava/lang/String;)V
    .locals 0
    .param p1, "emailWork"    # Ljava/lang/String;

    .prologue
    .line 223
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    .line 224
    return-void
.end method

.method public setEncodedImage(Ljava/lang/String;)V
    .locals 0
    .param p1, "encodedAvatar"    # Ljava/lang/String;

    .prologue
    .line 372
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->encoded_avatar:Ljava/lang/String;

    .line 373
    return-void
.end method

.method public setField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 158
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/jivesoftware/smackx/packet/VCard;->setField(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 159
    return-void
.end method

.method public setField(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "isUnescapable"    # Z

    .prologue
    .line 170
    if-nez p3, :cond_0

    .line 171
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    :goto_0
    return-void

    .line 174
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public setFirstName(Ljava/lang/String;)V
    .locals 0
    .param p1, "firstName"    # Ljava/lang/String;

    .prologue
    .line 183
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    .line 184
    return-void
.end method

.method public setHasModified(Z)V
    .locals 0
    .param p1, "hasModified"    # Z

    .prologue
    .line 503
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->hasModified:Z

    .line 504
    return-void
.end method

.method public setJabberId(Ljava/lang/String;)V
    .locals 2
    .param p1, "jabberId"    # Ljava/lang/String;

    .prologue
    .line 231
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    const-string v1, "JABBERID"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    return-void
.end method

.method public setLastName(Ljava/lang/String;)V
    .locals 0
    .param p1, "lastName"    # Ljava/lang/String;

    .prologue
    .line 191
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    .line 192
    return-void
.end method

.method public setLocalAvatarHash(Ljava/lang/String;)V
    .locals 0
    .param p1, "avatarHash"    # Ljava/lang/String;

    .prologue
    .line 476
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->localAvatarHash:Ljava/lang/String;

    .line 477
    return-void
.end method

.method public setMiddleName(Ljava/lang/String;)V
    .locals 0
    .param p1, "middleName"    # Ljava/lang/String;

    .prologue
    .line 199
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    .line 200
    return-void
.end method

.method public setModified(Z)V
    .locals 0
    .param p1, "modified"    # Z

    .prologue
    .line 491
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->modified:Z

    .line 492
    return-void
.end method

.method public setNickName(Ljava/lang/String;)V
    .locals 2
    .param p1, "nickName"    # Ljava/lang/String;

    .prologue
    .line 207
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    const-string v1, "NICKNAME"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    return-void
.end method

.method public setOrganization(Ljava/lang/String;)V
    .locals 0
    .param p1, "organization"    # Ljava/lang/String;

    .prologue
    .line 239
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    .line 240
    return-void
.end method

.method public setOrganizationUnit(Ljava/lang/String;)V
    .locals 0
    .param p1, "organizationUnit"    # Ljava/lang/String;

    .prologue
    .line 247
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    .line 248
    return-void
.end method

.method public setPhoneHome(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "phoneType"    # Ljava/lang/String;
    .param p2, "phoneNum"    # Ljava/lang/String;

    .prologue
    .line 298
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    return-void
.end method

.method public setPhoneWork(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "phoneType"    # Ljava/lang/String;
    .param p2, "phoneNum"    # Ljava/lang/String;

    .prologue
    .line 317
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 764
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->getChildElementXML()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
