.class public Lcom/google/android/gtalkservice/OtrManager;
.super Ljava/lang/Object;
.source "OtrManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/OtrManager$3;,
        Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;
    }
.end annotation


# static fields
.field private static final DBG:Z = true


# instance fields
.field private mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

.field private mQueryFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private mQueryListener:Lorg/jivesoftware/smack/PacketListener;

.field private mResolver:Landroid/content/ContentResolver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/OtrManager;)Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/OtrManager;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/google/android/gtalkservice/OtrManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/gtalkservice/OtrManager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/OtrManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/OtrManager;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/gtalkservice/OtrManager;)Landroid/content/ContentResolver;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/OtrManager;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/google/android/gtalkservice/OtrManager;->mResolver:Landroid/content/ContentResolver;

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 305
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[OtrMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    return-void
.end method


# virtual methods
.method public getOtrEtag()Ljava/lang/String;
    .locals 4

    .prologue
    .line 64
    iget-object v1, p0, Lcom/google/android/gtalkservice/OtrManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 65
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    iget-object v1, p0, Lcom/google/android/gtalkservice/OtrManager;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Landroid/provider/Im$ContactsEtag;->getOtrEtag(Landroid/content/ContentResolver;J)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public goOffRecordInRoom(Ljava/lang/String;Z)V
    .locals 5
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "otrStatus"    # Z

    .prologue
    .line 110
    new-instance v2, Lcom/google/android/gtalkservice/extensions/OtrQuery;

    invoke-direct {v2}, Lcom/google/android/gtalkservice/extensions/OtrQuery;-><init>()V

    .line 111
    .local v2, "packet":Lcom/google/android/gtalkservice/extensions/OtrQuery;
    invoke-virtual {v2, p1}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->setTo(Ljava/lang/String;)V

    .line 112
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 114
    new-instance v1, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;-><init>(Ljava/lang/String;Z)V

    .line 115
    .local v1, "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    invoke-virtual {v2, v1}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->addItem(Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;)V

    .line 117
    iget-object v3, p0, Lcom/google/android/gtalkservice/OtrManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v0

    .line 118
    .local v0, "iqMgr":Lcom/google/android/gtalkservice/IQPacketManager;
    new-instance v3, Lcom/google/android/gtalkservice/OtrManager$2;

    invoke-direct {v3, p0, p2}, Lcom/google/android/gtalkservice/OtrManager$2;-><init>(Lcom/google/android/gtalkservice/OtrManager;Z)V

    const/4 v4, 0x1

    invoke-virtual {v0, v2, v3, v4}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V

    .line 128
    return-void
.end method

.method public goOffRecordWithContact(Ljava/util/ArrayList;Z)V
    .locals 7
    .param p2, "otrStatus"    # Z
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
    .line 89
    .local p1, "contacts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v4, Lcom/google/android/gtalkservice/extensions/OtrQuery;

    invoke-direct {v4}, Lcom/google/android/gtalkservice/extensions/OtrQuery;-><init>()V

    .line 90
    .local v4, "packet":Lcom/google/android/gtalkservice/extensions/OtrQuery;
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v4, v5}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 92
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 93
    .local v0, "contact":Ljava/lang/String;
    new-instance v3, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;

    invoke-direct {v3, v0, p2}, Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;-><init>(Ljava/lang/String;Z)V

    .line 94
    .local v3, "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    invoke-virtual {v4, v3}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->addItem(Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;)V

    goto :goto_0

    .line 97
    .end local v0    # "contact":Ljava/lang/String;
    .end local v3    # "item":Lcom/google/android/gtalkservice/extensions/OtrQuery$Item;
    :cond_0
    iget-object v5, p0, Lcom/google/android/gtalkservice/OtrManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v2

    .line 98
    .local v2, "iqMgr":Lcom/google/android/gtalkservice/IQPacketManager;
    new-instance v5, Lcom/google/android/gtalkservice/OtrManager$1;

    invoke-direct {v5, p0, p2}, Lcom/google/android/gtalkservice/OtrManager$1;-><init>(Lcom/google/android/gtalkservice/OtrManager;Z)V

    const/4 v6, 0x1

    invoke-virtual {v2, v4, v5, v6}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V

    .line 107
    return-void
.end method

.method public init(Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resolver"    # Landroid/content/ContentResolver;
    .param p3, "connectionCtx"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .prologue
    .line 49
    iput-object p3, p0, Lcom/google/android/gtalkservice/OtrManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .line 50
    iput-object p2, p0, Lcom/google/android/gtalkservice/OtrManager;->mResolver:Landroid/content/ContentResolver;

    .line 51
    return-void
.end method

.method initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/gtalkservice/OtrManager;->mQueryListener:Lorg/jivesoftware/smack/PacketListener;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gtalkservice/OtrManager$OtrQueryListener;-><init>(Lcom/google/android/gtalkservice/OtrManager;Lcom/google/android/gtalkservice/OtrManager$1;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/OtrManager;->mQueryListener:Lorg/jivesoftware/smack/PacketListener;

    .line 56
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lcom/google/android/gtalkservice/extensions/OtrQuery;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/OtrManager;->mQueryFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/OtrManager;->mQueryListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v1, p0, Lcom/google/android/gtalkservice/OtrManager;->mQueryFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 61
    return-void
.end method

.method public queryStatus()V
    .locals 4

    .prologue
    .line 69
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    const-string v3, "queryStatus"

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/OtrManager;->log(Ljava/lang/String;)V

    .line 71
    :cond_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/OtrManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 73
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    new-instance v2, Lcom/google/android/gtalkservice/extensions/OtrQuery;

    invoke-direct {v2}, Lcom/google/android/gtalkservice/extensions/OtrQuery;-><init>()V

    .line 74
    .local v2, "query":Lcom/google/android/gtalkservice/extensions/OtrQuery;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 75
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUserBareAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->setTo(Ljava/lang/String;)V

    .line 78
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/OtrManager;->getOtrEtag()Ljava/lang/String;

    move-result-object v1

    .line 79
    .local v1, "etag":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 80
    invoke-virtual {v2, v1}, Lcom/google/android/gtalkservice/extensions/OtrQuery;->setEtag(Ljava/lang/String;)V

    .line 85
    :cond_1
    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;Z)Z

    .line 86
    return-void
.end method
