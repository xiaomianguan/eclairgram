.class public Lorg/jivesoftware/smack/packet/HttpResponse;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "HttpResponse.java"


# instance fields
.field private data:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 27
    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/HttpResponse;->data:[B

    return-object v0
.end method

.method public setData([B)V
    .locals 0
    .param p1, "data"    # [B

    .prologue
    .line 30
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/HttpResponse;->data:[B

    .line 31
    return-void
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 2

    .prologue
    .line 63
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "HttpResponse.toProtoBuf() should not be called!"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v7, -0x1

    const-string v6, "\" "

    .line 38
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 39
    .local v2, "sb":Ljava/lang/StringBuffer;
    const-string v4, "<http-response id=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 40
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/HttpResponse;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\" "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 42
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/HttpResponse;->getRmq2Id()Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "rmq2Id":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/HttpResponse;->getLastStreamId()I

    move-result v0

    .line 44
    .local v0, "lastStreamId":I
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/HttpResponse;->getStreamId()I

    move-result v3

    .line 46
    .local v3, "streamId":I
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 47
    const-string v4, "persistent_id=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\" "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 50
    :cond_0
    if-eq v0, v7, :cond_1

    .line 51
    const-string v4, "last_stream_id=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\" "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 54
    :cond_1
    if-eq v3, v7, :cond_2

    .line 55
    const-string v4, "stream_id=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\" "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 58
    :cond_2
    const-string v4, "/>"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 59
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
