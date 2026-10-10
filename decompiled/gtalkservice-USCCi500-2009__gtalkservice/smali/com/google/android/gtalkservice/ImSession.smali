.class public abstract Lcom/google/android/gtalkservice/ImSession;
.super Ljava/lang/Object;
.source "ImSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/ImSession$2;
    }
.end annotation


# static fields
.field private static final DEFAULT_PRESENCE_PRIORITY:I = 0x18

.field public static final SHARE_ONE_PRESENCE:Z = true


# instance fields
.field protected mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

.field private mConnectionListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

.field private mConnectionListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gtalkservice/RemoteListenerCallback",
            "<",
            "Lcom/google/android/gtalkservice/IConnectionStateListener;",
            ">;"
        }
    .end annotation
.end field

.field private mConnectionListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/IConnectionStateListener;",
            ">;"
        }
    .end annotation
.end field

.field protected mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

.field protected mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

.field private mHostConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

.field protected mPassword:Ljava/lang/String;

.field protected mPresence:Lcom/google/android/gtalkservice/Presence;

.field private mPresenceLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private mPresenceReadLock:Ljava/util/concurrent/locks/Lock;

.field private mPresenceWriteLock:Ljava/util/concurrent/locks/Lock;

.field protected mServiceProviderId:J

.field protected mSharedPresence:Lcom/google/android/gtalkservice/Presence;

.field protected mUsername:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/GTalkConnectionContext;J)V
    .locals 2
    .param p1, "connectionContext"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .param p2, "serviceProviderId"    # J

    .prologue
    const/4 v1, 0x0

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Lcom/google/android/gtalkservice/RemoteListenerCallback;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/RemoteListenerCallback;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    .line 59
    new-instance v0, Lcom/google/android/gtalkservice/ImSession$1;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/ImSession$1;-><init>(Lcom/google/android/gtalkservice/ImSession;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

    .line 80
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 81
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceReadLock:Ljava/util/concurrent/locks/Lock;

    .line 82
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceWriteLock:Ljava/util/concurrent/locks/Lock;

    .line 97
    iput-object p1, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .line 98
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 99
    iput-wide p2, p0, Lcom/google/android/gtalkservice/ImSession;->mServiceProviderId:J

    .line 100
    new-instance v0, Lcom/google/android/gtalkservice/ConnectionState;

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ConnectionState;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    .line 101
    new-instance v0, Lcom/google/android/gtalkservice/ConnectionError;

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/ConnectionError;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    .line 104
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/ImSession;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 105
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/gtalkservice/ImSession;Lcom/google/android/gtalkservice/IConnectionStateListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ImSession;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IConnectionStateListener;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ImSession;->notifyListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V

    return-void
.end method

.method private addPresenceExtensions(Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 3
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 553
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->getShowMobileIndicator()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 554
    const-string v1, "http://www.android.com/gtalk/client/caps"

    .line 559
    .local v1, "node":Ljava/lang/String;
    :goto_0
    new-instance v0, Lorg/jivesoftware/smack/packet/PresenceCapability;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/PresenceCapability;-><init>(Ljava/lang/String;)V

    .line 560
    .local v0, "cap":Lorg/jivesoftware/smack/packet/PresenceCapability;
    const-string v2, "pmuc-v1"

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/PresenceCapability;->setExtension(Ljava/lang/String;)V

    .line 561
    const-string v2, "1.1"

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/PresenceCapability;->setVersion(Ljava/lang/String;)V

    .line 562
    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 563
    return-void

    .line 556
    .end local v0    # "cap":Lorg/jivesoftware/smack/packet/PresenceCapability;
    .end local v1    # "node":Ljava/lang/String;
    :cond_0
    const-string v1, "http://www.android.com/gtalk/client/caps2"

    .restart local v1    # "node":Ljava/lang/String;
    goto :goto_0
.end method

.method private createChatSessionWrapper(Lcom/google/android/gtalkservice/ChatSession;)Lcom/google/android/gtalkservice/IChatSession;
    .locals 1
    .param p1, "chatSession"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 676
    new-instance v0, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;

    invoke-direct {v0, p1}, Lcom/google/android/gtalkservice/service/ChatSessionWrapper;-><init>(Lcom/google/android/gtalkservice/ChatSession;)V

    return-object v0
.end method

.method public static createImSession(Ljava/lang/String;JLcom/google/android/gtalkservice/GTalkConnectionContext;)Lcom/google/android/gtalkservice/ImSession;
    .locals 1
    .param p0, "providerName"    # Ljava/lang/String;
    .param p1, "providerId"    # J
    .param p3, "connectionContext"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .prologue
    .line 89
    const-string v0, "GTalk"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    new-instance v0, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;

    invoke-direct {v0, p3, p1, p2}, Lcom/google/android/gtalkservice/gtalk/GTalkImSession;-><init>(Lcom/google/android/gtalkservice/GTalkConnectionContext;J)V

    .line 93
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private internalSetConnectionState(I)Z
    .locals 3
    .param p1, "state"    # I

    .prologue
    .line 176
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    monitor-enter v0

    .line 177
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v1

    if-eq v1, p1, :cond_1

    .line 178
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setConnectionState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/google/android/gtalkservice/ConnectionState;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gtalkservice/ImSession;->log(Ljava/lang/String;)V

    .line 179
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/ConnectionState;->setState(I)V

    .line 180
    const/4 v1, 0x1

    monitor-exit v0

    move v0, v1

    .line 184
    :goto_0
    return v0

    .line 182
    :cond_1
    monitor-exit v0

    .line 184
    const/4 v0, 0x0

    goto :goto_0

    .line 182
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 705
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ImSession] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    return-void
.end method

.method private notifyListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IConnectionStateListener;

    .prologue
    .line 285
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "notifyConnectionListener: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", error="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gtalkservice/ImSession;->log(Ljava/lang/String;)V

    .line 289
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

    invoke-interface {p1, v1, v2}, Lcom/google/android/gtalkservice/IConnectionStateListener;->connectionStateChanged(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    :goto_0
    return-void

    .line 290
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 291
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyListener caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing listener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    monitor-enter v1

    .line 294
    :try_start_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 295
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public static sendPresence(Lcom/google/android/gtalkservice/GTalkConnection;Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 4
    .param p0, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 493
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, p1, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;Z)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 498
    :goto_0
    return-void

    .line 494
    :catch_0
    move-exception v0

    .line 496
    .local v0, "ex":Ljava/lang/IllegalStateException;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendPresence caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private translateGTalkPresence(Lcom/google/android/gtalkservice/Presence;)I
    .locals 4
    .param p1, "p"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    .line 394
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v2

    if-nez v2, :cond_0

    .line 395
    const/4 v2, 0x0

    .line 420
    :goto_0
    return v2

    .line 398
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->isInvisible()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 399
    const/4 v2, 0x1

    goto :goto_0

    .line 402
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->getShow()Lcom/google/android/gtalkservice/Presence$Show;

    move-result-object v1

    .line 405
    .local v1, "show":Lcom/google/android/gtalkservice/Presence$Show;
    sget-object v2, Lcom/google/android/gtalkservice/ImSession$2;->$SwitchMap$com$google$android$gtalkservice$Presence$Show:[I

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence$Show;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 416
    const/4 v0, 0x5

    .local v0, "availability":I
    :goto_1
    move v2, v0

    .line 420
    goto :goto_0

    .line 407
    .end local v0    # "availability":I
    :pswitch_0
    const/4 v0, 0x4

    .line 408
    .restart local v0    # "availability":I
    goto :goto_1

    .line 412
    .end local v0    # "availability":I
    :pswitch_1
    const/4 v0, 0x2

    .line 413
    .restart local v0    # "availability":I
    goto :goto_1

    .line 405
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public addConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V
    .locals 5
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IConnectionStateListener;

    .prologue
    .line 255
    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    monitor-enter v2

    .line 256
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/IConnectionStateListener;

    .line 257
    .local v1, "remoteListener":Lcom/google/android/gtalkservice/IConnectionStateListener;
    invoke-interface {v1}, Lcom/google/android/gtalkservice/IConnectionStateListener;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-interface {p1}, Lcom/google/android/gtalkservice/IConnectionStateListener;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-ne v3, v4, :cond_0

    .line 258
    monitor-exit v2

    .line 266
    .end local v1    # "remoteListener":Lcom/google/android/gtalkservice/IConnectionStateListener;
    :goto_0
    return-void

    .line 262
    :cond_1
    iget-object v3, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 263
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 265
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ImSession;->notifyListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V

    goto :goto_0

    .line 263
    .end local v0    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public abstract addContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
.end method

.method public abstract addGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
.end method

.method public addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 633
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 634
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 635
    return-void
.end method

.method public addRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 643
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterHandler()Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v0

    .line 644
    .local v0, "rosterHandler":Lcom/google/android/gtalkservice/RosterListenerImpl;
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->addRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V

    .line 645
    return-void
.end method

.method public approveSubscriptionRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 8
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "groups"    # [Ljava/lang/String;

    .prologue
    .line 622
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getSubscriptionManager()Lcom/google/android/gtalkservice/SubscriptionManager;

    move-result-object v0

    .line 623
    .local v0, "sMgr":Lcom/google/android/gtalkservice/SubscriptionManager;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getServiceProviderId()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getAccountId()J

    move-result-wide v3

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/gtalkservice/SubscriptionManager;->acceptRequestForUser(JJLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 625
    return-void
.end method

.method public abstract blockContact(Ljava/lang/String;)V
.end method

.method protected clearConnectionError()V
    .locals 2

    .prologue
    .line 251
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/ConnectionError;->setError(I)V

    .line 252
    return-void
.end method

.method public abstract clearContactFlags(Ljava/lang/String;)V
.end method

.method public abstract closeAllChatSessions()V
.end method

.method public createChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;
    .locals 8
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 669
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 670
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mUsername:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getServiceProviderId()J

    move-result-wide v3

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getAccountId()J

    move-result-wide v5

    move-object v2, p1

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gtalkservice/ChatMgr;->createChatSession(Ljava/lang/String;Ljava/lang/String;JJ)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v7

    .line 672
    .local v7, "session":Lcom/google/android/gtalkservice/ChatSession;
    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/ImSession;->createChatSessionWrapper(Lcom/google/android/gtalkservice/ChatSession;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v1

    return-object v1
.end method

.method public abstract createGroupChatSession(Ljava/lang/String;[Ljava/lang/String;)V
.end method

.method public abstract declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public declineSubscriptionRequest(Ljava/lang/String;)V
    .locals 6
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 628
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getSubscriptionManager()Lcom/google/android/gtalkservice/SubscriptionManager;

    move-result-object v0

    .line 629
    .local v0, "sMgr":Lcom/google/android/gtalkservice/SubscriptionManager;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getServiceProviderId()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getAccountId()J

    move-result-wide v3

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/SubscriptionManager;->declineRequestForUser(JJLjava/lang/String;)V

    .line 630
    return-void
.end method

.method public abstract editContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
.end method

.method public abstract getAccountId()J
.end method

.method public getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/IChatSession;
    .locals 3
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 680
    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 681
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->getChatSession(Ljava/lang/String;)Lcom/google/android/gtalkservice/ChatSession;

    move-result-object v1

    .line 683
    .local v1, "session":Lcom/google/android/gtalkservice/ChatSession;
    if-nez v1, :cond_0

    .line 684
    const/4 v2, 0x0

    .line 687
    :goto_0
    return-object v2

    :cond_0
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/ImSession;->createChatSessionWrapper(Lcom/google/android/gtalkservice/ChatSession;)Lcom/google/android/gtalkservice/IChatSession;

    move-result-object v2

    goto :goto_0
.end method

.method public getConnectionError()Lcom/google/android/gtalkservice/ConnectionError;
    .locals 2

    .prologue
    .line 198
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

    monitor-enter v0

    .line 199
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

    monitor-exit v0

    return-object v1

    .line 200
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;
    .locals 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    monitor-enter v0

    .line 154
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    monitor-exit v0

    return-object v1

    .line 155
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    return-object v0
.end method

.method protected getHostConnectionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    return-object v0
.end method

.method protected getIntendedPresence()Lcom/google/android/gtalkservice/Presence;
    .locals 2

    .prologue
    .line 476
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 480
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getPresence()Lcom/google/android/gtalkservice/Presence;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 485
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceReadLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method protected getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mPassword:Ljava/lang/String;

    return-object v0
.end method

.method public getPresence()Lcom/google/android/gtalkservice/Presence;
    .locals 2

    .prologue
    .line 441
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v0

    .line 443
    .local v0, "state":Lcom/google/android/gtalkservice/ConnectionState;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ConnectionState;->isOnline()Z

    move-result v1

    if-nez v1, :cond_0

    .line 444
    sget-object v1, Lcom/google/android/gtalkservice/Presence;->OFFLINE:Lcom/google/android/gtalkservice/Presence;

    .line 447
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getIntendedPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v1

    goto :goto_0
.end method

.method public getServiceProviderId()J
    .locals 2

    .prologue
    .line 118
    iget-wide v0, p0, Lcom/google/android/gtalkservice/ImSession;->mServiceProviderId:J

    return-wide v0
.end method

.method public getSharedPresence()Lcom/google/android/gtalkservice/Presence;
    .locals 1

    .prologue
    .line 457
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mSharedPresence:Lcom/google/android/gtalkservice/Presence;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mUsername:Ljava/lang/String;

    return-object v0
.end method

.method public goOffRecordInRoom(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "offRecordFlag"    # Z

    .prologue
    .line 658
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getOtrManager()Lcom/google/android/gtalkservice/OtrManager;

    move-result-object v0

    .line 659
    .local v0, "otrMgr":Lcom/google/android/gtalkservice/OtrManager;
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/OtrManager;->goOffRecordInRoom(Ljava/lang/String;Z)V

    .line 660
    return-void
.end method

.method public goOffRecordWithContact(Ljava/util/ArrayList;Z)V
    .locals 2
    .param p2, "offRecordFlag"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 653
    .local p1, "contacts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getOtrManager()Lcom/google/android/gtalkservice/OtrManager;

    move-result-object v0

    .line 654
    .local v0, "otrMgr":Lcom/google/android/gtalkservice/OtrManager;
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/OtrManager;->goOffRecordWithContact(Ljava/util/ArrayList;Z)V

    .line 655
    return-void
.end method

.method public abstract hideContact(Ljava/lang/String;)V
.end method

.method public hostSessionConnectionStateChanged(II)V
    .locals 3
    .param p1, "state"    # I
    .param p2, "error"    # I

    .prologue
    const/4 v2, 0x0

    .line 228
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionState:Lcom/google/android/gtalkservice/ConnectionState;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v0

    .line 230
    .local v0, "ourState":I
    packed-switch v0, :pswitch_data_0

    .line 244
    const/4 v1, 0x1

    if-gt p1, v1, :cond_0

    .line 245
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/android/gtalkservice/ImSession;->setConnectionStateAndError(IIZ)V

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 236
    :pswitch_0
    if-le p1, v0, :cond_0

    .line 237
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/android/gtalkservice/ImSession;->setConnectionStateAndError(IIZ)V

    goto :goto_0

    .line 230
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public abstract initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
.end method

.method public isOffRecordWithContact(Ljava/lang/String;)Z
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 663
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v1

    invoke-static {v0, v1, v2, p1}, Lcom/google/android/gtalkservice/DatabaseHelper;->isOffTheRecordWithContact(Landroid/content/ContentResolver;JLjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public abstract joinGroupChatSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public loadVCard()V
    .locals 4

    .prologue
    .line 596
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    const-string v3, "load user\'s vCard from server"

    invoke-static {v3}, Lcom/google/android/gtalkservice/ImSession;->log(Ljava/lang/String;)V

    .line 599
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getUsername()Ljava/lang/String;

    move-result-object v1

    .line 600
    .local v1, "username":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getVCardManager()Lcom/google/android/gtalkservice/VCardMgr;

    move-result-object v2

    .line 602
    .local v2, "vcardMgr":Lcom/google/android/gtalkservice/VCardMgr;
    invoke-virtual {v2, v1}, Lcom/google/android/gtalkservice/VCardMgr;->getStoredAvatarHashForContact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 603
    .local v0, "storedHash":Ljava/lang/String;
    invoke-virtual {v2, v1, v0}, Lcom/google/android/gtalkservice/VCardMgr;->loadAvatarForUser(Ljava/lang/String;Ljava/lang/String;)V

    .line 604
    invoke-virtual {v2, v1}, Lcom/google/android/gtalkservice/VCardMgr;->addToNotificationMap(Ljava/lang/String;)V

    .line 605
    return-void
.end method

.method public abstract login(Ljava/lang/String;Ljava/lang/String;Z)V
.end method

.method public abstract logout()V
.end method

.method protected notifyConnectionListeners()V
    .locals 3

    .prologue
    .line 280
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListenerCallable:Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    .line 281
    return-void
.end method

.method protected abstract onLoggedIn()V
.end method

.method protected onLoggedOut()V
    .locals 3

    .prologue
    .line 145
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    const-string v0, "onLoggedOut"

    invoke-static {v0}, Lcom/google/android/gtalkservice/ImSession;->log(Ljava/lang/String;)V

    .line 146
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->onImSessionLoggedOut()V

    .line 149
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnectionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getAccountId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/ChatMgr;->onLogout(J)V

    .line 150
    return-void
.end method

.method public abstract pinContact(Ljava/lang/String;)V
.end method

.method public abstract pruneOldChatSessions(J)V
.end method

.method public removeConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V
    .locals 5
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IConnectionStateListener;

    .prologue
    .line 269
    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    monitor-enter v2

    .line 270
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/IConnectionStateListener;

    .line 271
    .local v1, "remoteListener":Lcom/google/android/gtalkservice/IConnectionStateListener;
    invoke-interface {v1}, Lcom/google/android/gtalkservice/IConnectionStateListener;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-interface {p1}, Lcom/google/android/gtalkservice/IConnectionStateListener;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-ne v3, v4, :cond_0

    .line 272
    iget-object v3, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 273
    monitor-exit v2

    .line 277
    .end local v1    # "remoteListener":Lcom/google/android/gtalkservice/IConnectionStateListener;
    :goto_0
    return-void

    .line 276
    :cond_1
    monitor-exit v2

    goto :goto_0

    .end local v0    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public abstract removeContact(Ljava/lang/String;)V
.end method

.method public abstract removeGroupChatInvitationListener(Lcom/google/android/gtalkservice/IGroupChatInvitationListener;)V
.end method

.method public removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 638
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getChatManager()Lcom/google/android/gtalkservice/ChatMgr;

    move-result-object v0

    .line 639
    .local v0, "chatMgr":Lcom/google/android/gtalkservice/ChatMgr;
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    .line 640
    return-void
.end method

.method public removeRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IRosterListener;

    .prologue
    .line 648
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterHandler()Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v0

    .line 649
    .local v0, "rosterHandler":Lcom/google/android/gtalkservice/RosterListenerImpl;
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->removeRemoteRosterListener(Lcom/google/android/gtalkservice/IRosterListener;)V

    .line 650
    return-void
.end method

.method public sendPresence(Lcom/google/android/gtalkservice/Presence;)V
    .locals 2
    .param p1, "presence"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    .line 429
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/ImSession;->translatePresence(Lcom/google/android/gtalkservice/Presence;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    .line 430
    .local v0, "p":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/google/android/gtalkservice/ImSession;->sendPresence(Lcom/google/android/gtalkservice/GTalkConnection;Lorg/jivesoftware/smack/packet/Packet;)V

    .line 431
    return-void
.end method

.method public sendPresenceCapability()V
    .locals 3

    .prologue
    .line 574
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v0

    .line 579
    .local v0, "currentPresence":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 582
    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/ImSession;->translateXmppPresence(Lcom/google/android/gtalkservice/Presence;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    .line 583
    .local v1, "p":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/google/android/gtalkservice/ImSession;->sendPresence(Lcom/google/android/gtalkservice/GTalkConnection;Lorg/jivesoftware/smack/packet/Packet;)V

    .line 585
    .end local v1    # "p":Lorg/jivesoftware/smack/packet/Packet;
    :cond_0
    return-void
.end method

.method public setAndSendPresence(Lcom/google/android/gtalkservice/Presence;)V
    .locals 0
    .param p1, "presence"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    .line 305
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/ImSession;->setPresence(Lcom/google/android/gtalkservice/Presence;)Z

    .line 306
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/ImSession;->sendPresence(Lcom/google/android/gtalkservice/Presence;)V

    .line 307
    return-void
.end method

.method public setConnectionError(I)Z
    .locals 3
    .param p1, "error"    # I

    .prologue
    .line 204
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

    monitor-enter v0

    .line 205
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ConnectionError;->getError()I

    move-result v1

    if-eq v1, p1, :cond_1

    .line 206
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setConnectionError: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/google/android/gtalkservice/ConnectionError;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gtalkservice/ImSession;->log(Ljava/lang/String;)V

    .line 207
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ImSession;->mConnectionError:Lcom/google/android/gtalkservice/ConnectionError;

    invoke-virtual {v1, p1}, Lcom/google/android/gtalkservice/ConnectionError;->setError(I)V

    .line 208
    const/4 v1, 0x1

    monitor-exit v0

    move v0, v1

    .line 212
    :goto_0
    return v0

    .line 210
    :cond_1
    monitor-exit v0

    .line 212
    const/4 v0, 0x0

    goto :goto_0

    .line 210
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setConnectionState(I)Z
    .locals 2
    .param p1, "state"    # I

    .prologue
    .line 188
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ImSession;->internalSetConnectionState(I)Z

    move-result v0

    .line 189
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->notifyConnectionListeners()V

    .line 191
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->asyncUpdateAccountStatus()V

    .line 194
    :cond_0
    return v0
.end method

.method public setConnectionStateAndError(IIZ)V
    .locals 2
    .param p1, "state"    # I
    .param p2, "error"    # I
    .param p3, "forceNotify"    # Z

    .prologue
    .line 216
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ImSession;->internalSetConnectionState(I)Z

    move-result v0

    .line 218
    .local v0, "notify":Z
    invoke-virtual {p0, p2}, Lcom/google/android/gtalkservice/ImSession;->setConnectionError(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 219
    const/4 v0, 0x1

    .line 222
    :cond_0
    if-nez v0, :cond_1

    if-eqz p3, :cond_2

    .line 223
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->notifyConnectionListeners()V

    .line 225
    :cond_2
    return-void
.end method

.method protected setLastLoginState(Z)V
    .locals 8
    .param p1, "isLoggedIn"    # Z

    .prologue
    const/4 v7, 0x0

    .line 164
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 165
    .local v3, "values":Landroid/content/ContentValues;
    if-eqz p1, :cond_1

    const/4 v4, 0x1

    move v2, v4

    .line 166
    .local v2, "lastLoggedInVal":I
    :goto_0
    const-string v4, "last_login_state"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 167
    sget-object v4, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getAccountId()J

    move-result-wide v5

    invoke-static {v4, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 168
    .local v0, "accountUri":Landroid/net/Uri;
    iget-object v4, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v0, v3, v7, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 170
    .local v1, "count":I
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setLastLoginState("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") for acct "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getAccountId()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " updated "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " rows"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gtalkservice/ImSession;->log(Ljava/lang/String;)V

    .line 172
    :cond_0
    return-void

    .line 165
    .end local v0    # "accountUri":Landroid/net/Uri;
    .end local v1    # "count":I
    .end local v2    # "lastLoggedInVal":I
    :cond_1
    const/4 v4, 0x0

    move v2, v4

    goto :goto_0
.end method

.method protected setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/google/android/gtalkservice/ImSession;->mPassword:Ljava/lang/String;

    .line 137
    return-void
.end method

.method public setPresence(Lcom/google/android/gtalkservice/Presence;)Z
    .locals 5
    .param p1, "presence"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    const-string v4, "setPresence: "

    .line 315
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_2

    .line 316
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setPresence: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->printDetails()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/ImSession;->log(Ljava/lang/String;)V

    .line 321
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 323
    .local v1, "retVal":Z
    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 329
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v0

    .line 335
    .local v0, "oldPresence":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {p1, v0}, Lcom/google/android/gtalkservice/Presence;->equals(Lcom/google/android/gtalkservice/Presence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 337
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/google/android/gtalkservice/GTalkConnection;->setPresence(Lcom/google/android/gtalkservice/Presence;)V

    .line 342
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->asyncUpdateAccountStatus()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 343
    const/4 v1, 0x1

    .line 347
    :cond_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 350
    return v1

    .line 317
    .end local v0    # "oldPresence":Lcom/google/android/gtalkservice/Presence;
    .end local v1    # "retVal":Z
    :cond_2
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    .line 318
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setPresence: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gtalkservice/ImSession;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 347
    .restart local v1    # "retVal":Z
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/ImSession;->mPresenceWriteLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2
.end method

.method public setSharedPresence(Lcom/google/android/gtalkservice/Presence;)V
    .locals 1
    .param p1, "presence"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    .line 466
    new-instance v0, Lcom/google/android/gtalkservice/Presence;

    invoke-direct {v0, p1}, Lcom/google/android/gtalkservice/Presence;-><init>(Lcom/google/android/gtalkservice/Presence;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ImSession;->mSharedPresence:Lcom/google/android/gtalkservice/Presence;

    .line 467
    return-void
.end method

.method protected setUsername(Ljava/lang/String;)V
    .locals 0
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/google/android/gtalkservice/ImSession;->mUsername:Ljava/lang/String;

    .line 129
    return-void
.end method

.method protected abstract translatePresence(Lcom/google/android/gtalkservice/Presence;)Lorg/jivesoftware/smack/packet/Packet;
.end method

.method protected translateXmppPresence(Lcom/google/android/gtalkservice/Presence;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 7
    .param p1, "inPresence"    # Lcom/google/android/gtalkservice/Presence;

    .prologue
    .line 504
    const/16 v2, 0x18

    .line 507
    .local v2, "priority":I
    if-nez p1, :cond_0

    .line 508
    const/4 v1, 0x0

    .line 509
    .local v1, "isAvailable":Z
    sget-object v4, Lcom/google/android/gtalkservice/Presence$Show;->NONE:Lcom/google/android/gtalkservice/Presence$Show;

    .line 510
    .local v4, "show":Lcom/google/android/gtalkservice/Presence$Show;
    const/4 v0, 0x0

    .line 517
    .local v0, "customStatus":Ljava/lang/String;
    :goto_0
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    if-eqz v1, :cond_1

    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    :goto_1
    invoke-direct {v3, v5}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 520
    .local v3, "retVal":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/packet/Presence;->setStatus(Ljava/lang/String;)V

    .line 521
    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/packet/Presence;->setPriority(I)V

    .line 523
    sget-object v5, Lcom/google/android/gtalkservice/ImSession$2;->$SwitchMap$com$google$android$gtalkservice$Presence$Show:[I

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/Presence$Show;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 544
    :goto_2
    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/ImSession;->addPresenceExtensions(Lorg/jivesoftware/smack/packet/Presence;)V

    .line 547
    return-object v3

    .line 512
    .end local v0    # "customStatus":Ljava/lang/String;
    .end local v1    # "isAvailable":Z
    .end local v3    # "retVal":Lorg/jivesoftware/smack/packet/Presence;
    .end local v4    # "show":Lcom/google/android/gtalkservice/Presence$Show;
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v1

    .line 513
    .restart local v1    # "isAvailable":Z
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->getShow()Lcom/google/android/gtalkservice/Presence$Show;

    move-result-object v4

    .line 514
    .restart local v4    # "show":Lcom/google/android/gtalkservice/Presence$Show;
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/Presence;->getStatus()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "customStatus":Ljava/lang/String;
    goto :goto_0

    .line 517
    :cond_1
    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    goto :goto_1

    .line 525
    .restart local v3    # "retVal":Lorg/jivesoftware/smack/packet/Presence;
    :pswitch_0
    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Mode;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V

    goto :goto_2

    .line 529
    :pswitch_1
    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Mode;->AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V

    goto :goto_2

    .line 533
    :pswitch_2
    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Mode;->EXTENDED_AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V

    goto :goto_2

    .line 537
    :pswitch_3
    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Mode;->DO_NOT_DISTURB:Lorg/jivesoftware/smack/packet/Presence$Mode;

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V

    goto :goto_2

    .line 523
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public updateAccountStatus()V
    .locals 12

    .prologue
    .line 354
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v9

    .line 355
    .local v9, "state":Lcom/google/android/gtalkservice/ConnectionState;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v8

    .line 357
    .local v8, "presence":Lcom/google/android/gtalkservice/Presence;
    const/4 v4, 0x0

    .line 358
    .local v4, "presenceMode":I
    const/4 v6, 0x0

    .line 363
    .local v6, "connStatus":I
    invoke-virtual {v9}, Lcom/google/android/gtalkservice/ConnectionState;->isOnline()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 364
    invoke-direct {p0, v8}, Lcom/google/android/gtalkservice/ImSession;->translateGTalkPresence(Lcom/google/android/gtalkservice/Presence;)I

    move-result v4

    .line 365
    const/4 v6, 0x3

    .line 368
    :cond_0
    iget-object v10, p0, Lcom/google/android/gtalkservice/ImSession;->mHostConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 369
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v7

    .line 370
    .local v7, "hostConnection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v7}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v1

    .line 371
    .local v1, "accountId":J
    invoke-virtual {v7}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v3

    .line 372
    .local v3, "username":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/google/android/gtalkservice/Presence;->getStatus()Ljava/lang/String;

    move-result-object v5

    .line 374
    .local v5, "status":Ljava/lang/String;
    invoke-static {v0, v1, v2, v4, v6}, Lcom/google/android/gtalkservice/DatabaseHelper;->setAccountStatus(Landroid/content/ContentResolver;JII)V

    .line 377
    const-string v10, "GTalkService"

    const/4 v11, 0x3

    invoke-static {v10, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 378
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "updateAccountStatus: update contact presence for "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", account="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", presence="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", status="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gtalkservice/ImSession;->log(Ljava/lang/String;)V

    .line 385
    :cond_1
    if-nez v4, :cond_2

    .line 386
    invoke-static {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/ContactPresence;->removeContactPresenceFor(Landroid/content/ContentResolver;JLjava/lang/String;)V

    .line 391
    :goto_0
    return-void

    .line 388
    :cond_2
    invoke-static/range {v0 .. v5}, Lcom/google/android/gtalkservice/ContactPresence;->updateContactPresence(Landroid/content/ContentResolver;JLjava/lang/String;ILjava/lang/String;)V

    goto :goto_0
.end method

.method public uploadAvatar(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "avatar"    # Landroid/graphics/Bitmap;

    .prologue
    .line 588
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getVCardManager()Lcom/google/android/gtalkservice/VCardMgr;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/VCardMgr;->uploadAvatar(Landroid/graphics/Bitmap;)V

    .line 589
    return-void
.end method

.method public uploadAvatarFromDb()V
    .locals 2

    .prologue
    .line 592
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getHostConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getVCardManager()Lcom/google/android/gtalkservice/VCardMgr;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ImSession;->getUsername()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/VCardMgr;->uploadAvatarFromDb(Ljava/lang/String;)V

    .line 593
    return-void
.end method
