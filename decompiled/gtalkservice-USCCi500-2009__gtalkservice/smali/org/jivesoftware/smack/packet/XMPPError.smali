.class public Lorg/jivesoftware/smack/packet/XMPPError;
.super Ljava/lang/Object;
.source "XMPPError.java"


# instance fields
.field private code:I

.field private message:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "code"    # I

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput p1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput p1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    .line 77
    iput-object p2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    .line 78
    return-void
.end method


# virtual methods
.method public getCode()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    return-object v0
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 3

    .prologue
    .line 114
    new-instance v0, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->ERROR_INFO:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 115
    .local v0, "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    const/4 v1, 0x1

    iget v2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    invoke-virtual {v0, v1, v2}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 116
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 117
    const/4 v1, 0x2

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 119
    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 123
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 124
    .local v0, "txt":Ljava/lang/StringBuffer;
    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 126
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 104
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 105
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v1, "<error code=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 106
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 107
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 109
    :cond_0
    const-string v1, "</error>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
