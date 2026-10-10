.class public Lorg/jivesoftware/smack/util/PacketParserUtils;
.super Ljava/lang/Object;
.source "PacketParserUtils.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Smack"

.field private static final PARSE_MESSAGE_BODY_ENHANCED:Z = true

.field private static final PROPERTIES_NAMESPACE:Ljava/lang/String; = "http://www.jivesoftware.com/xmlns/xmpp/properties"

.field private static final PULL_XML_FEATURE_RELAXED:Ljava/lang/String; = "http://xmlpull.org/v1/doc/features.html#relaxed"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBoolOrDefault(Lcom/google/common/io/protocol/ProtoBuf;IZ)Z
    .locals 1
    .param p0, "proto"    # Lcom/google/common/io/protocol/ProtoBuf;
    .param p1, "field"    # I
    .param p2, "defaultValue"    # Z

    .prologue
    .line 72
    invoke-virtual {p0, p1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    move v0, p2

    goto :goto_0
.end method

.method public static getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I
    .locals 1
    .param p0, "proto"    # Lcom/google/common/io/protocol/ProtoBuf;
    .param p1, "field"    # I
    .param p2, "defaultValue"    # I

    .prologue
    .line 68
    invoke-virtual {p0, p1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    move v0, p2

    goto :goto_0
.end method

.method public static getLongOrDefault(Lcom/google/common/io/protocol/ProtoBuf;IJ)J
    .locals 2
    .param p0, "proto"    # Lcom/google/common/io/protocol/ProtoBuf;
    .param p1, "field"    # I
    .param p2, "defaultValue"    # J

    .prologue
    .line 80
    invoke-virtual {p0, p1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/io/protocol/ProtoBuf;->getLong(I)J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    move-wide v0, p2

    goto :goto_0
.end method

.method public static getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "proto"    # Lcom/google/common/io/protocol/ProtoBuf;
    .param p1, "field"    # I
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-virtual {p0, p1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    move-object v0, p2

    goto :goto_0
.end method

.method public static parseBatchPresence(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 14
    .param p0, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v13, 0x3

    const/4 v12, -0x1

    .line 587
    new-instance v0, Lorg/jivesoftware/smack/packet/BatchPresence;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/BatchPresence;-><init>()V

    .line 589
    .local v0, "batchPresence":Lorg/jivesoftware/smack/packet/BatchPresence;
    const/4 v10, 0x1

    const-string v11, "ID_NOT_AVAILABLE"

    invoke-static {p0, v10, v11}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 590
    .local v3, "id":Ljava/lang/String;
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/BatchPresence;->setPacketID(Ljava/lang/String;)V

    .line 592
    const/4 v10, 0x2

    const-string v11, ""

    invoke-static {p0, v10, v11}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 593
    .local v9, "to":Ljava/lang/String;
    invoke-virtual {v0, v9}, Lorg/jivesoftware/smack/packet/BatchPresence;->setTo(Ljava/lang/String;)V

    .line 595
    const/4 v10, 0x4

    const/4 v11, 0x0

    invoke-static {p0, v10, v11}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 596
    .local v7, "rmq2Id":Ljava/lang/String;
    invoke-virtual {v0, v7}, Lorg/jivesoftware/smack/packet/BatchPresence;->setRmq2Id(Ljava/lang/String;)V

    .line 598
    const/4 v10, 0x6

    invoke-static {p0, v10, v12}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I

    move-result v4

    .line 600
    .local v4, "lastStreamId":I
    invoke-virtual {v0, v4}, Lorg/jivesoftware/smack/packet/BatchPresence;->setLastStreamId(I)V

    .line 602
    const/4 v10, 0x5

    invoke-static {p0, v10, v12}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I

    move-result v8

    .line 604
    .local v8, "streamId":I
    invoke-virtual {v0, v8}, Lorg/jivesoftware/smack/packet/BatchPresence;->setStreamId(I)V

    .line 606
    invoke-virtual {p0, v13}, Lcom/google/common/io/protocol/ProtoBuf;->getCount(I)I

    move-result v1

    .line 608
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 609
    invoke-virtual {p0, v13, v2}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(II)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v6

    .line 610
    .local v6, "presencePb":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-static {v6}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePresence(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smack/packet/Presence;

    .line 611
    .local v5, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v0, v5}, Lorg/jivesoftware/smack/packet/BatchPresence;->addPresenceStanza(Lorg/jivesoftware/smack/packet/Presence;)V

    .line 608
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 614
    .end local v5    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    .end local v6    # "presencePb":Lcom/google/common/io/protocol/ProtoBuf;
    :cond_0
    return-object v0
.end method

.method public static parseDataMessage(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/DataMessage;
    .locals 6
    .param p0, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 294
    new-instance v1, Lorg/jivesoftware/smack/packet/DataMessage;

    invoke-direct {v1}, Lorg/jivesoftware/smack/packet/DataMessage;-><init>()V

    .line 296
    .local v1, "dataMessage":Lorg/jivesoftware/smack/packet/DataMessage;
    const/4 v0, 0x3

    const/4 v2, 0x0

    invoke-static {p0, v0, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 297
    .local v0, "from":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setFrom(Ljava/lang/String;)V

    .line 299
    const/4 v0, 0x4

    const/4 v2, 0x0

    invoke-static {p0, v0, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    .end local v0    # "from":Ljava/lang/String;
    move-result-object v0

    .line 300
    .local v0, "to":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setTo(Ljava/lang/String;)V

    .line 302
    const/4 v0, 0x2

    const/4 v2, 0x0

    invoke-static {p0, v0, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    .end local v0    # "to":Ljava/lang/String;
    move-result-object v0

    .line 303
    .local v0, "id":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setPacketID(Ljava/lang/String;)V

    .line 305
    const/4 v0, 0x1

    const-wide/16 v2, -0x1

    invoke-static {p0, v0, v2, v3}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLongOrDefault(Lcom/google/common/io/protocol/ProtoBuf;IJ)J

    .end local v0    # "id":Ljava/lang/String;
    move-result-wide v2

    .line 306
    .local v2, "rmqId":J
    invoke-virtual {v1, v2, v3}, Lorg/jivesoftware/smack/packet/DataMessage;->setRmqId(J)V

    .line 308
    const/16 v0, 0x9

    const/4 v2, 0x0

    invoke-static {p0, v0, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    .end local v2    # "rmqId":J
    move-result-object v0

    .line 309
    .local v0, "rmq2Id":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setRmq2Id(Ljava/lang/String;)V

    .line 311
    const/16 v0, 0xb

    const/4 v2, -0x1

    invoke-static {p0, v0, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I

    .end local v0    # "rmq2Id":Ljava/lang/String;
    move-result v0

    .line 313
    .local v0, "lastStreamId":I
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setLastStreamId(I)V

    .line 316
    const/16 v0, 0xa

    const/4 v2, -0x1

    invoke-static {p0, v0, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I

    .end local v0    # "lastStreamId":I
    move-result v0

    .line 318
    .local v0, "streamId":I
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setStreamId(I)V

    .line 320
    const/4 v0, 0x5

    const/4 v2, 0x0

    invoke-static {p0, v0, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    .end local v0    # "streamId":I
    move-result-object v0

    .line 321
    .local v0, "category":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setCategory(Ljava/lang/String;)V

    .line 323
    const/4 v0, 0x6

    const/4 v2, 0x0

    invoke-static {p0, v0, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    .end local v0    # "category":Ljava/lang/String;
    move-result-object v0

    .line 324
    .local v0, "token":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setToken(Ljava/lang/String;)V

    .line 326
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    .end local v0    # "token":Ljava/lang/String;
    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 328
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setFromTrustedServer(Z)V

    .line 331
    :cond_0
    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 332
    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 333
    .local v0, "permission":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 334
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->setPermission(Ljava/lang/String;)V

    .line 338
    .end local v0    # "permission":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->getCount(I)I

    move-result v4

    .line 339
    .local v4, "numAppDataPairs":I
    const/4 v0, 0x0

    .local v0, "i":I
    move v2, v0

    .end local v0    # "i":I
    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_2

    .line 340
    const/4 v0, 0x7

    invoke-virtual {p0, v0, v2}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(II)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v0

    .line 341
    .local v0, "appDataPb":Lcom/google/common/io/protocol/ProtoBuf;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 342
    .local v3, "key":Ljava/lang/String;
    const/4 v5, 0x2

    invoke-virtual {v0, v5}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 345
    .local v5, "value":Ljava/lang/String;
    new-instance v0, Lorg/jivesoftware/smack/packet/DataMessage$AppData;

    .end local v0    # "appDataPb":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-direct {v0, v3, v5}, Lorg/jivesoftware/smack/packet/DataMessage$AppData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    .local v0, "appData":Lorg/jivesoftware/smack/packet/DataMessage$AppData;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/DataMessage;->addAppData(Lorg/jivesoftware/smack/packet/DataMessage$AppData;)V

    .line 339
    add-int/lit8 v0, v2, 0x1

    .end local v2    # "i":I
    .local v0, "i":I
    move v2, v0

    .end local v0    # "i":I
    .restart local v2    # "i":I
    goto :goto_0

    .line 349
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_2
    return-object v1
.end method

.method public static parseError(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/XMPPError;
    .locals 4
    .param p0, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    .line 762
    const/4 v1, 0x0

    .line 763
    .local v1, "message":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 764
    invoke-virtual {p0, v3}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 766
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v0

    .line 768
    .local v0, "code":I
    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-direct {v2, v0, v1}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(ILjava/lang/String;)V

    return-object v2
.end method

.method public static parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;
    .locals 11
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const-string v10, "code"

    .line 708
    const-string v3, "-1"

    .line 709
    .local v3, "errorCode":Ljava/lang/String;
    const/4 v6, 0x0

    .line 710
    .local v6, "message":Ljava/lang/String;
    const/4 v7, 0x0

    .line 711
    .local v7, "other":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v0

    .line 713
    .local v0, "attrCount":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v0, :cond_1

    .line 714
    invoke-interface {p0, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, "code"

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 715
    const-string v8, ""

    const-string v9, "code"

    invoke-interface {p0, v8, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 713
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 719
    :cond_1
    const/4 v1, 0x0

    .line 720
    .local v1, "done":Z
    :cond_2
    :goto_1
    if-nez v1, :cond_6

    .line 721
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    .line 722
    .local v4, "eventType":I
    const/4 v8, 0x2

    if-ne v4, v8, :cond_4

    .line 723
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 727
    .local v2, "elementName":Ljava/lang/String;
    const-string v8, "text"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 728
    if-nez v6, :cond_2

    .line 729
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 731
    :cond_3
    const-string v8, "feature-not-implemented"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 734
    const-string v7, "feature not implemented"

    goto :goto_1

    .line 736
    .end local v2    # "elementName":Ljava/lang/String;
    :cond_4
    const/4 v8, 0x3

    if-ne v4, v8, :cond_5

    .line 737
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "error"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 738
    const/4 v1, 0x1

    goto :goto_1

    .line 740
    :cond_5
    const/4 v8, 0x4

    if-ne v4, v8, :cond_2

    .line 741
    if-nez v6, :cond_2

    .line 742
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 747
    .end local v4    # "eventType":I
    :cond_6
    if-nez v6, :cond_7

    .line 748
    move-object v6, v7

    .line 751
    :cond_7
    new-instance v8, Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-direct {v8, v9, v6}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(ILjava/lang/String;)V

    return-object v8
.end method

.method public static parseMessage(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 14
    .param p0, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v13, 0x2

    const/4 v12, -0x1

    const/4 v10, 0x1

    const/4 v9, 0x0

    const-string v11, ""

    .line 216
    new-instance v4, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v4}, Lorg/jivesoftware/smack/packet/Message;-><init>()V

    .line 217
    .local v4, "message":Lorg/jivesoftware/smack/packet/Message;
    const/4 v7, 0x3

    invoke-static {p0, v7, v9}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 218
    .local v3, "id":Ljava/lang/String;
    if-nez v3, :cond_6

    const-string v7, "ID_NOT_AVAILABLE"

    :goto_0
    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setPacketID(Ljava/lang/String;)V

    .line 220
    const-wide/16 v7, -0x1

    invoke-static {p0, v10, v7, v8}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLongOrDefault(Lcom/google/common/io/protocol/ProtoBuf;IJ)J

    move-result-wide v7

    invoke-virtual {v4, v7, v8}, Lorg/jivesoftware/smack/packet/Message;->setRmqId(J)V

    .line 223
    const/16 v7, 0xd

    const-string v8, ""

    invoke-static {p0, v7, v11}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setRmq2Id(Ljava/lang/String;)V

    .line 224
    const/16 v7, 0xf

    invoke-static {p0, v7, v12}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setLastStreamId(I)V

    .line 226
    const/16 v7, 0xe

    invoke-static {p0, v7, v12}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setStreamId(I)V

    .line 229
    const/4 v7, 0x5

    const-string v8, ""

    invoke-static {p0, v7, v11}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 230
    const/4 v7, 0x4

    const-string v8, ""

    invoke-static {p0, v7, v11}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setFrom(Ljava/lang/String;)V

    .line 231
    sget-object v6, Lorg/jivesoftware/smack/packet/Message$Type;->NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 232
    .local v6, "type":Lorg/jivesoftware/smack/packet/Message$Type;
    invoke-virtual {p0, v13}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 233
    invoke-virtual {p0, v13}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 250
    :cond_0
    :goto_1
    :pswitch_0
    invoke-virtual {v4, v6}, Lorg/jivesoftware/smack/packet/Message;->setType(Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 252
    sget-object v7, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v6, v7, :cond_1

    .line 253
    const/16 v7, 0x9

    invoke-virtual {p0, v7}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 254
    const/16 v7, 0x9

    invoke-virtual {p0, v7}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(I)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v0

    .line 256
    .local v0, "errorProtobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-static {v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 260
    .end local v0    # "errorProtobuf":Lcom/google/common/io/protocol/ProtoBuf;
    :cond_1
    const/4 v7, 0x6

    invoke-static {p0, v7, v9}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setSubject(Ljava/lang/String;)V

    .line 261
    const/4 v7, 0x7

    invoke-static {p0, v7, v9}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setBody(Ljava/lang/String;)V

    .line 262
    const/16 v7, 0x8

    invoke-static {p0, v7, v9}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setThread(Ljava/lang/String;)V

    .line 264
    const/16 v7, 0xb

    invoke-virtual {p0, v7}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 265
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/Message;->setHasNoSave(Z)V

    .line 266
    const/16 v7, 0xb

    invoke-virtual {p0, v7}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smack/packet/Message;->setNoSave(Z)V

    .line 269
    :cond_2
    const/16 v7, 0x10

    invoke-virtual {p0, v7}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 270
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/Message;->setIsRead(Z)V

    .line 273
    :cond_3
    const/16 v7, 0xc

    invoke-virtual {p0, v7}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 274
    const/16 v7, 0xc

    invoke-virtual {p0, v7}, Lcom/google/common/io/protocol/ProtoBuf;->getLong(I)J

    move-result-wide v7

    invoke-virtual {v4, v7, v8}, Lorg/jivesoftware/smack/packet/Message;->setTimestamp(J)V

    .line 277
    :cond_4
    const/16 v7, 0xa

    invoke-virtual {p0, v7}, Lcom/google/common/io/protocol/ProtoBuf;->getCount(I)I

    move-result v5

    .line 278
    .local v5, "numExtensions":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-ge v2, v5, :cond_7

    .line 279
    const/16 v7, 0xa

    invoke-virtual {p0, v7, v2}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(II)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v7

    invoke-static {v7}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    .line 281
    .local v1, "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-eqz v1, :cond_5

    .line 282
    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 278
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v1    # "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    .end local v2    # "i":I
    .end local v5    # "numExtensions":I
    .end local v6    # "type":Lorg/jivesoftware/smack/packet/Message$Type;
    :cond_6
    move-object v7, v3

    .line 218
    goto/16 :goto_0

    .line 237
    .restart local v6    # "type":Lorg/jivesoftware/smack/packet/Message$Type;
    :pswitch_1
    sget-object v6, Lorg/jivesoftware/smack/packet/Message$Type;->CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 238
    goto/16 :goto_1

    .line 240
    :pswitch_2
    sget-object v6, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 241
    goto/16 :goto_1

    .line 243
    :pswitch_3
    sget-object v6, Lorg/jivesoftware/smack/packet/Message$Type;->HEADLINE:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 244
    goto/16 :goto_1

    .line 246
    :pswitch_4
    sget-object v6, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    goto/16 :goto_1

    .line 287
    .restart local v2    # "i":I
    .restart local v5    # "numExtensions":I
    :cond_7
    return-object v4

    .line 233
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static parseMessage(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 9
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 91
    new-instance v2, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/Message;-><init>()V

    .line 93
    .local v2, "message":Lorg/jivesoftware/smack/packet/Message;
    const-string v0, ""

    const-string v1, "stanza-id"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseRmqIdFromString(Ljava/lang/String;)J

    move-result-wide v0

    .line 95
    .local v0, "rmqId":J
    invoke-virtual {v2, v0, v1}, Lorg/jivesoftware/smack/packet/Message;->setRmqId(J)V

    .line 97
    const-string v0, ""

    .end local v0    # "rmqId":J
    const-string v1, "id"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, "id":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string v0, "ID_NOT_AVAILABLE"

    .end local v0    # "id":Ljava/lang/String;
    :cond_0
    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/packet/Message;->setPacketID(Ljava/lang/String;)V

    .line 99
    const-string v0, ""

    const-string v1, "to"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 100
    const-string v0, ""

    const-string v1, "from"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/packet/Message;->setFrom(Ljava/lang/String;)V

    .line 101
    const-string v0, ""

    const-string v1, "type"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smack/packet/Message$Type;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v0

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smack/packet/Message;->setType(Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 106
    const/4 v1, 0x0

    .line 107
    .local v1, "done":Z
    const/4 v3, 0x0

    .line 108
    .local v3, "subject":Ljava/lang/String;
    const/4 v0, 0x0

    .line 109
    .local v0, "body":Ljava/lang/String;
    const/4 v4, 0x0

    .line 110
    .local v4, "thread":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "properties":Ljava/util/Map;
    move-object v6, v4

    .end local v4    # "thread":Ljava/lang/String;
    .local v6, "thread":Ljava/lang/String;
    move-object v5, v3

    .end local v3    # "subject":Ljava/lang/String;
    .local v5, "subject":Ljava/lang/String;
    move-object v4, v0

    .end local v0    # "properties":Ljava/util/Map;
    .local v4, "properties":Ljava/util/Map;
    move v0, v1

    .line 111
    .end local v1    # "done":Z
    .local v0, "done":Z
    :goto_0
    if-nez v0, :cond_8

    .line 112
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 113
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_7

    .line 114
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, "elementName":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v3

    .line 119
    .local v3, "namespace":Ljava/lang/String;
    const-string v7, "subject"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 120
    if-nez v5, :cond_6

    .line 121
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    .end local v5    # "subject":Ljava/lang/String;
    .local v1, "subject":Ljava/lang/String;
    move-object v3, v1

    .end local v1    # "subject":Ljava/lang/String;
    .local v3, "subject":Ljava/lang/String;
    move-object v1, v4

    .end local v4    # "properties":Ljava/util/Map;
    .local v1, "properties":Ljava/util/Map;
    move-object v4, v6

    .end local v6    # "thread":Ljava/lang/String;
    .local v4, "thread":Ljava/lang/String;
    :goto_1
    move-object v6, v4

    .end local v4    # "thread":Ljava/lang/String;
    .restart local v6    # "thread":Ljava/lang/String;
    move-object v5, v3

    .end local v3    # "subject":Ljava/lang/String;
    .restart local v5    # "subject":Ljava/lang/String;
    move-object v4, v1

    .line 159
    .end local v1    # "properties":Ljava/util/Map;
    .local v4, "properties":Ljava/util/Map;
    goto :goto_0

    .line 124
    .local v1, "elementName":Ljava/lang/String;
    .local v3, "namespace":Ljava/lang/String;
    :cond_1
    const-string v7, "body"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 128
    invoke-static {p0, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseMessageBody(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/packet/Message;)V

    move-object v1, v4

    .end local v4    # "properties":Ljava/util/Map;
    .local v1, "properties":Ljava/util/Map;
    move-object v3, v5

    .end local v5    # "subject":Ljava/lang/String;
    .local v3, "subject":Ljava/lang/String;
    move-object v4, v6

    .end local v6    # "thread":Ljava/lang/String;
    .local v4, "thread":Ljava/lang/String;
    goto :goto_1

    .line 135
    .local v1, "elementName":Ljava/lang/String;
    .local v3, "namespace":Ljava/lang/String;
    .local v4, "properties":Ljava/util/Map;
    .restart local v5    # "subject":Ljava/lang/String;
    .restart local v6    # "thread":Ljava/lang/String;
    :cond_2
    const-string v7, "thread"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 136
    if-nez v6, :cond_6

    .line 137
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    .end local v6    # "thread":Ljava/lang/String;
    .local v1, "thread":Ljava/lang/String;
    move-object v3, v5

    .end local v5    # "subject":Ljava/lang/String;
    .local v3, "subject":Ljava/lang/String;
    move-object v8, v1

    .end local v1    # "thread":Ljava/lang/String;
    .local v8, "thread":Ljava/lang/String;
    move-object v1, v4

    .end local v4    # "properties":Ljava/util/Map;
    .local v1, "properties":Ljava/util/Map;
    move-object v4, v8

    .end local v8    # "thread":Ljava/lang/String;
    .local v4, "thread":Ljava/lang/String;
    goto :goto_1

    .line 140
    .local v1, "elementName":Ljava/lang/String;
    .local v3, "namespace":Ljava/lang/String;
    .local v4, "properties":Ljava/util/Map;
    .restart local v5    # "subject":Ljava/lang/String;
    .restart local v6    # "thread":Ljava/lang/String;
    :cond_3
    const-string v7, "error"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 141
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v1

    .end local v1    # "elementName":Ljava/lang/String;
    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/packet/Message;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    move-object v1, v4

    .end local v4    # "properties":Ljava/util/Map;
    .local v1, "properties":Ljava/util/Map;
    move-object v3, v5

    .end local v5    # "subject":Ljava/lang/String;
    .local v3, "subject":Ljava/lang/String;
    move-object v4, v6

    .end local v6    # "thread":Ljava/lang/String;
    .local v4, "thread":Ljava/lang/String;
    goto :goto_1

    .line 143
    .local v1, "elementName":Ljava/lang/String;
    .local v3, "namespace":Ljava/lang/String;
    .local v4, "properties":Ljava/util/Map;
    .restart local v5    # "subject":Ljava/lang/String;
    .restart local v6    # "thread":Ljava/lang/String;
    :cond_4
    const-string v7, "properties"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const-string v7, "http://www.jivesoftware.com/xmlns/xmpp/properties"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 146
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseProperties(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;

    move-result-object v1

    .end local v4    # "properties":Ljava/util/Map;
    .local v1, "properties":Ljava/util/Map;
    move-object v4, v6

    .end local v6    # "thread":Ljava/lang/String;
    .local v4, "thread":Ljava/lang/String;
    move-object v3, v5

    .end local v5    # "subject":Ljava/lang/String;
    .local v3, "subject":Ljava/lang/String;
    goto :goto_1

    .line 150
    .local v1, "elementName":Ljava/lang/String;
    .local v3, "namespace":Ljava/lang/String;
    .local v4, "properties":Ljava/util/Map;
    .restart local v5    # "subject":Ljava/lang/String;
    .restart local v6    # "thread":Ljava/lang/String;
    :cond_5
    invoke-static {v1, v3, p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    .end local v1    # "elementName":Ljava/lang/String;
    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .end local v3    # "namespace":Ljava/lang/String;
    :cond_6
    move-object v1, v4

    .end local v4    # "properties":Ljava/util/Map;
    .local v1, "properties":Ljava/util/Map;
    move-object v3, v5

    .end local v5    # "subject":Ljava/lang/String;
    .local v3, "subject":Ljava/lang/String;
    move-object v4, v6

    .end local v6    # "thread":Ljava/lang/String;
    .local v4, "thread":Ljava/lang/String;
    goto :goto_1

    .line 154
    .end local v3    # "subject":Ljava/lang/String;
    .local v1, "eventType":I
    .local v4, "properties":Ljava/util/Map;
    .restart local v5    # "subject":Ljava/lang/String;
    .restart local v6    # "thread":Ljava/lang/String;
    :cond_7
    const/4 v3, 0x3

    if-ne v1, v3, :cond_6

    .line 155
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "eventType":I
    const-string v3, "message"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 156
    const/4 v0, 0x1

    move-object v1, v4

    .end local v4    # "properties":Ljava/util/Map;
    .local v1, "properties":Ljava/util/Map;
    move-object v3, v5

    .end local v5    # "subject":Ljava/lang/String;
    .restart local v3    # "subject":Ljava/lang/String;
    move-object v4, v6

    .end local v6    # "thread":Ljava/lang/String;
    .local v4, "thread":Ljava/lang/String;
    goto :goto_1

    .line 160
    .end local v1    # "properties":Ljava/util/Map;
    .end local v3    # "subject":Ljava/lang/String;
    .local v4, "properties":Ljava/util/Map;
    .restart local v5    # "subject":Ljava/lang/String;
    .restart local v6    # "thread":Ljava/lang/String;
    :cond_8
    invoke-virtual {v2, v5}, Lorg/jivesoftware/smack/packet/Message;->setSubject(Ljava/lang/String;)V

    .line 166
    invoke-virtual {v2, v6}, Lorg/jivesoftware/smack/packet/Message;->setThread(Ljava/lang/String;)V

    .line 168
    if-eqz v4, :cond_9

    .line 169
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    .end local p0    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .end local v0    # "done":Z
    .local p0, "i":Ljava/util/Iterator;
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 170
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 171
    .local v0, "name":Ljava/lang/String;
    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/jivesoftware/smack/packet/Message;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    .line 176
    .end local v0    # "name":Ljava/lang/String;
    .end local p0    # "i":Ljava/util/Iterator;
    :cond_9
    return-object v2
.end method

.method private static parseMessageBody(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/packet/Message;)V
    .locals 5
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 183
    const/4 v0, 0x0

    .line 184
    .local v0, "body":Ljava/lang/String;
    const/4 v1, 0x0

    .line 186
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_3

    .line 187
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 188
    .local v2, "eventType":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 190
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto :goto_0

    .line 193
    :cond_1
    const/4 v3, 0x4

    if-ne v2, v3, :cond_2

    .line 194
    if-nez v0, :cond_0

    .line 195
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 198
    :cond_2
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 200
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "body"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 201
    const/4 v1, 0x1

    goto :goto_0

    .line 206
    .end local v2    # "eventType":I
    :cond_3
    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/packet/Message;->setBody(Ljava/lang/String;)V

    .line 207
    return-void
.end method

.method private static parsePacketExtension(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 3
    .param p0, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 353
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v1

    .line 355
    .local v1, "id":I
    if-nez v1, :cond_1

    .line 357
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->getBytes(I)[B

    move-result-object v0

    .line 358
    .local v0, "xmlBytes":[B
    new-instance p0, Ljava/io/ByteArrayInputStream;

    .end local p0    # "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-direct {p0, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 360
    .local p0, "bais":Ljava/io/ByteArrayInputStream;
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    .line 361
    .local v1, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v0, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    .end local v0    # "xmlBytes":[B
    const/4 v2, 0x1

    invoke-interface {v1, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 362
    const-string v0, "UTF-8"

    invoke-interface {v1, p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 363
    const-string p0, "http://xmlpull.org/v1/doc/features.html#relaxed"

    .end local p0    # "bais":Ljava/io/ByteArrayInputStream;
    const/4 v0, 0x1

    invoke-interface {v1, p0, v0}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 366
    :goto_0
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result p0

    .local p0, "event":I
    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    .line 367
    packed-switch p0, :pswitch_data_0

    goto :goto_0

    .line 369
    :pswitch_0
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p0

    .line 370
    .local p0, "elementName":Ljava/lang/String;
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v0

    .line 371
    .local v0, "namespace":Ljava/lang/String;
    invoke-static {p0, v0, v1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object p0

    .line 396
    .end local v0    # "namespace":Ljava/lang/String;
    .end local v1    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local p0    # "elementName":Ljava/lang/String;
    :goto_1
    return-object p0

    .line 374
    .restart local v1    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .local p0, "event":I
    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    .line 377
    .local v1, "id":I
    .local p0, "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    :cond_1
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->getBytes(I)[B

    move-result-object v0

    .line 378
    .local v0, "data":[B
    invoke-static {v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getExtensionProvider(I)Ljava/lang/Object;

    move-result-object p0

    .line 379
    .local p0, "o":Ljava/lang/Object;
    if-nez p0, :cond_2

    .line 380
    const/4 p0, 0x0

    goto :goto_1

    .line 382
    :cond_2
    const/4 v1, 0x0

    .line 383
    .local v1, "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    instance-of v2, p0, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    if-eqz v2, :cond_4

    .line 384
    check-cast p0, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    .end local v1    # "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    .local p0, "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    move-object v1, p0

    .line 389
    .end local p0    # "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    .restart local v1    # "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    :cond_3
    :goto_2
    if-eqz v1, :cond_5

    .line 390
    invoke-interface {v1}, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;->getProtoBufType()Lcom/google/common/io/protocol/ProtoBufType;

    move-result-object v2

    .line 391
    .local v2, "type":Lcom/google/common/io/protocol/ProtoBufType;
    new-instance p0, Lcom/google/common/io/protocol/ProtoBuf;

    invoke-direct {p0, v2}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 392
    .local p0, "extension":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->parse([B)Lcom/google/common/io/protocol/ProtoBuf;

    .line 394
    invoke-interface {v1, p0}, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;->parseExtension(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object p0

    goto :goto_1

    .line 385
    .end local v2    # "type":Lcom/google/common/io/protocol/ProtoBufType;
    .local p0, "o":Ljava/lang/Object;
    :cond_4
    instance-of v2, p0, Ljava/lang/Class;

    if-eqz v2, :cond_3

    .line 386
    check-cast p0, Ljava/lang/Class;

    .line 387
    .local p0, "clazz":Ljava/lang/Class;
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "clazz":Ljava/lang/Class;
    check-cast p0, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    .end local v1    # "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    .local p0, "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    move-object v1, p0

    .end local p0    # "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    .restart local v1    # "provider":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    goto :goto_2

    .line 396
    :cond_5
    const/4 p0, 0x0

    goto :goto_1

    .line 367
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public static parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 7
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 784
    invoke-static {p0, p1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getExtensionProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 785
    .local v4, "provider":Ljava/lang/Object;
    if-eqz v4, :cond_1

    .line 786
    instance-of v6, v4, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    if-eqz v6, :cond_0

    .line 787
    check-cast v4, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    .end local v4    # "provider":Ljava/lang/Object;
    invoke-interface {v4, p2}, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v6

    .line 820
    .end local p0    # "elementName":Ljava/lang/String;
    :goto_0
    return-object v6

    .line 789
    .restart local v4    # "provider":Ljava/lang/Object;
    .restart local p0    # "elementName":Ljava/lang/String;
    :cond_0
    instance-of v6, v4, Ljava/lang/Class;

    if-eqz v6, :cond_1

    .line 790
    check-cast v4, Ljava/lang/Class;

    .end local v4    # "provider":Ljava/lang/Object;
    invoke-static {p0, v4, p2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "elementName":Ljava/lang/String;
    check-cast p0, Lorg/jivesoftware/smack/packet/PacketExtension;

    move-object v6, p0

    goto :goto_0

    .line 795
    .restart local v4    # "provider":Ljava/lang/Object;
    .restart local p0    # "elementName":Ljava/lang/String;
    :cond_1
    new-instance v2, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;

    invoke-direct {v2, p0, p1}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 796
    .local v2, "extension":Lorg/jivesoftware/smack/packet/DefaultPacketExtension;
    const/4 v0, 0x0

    .line 797
    .local v0, "done":Z
    :cond_2
    :goto_1
    if-nez v0, :cond_5

    .line 798
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 799
    .local v1, "eventType":I
    const/4 v6, 0x2

    if-ne v1, v6, :cond_4

    .line 800
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 802
    .local v3, "name":Ljava/lang/String;
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->isEmptyElementTag()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 803
    const-string v6, ""

    invoke-virtual {v2, v3, v6}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 807
    :cond_3
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 808
    const/4 v6, 0x4

    if-ne v1, v6, :cond_2

    .line 809
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v5

    .line 810
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v2, v3, v5}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 814
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_4
    const/4 v6, 0x3

    if-ne v1, v6, :cond_2

    .line 815
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 816
    const/4 v0, 0x1

    goto :goto_1

    .end local v1    # "eventType":I
    :cond_5
    move-object v6, v2

    .line 820
    goto :goto_0
.end method

.method public static parsePresence(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 15
    .param p0, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 477
    const/4 v0, 0x3

    const-string v1, "ID_NOT_AVAILABLE"

    invoke-static {p0, v0, v1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 479
    .local v3, "id":Ljava/lang/String;
    const/4 v0, 0x1

    const-wide/16 v1, -0x1

    invoke-static {p0, v0, v1, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLongOrDefault(Lcom/google/common/io/protocol/ProtoBuf;IJ)J

    move-result-wide v9

    .line 480
    .local v9, "rmqId":J
    const/16 v0, 0xd

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 481
    .local v8, "rmq2Id":Ljava/lang/String;
    const/16 v0, 0xf

    const/4 v1, -0x1

    invoke-static {p0, v0, v1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I

    move-result v4

    .line 483
    .local v4, "lastStreamId":I
    const/16 v0, 0xe

    const/4 v1, -0x1

    invoke-static {p0, v0, v1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I

    move-result v12

    .line 486
    .local v12, "streamId":I
    const/4 v0, 0x5

    const-string v1, ""

    invoke-static {p0, v0, v1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 487
    .local v13, "to":Ljava/lang/String;
    const/4 v0, 0x4

    const-string v1, ""

    invoke-static {p0, v0, v1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 488
    .local v2, "from":Ljava/lang/String;
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    .line 489
    .local v0, "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 490
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    move-object v14, v0

    .line 514
    .end local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .local v14, "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    :goto_0
    const/4 v0, 0x7

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getStringOrDefault(Lcom/google/common/io/protocol/ProtoBuf;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 515
    .local v11, "status":Ljava/lang/String;
    const/16 v0, 0x8

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getIntOrDefault(Lcom/google/common/io/protocol/ProtoBuf;II)I

    move-result v7

    .line 517
    .local v7, "priority":I
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Mode;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Mode;

    .line 519
    .local v0, "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    const/4 v1, 0x6

    invoke-virtual {p0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 520
    const/4 v1, 0x6

    invoke-virtual {p0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v1

    packed-switch v1, :pswitch_data_1

    :cond_1
    move-object v5, v0

    .line 535
    .end local v0    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .local v5, "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    :goto_1
    const/4 v0, 0x0

    .line 536
    .local v0, "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    const/16 v1, 0xb

    invoke-virtual {p0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 537
    const/16 v1, 0xb

    invoke-virtual {p0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v1

    packed-switch v1, :pswitch_data_2

    :cond_2
    move-object v1, v0

    .line 550
    .end local v0    # "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    .local v1, "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    :goto_2
    const/4 v0, 0x0

    .line 551
    .local v0, "avatarHash":Ljava/lang/String;
    const/16 v6, 0xc

    invoke-virtual {p0, v6}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 552
    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    .end local v0    # "avatarHash":Ljava/lang/String;
    move-result-object v0

    .line 555
    .restart local v0    # "avatarHash":Ljava/lang/String;
    :cond_3
    new-instance v6, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v6, v14, v11, v7, v5}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;Ljava/lang/String;ILorg/jivesoftware/smack/packet/Presence$Mode;)V

    .line 556
    .local v6, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v6, v2}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    .line 557
    invoke-virtual {v6, v13}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 558
    invoke-virtual {v6, v3}, Lorg/jivesoftware/smack/packet/Presence;->setPacketID(Ljava/lang/String;)V

    .line 559
    invoke-virtual {v6, v9, v10}, Lorg/jivesoftware/smack/packet/Presence;->setRmqId(J)V

    .line 560
    invoke-virtual {v6, v8}, Lorg/jivesoftware/smack/packet/Presence;->setRmq2Id(Ljava/lang/String;)V

    .line 561
    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/packet/Presence;->setLastStreamId(I)V

    .line 562
    invoke-virtual {v6, v12}, Lorg/jivesoftware/smack/packet/Presence;->setStreamId(I)V

    .line 563
    invoke-virtual {v6, v1}, Lorg/jivesoftware/smack/packet/Presence;->setClientType(Lorg/jivesoftware/smack/packet/Presence$ClientType;)V

    .line 564
    invoke-virtual {v6, v0}, Lorg/jivesoftware/smack/packet/Presence;->setAvatarHash(Ljava/lang/String;)V

    .line 566
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->ERROR:Lorg/jivesoftware/smack/packet/Presence$Type;

    .end local v0    # "avatarHash":Ljava/lang/String;
    if-ne v14, v0, :cond_4

    .line 567
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 568
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(I)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v0

    .line 570
    .local v0, "errorProtobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-static {v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v0

    .end local v0    # "errorProtobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual {v6, v0}, Lorg/jivesoftware/smack/packet/Presence;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 573
    :cond_4
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/google/common/io/protocol/ProtoBuf;->getCount(I)I

    move-result v2

    .line 575
    .local v2, "numExtensions":I
    const/4 v0, 0x0

    .local v0, "i":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_3
    if-ge v1, v2, :cond_6

    .line 576
    const/16 v0, 0xa

    invoke-virtual {p0, v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(II)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    .line 578
    .local v0, "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-eqz v0, :cond_5

    .line 579
    invoke-virtual {v6, v0}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 575
    :cond_5
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .local v0, "i":I
    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_3

    .line 492
    .end local v1    # "i":I
    .end local v5    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .end local v6    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    .end local v7    # "priority":I
    .end local v11    # "status":Ljava/lang/String;
    .end local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .local v0, "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .local v2, "from":Ljava/lang/String;
    :pswitch_0
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object v14, v0

    .line 493
    .end local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    goto/16 :goto_0

    .line 495
    .end local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    :pswitch_1
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->PROBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object v14, v0

    .line 496
    .end local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    goto/16 :goto_0

    .line 498
    .end local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    :pswitch_2
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object v14, v0

    .line 499
    .end local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    goto/16 :goto_0

    .line 501
    .end local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    :pswitch_3
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object v14, v0

    .line 502
    .end local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    goto/16 :goto_0

    .line 504
    .end local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    :pswitch_4
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object v14, v0

    .line 505
    .end local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    goto/16 :goto_0

    .line 507
    .end local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    :pswitch_5
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object v14, v0

    .line 508
    .end local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    goto/16 :goto_0

    .line 510
    .end local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    :pswitch_6
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->ERROR:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object v14, v0

    .end local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    .restart local v14    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    goto/16 :goto_0

    .local v0, "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .restart local v7    # "priority":I
    .restart local v11    # "status":Ljava/lang/String;
    :pswitch_7
    move-object v5, v0

    .line 522
    .end local v0    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .restart local v5    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    goto/16 :goto_1

    .line 524
    .end local v5    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .restart local v0    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    :pswitch_8
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Mode;->AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-object v5, v0

    .line 525
    .end local v0    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .restart local v5    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    goto/16 :goto_1

    .line 527
    .end local v5    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .restart local v0    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    :pswitch_9
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Mode;->EXTENDED_AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-object v5, v0

    .line 528
    .end local v0    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .restart local v5    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    goto/16 :goto_1

    .line 530
    .end local v5    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .restart local v0    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    :pswitch_a
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Mode;->DO_NOT_DISTURB:Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-object v5, v0

    .end local v0    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    .restart local v5    # "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    goto/16 :goto_1

    .line 539
    .local v0, "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    :pswitch_b
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->ANDROID:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    move-object v1, v0

    .line 540
    .end local v0    # "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    .local v1, "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    goto/16 :goto_2

    .line 542
    .end local v1    # "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    .restart local v0    # "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    :pswitch_c
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->MOBILE:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    move-object v1, v0

    .line 543
    .end local v0    # "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    .restart local v1    # "clientType":Lorg/jivesoftware/smack/packet/Presence$ClientType;
    goto/16 :goto_2

    .line 583
    .local v1, "i":I
    .local v2, "numExtensions":I
    .restart local v6    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_6
    return-object v6

    .line 490
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_1
        :pswitch_6
    .end packed-switch

    .line 520
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_a
        :pswitch_9
    .end packed-switch

    .line 537
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
    .end packed-switch
.end method

.method public static parsePresence(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Presence;
    .locals 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 409
    const-string v0, ""

    const-string v1, "type"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smack/packet/Presence$Type;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v0

    .line 411
    .local v0, "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v3, v0}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 412
    .local v3, "presence":Lorg/jivesoftware/smack/packet/Presence;
    const-string v0, ""

    .end local v0    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    const-string v1, "to"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 413
    const-string v0, ""

    const-string v1, "from"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    .line 414
    const-string v0, ""

    const-string v1, "id"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 415
    .local v0, "id":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string v0, "ID_NOT_AVAILABLE"

    .end local v0    # "id":Ljava/lang/String;
    :cond_0
    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/packet/Presence;->setPacketID(Ljava/lang/String;)V

    .line 417
    const-string v0, ""

    const-string v1, "stanza-id"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseRmqIdFromString(Ljava/lang/String;)J

    move-result-wide v0

    .line 419
    .local v0, "rmqId":J
    invoke-virtual {v3, v0, v1}, Lorg/jivesoftware/smack/packet/Presence;->setRmqId(J)V

    .line 422
    const/4 v0, 0x0

    .line 423
    .local v0, "done":Z
    :cond_1
    :goto_0
    if-nez v0, :cond_8

    .line 424
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 425
    .local v1, "eventType":I
    const/4 v2, 0x2

    if-ne v1, v2, :cond_7

    .line 426
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 427
    .local v1, "elementName":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v2

    .line 428
    .local v2, "namespace":Ljava/lang/String;
    const-string v4, "status"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 429
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "elementName":Ljava/lang/String;
    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/packet/Presence;->setStatus(Ljava/lang/String;)V

    goto :goto_0

    .line 431
    .restart local v1    # "elementName":Ljava/lang/String;
    :cond_2
    const-string v4, "priority"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 433
    :try_start_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "elementName":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 434
    .local v1, "priority":I
    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/packet/Presence;->setPriority(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 436
    .end local v1    # "priority":I
    :catch_0
    move-exception v1

    goto :goto_0

    .line 437
    :catch_1
    move-exception v1

    .line 439
    .local v1, "iae":Ljava/lang/IllegalArgumentException;
    const/4 v1, 0x0

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/packet/Presence;->setPriority(I)V

    goto :goto_0

    .line 442
    .local v1, "elementName":Ljava/lang/String;
    :cond_3
    const-string v4, "show"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 443
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "elementName":Ljava/lang/String;
    invoke-static {v1}, Lorg/jivesoftware/smack/packet/Presence$Mode;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-result-object v1

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V

    goto :goto_0

    .line 445
    .restart local v1    # "elementName":Ljava/lang/String;
    :cond_4
    const-string v4, "error"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 446
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v1

    .end local v1    # "elementName":Ljava/lang/String;
    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/packet/Presence;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    goto :goto_0

    .line 448
    .restart local v1    # "elementName":Ljava/lang/String;
    :cond_5
    const-string v4, "properties"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    const-string v4, "http://www.jivesoftware.com/xmlns/xmpp/properties"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 451
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseProperties(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;

    move-result-object v4

    .line 453
    .local v4, "properties":Ljava/util/Map;
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .end local v1    # "elementName":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local v2    # "namespace":Ljava/lang/String;
    .local v1, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 454
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 455
    .local v2, "name":Ljava/lang/String;
    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v2, v5}, Lorg/jivesoftware/smack/packet/Presence;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 460
    .end local v4    # "properties":Ljava/util/Map;
    .local v1, "elementName":Ljava/lang/String;
    .local v2, "namespace":Ljava/lang/String;
    :cond_6
    invoke-static {v1, v2, p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    .end local v1    # "elementName":Ljava/lang/String;
    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto/16 :goto_0

    .line 464
    .end local v2    # "namespace":Ljava/lang/String;
    .local v1, "eventType":I
    :cond_7
    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    .line 465
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "eventType":I
    const-string v2, "presence"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 466
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 470
    :cond_8
    return-object v3
.end method

.method public static parseProperties(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;
    .locals 14
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x2

    const-string v13, "property"

    .line 629
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 631
    .local v4, "properties":Ljava/util/Map;
    :cond_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 632
    .local v2, "eventType":I
    if-ne v2, v11, :cond_b

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "property"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 634
    const/4 v0, 0x0

    .line 635
    .local v0, "done":Z
    const/4 v3, 0x0

    .line 636
    .local v3, "name":Ljava/lang/String;
    const/4 v5, 0x0

    .line 637
    .local v5, "type":Ljava/lang/String;
    const/4 v7, 0x0

    .line 638
    .local v7, "valueText":Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "value":Ljava/lang/Object;
    move-object v8, v6

    .line 639
    .end local v6    # "value":Ljava/lang/Object;
    :cond_1
    :goto_0
    if-nez v0, :cond_0

    .line 640
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 641
    if-ne v2, v11, :cond_3

    .line 642
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 643
    .local v1, "elementName":Ljava/lang/String;
    const-string v9, "name"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 644
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 646
    :cond_2
    const-string v9, "value"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 647
    const-string v9, ""

    const-string v10, "type"

    invoke-interface {p0, v9, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 648
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 651
    .end local v1    # "elementName":Ljava/lang/String;
    :cond_3
    if-ne v2, v12, :cond_1

    .line 652
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "property"

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 653
    const-string v9, "integer"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 654
    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    .local v6, "value":Ljava/lang/Integer;
    move-object v8, v6

    .line 683
    .end local v6    # "value":Ljava/lang/Integer;
    :cond_4
    :goto_1
    if-eqz v3, :cond_5

    if-eqz v8, :cond_5

    .line 684
    invoke-interface {v4, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 686
    :cond_5
    const/4 v0, 0x1

    goto :goto_0

    .line 656
    :cond_6
    const-string v9, "long"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 657
    new-instance v6, Ljava/lang/Long;

    invoke-direct {v6, v7}, Ljava/lang/Long;-><init>(Ljava/lang/String;)V

    .local v6, "value":Ljava/lang/Long;
    move-object v8, v6

    goto :goto_1

    .line 659
    .end local v6    # "value":Ljava/lang/Long;
    :cond_7
    const-string v9, "float"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 660
    new-instance v6, Ljava/lang/Float;

    invoke-direct {v6, v7}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    .local v6, "value":Ljava/lang/Float;
    move-object v8, v6

    goto :goto_1

    .line 662
    .end local v6    # "value":Ljava/lang/Float;
    :cond_8
    const-string v9, "double"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 663
    new-instance v6, Ljava/lang/Double;

    invoke-direct {v6, v7}, Ljava/lang/Double;-><init>(Ljava/lang/String;)V

    .local v6, "value":Ljava/lang/Double;
    move-object v8, v6

    goto :goto_1

    .line 665
    .end local v6    # "value":Ljava/lang/Double;
    :cond_9
    const-string v9, "boolean"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 666
    new-instance v6, Ljava/lang/Boolean;

    invoke-direct {v6, v7}, Ljava/lang/Boolean;-><init>(Ljava/lang/String;)V

    .local v6, "value":Ljava/lang/Boolean;
    move-object v8, v6

    goto :goto_1

    .line 668
    .end local v6    # "value":Ljava/lang/Boolean;
    :cond_a
    const-string v9, "string"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 669
    move-object v6, v7

    .local v6, "value":Ljava/lang/String;
    move-object v8, v6

    goto :goto_1

    .line 691
    .end local v0    # "done":Z
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "type":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    .end local v7    # "valueText":Ljava/lang/String;
    :cond_b
    if-ne v2, v12, :cond_0

    .line 692
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "properties"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 697
    return-object v4
.end method

.method public static parseRmqIdFromString(Ljava/lang/String;)J
    .locals 6
    .param p0, "idStr"    # Ljava/lang/String;

    .prologue
    .line 824
    const-wide/16 v1, -0x1

    .line 828
    .local v1, "retVal":J
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 830
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v1

    .line 836
    :cond_0
    :goto_0
    return-wide v1

    .line 831
    :catch_0
    move-exception v0

    .line 832
    .local v0, "ex":Ljava/lang/NumberFormatException;
    const-string v3, "Smack"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "parseRmqIdFromString caught "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;
    .locals 2
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "objectClass"    # Ljava/lang/Class;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 842
    const/4 v0, 0x0

    .line 843
    .local v0, "done":Z
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .line 866
    .local v1, "object":Ljava/lang/Object;
    return-object v1
.end method
