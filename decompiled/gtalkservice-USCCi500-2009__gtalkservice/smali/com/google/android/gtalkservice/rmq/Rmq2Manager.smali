.class public Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
.super Ljava/lang/Object;
.source "Rmq2Manager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    }
.end annotation


# static fields
.field private static final DEBUG_RMQ2:Z

.field private static sIncludeStreamId:Z


# instance fields
.field private final mAckedS2dMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mAckingInterval:I

.field private final mD2sIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLastStreamIdAcked:I

.field private mMessageQueue:Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;

.field private mPacketSender:Lcom/google/android/gtalkservice/PacketSender;

.field private mProtobufConfig:Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;

.field private mProtobufSerializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

.field private final mResendQueue:Ljava/util/LinkedList;

.field private mRmqAckLock:Ljava/lang/Object;

.field private mS2dIdStore:Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;

.field private mStreamIdIn:I

.field private mStreamIdOut:I

.field private mUnackedS2dIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->sIncludeStreamId:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gtalkservice/PacketSender;Landroid/content/ContentResolver;)V
    .locals 2
    .param p1, "packetSender"    # Lcom/google/android/gtalkservice/PacketSender;
    .param p2, "resolver"    # Landroid/content/ContentResolver;

    .prologue
    .line 141
    new-instance v0, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;

    invoke-direct {v0, p2}, Lcom/google/android/gtalkservice/rmq/PersistentMessageQueue;-><init>(Landroid/content/ContentResolver;)V

    new-instance v1, Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStoreImpl;

    invoke-direct {v1, p2}, Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStoreImpl;-><init>(Landroid/content/ContentResolver;)V

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;-><init>(Lcom/google/android/gtalkservice/PacketSender;Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;)V

    .line 144
    return-void
.end method

.method public constructor <init>(Lcom/google/android/gtalkservice/PacketSender;Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;)V
    .locals 2
    .param p1, "packetSender"    # Lcom/google/android/gtalkservice/PacketSender;
    .param p2, "clientRmq"    # Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;
    .param p3, "s2dRmq"    # Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;

    .prologue
    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mProtobufConfig:Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;

    .line 73
    new-instance v0, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializerImpl;

    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mProtobufConfig:Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializerImpl;-><init>(Lcom/google/android/gtalkservice/proto/ProtoBufStreamConfiguration;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mProtobufSerializer:Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;

    .line 123
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    .line 127
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    .line 133
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    .line 135
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mRmqAckLock:Ljava/lang/Object;

    .line 149
    iput-object p1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mPacketSender:Lcom/google/android/gtalkservice/PacketSender;

    .line 150
    iput-object p2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mMessageQueue:Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;

    .line 151
    iput-object p3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mS2dIdStore:Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;

    .line 152
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mResendQueue:Ljava/util/LinkedList;

    .line 153
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/gtalkservice/rmq/Rmq2Manager;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->resendPackets()V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/rmq/Rmq2Manager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    return-void
.end method

.method private ackD2sMessagesInternal(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 553
    .local p1, "d2sIdsToAck":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    .line 555
    .local v3, "size":I
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v4, :cond_0

    .line 556
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ackD2sMessagesInternal: size="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 559
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 561
    .local v2, "rmq2Ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    monitor-enter v4

    .line 562
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;

    .line 563
    .local v0, "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    iget-object v5, v0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;->d2sId:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 564
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 566
    .end local v0    # "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 568
    iget-object v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mMessageQueue:Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;

    invoke-interface {v4, v2}, Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;->removeMessagesByRmq2Ids(Ljava/util/List;)I

    .line 569
    return-void
.end method

.method public static getIncludeStreamIdInProtobuf()Z
    .locals 1

    .prologue
    .line 183
    sget-boolean v0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->sIncludeStreamId:Z

    return v0
.end method

.method private internalProcessS2dMessage(Ljava/lang/String;I)V
    .locals 12
    .param p1, "s2dId"    # Ljava/lang/String;
    .param p2, "lastStreamIdReceived"    # I

    .prologue
    .line 481
    sget-boolean v9, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v9, :cond_0

    .line 482
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "processS2dMessage: s2dId="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", lastStreamId="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 485
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 486
    iget-object v9, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    monitor-enter v9

    .line 487
    :try_start_0
    iget-object v10, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    invoke-interface {v10, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 488
    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 491
    :cond_1
    const/4 v4, 0x0

    .line 492
    .local v4, "deviceStreamIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v8, 0x0

    .line 494
    .local v8, "s2dIdsToDelete":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v9, -0x1

    if-eq p2, v9, :cond_6

    .line 496
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v1

    .line 498
    .local v1, "d2sIdsToAck":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;>;"
    iget-object v9, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    monitor-enter v9

    .line 506
    :try_start_1
    iget-object v10, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;

    .line 507
    .local v2, "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    iget v10, v2, Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;->streamId:I

    if-ge p2, v10, :cond_7

    .line 513
    .end local v2    # "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    :cond_2
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 515
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v9

    if-lez v9, :cond_3

    .line 516
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->ackD2sMessagesInternal(Ljava/util/List;)V

    .line 526
    :cond_3
    iget-object v10, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    monitor-enter v10

    .line 527
    :try_start_2
    iget-object v9, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .end local v5    # "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 529
    .local v3, "deviceStreamId":I
    if-ge p2, v3, :cond_8

    .line 546
    .end local v3    # "deviceStreamId":I
    :cond_5
    monitor-exit v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 549
    .end local v1    # "d2sIdsToAck":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;>;"
    :cond_6
    invoke-direct {p0, p1, v8, v4}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->updateS2dIds(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 550
    return-void

    .line 488
    .end local v4    # "deviceStreamIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v8    # "s2dIdsToDelete":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v10

    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v10

    .line 511
    .restart local v1    # "d2sIdsToAck":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;>;"
    .restart local v2    # "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    .restart local v4    # "deviceStreamIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v8    # "s2dIdsToDelete":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_7
    :try_start_4
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 513
    .end local v2    # "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    .end local v5    # "i$":Ljava/util/Iterator;
    :catchall_1
    move-exception v10

    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v10

    .line 533
    .restart local v3    # "deviceStreamId":I
    :cond_8
    if-nez v4, :cond_9

    .line 534
    :try_start_5
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v4

    .line 535
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v8

    .line 538
    :cond_9
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 541
    iget-object v9, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 542
    .local v0, "ackedS2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 543
    .local v7, "id":Ljava/lang/String;
    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 546
    .end local v0    # "ackedS2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "deviceStreamId":I
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v7    # "id":Ljava/lang/String;
    :catchall_2
    move-exception v9

    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v9
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 686
    const-string v0, "Rmq"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[Rmq2Mgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 687
    return-void
.end method

.method private makeRmqPacket(JLorg/jivesoftware/smack/packet/Packet;)Lcom/google/android/gtalkservice/rmq/RmqPacket;
    .locals 9
    .param p1, "rmqId"    # J
    .param p3, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 304
    const/4 v8, 0x0

    .line 307
    .local v8, "retVal":Lcom/google/android/gtalkservice/rmq/RmqPacket;
    :try_start_0
    invoke-virtual {p3}, Lorg/jivesoftware/smack/packet/Packet;->toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v7

    .line 308
    .local v7, "protoBuf":Lcom/google/common/io/protocol/ProtoBuf;
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mProtobufConfig:Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;

    invoke-virtual {v7}, Lcom/google/common/io/protocol/ProtoBuf;->getType()Lcom/google/common/io/protocol/ProtoBufType;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->getTag(Lcom/google/common/io/protocol/ProtoBufType;)B

    move-result v4

    .line 309
    .local v4, "tag":B
    invoke-virtual {v7}, Lcom/google/common/io/protocol/ProtoBuf;->toByteArray()[B

    move-result-object v5

    .line 310
    .local v5, "bytes":[B
    new-instance v0, Lcom/google/android/gtalkservice/rmq/RmqPacket;

    move-object v1, p3

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gtalkservice/rmq/RmqPacket;-><init>(Lorg/jivesoftware/smack/packet/Packet;JB[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 315
    .end local v4    # "tag":B
    .end local v5    # "bytes":[B
    .end local v7    # "protoBuf":Lcom/google/common/io/protocol/ProtoBuf;
    .end local v8    # "retVal":Lcom/google/android/gtalkservice/rmq/RmqPacket;
    .local v0, "retVal":Lcom/google/android/gtalkservice/rmq/RmqPacket;
    :goto_0
    return-object v0

    .line 311
    .end local v0    # "retVal":Lcom/google/android/gtalkservice/rmq/RmqPacket;
    .restart local v8    # "retVal":Lcom/google/android/gtalkservice/rmq/RmqPacket;
    :catch_0
    move-exception v1

    move-object v6, v1

    .line 312
    .local v6, "ioe":Ljava/io/IOException;
    const-string v1, "Rmq"

    const-string v2, "makeRmqPacket: caught IOException"

    invoke-static {v1, v2, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v0, v8

    .end local v8    # "retVal":Lcom/google/android/gtalkservice/rmq/RmqPacket;
    .restart local v0    # "retVal":Lcom/google/android/gtalkservice/rmq/RmqPacket;
    goto :goto_0
.end method

.method private processSelectiveAck(Lcom/google/android/gtalkservice/extensions/SelectiveAck;)V
    .locals 3
    .param p1, "ack"    # Lcom/google/android/gtalkservice/extensions/SelectiveAck;

    .prologue
    .line 620
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/extensions/SelectiveAck;->getIdList()Ljava/util/List;

    move-result-object v0

    .line 622
    .local v0, "acks":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "got SelectiveAck, size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 625
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mMessageQueue:Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;

    invoke-interface {v1, v0}, Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;->removeMessagesByRmq2Ids(Ljava/util/List;)I

    .line 628
    invoke-direct {p0}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->resendRmqPackets()V

    .line 629
    return-void
.end method

.method private resendPackets()V
    .locals 4

    .prologue
    .line 669
    :goto_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mResendQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 670
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mResendQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 671
    monitor-exit v1

    .line 683
    return-void

    .line 674
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mResendQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Packet;

    .line 676
    .local v0, "packet":Lorg/jivesoftware/smack/packet/Packet;
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v2, :cond_1

    .line 677
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resend packet "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Packet;->getRmq2Id()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 680
    :cond_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mPacketSender:Lcom/google/android/gtalkservice/PacketSender;

    invoke-interface {v2, v0}, Lcom/google/android/gtalkservice/PacketSender;->sendPacketOverMcsConnection(Lorg/jivesoftware/smack/packet/Packet;)Z

    .line 681
    monitor-exit v1

    goto :goto_0

    .end local v0    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private resendRmqPackets()V
    .locals 8

    .prologue
    .line 632
    iget-object v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mMessageQueue:Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;

    invoke-interface {v4}, Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;->getRmq2Packets()Lcom/google/android/gtalkservice/rmq/RmqPacketList;

    move-result-object v2

    .line 633
    .local v2, "list":Lcom/google/android/gtalkservice/rmq/RmqPacketList;
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/rmq/RmqPacketList;->size()I

    move-result v0

    .line 636
    .local v0, "count":I
    if-nez v0, :cond_1

    .line 637
    :try_start_0
    const-string v4, "GTalkService"

    const/4 v5, 0x3

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 638
    const-string v4, "no rmq packets to resend"

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 663
    :cond_0
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/rmq/RmqPacketList;->close()V

    .line 665
    :goto_0
    return-void

    .line 643
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mResendQueue:Ljava/util/LinkedList;

    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 644
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_3

    .line 645
    :try_start_2
    invoke-virtual {v2, v1}, Lcom/google/android/gtalkservice/rmq/RmqPacketList;->getPacketAt(I)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    .line 647
    .local v3, "packet":Lorg/jivesoftware/smack/packet/Packet;
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v5, :cond_2

    .line 648
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "resendRmqPackets: add packet "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Packet;->getRmqId()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to queue"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 650
    :cond_2
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mResendQueue:Ljava/util/LinkedList;

    invoke-virtual {v5, v3}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 644
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 652
    .end local v3    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :cond_3
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 654
    :try_start_3
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/google/android/gtalkservice/rmq/Rmq2Manager$1;

    invoke-direct {v5, p0}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager$1;-><init>(Lcom/google/android/gtalkservice/rmq/Rmq2Manager;)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 663
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/rmq/RmqPacketList;->close()V

    goto :goto_0

    .line 652
    :catchall_0
    move-exception v5

    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 663
    .end local v1    # "i":I
    :catchall_1
    move-exception v4

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/rmq/RmqPacketList;->close()V

    throw v4
.end method

.method private sendStreamAck()V
    .locals 5

    .prologue
    .line 601
    const/4 v1, 0x0

    .line 603
    .local v1, "needToSendAck":Z
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mRmqAckLock:Ljava/lang/Object;

    monitor-enter v2

    .line 604
    :try_start_0
    iget v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdIn:I

    iget v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mLastStreamIdAcked:I

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->getAckingInterval()I

    move-result v4

    if-lt v3, v4, :cond_1

    .line 605
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v3, :cond_0

    .line 606
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sendStreamAck: mStreamIdIn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdIn:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mLastStreamIdAcked="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mLastStreamIdAcked:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 609
    :cond_0
    const/4 v1, 0x1

    .line 611
    :cond_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 613
    if-eqz v1, :cond_2

    .line 614
    new-instance v0, Lcom/google/android/gtalkservice/extensions/StreamAck;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/extensions/StreamAck;-><init>()V

    .line 615
    .local v0, "ack":Lcom/google/android/gtalkservice/extensions/StreamAck;
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mPacketSender:Lcom/google/android/gtalkservice/PacketSender;

    invoke-interface {v2, v0}, Lcom/google/android/gtalkservice/PacketSender;->sendPacketOverMcsConnection(Lorg/jivesoftware/smack/packet/Packet;)Z

    .line 617
    .end local v0    # "ack":Lcom/google/android/gtalkservice/extensions/StreamAck;
    :cond_2
    return-void

    .line 611
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public static setIncludeStreamId(Z)V
    .locals 0
    .param p0, "flag"    # Z

    .prologue
    .line 187
    sput-boolean p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->sIncludeStreamId:Z

    .line 188
    return-void
.end method

.method private setLastStreamIdAcked(I)Z
    .locals 2
    .param p1, "lastStreamIdReceived"    # I

    .prologue
    .line 203
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mRmqAckLock:Ljava/lang/Object;

    monitor-enter v0

    .line 204
    :try_start_0
    iget v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mLastStreamIdAcked:I

    if-le p1, v1, :cond_0

    .line 205
    iput p1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mLastStreamIdAcked:I

    .line 206
    const/4 v1, 0x1

    monitor-exit v0

    move v0, v1

    .line 210
    :goto_0
    return v0

    .line 208
    :cond_0
    monitor-exit v0

    .line 210
    const/4 v0, 0x0

    goto :goto_0

    .line 208
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private updateS2dIds(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 5
    .param p1, "s2dIdToAdd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 575
    .local p2, "s2dIdsToDelete":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "deviceStreamIdsAcked":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 576
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateS2dIds: add s2did="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 577
    :cond_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mS2dIdStore:Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;

    invoke-interface {v3, p1}, Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;->addS2dId(Ljava/lang/String;)V

    .line 581
    :cond_1
    if-eqz p2, :cond_5

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    move v1, v3

    .line 582
    .local v1, "size":I
    :goto_0
    if-lez v1, :cond_3

    .line 583
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v3, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateS2dIds: delete "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " s2d ids"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 584
    :cond_2
    iget-object v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mS2dIdStore:Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;

    invoke-interface {v3, p2}, Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;->deleteS2dIds(Ljava/util/List;)V

    .line 588
    :cond_3
    if-eqz p3, :cond_6

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_6

    .line 589
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 590
    .local v2, "streamId":Ljava/lang/Integer;
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v3, :cond_4

    .line 591
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateS2dIds: remove streamId "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " from map"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 593
    :cond_4
    iget-object v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    monitor-enter v3

    .line 594
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 595
    monitor-exit v3

    goto :goto_1

    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 581
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "size":I
    .end local v2    # "streamId":Ljava/lang/Integer;
    :cond_5
    const/4 v3, 0x0

    move v1, v3

    goto :goto_0

    .line 598
    .restart local v1    # "size":I
    :cond_6
    return-void
.end method


# virtual methods
.method public getAckingInterval()I
    .locals 1

    .prologue
    .line 214
    iget v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckingInterval:I

    return v0
.end method

.method public getD2sIds()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 227
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    monitor-enter v1

    .line 228
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 229
    .local v0, "retVal":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;>;"
    monitor-exit v1

    .line 231
    return-object v0

    .line 229
    .end local v0    # "retVal":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;>;"
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getLastStreamIdAcked()I
    .locals 2

    .prologue
    .line 197
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mRmqAckLock:Ljava/lang/Object;

    monitor-enter v0

    .line 198
    :try_start_0
    iget v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mLastStreamIdAcked:I

    monitor-exit v0

    return v1

    .line 199
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getLastStreamIdReceived()I
    .locals 2

    .prologue
    .line 191
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mRmqAckLock:Ljava/lang/Object;

    monitor-enter v0

    .line 192
    :try_start_0
    iget v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdIn:I

    monitor-exit v0

    return v1

    .line 193
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getMessageQueue()Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mMessageQueue:Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;

    return-object v0
.end method

.method public getS2dIdStore()Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mS2dIdStore:Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;

    return-object v0
.end method

.method public initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 0
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->resetStreamIds()V

    .line 157
    return-void
.end method

.method public processAndRetrieveInitialS2dIds()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 248
    iget-object v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mS2dIdStore:Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;

    invoke-interface {v3}, Lcom/google/android/gtalkservice/rmq/Rmq2Server2DeviceIdStore;->getS2dIds()Ljava/util/List;

    move-result-object v2

    .line 250
    .local v2, "s2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    monitor-enter v3

    .line 251
    :try_start_0
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 252
    .local v1, "id":Ljava/lang/String;
    iget-object v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 254
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "id":Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 256
    return-object v2
.end method

.method public processD2sMessage(Ljava/lang/String;)I
    .locals 5
    .param p1, "rmq2Id"    # Ljava/lang/String;

    .prologue
    .line 327
    iget v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdOut:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdOut:I

    .line 329
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 330
    new-instance v1, Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;

    iget v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdOut:I

    invoke-direct {v1, v2, p1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;-><init>(ILjava/lang/String;)V

    .line 331
    .local v1, "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    monitor-enter v2

    .line 332
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 333
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 336
    .end local v1    # "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    :cond_0
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v2, :cond_1

    .line 337
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "processD2sMessage: mStreamIdOut="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdOut:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 343
    :cond_1
    const/4 v0, 0x0

    .line 345
    .local v0, "ackedS2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    monitor-enter v2

    .line 346
    :try_start_1
    iget-object v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 347
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    .line 348
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    .line 350
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 352
    iget-object v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    monitor-enter v2

    .line 353
    if-eqz v0, :cond_3

    .line 354
    :try_start_2
    iget-object v3, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    iget v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdOut:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    :cond_3
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 358
    iget v2, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdOut:I

    return v2

    .line 333
    .end local v0    # "ackedS2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 350
    .end local v1    # "d2sInfo":Lcom/google/android/gtalkservice/rmq/Rmq2Manager$D2sInfo;
    .restart local v0    # "ackedS2dIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_1
    move-exception v3

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v3

    .line 356
    :catchall_2
    move-exception v3

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v3
.end method

.method public processS2dMessage(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 465
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mRmqAckLock:Ljava/lang/Object;

    monitor-enter v0

    .line 466
    :try_start_0
    iget v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdIn:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdIn:I

    .line 467
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 470
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getRmq2Id()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getLastStreamId()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->internalProcessS2dMessage(Ljava/lang/String;I)V

    .line 473
    invoke-direct {p0}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->sendStreamAck()V

    .line 475
    instance-of v0, p1, Lcom/google/android/gtalkservice/extensions/SelectiveAck;

    if-eqz v0, :cond_0

    .line 476
    check-cast p1, Lcom/google/android/gtalkservice/extensions/SelectiveAck;

    .end local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processSelectiveAck(Lcom/google/android/gtalkservice/extensions/SelectiveAck;)V

    .line 478
    :cond_0
    return-void

    .line 467
    .restart local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public resetStreamIds()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 160
    iput v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdIn:I

    .line 161
    iput v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mStreamIdOut:I

    .line 164
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    monitor-enter v0

    .line 165
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mD2sIds:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 166
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    monitor-enter v0

    .line 170
    :try_start_1
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mUnackedS2dIds:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 171
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 173
    iget-object v0, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    monitor-enter v0

    .line 174
    :try_start_2
    iget-object v1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckedS2dMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 175
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 176
    return-void

    .line 166
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 171
    :catchall_1
    move-exception v1

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1

    .line 175
    :catchall_2
    move-exception v1

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v1
.end method

.method public send(Lorg/jivesoftware/smack/packet/Packet;)Z
    .locals 7
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 273
    iget-object v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mMessageQueue:Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;

    invoke-interface {v4}, Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;->getNextRmqId()J

    move-result-wide v1

    .line 274
    .local v1, "rmqId":J
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .line 276
    .local v0, "rmq2Id":Ljava/lang/String;
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "send: rmq2Id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 278
    :cond_0
    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/packet/Packet;->setRmq2Id(Ljava/lang/String;)V

    .line 280
    invoke-direct {p0, v1, v2, p1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->makeRmqPacket(JLorg/jivesoftware/smack/packet/Packet;)Lcom/google/android/gtalkservice/rmq/RmqPacket;

    move-result-object v3

    .line 281
    .local v3, "rmqPacket":Lcom/google/android/gtalkservice/rmq/RmqPacket;
    if-nez v3, :cond_1

    .line 282
    const-string v4, "Rmq"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "send: cannot make RmqPacket from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    const/4 v4, 0x0

    .line 298
    :goto_0
    return v4

    .line 288
    :cond_1
    iget-object v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mMessageQueue:Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;

    invoke-interface {v4, v1, v2, v3}, Lcom/google/android/gtalkservice/rmq/ReliableMessageQueue;->enqueueMessage(JLcom/google/android/gtalkservice/rmq/RmqPacket;)V

    .line 290
    iget-object v4, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mResendQueue:Ljava/util/LinkedList;

    monitor-enter v4

    .line 291
    :try_start_0
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mResendQueue:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    if-nez v5, :cond_2

    .line 292
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mPacketSender:Lcom/google/android/gtalkservice/PacketSender;

    invoke-interface {v5, v3}, Lcom/google/android/gtalkservice/PacketSender;->sendPacketOverMcsConnection(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v5

    monitor-exit v4

    move v4, v5

    goto :goto_0

    .line 294
    :cond_2
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sDebugRmq:Z

    if-eqz v5, :cond_3

    .line 295
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "send: add packet "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to resend queue"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->log(Ljava/lang/String;)V

    .line 297
    :cond_3
    iget-object v5, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mResendQueue:Ljava/util/LinkedList;

    invoke-virtual {v5, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 298
    const/4 v5, 0x1

    monitor-exit v4

    move v4, v5

    goto :goto_0

    .line 300
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method

.method public serializePacketAsProtoBuf(Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;Lorg/jivesoftware/smack/packet/Packet;)[B
    .locals 9
    .param p1, "serializer"    # Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;
    .param p2, "packet"    # Lorg/jivesoftware/smack/packet/Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 365
    invoke-virtual {p2}, Lorg/jivesoftware/smack/packet/Packet;->toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v3

    .line 370
    .local v3, "protobuf":Lcom/google/common/io/protocol/ProtoBuf;
    if-nez v3, :cond_0

    .line 371
    invoke-virtual {p0, v8}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processD2sMessage(Ljava/lang/String;)I

    move-object v6, v8

    .line 461
    :goto_0
    return-object v6

    .line 375
    :cond_0
    invoke-virtual {v3}, Lcom/google/common/io/protocol/ProtoBuf;->getType()Lcom/google/common/io/protocol/ProtoBufType;

    move-result-object v5

    .line 376
    .local v5, "type":Lcom/google/common/io/protocol/ProtoBufType;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->getLastStreamIdReceived()I

    move-result v1

    .line 378
    .local v1, "lastStreamIdReceived":I
    const/4 v2, 0x0

    .line 381
    .local v2, "persistentId":Ljava/lang/String;
    :try_start_0
    sget-object v6, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_PING:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v5, v6, :cond_3

    .line 382
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processD2sMessage(Ljava/lang/String;)I

    move-result v4

    .line 383
    .local v4, "streamId":I
    invoke-static {}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->getIncludeStreamIdInProtobuf()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 384
    const/4 v6, 0x1

    invoke-virtual {v3, v6, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 386
    :cond_1
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->setLastStreamIdAcked(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 387
    const/4 v6, 0x2

    invoke-virtual {v3, v6, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 461
    .end local v4    # "streamId":I
    :cond_2
    :goto_1
    invoke-interface {p1, v3}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;->serialize(Lcom/google/common/io/protocol/ProtoBuf;)[B

    move-result-object v6

    goto :goto_0

    .line 389
    :cond_3
    :try_start_1
    sget-object v6, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_ACK:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v5, v6, :cond_5

    .line 390
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processD2sMessage(Ljava/lang/String;)I

    move-result v4

    .line 391
    .restart local v4    # "streamId":I
    invoke-static {}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->getIncludeStreamIdInProtobuf()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 392
    const/4 v6, 0x1

    invoke-virtual {v3, v6, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 394
    :cond_4
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->setLastStreamIdAcked(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 395
    const/4 v6, 0x2

    invoke-virtual {v3, v6, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 456
    .end local v4    # "streamId":I
    :catch_0
    move-exception v6

    move-object v0, v6

    .line 457
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "GTalkService"

    const-string v7, "serializePacketAsProtoBuf: caught "

    invoke-static {v6, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v6, v8

    .line 458
    goto :goto_0

    .line 397
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5
    :try_start_2
    sget-object v6, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->IQ_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v5, v6, :cond_8

    .line 398
    const/16 v6, 0x8

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 399
    const/16 v6, 0x8

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 401
    :cond_6
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processD2sMessage(Ljava/lang/String;)I

    move-result v4

    .line 402
    .restart local v4    # "streamId":I
    invoke-static {}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->getIncludeStreamIdInProtobuf()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 403
    const/16 v6, 0x9

    invoke-virtual {v3, v6, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 405
    :cond_7
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->setLastStreamIdAcked(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 406
    const/16 v6, 0xa

    invoke-virtual {v3, v6, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto :goto_1

    .line 408
    .end local v4    # "streamId":I
    :cond_8
    sget-object v6, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->MESSAGE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v5, v6, :cond_b

    .line 409
    const/16 v6, 0xd

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 410
    const/16 v6, 0xd

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 412
    :cond_9
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processD2sMessage(Ljava/lang/String;)I

    move-result v4

    .line 413
    .restart local v4    # "streamId":I
    invoke-static {}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->getIncludeStreamIdInProtobuf()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 414
    const/16 v6, 0xe

    invoke-virtual {v3, v6, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 416
    :cond_a
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->setLastStreamIdAcked(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 417
    const/16 v6, 0xf

    invoke-virtual {v3, v6, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_1

    .line 419
    .end local v4    # "streamId":I
    :cond_b
    sget-object v6, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HTTP_REQUEST:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v5, v6, :cond_e

    .line 420
    const/4 v6, 0x4

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 421
    const/4 v6, 0x4

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 423
    :cond_c
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processD2sMessage(Ljava/lang/String;)I

    move-result v4

    .line 424
    .restart local v4    # "streamId":I
    invoke-static {}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->getIncludeStreamIdInProtobuf()Z

    move-result v6

    if-eqz v6, :cond_d

    .line 425
    const/4 v6, 0x5

    invoke-virtual {v3, v6, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 427
    :cond_d
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->setLastStreamIdAcked(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 428
    const/4 v6, 0x6

    invoke-virtual {v3, v6, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_1

    .line 430
    .end local v4    # "streamId":I
    :cond_e
    sget-object v6, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->PRESENCE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v5, v6, :cond_11

    .line 431
    const/16 v6, 0xd

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v6

    if-eqz v6, :cond_f

    .line 432
    const/16 v6, 0xd

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 434
    :cond_f
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processD2sMessage(Ljava/lang/String;)I

    move-result v4

    .line 435
    .restart local v4    # "streamId":I
    invoke-static {}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->getIncludeStreamIdInProtobuf()Z

    move-result v6

    if-eqz v6, :cond_10

    .line 436
    const/16 v6, 0xe

    invoke-virtual {v3, v6, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 438
    :cond_10
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->setLastStreamIdAcked(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 439
    const/16 v6, 0xf

    invoke-virtual {v3, v6, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_1

    .line 441
    .end local v4    # "streamId":I
    :cond_11
    sget-object v6, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->DATA_MESSAGE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v5, v6, :cond_14

    .line 442
    const/16 v6, 0x9

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v6

    if-eqz v6, :cond_12

    .line 443
    const/16 v6, 0x9

    invoke-virtual {v3, v6}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 445
    :cond_12
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processD2sMessage(Ljava/lang/String;)I

    move-result v4

    .line 446
    .restart local v4    # "streamId":I
    invoke-static {}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->getIncludeStreamIdInProtobuf()Z

    move-result v6

    if-eqz v6, :cond_13

    .line 447
    const/16 v6, 0xa

    invoke-virtual {v3, v6, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 449
    :cond_13
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->setLastStreamIdAcked(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 450
    const/16 v6, 0xb

    invoke-virtual {v3, v6, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    goto/16 :goto_1

    .line 453
    .end local v4    # "streamId":I
    :cond_14
    sget-object v6, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->LOGIN_REQUEST:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v5, v6, :cond_2

    .line 454
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processD2sMessage(Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1
.end method

.method public setAckingInterval(I)V
    .locals 1
    .param p1, "interval"    # I

    .prologue
    .line 218
    if-gtz p1, :cond_0

    .line 219
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 221
    :cond_0
    iput p1, p0, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->mAckingInterval:I

    .line 222
    return-void
.end method
