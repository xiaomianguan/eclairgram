.class Lorg/jivesoftware/smack/Roster$RosterPacketListener;
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
    name = "RosterPacketListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/Roster;


# direct methods
.method private constructor <init>(Lorg/jivesoftware/smack/Roster;)V
    .locals 0

    .prologue
    .line 806
    iput-object p1, p0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Roster$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p2, "x1"    # Lorg/jivesoftware/smack/Roster$1;

    .prologue
    .line 806
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster$RosterPacketListener;-><init>(Lorg/jivesoftware/smack/Roster;)V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 16
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 811
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 812
    .local v8, "addedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 813
    .local v15, "updatedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 815
    .local v9, "deletedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    move-object/from16 v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/RosterPacket;

    move-object v14, v0

    .line 816
    .local v14, "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    invoke-virtual {v14}, Lorg/jivesoftware/smack/packet/RosterPacket;->getRosterItems()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 817
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .line 818
    .local v12, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {v12}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v2

    .line 819
    .local v2, "user":Ljava/lang/String;
    invoke-virtual {v12}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getName()Ljava/lang/String;

    move-result-object v3

    .line 820
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v12}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v4

    .line 821
    .local v4, "itemType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    invoke-virtual {v12}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v5

    .line 823
    .local v5, "itemStatus":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    new-instance v1, Lorg/jivesoftware/smack/RosterEntry;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$800(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v6

    invoke-direct/range {v1 .. v6}, Lorg/jivesoftware/smack/RosterEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 829
    .local v1, "entry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-static {}, Lorg/jivesoftware/smack/GoogleExtensions;->getSupportExtendedContactAttribute()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 830
    invoke-virtual {v12}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionGetStatus()Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smack/RosterEntry;->googleSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    .line 831
    invoke-virtual {v12}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionGetRejected()Z

    move-result v6

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smack/RosterEntry;->googleSetRejected(Z)V

    .line 832
    invoke-virtual {v12}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->isQuickContact()Z

    move-result v6

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smack/RosterEntry;->setQuickContact(Z)V

    .line 836
    :cond_0
    sget-object v6, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->REMOVE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v6, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 840
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$400(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 841
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$400(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 844
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v6

    monitor-enter v6

    .line 845
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v7, v0

    invoke-static {v7}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 846
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v7, v0

    invoke-static {v7}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 848
    :cond_2
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 851
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->parseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "@"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 852
    .local v13, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$300(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v13}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 854
    invoke-interface {v9, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 848
    .end local v13    # "key":Ljava/lang/String;
    :catchall_0
    move-exception v7

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v7

    .line 857
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$400(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    const/4 v6, 0x1

    move v7, v6

    .line 887
    .local v7, "addEntry":Z
    :goto_1
    if-eqz v7, :cond_7

    .line 888
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$400(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 890
    invoke-interface {v8, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 929
    .end local v7    # "addEntry":Z
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v6

    monitor-enter v6

    .line 930
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v7, v0

    invoke-static {v7}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 931
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v7, v0

    invoke-static {v7}, Lorg/jivesoftware/smack/Roster;->access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 933
    :cond_5
    monitor-exit v6

    goto/16 :goto_0

    :catchall_1
    move-exception v7

    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v7

    .line 857
    :cond_6
    const/4 v6, 0x0

    move v7, v6

    goto :goto_1

    .line 894
    .restart local v7    # "addEntry":Z
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6}, Lorg/jivesoftware/smack/Roster;->access$400(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v7, v0

    .end local v7    # "addEntry":Z
    invoke-static {v7}, Lorg/jivesoftware/smack/Roster;->access$400(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v7

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/jivesoftware/smack/RosterEntry;

    .line 898
    .local v10, "existingEntry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-virtual {v10, v1}, Lorg/jivesoftware/smack/RosterEntry;->updateState(Lorg/jivesoftware/smack/RosterEntry;)V

    .line 905
    invoke-interface {v15, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 912
    invoke-virtual {v1}, Lorg/jivesoftware/smack/RosterEntry;->isBlocked()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 914
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    const/4 v7, 0x1

    invoke-static {v6, v2, v7}, Lorg/jivesoftware/smack/Roster;->access$600(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;Z)V

    goto :goto_2

    .line 1007
    .end local v1    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v2    # "user":Ljava/lang/String;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "itemType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .end local v5    # "itemStatus":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v10    # "existingEntry":Lorg/jivesoftware/smack/RosterEntry;
    .end local v12    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    monitor-enter v6

    .line 1008
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v7, v0

    const/4 v10, 0x1

    iput-boolean v10, v7, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    .line 1010
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v7, v0

    invoke-virtual {v7}, Ljava/lang/Object;->notifyAll()V

    .line 1011
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 1014
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/Roster$RosterPacketListener;->this$0:Lorg/jivesoftware/smack/Roster;

    move-object v6, v0

    invoke-static {v6, v8, v15, v9}, Lorg/jivesoftware/smack/Roster;->access$1000(Lorg/jivesoftware/smack/Roster;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 1015
    return-void

    .line 1011
    :catchall_2
    move-exception v7

    :try_start_4
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v7
.end method
