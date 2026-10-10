.class Lorg/jivesoftware/smack/GroupChat$2;
.super Ljava/lang/Object;
.source "GroupChat.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


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
    .line 83
    iput-object p1, p0, Lorg/jivesoftware/smack/GroupChat$2;->this$0:Lorg/jivesoftware/smack/GroupChat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 84
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/Presence;

    move-object v2, v0

    .line 85
    .local v2, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v1

    .line 86
    .local v1, "from":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v3, v4, :cond_2

    .line 87
    iget-object v3, p0, Lorg/jivesoftware/smack/GroupChat$2;->this$0:Lorg/jivesoftware/smack/GroupChat;

    invoke-static {v3}, Lorg/jivesoftware/smack/GroupChat;->access$000(Lorg/jivesoftware/smack/GroupChat;)Ljava/util/List;

    move-result-object v3

    monitor-enter v3

    .line 88
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/GroupChat$2;->this$0:Lorg/jivesoftware/smack/GroupChat;

    invoke-static {v4}, Lorg/jivesoftware/smack/GroupChat;->access$000(Lorg/jivesoftware/smack/GroupChat;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 89
    iget-object v4, p0, Lorg/jivesoftware/smack/GroupChat$2;->this$0:Lorg/jivesoftware/smack/GroupChat;

    invoke-static {v4}, Lorg/jivesoftware/smack/GroupChat;->access$000(Lorg/jivesoftware/smack/GroupChat;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    :cond_0
    monitor-exit v3

    .line 98
    :cond_1
    :goto_0
    return-void

    .line 91
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 93
    :cond_2
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v3, v4, :cond_1

    .line 94
    iget-object v3, p0, Lorg/jivesoftware/smack/GroupChat$2;->this$0:Lorg/jivesoftware/smack/GroupChat;

    invoke-static {v3}, Lorg/jivesoftware/smack/GroupChat;->access$000(Lorg/jivesoftware/smack/GroupChat;)Ljava/util/List;

    move-result-object v3

    monitor-enter v3

    .line 95
    :try_start_1
    iget-object v4, p0, Lorg/jivesoftware/smack/GroupChat$2;->this$0:Lorg/jivesoftware/smack/GroupChat;

    invoke-static {v4}, Lorg/jivesoftware/smack/GroupChat;->access$000(Lorg/jivesoftware/smack/GroupChat;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 96
    monitor-exit v3

    goto :goto_0

    :catchall_1
    move-exception v4

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v4
.end method
