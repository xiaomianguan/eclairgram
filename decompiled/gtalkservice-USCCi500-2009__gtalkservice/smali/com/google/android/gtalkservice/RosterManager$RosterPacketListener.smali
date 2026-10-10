.class Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;
.super Ljava/lang/Object;
.source "RosterManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/RosterManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RosterPacketListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/RosterManager;


# direct methods
.method private constructor <init>(Lcom/google/android/gtalkservice/RosterManager;)V
    .locals 0

    .prologue
    .line 376
    iput-object p1, p0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gtalkservice/RosterManager;Lcom/google/android/gtalkservice/RosterManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/gtalkservice/RosterManager;
    .param p2, "x1"    # Lcom/google/android/gtalkservice/RosterManager$1;

    .prologue
    .line 376
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;-><init>(Lcom/google/android/gtalkservice/RosterManager;)V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 19
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 379
    move-object/from16 v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/RosterPacket;

    move-object v2, v0

    .line 380
    .local v2, "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    invoke-static {v1}, Lcom/google/android/gtalkservice/RosterManager;->access$600(Lcom/google/android/gtalkservice/RosterManager;)Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v14

    .line 382
    .local v14, "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    iget-wide v9, v14, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    .line 383
    .local v9, "accountId":J
    const/16 v16, 0x0

    .line 385
    .local v16, "isRosterResult":Z
    monitor-enter p0

    .line 392
    :try_start_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v1

    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-eq v1, v3, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    invoke-virtual {v1, v9, v10}, Lcom/google/android/gtalkservice/RosterManager;->isRosterRequestPendingForAccount(J)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 394
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    const/4 v3, 0x0

    invoke-virtual {v1, v9, v10, v3}, Lcom/google/android/gtalkservice/RosterManager;->setRosterRequestPendingForAccount(JZ)V

    .line 395
    const/16 v16, 0x1

    .line 397
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 399
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->getEtag()Ljava/lang/String;

    move-result-object v15

    .line 400
    .local v15, "etag":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->getNotModified()Ljava/lang/Boolean;

    move-result-object v18

    .line 401
    .local v18, "notModifiedBoolean":Ljava/lang/Boolean;
    if-eqz v18, :cond_2

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    move/from16 v17, v1

    .line 404
    .local v17, "notModified":Z
    :goto_0
    if-eqz v17, :cond_3

    .line 405
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    const-string v2, "roster not modified"

    .end local v2    # "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    invoke-static {v1, v2}, Lcom/google/android/gtalkservice/RosterManager;->access$900(Lcom/google/android/gtalkservice/RosterManager;Ljava/lang/String;)V

    .line 408
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/google/android/gtalkservice/RosterManager;->access$502(Lcom/google/android/gtalkservice/RosterManager;Z)Z

    .line 409
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    invoke-static {v1}, Lcom/google/android/gtalkservice/RosterManager;->access$800(Lcom/google/android/gtalkservice/RosterManager;)Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/RosterListenerImpl;->setRosterFetched(Z)V

    .line 410
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    invoke-static {v1}, Lcom/google/android/gtalkservice/RosterManager;->access$800(Lcom/google/android/gtalkservice/RosterManager;)Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged()Z

    .line 450
    :goto_1
    return-void

    .line 397
    .end local v15    # "etag":Ljava/lang/String;
    .end local v17    # "notModified":Z
    .end local v18    # "notModifiedBoolean":Ljava/lang/Boolean;
    .restart local v2    # "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 401
    .restart local v15    # "etag":Ljava/lang/String;
    .restart local v18    # "notModifiedBoolean":Ljava/lang/Boolean;
    :cond_2
    const/4 v1, 0x0

    move/from16 v17, v1

    goto :goto_0

    .line 416
    .restart local v17    # "notModified":Z
    :cond_3
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 417
    .local v3, "addedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 418
    .local v4, "updatedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 420
    .local v5, "deletedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    if-eqz v16, :cond_4

    .line 424
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    const/4 v6, 0x1

    invoke-static/range {v1 .. v6}, Lcom/google/android/gtalkservice/RosterManager;->access$1000(Lcom/google/android/gtalkservice/RosterManager;Lorg/jivesoftware/smack/packet/RosterPacket;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;Z)V

    .line 428
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/google/android/gtalkservice/RosterManager;->access$502(Lcom/google/android/gtalkservice/RosterManager;Z)Z

    .line 446
    .end local v2    # "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v6, v0

    iget-wide v7, v14, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    move-object v11, v3

    move-object v12, v4

    move-object v13, v5

    invoke-static/range {v6 .. v13}, Lcom/google/android/gtalkservice/RosterManager;->access$1200(Lcom/google/android/gtalkservice/RosterManager;JJLjava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    invoke-static {v1}, Lcom/google/android/gtalkservice/RosterManager;->access$700(Lcom/google/android/gtalkservice/RosterManager;)Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1, v9, v10, v15}, Lcom/google/android/gtalkservice/DatabaseHelper;->setRosterEtag(Landroid/content/ContentResolver;JLjava/lang/String;)V

    goto :goto_1

    .line 436
    .restart local v2    # "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    :cond_4
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->getRosterItemCount()I

    move-result v1

    const/16 v6, 0x32

    if-ge v1, v6, :cond_5

    .line 437
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    invoke-static {v1, v2, v3, v4, v5}, Lcom/google/android/gtalkservice/RosterManager;->access$1100(Lcom/google/android/gtalkservice/RosterManager;Lorg/jivesoftware/smack/packet/RosterPacket;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V

    goto :goto_2

    .line 440
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    move-object v1, v0

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lcom/google/android/gtalkservice/RosterManager;->access$1000(Lcom/google/android/gtalkservice/RosterManager;Lorg/jivesoftware/smack/packet/RosterPacket;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;Z)V

    goto :goto_2
.end method
