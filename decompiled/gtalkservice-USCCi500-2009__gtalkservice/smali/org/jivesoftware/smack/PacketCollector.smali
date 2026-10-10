.class public Lorg/jivesoftware/smack/PacketCollector;
.super Ljava/lang/Object;
.source "PacketCollector.java"


# static fields
.field private static final MAX_PACKETS:I = 0x100


# instance fields
.field private cancelled:Z

.field public packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private packetReader:Lorg/jivesoftware/smack/PacketReader;

.field resultQueue:Ljava/util/LinkedList;


# direct methods
.method protected constructor <init>(Lorg/jivesoftware/smack/PacketReader;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .locals 2
    .param p1, "packetReader"    # Lorg/jivesoftware/smack/PacketReader;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/PacketCollector;->cancelled:Z

    .line 63
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketCollector;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    .line 64
    iput-object p2, p0, Lorg/jivesoftware/smack/PacketCollector;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 65
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    .line 67
    iget-object v0, p1, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    monitor-enter v0

    .line 68
    :try_start_0
    iget-object v1, p1, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    monitor-exit v0

    .line 70
    return-void

    .line 69
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public cancel()V
    .locals 4

    .prologue
    .line 79
    iget-boolean v1, p0, Lorg/jivesoftware/smack/PacketCollector;->cancelled:Z

    if-nez v1, :cond_0

    .line 80
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/PacketCollector;->cancelled:Z

    .line 84
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketCollector;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    iget-object v1, v1, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    monitor-enter v1

    .line 85
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketCollector;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    iget-object v2, v2, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    invoke-interface {v2, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 86
    .local v0, "index":I
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketCollector;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    iget-object v2, v2, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v0, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 87
    monitor-exit v1

    .line 89
    .end local v0    # "index":I
    :cond_0
    return-void

    .line 87
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getPacketFilter()Lorg/jivesoftware/smack/filter/PacketFilter;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    return-object v0
.end method

.method public declared-synchronized nextResult()Lorg/jivesoftware/smack/packet/Packet;
    .locals 1

    .prologue
    .line 126
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 130
    :catch_0
    move-exception v0

    goto :goto_0

    .line 134
    :cond_0
    :try_start_2
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Packet;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v0

    .line 126
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized nextResult(J)Lorg/jivesoftware/smack/packet/Packet;
    .locals 1
    .param p1, "timeout"    # J

    .prologue
    .line 147
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    :try_start_1
    invoke-virtual {p0, p1, p2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 156
    :cond_0
    :goto_0
    :try_start_2
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 157
    const/4 v0, 0x0

    .line 160
    :goto_1
    monitor-exit p0

    return-object v0

    :cond_1
    :try_start_3
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Packet;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 151
    :catch_0
    move-exception v0

    goto :goto_0

    .line 147
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized pollResult()Lorg/jivesoftware/smack/packet/Packet;
    .locals 1

    .prologue
    .line 110
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    const/4 v0, 0x0

    .line 114
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Packet;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 110
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 171
    monitor-enter p0

    if-nez p1, :cond_1

    .line 184
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 174
    :cond_1
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-interface {v0, p1}, Lorg/jivesoftware/smack/filter/PacketFilter;->accept(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    :cond_2
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/16 v1, 0x100

    if-ne v0, v1, :cond_3

    .line 177
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 180
    :cond_3
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 182
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 171
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
