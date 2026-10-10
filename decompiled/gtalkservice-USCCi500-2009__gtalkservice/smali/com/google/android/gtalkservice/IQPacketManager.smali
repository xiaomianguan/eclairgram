.class public Lcom/google/android/gtalkservice/IQPacketManager;
.super Ljava/lang/Object;
.source "IQPacketManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "GTalkService"


# instance fields
.field private mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

.field private mHandlersMap:Ljava/util/HashMap;

.field private mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

.field private mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 1
    .param p1, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mHandlersMap:Ljava/util/HashMap;

    .line 44
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 121
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[IQPacketMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    return-void
.end method


# virtual methods
.method public getRmq2Manager()Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    return-object v0
.end method

.method public getRmqManager()Lcom/google/android/gtalkservice/rmq/RmqManager;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    return-object v0
.end method

.method public initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 47
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smack/packet/IQ;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 48
    .local v1, "iqTypeFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v0, Lorg/jivesoftware/smack/filter/AndFilter;

    new-instance v2, Lcom/google/android/gtalkservice/IQPacketManager$1;

    invoke-direct {v2, p0}, Lcom/google/android/gtalkservice/IQPacketManager$1;-><init>(Lcom/google/android/gtalkservice/IQPacketManager;)V

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>(Lorg/jivesoftware/smack/filter/PacketFilter;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 55
    .local v0, "iqFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-virtual {p1, p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 56
    return-void
.end method

.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 6
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 102
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    move-object v3, v0

    .line 103
    .local v3, "iq":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v2

    .line 106
    .local v2, "id":Ljava/lang/String;
    iget-object v4, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mHandlersMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 107
    :try_start_0
    iget-object v5, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mHandlersMap:Ljava/util/HashMap;

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/IQPacketHandler;

    .line 108
    .local v1, "handler":Lcom/google/android/gtalkservice/IQPacketHandler;
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    if-eqz v1, :cond_1

    .line 111
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "got packet "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/IQPacketManager;->log(Ljava/lang/String;)V

    .line 112
    :cond_0
    invoke-interface {v1, v3}, Lcom/google/android/gtalkservice/IQPacketHandler;->handlePacket(Lorg/jivesoftware/smack/packet/IQ;)V

    .line 114
    iget-object v4, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mHandlersMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 115
    :try_start_1
    iget-object v5, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mHandlersMap:Ljava/util/HashMap;

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 118
    :cond_1
    return-void

    .line 108
    .end local v1    # "handler":Lcom/google/android/gtalkservice/IQPacketHandler;
    :catchall_0
    move-exception v5

    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v5

    .line 116
    .restart local v1    # "handler":Lcom/google/android/gtalkservice/IQPacketHandler;
    :catchall_1
    move-exception v5

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v5
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;)V
    .locals 1
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/IQ;
    .param p2, "handler"    # Lcom/google/android/gtalkservice/IQPacketHandler;

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V

    .line 76
    return-void
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V
    .locals 3
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/IQ;
    .param p2, "handler"    # Lcom/google/android/gtalkservice/IQPacketHandler;
    .param p3, "storeInRmq"    # Z

    .prologue
    .line 80
    if-eqz p2, :cond_0

    .line 81
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "id":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mHandlersMap:Ljava/util/HashMap;

    monitor-enter v1

    .line 84
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mHandlersMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "send packet "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/IQPacketManager;->log(Ljava/lang/String;)V

    .line 90
    .end local v0    # "id":Ljava/lang/String;
    :cond_0
    if-eqz p3, :cond_2

    .line 91
    iget-object v1, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    if-eqz v1, :cond_1

    .line 92
    iget-object v1, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->send(Lorg/jivesoftware/smack/packet/Packet;)Z

    .line 99
    :goto_0
    return-void

    .line 85
    .restart local v0    # "id":Ljava/lang/String;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 94
    .end local v0    # "id":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/rmq/RmqManager;->send(Lorg/jivesoftware/smack/packet/Packet;)Z

    goto :goto_0

    .line 97
    :cond_2
    iget-object v1, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacketOverMcsConnection(Lorg/jivesoftware/smack/packet/Packet;)Z

    goto :goto_0
.end method

.method public setRmq2Manager(Lcom/google/android/gtalkservice/rmq/Rmq2Manager;)V
    .locals 0
    .param p1, "rmq2Mgr"    # Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mRmq2Manager:Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    .line 72
    return-void
.end method

.method public setRmqManager(Lcom/google/android/gtalkservice/rmq/RmqManager;)V
    .locals 0
    .param p1, "rmqMgr"    # Lcom/google/android/gtalkservice/rmq/RmqManager;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/google/android/gtalkservice/IQPacketManager;->mRmqManager:Lcom/google/android/gtalkservice/rmq/RmqManager;

    .line 64
    return-void
.end method
