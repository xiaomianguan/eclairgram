.class public Lorg/jivesoftware/smack/packet/PresenceCapability;
.super Lorg/jivesoftware/smack/packet/DefaultPacketExtension;
.source "PresenceCapability.java"


# static fields
.field private static final NS:Ljava/lang/String; = "http://jabber.org/protocol/caps"


# instance fields
.field private mExtension:Ljava/lang/String;

.field private mHash:Ljava/lang/String;

.field private mNode:Ljava/lang/String;

.field private mVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "node"    # Ljava/lang/String;

    .prologue
    .line 35
    const-string v0, "c"

    const-string v1, "http://jabber.org/protocol/caps"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/packet/PresenceCapability;->setNode(Ljava/lang/String;)V

    .line 37
    return-void
.end method


# virtual methods
.method public getExtension()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mExtension:Ljava/lang/String;

    return-object v0
.end method

.method public getHash()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mHash:Ljava/lang/String;

    return-object v0
.end method

.method public getNode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mNode:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mVersion:Ljava/lang/String;

    return-object v0
.end method

.method public setExtension(Ljava/lang/String;)V
    .locals 0
    .param p1, "ext"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mExtension:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public setHash(Ljava/lang/String;)V
    .locals 0
    .param p1, "hash"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mHash:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public setNode(Ljava/lang/String;)V
    .locals 0
    .param p1, "node"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mNode:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mVersion:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 8

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 101
    new-instance v2, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v5, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->EXTENSION:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v2, v5}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 102
    .local v2, "extension":Lcom/google/common/io/protocol/ProtoBuf;
    const/16 v5, 0x8

    invoke-virtual {v2, v6, v5}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 105
    new-instance v0, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v5, Lcom/google/android/gtalkservice/proto/GtalkExtensionsMessageTypes;->CAPABILITIES:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v0, v5}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 106
    .local v0, "capabilities":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PresenceCapability;->getNode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v6, v5}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 108
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mExtension:Ljava/lang/String;

    .line 109
    .local v1, "ext":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 110
    const/4 v5, 0x3

    invoke-virtual {v0, v5, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 113
    :cond_0
    iget-object v4, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mVersion:Ljava/lang/String;

    .line 114
    .local v4, "version":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 115
    invoke-virtual {v0, v7, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 118
    :cond_1
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mHash:Ljava/lang/String;

    .line 119
    .local v3, "hash":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 120
    const/4 v5, 0x4

    invoke-virtual {v0, v5, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 123
    :cond_2
    invoke-virtual {v2, v7, v0}, Lcom/google/common/io/protocol/ProtoBuf;->setProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 124
    return-object v2
.end method

.method public toXML()Ljava/lang/String;
    .locals 7

    .prologue
    const-string v6, "\""

    .line 72
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 74
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v4, "<c xmlns=\""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "http://jabber.org/protocol/caps"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 75
    const-string v4, " node=\""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PresenceCapability;->getNode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 77
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mExtension:Ljava/lang/String;

    .line 78
    .local v1, "ext":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 79
    const-string v4, " ext=\""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 82
    :cond_0
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mVersion:Ljava/lang/String;

    .line 83
    .local v3, "version":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 84
    const-string v4, " ver=\""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 87
    :cond_1
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/PresenceCapability;->mHash:Ljava/lang/String;

    .line 88
    .local v2, "hash":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 89
    const-string v4, " hash=\""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    :cond_2
    const-string v4, " />"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
