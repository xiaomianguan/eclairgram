.class public Lorg/jivesoftware/smack/packet/BatchPresence;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "BatchPresence.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Smack"


# instance fields
.field private mPresenceList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jivesoftware/smack/packet/Presence;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/BatchPresence;->mPresenceList:Ljava/util/ArrayList;

    .line 36
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 106
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BatchPresence] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    return-void
.end method


# virtual methods
.method public addPresenceStanza(Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 1
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 55
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/BatchPresence;->mPresenceList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    return-void
.end method

.method public getNumPresenceStanzas()I
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/BatchPresence;->mPresenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getPresenceStanza(I)Lorg/jivesoftware/smack/packet/Presence;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 51
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/BatchPresence;->mPresenceList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/packet/BatchPresence;
    check-cast p0, Lorg/jivesoftware/smack/packet/Presence;

    return-object p0
.end method

.method public final getPresenceStanzaIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smack/packet/Presence;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/BatchPresence;->mPresenceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getPresenceStanzaList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jivesoftware/smack/packet/Presence;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/BatchPresence;->mPresenceList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 2

    .prologue
    .line 102
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "BatchPresence.toProtoBuf() should not be called!"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 14

    .prologue
    const/4 v13, -0x1

    const/16 v12, 0x20

    const-string v11, "\""

    .line 59
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 60
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v9, "<iq"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 62
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/BatchPresence;->getPacketID()Ljava/lang/String;

    move-result-object v4

    .line 63
    .local v4, "packetId":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/BatchPresence;->getTo()Ljava/lang/String;

    move-result-object v8

    .line 64
    .local v8, "to":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/BatchPresence;->getRmq2Id()Ljava/lang/String;

    move-result-object v6

    .line 65
    .local v6, "rmq2Id":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/BatchPresence;->getLastStreamId()I

    move-result v3

    .line 66
    .local v3, "lastStreamId":I
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/BatchPresence;->getStreamId()I

    move-result v7

    .line 68
    .local v7, "streamId":I
    if-eqz v4, :cond_0

    .line 69
    const-string v9, " id=\""

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 72
    :cond_0
    if-eqz v8, :cond_1

    .line 73
    const-string v9, " to=\""

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 76
    :cond_1
    if-eqz v6, :cond_2

    .line 77
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "persistent_id=\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 80
    :cond_2
    if-eq v3, v13, :cond_3

    .line 81
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "last_stream_id=\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 84
    :cond_3
    if-eq v7, v13, :cond_4

    .line 85
    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "stream_id=\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    :cond_4
    const-string v9, "><mp:batch xmlns:mp=\"google:mobile:presence\">"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/BatchPresence;->getNumPresenceStanzas()I

    move-result v1

    .line 91
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_5

    .line 92
    iget-object v9, p0, Lorg/jivesoftware/smack/packet/BatchPresence;->mPresenceList:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smack/packet/Presence;

    .line 93
    .local v5, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->toXML()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 96
    .end local v5    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_5
    const-string v9, "</mp:batch></iq>"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    return-object v9
.end method
