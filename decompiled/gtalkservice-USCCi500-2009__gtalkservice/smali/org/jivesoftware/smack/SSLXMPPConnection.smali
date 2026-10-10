.class public Lorg/jivesoftware/smack/SSLXMPPConnection;
.super Lorg/jivesoftware/smack/XMPPConnection;
.source "SSLXMPPConnection.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Smack"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 62
    const/16 v0, 0x1467

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smack/SSLXMPPConnection;-><init>(Ljava/lang/String;I)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 78
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, v3

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smack/SSLXMPPConnection;-><init>(Ljava/lang/String;IIZLjava/lang/String;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIZLjava/lang/String;)V
    .locals 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "sslHandshakeTimeout"    # I
    .param p4, "useProtoBuf"    # Z
    .param p5, "serviceName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-static {p3}, Landroid/net/SSLCertificateSocketFactory;->getDefault(I)Ljavax/net/SocketFactory;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p5

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smack/XMPPConnection;-><init>(Ljava/lang/String;ILjava/lang/String;ZLjavax/net/SocketFactory;)V

    .line 105
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIZLjava/lang/String;Ljavax/net/SocketFactory;)V
    .locals 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "sslHandshakeTimeout"    # I
    .param p4, "useProtoBuf"    # Z
    .param p5, "serviceName"    # Ljava/lang/String;
    .param p6, "factory"    # Ljavax/net/SocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 128
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p5

    move v4, p4

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smack/XMPPConnection;-><init>(Ljava/lang/String;ILjava/lang/String;ZLjavax/net/SocketFactory;)V

    .line 129
    return-void
.end method


# virtual methods
.method public isSecureConnection()Z
    .locals 1

    .prologue
    .line 133
    const/4 v0, 0x1

    return v0
.end method
