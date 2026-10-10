.class public Lorg/jivesoftware/smackx/GroupChatInvitation;
.super Ljava/lang/Object;
.source "GroupChatInvitation.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# static fields
.field public static final ELEMENT_NAME:Ljava/lang/String; = "x"

.field public static final NAMESPACE:Ljava/lang/String; = "jabber:x:conference"


# instance fields
.field private roomAddress:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "roomAddress"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Lorg/jivesoftware/smackx/GroupChatInvitation;->roomAddress:Ljava/lang/String;

    .line 86
    return-void
.end method


# virtual methods
.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    const-string v0, "x"

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    const-string v0, "jabber:x:conference"

    return-object v0
.end method

.method public getRoomAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jivesoftware/smackx/GroupChatInvitation;->roomAddress:Ljava/lang/String;

    return-object v0
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 4

    .prologue
    .line 114
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/GroupChatInvitation;->toXML()Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, "xml":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 116
    const/4 v2, 0x0

    .line 122
    :goto_0
    return-object v2

    .line 118
    :cond_0
    new-instance v0, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v2, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->EXTENSION:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v0, v2}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 119
    .local v0, "extension":Lcom/google/common/io/protocol/ProtoBuf;
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 121
    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    move-object v2, v0

    .line 122
    goto :goto_0
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 108
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 109
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v1, "<x xmlns=\"jabber:x:conference\" jid=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/GroupChatInvitation;->roomAddress:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\"/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
