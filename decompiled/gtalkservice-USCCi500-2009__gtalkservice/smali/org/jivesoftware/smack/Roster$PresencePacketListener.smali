.class Lorg/jivesoftware/smack/Roster$PresencePacketListener;
.super Ljava/lang/Object;
.source "Roster.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/Roster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PresencePacketListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/Roster;


# direct methods
.method private constructor <init>(Lorg/jivesoftware/smack/Roster;)V
    .locals 0

    .prologue
    .line 728
    iput-object p1, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Roster$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p2, "x1"    # Lorg/jivesoftware/smack/Roster$1;

    .prologue
    .line 728
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster$PresencePacketListener;-><init>(Lorg/jivesoftware/smack/Roster;)V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 10
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 730
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/Presence;

    move-object v5, v0

    .line 731
    .local v5, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v2

    .line 743
    .local v2, "from":Ljava/lang/String;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v8, v9, :cond_4

    .line 746
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8, v2}, Lorg/jivesoftware/smack/Roster;->access$200(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 749
    .local v4, "key":Ljava/lang/String;
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$300(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_1

    .line 750
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 751
    .local v7, "userPresences":Ljava/util/Map;
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$300(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 757
    :goto_0
    monitor-enter v7

    .line 758
    :try_start_0
    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 759
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 761
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$400(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v8

    monitor-enter v8

    .line 762
    :try_start_1
    iget-object v9, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v9}, Lorg/jivesoftware/smack/Roster;->access$400(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 763
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/RosterEntry;

    .line 764
    .local v1, "entry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 765
    iget-object v9, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v9, v2, v5}, Lorg/jivesoftware/smack/Roster;->access$500(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V

    goto :goto_1

    .line 768
    .end local v1    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v3    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v9

    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v9

    .line 754
    .end local v7    # "userPresences":Ljava/util/Map;
    :cond_1
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$300(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    .restart local v7    # "userPresences":Ljava/util/Map;
    goto :goto_0

    .line 759
    :catchall_1
    move-exception v8

    :try_start_2
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v8

    .line 768
    .restart local v3    # "i":Ljava/util/Iterator;
    :cond_2
    :try_start_3
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 800
    .end local v3    # "i":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/String;
    .end local v7    # "userPresences":Ljava/util/Map;
    :cond_3
    :goto_2
    return-void

    .line 771
    :cond_4
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v8, v9, :cond_5

    .line 772
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    const/4 v9, 0x0

    invoke-static {v8, v2, v9}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;Z)V

    goto :goto_2

    .line 774
    :cond_5
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v8, v9, :cond_7

    .line 775
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$700(Lorg/jivesoftware/smack/Roster;)I

    move-result v8

    if-nez v8, :cond_6

    .line 777
    new-instance v6, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v8, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v6, v8}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 778
    .local v6, "response":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 779
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$800(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v8

    invoke-virtual {v8, v6}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_2

    .line 781
    .end local v6    # "response":Lorg/jivesoftware/smack/packet/Presence;
    :cond_6
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$700(Lorg/jivesoftware/smack/Roster;)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_3

    .line 783
    new-instance v6, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v8, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v6, v8}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 784
    .restart local v6    # "response":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 785
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$800(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v8

    invoke-virtual {v8, v6}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_2

    .line 789
    .end local v6    # "response":Lorg/jivesoftware/smack/packet/Presence;
    :cond_7
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v8, v9, :cond_3

    .line 790
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$700(Lorg/jivesoftware/smack/Roster;)I

    move-result v8

    const/4 v9, 0x2

    if-eq v8, v9, :cond_3

    .line 794
    new-instance v6, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v8, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v6, v8}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 795
    .restart local v6    # "response":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 796
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster$PresencePacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-static {v8}, Lorg/jivesoftware/smack/Roster;->access$800(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v8

    invoke-virtual {v8, v6}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto/16 :goto_2
.end method
