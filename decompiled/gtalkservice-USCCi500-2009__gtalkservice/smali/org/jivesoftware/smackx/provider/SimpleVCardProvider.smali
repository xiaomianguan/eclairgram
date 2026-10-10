.class public Lorg/jivesoftware/smackx/provider/SimpleVCardProvider;
.super Ljava/lang/Object;
.source "SimpleVCardProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Smack"

.field private static final _debug:Z


# instance fields
.field encodedAvatar:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 165
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[SimpleVCardProvider] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    return-void
.end method

.method private parseVCardPhoto(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 82
    const/4 v0, 0x0

    .line 83
    .local v0, "done":Z
    const/4 v2, 0x0

    .line 87
    .local v2, "node":Ljava/lang/String;
    :cond_0
    :goto_0
    if-nez v0, :cond_3

    .line 88
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 90
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_1

    .line 91
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 99
    :cond_1
    const/4 v3, 0x3

    if-ne v1, v3, :cond_2

    .line 100
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "PHOTO"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 102
    const/4 v0, 0x1

    goto :goto_0

    .line 105
    :cond_2
    const/4 v3, 0x4

    if-ne v1, v3, :cond_0

    .line 106
    if-eqz v2, :cond_0

    .line 107
    const-string v3, "BINVAL"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 108
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smackx/provider/SimpleVCardProvider;->encodedAvatar:Ljava/lang/String;

    goto :goto_0

    .line 114
    .end local v1    # "eventType":I
    :cond_3
    return-void
.end method


# virtual methods
.method public getProtoBufType()Lcom/google/common/io/protocol/ProtoBufType;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/google/android/gtalkservice/proto/GtalkExtensionsMessageTypes;->VCARD:Lcom/google/common/io/protocol/ProtoBufType;

    return-object v0
.end method

.method public getTag()I
    .locals 1

    .prologue
    .line 153
    const/4 v0, 0x4

    return v0
.end method

.method public parseIQ(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 8
    .param p1, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x3

    const/4 v5, 0x2

    .line 121
    new-instance v3, Lorg/jivesoftware/smackx/packet/VCard;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/packet/VCard;-><init>()V

    .line 123
    .local v3, "vcard":Lorg/jivesoftware/smackx/packet/VCard;
    invoke-virtual {p1, v7}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 124
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/VCard;->setHasModified(Z)V

    .line 125
    invoke-virtual {p1, v7}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v1

    .line 128
    .local v1, "modified":Z
    invoke-virtual {v3, v1}, Lorg/jivesoftware/smackx/packet/VCard;->setModified(Z)V

    .line 131
    .end local v1    # "modified":Z
    :cond_0
    invoke-virtual {p1, v6}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 132
    invoke-virtual {p1, v6}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(I)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v2

    .line 134
    .local v2, "photo":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual {v2, v5}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 135
    invoke-virtual {v2, v5}, Lcom/google/common/io/protocol/ProtoBuf;->getBytes(I)[B

    move-result-object v0

    .line 137
    .local v0, "data":[B
    invoke-virtual {v3, v0}, Lorg/jivesoftware/smackx/packet/VCard;->setAvatar([B)V

    .line 145
    .end local v0    # "data":[B
    .end local v2    # "photo":Lcom/google/common/io/protocol/ProtoBuf;
    :cond_1
    return-object v3
.end method

.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 44
    const/4 v1, 0x0

    .line 45
    .local v1, "done":Z
    new-instance v4, Lorg/jivesoftware/smackx/packet/VCard;

    invoke-direct {v4}, Lorg/jivesoftware/smackx/packet/VCard;-><init>()V

    .line 46
    .local v4, "vcard":Lorg/jivesoftware/smackx/packet/VCard;
    iput-object v7, p0, Lorg/jivesoftware/smackx/provider/SimpleVCardProvider;->encodedAvatar:Ljava/lang/String;

    .line 48
    const-string v5, "google:avatar"

    const-string v6, "modified"

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 49
    .local v3, "modified":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 51
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/packet/VCard;->setHasModified(Z)V

    .line 52
    const-string v5, "true"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/packet/VCard;->setModified(Z)V

    .line 55
    :cond_0
    :goto_0
    if-nez v1, :cond_2

    .line 56
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 57
    .local v2, "eventType":I
    const/4 v5, 0x2

    if-ne v2, v5, :cond_1

    .line 58
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "PHOTO"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 60
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/provider/SimpleVCardProvider;->parseVCardPhoto(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    .line 63
    :cond_1
    const/4 v5, 0x3

    if-ne v2, v5, :cond_0

    .line 64
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "vCard"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 65
    const/4 v1, 0x1

    goto :goto_0

    .line 70
    .end local v2    # "eventType":I
    :cond_2
    iget-object v5, p0, Lorg/jivesoftware/smackx/provider/SimpleVCardProvider;->encodedAvatar:Ljava/lang/String;

    if-eqz v5, :cond_3

    .line 71
    iget-object v5, p0, Lorg/jivesoftware/smackx/provider/SimpleVCardProvider;->encodedAvatar:Ljava/lang/String;

    invoke-static {v5}, Landroid/os/Base64Utils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    .line 72
    .local v0, "data":[B
    invoke-virtual {v4, v0}, Lorg/jivesoftware/smackx/packet/VCard;->setAvatar([B)V

    .line 75
    iput-object v7, p0, Lorg/jivesoftware/smackx/provider/SimpleVCardProvider;->encodedAvatar:Ljava/lang/String;

    .line 78
    .end local v0    # "data":[B
    :cond_3
    return-object v4
.end method
