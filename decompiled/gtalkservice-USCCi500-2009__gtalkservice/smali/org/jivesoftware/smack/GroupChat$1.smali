.class Lorg/jivesoftware/smack/GroupChat$1;
.super Ljava/lang/Object;
.source "GroupChat.java"

# interfaces
.implements Lorg/jivesoftware/smack/filter/PacketFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/GroupChat;-><init>(Lorg/jivesoftware/smack/XMPPConnection;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/GroupChat;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/GroupChat;)V
    .locals 0

    .prologue
    .line 73
    iput-object p1, p0, Lorg/jivesoftware/smack/GroupChat$1;->this$0:Lorg/jivesoftware/smack/GroupChat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lorg/jivesoftware/smack/packet/Packet;)Z
    .locals 4
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 74
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/Message;

    move-object v1, v0

    .line 75
    .local v1, "msg":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Message;->getType()Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v2

    sget-object v3, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
