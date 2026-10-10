.class public Lcom/google/android/gtalkservice/extensions/IdleProvider;
.super Ljava/lang/Object;
.source "IdleProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getProtoBufType()Lcom/google/common/io/protocol/ProtoBufType;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/google/android/gtalkservice/proto/GtalkExtensionsMessageTypes;->IDLE:Lcom/google/common/io/protocol/ProtoBufType;

    return-object v0
.end method

.method public getTag()I
    .locals 1

    .prologue
    .line 66
    const/16 v0, 0xa

    return v0
.end method

.method public parseIQ(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 3
    .param p1, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    .line 53
    new-instance v0, Lcom/google/android/gtalkservice/extensions/Idle;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/extensions/Idle;-><init>()V

    .line 55
    .local v0, "idle":Lcom/google/android/gtalkservice/extensions/Idle;
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/extensions/Idle;->setIdle(Z)V

    .line 57
    invoke-virtual {p1, v2}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 58
    invoke-virtual {p1, v2}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/extensions/Idle;->setSendAwayPresenceWhenIdle(Z)V

    .line 62
    :cond_0
    return-object v0
.end method

.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 7
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const-string v6, "true"

    const-string v5, ""

    .line 31
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 32
    .local v1, "event":I
    const/4 v4, 0x2

    if-ne v1, v4, :cond_2

    .line 33
    new-instance v2, Lcom/google/android/gtalkservice/extensions/Idle;

    invoke-direct {v2}, Lcom/google/android/gtalkservice/extensions/Idle;-><init>()V

    .line 35
    .local v2, "idle":Lcom/google/android/gtalkservice/extensions/Idle;
    const-string v4, ""

    const-string v4, "idle"

    invoke-interface {p1, v5, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 36
    .local v3, "idleValue":Ljava/lang/String;
    const-string v4, "true"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/google/android/gtalkservice/extensions/Idle;->setIdle(Z)V

    .line 38
    const-string v4, ""

    const-string v4, "away"

    invoke-interface {p1, v5, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "awayValue":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 40
    const-string v4, "true"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    invoke-virtual {v2, v4}, Lcom/google/android/gtalkservice/extensions/Idle;->setSendAwayPresenceWhenIdle(Z)V

    :cond_1
    move-object v4, v2

    .line 49
    .end local v0    # "awayValue":Ljava/lang/String;
    .end local v2    # "idle":Lcom/google/android/gtalkservice/extensions/Idle;
    .end local v3    # "idleValue":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 44
    :cond_2
    const/4 v4, 0x3

    if-ne v1, v4, :cond_0

    .line 49
    const/4 v4, 0x0

    goto :goto_0
.end method
