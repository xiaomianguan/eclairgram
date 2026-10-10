.class public Lcom/google/android/gtalkservice/RosterManager;
.super Ljava/lang/Object;
.source "RosterManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;,
        Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;,
        Lcom/google/android/gtalkservice/RosterManager$PresencePacketListener;
    }
.end annotation


# static fields
.field private static final CONTACT_PROJECTION:[Ljava/lang/String;

.field private static final CONTACT_TYPE_COLUMN_INDEX:I = 0x1

.field private static final DEBUG_ROSTER_DETAILS:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "GTalkService"

.field private static final USERNAME_COLUMN_INDEX:I


# instance fields
.field private mBatchPresencePacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private mBatchPresencePacketListener:Lorg/jivesoftware/smack/PacketListener;

.field private mContext:Landroid/content/Context;

.field private mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

.field private mNeedToClearOldPresence:Z

.field private mPresencePacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private mPresencePacketListener:Lorg/jivesoftware/smack/PacketListener;

.field private mResolver:Landroid/content/ContentResolver;

.field private mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

.field private mRosterPacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private mRosterPacketListener:Lorg/jivesoftware/smack/PacketListener;

.field private mRosterRequestPendingMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mRosterRequested:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 56
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "username"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "type"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gtalkservice/RosterManager;->CONTACT_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    return-void
.end method

.method static synthetic access$1000(Lcom/google/android/gtalkservice/RosterManager;Lorg/jivesoftware/smack/packet/RosterPacket;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;
    .param p1, "x1"    # Lorg/jivesoftware/smack/packet/RosterPacket;
    .param p2, "x2"    # Ljava/util/Collection;
    .param p3, "x3"    # Ljava/util/Collection;
    .param p4, "x4"    # Ljava/util/Collection;
    .param p5, "x5"    # Z

    .prologue
    .line 52
    invoke-direct/range {p0 .. p5}, Lcom/google/android/gtalkservice/RosterManager;->processLongRosterUpdate(Lorg/jivesoftware/smack/packet/RosterPacket;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;Z)V

    return-void
.end method

.method static synthetic access$1100(Lcom/google/android/gtalkservice/RosterManager;Lorg/jivesoftware/smack/packet/RosterPacket;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;
    .param p1, "x1"    # Lorg/jivesoftware/smack/packet/RosterPacket;
    .param p2, "x2"    # Ljava/util/Collection;
    .param p3, "x3"    # Ljava/util/Collection;
    .param p4, "x4"    # Ljava/util/Collection;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gtalkservice/RosterManager;->processShortRosterUpdate(Lorg/jivesoftware/smack/packet/RosterPacket;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/google/android/gtalkservice/RosterManager;JJLjava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;
    .param p1, "x1"    # J
    .param p3, "x2"    # J
    .param p5, "x3"    # Ljava/util/Collection;
    .param p6, "x4"    # Ljava/util/Collection;
    .param p7, "x5"    # Ljava/util/Collection;

    .prologue
    .line 52
    invoke-direct/range {p0 .. p7}, Lcom/google/android/gtalkservice/RosterManager;->fireRosterChangedEvent(JJLjava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/gtalkservice/RosterManager;Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/RosterManager;->fireRosterPresenceEvent(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/android/gtalkservice/RosterManager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterManager;->removePresenceForUser(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/gtalkservice/RosterManager;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mNeedToClearOldPresence:Z

    return v0
.end method

.method static synthetic access$502(Lcom/google/android/gtalkservice/RosterManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;
    .param p1, "x1"    # Z

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/RosterManager;->mNeedToClearOldPresence:Z

    return p1
.end method

.method static synthetic access$600(Lcom/google/android/gtalkservice/RosterManager;)Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/gtalkservice/RosterManager;)Landroid/content/ContentResolver;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mResolver:Landroid/content/ContentResolver;

    return-object v0
.end method

.method static synthetic access$800(Lcom/google/android/gtalkservice/RosterManager;)Lcom/google/android/gtalkservice/RosterListenerImpl;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    return-object v0
.end method

.method static synthetic access$900(Lcom/google/android/gtalkservice/RosterManager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/RosterManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    return-void
.end method

.method private createDeleteRosterEntry(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterEntry;
    .locals 6
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 475
    new-instance v0, Lorg/jivesoftware/smack/RosterEntry;

    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->REMOVE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    sget-object v4, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->UNSUBCRIPTION_PENDING:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-object v1, p1

    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smack/RosterEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;Lorg/jivesoftware/smack/XMPPConnection;)V

    return-object v0
.end method

.method private createRosterEntry(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)Lorg/jivesoftware/smack/RosterEntry;
    .locals 6
    .param p1, "item"    # Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .prologue
    .line 454
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v1

    .line 455
    .local v1, "user":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getName()Ljava/lang/String;

    move-result-object v2

    .line 456
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v3

    .line 457
    .local v3, "itemType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v4

    .line 459
    .local v4, "itemStatus":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    new-instance v0, Lorg/jivesoftware/smack/RosterEntry;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smack/RosterEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 465
    .local v0, "entry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-static {}, Lorg/jivesoftware/smack/GoogleExtensions;->getSupportExtendedContactAttribute()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 466
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionGetStatus()Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/jivesoftware/smack/RosterEntry;->googleSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    .line 467
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionGetRejected()Z

    move-result v5

    invoke-virtual {v0, v5}, Lorg/jivesoftware/smack/RosterEntry;->googleSetRejected(Z)V

    .line 468
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->isQuickContact()Z

    move-result v5

    invoke-virtual {v0, v5}, Lorg/jivesoftware/smack/RosterEntry;->setQuickContact(Z)V

    .line 471
    :cond_0
    return-object v0
.end method

.method private dumpRosterEntryDetail(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V
    .locals 5
    .param p1, "item"    # Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .prologue
    .line 483
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "add:"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 484
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v3, " user="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getName()Ljava/lang/String;

    move-result-object v1

    .line 487
    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 488
    const-string v3, ", name="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 490
    :cond_0
    const-string v3, ", subs_type="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 491
    const-string v3, ", subs_status="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 493
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionGetStatus()Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    move-result-object v2

    .line 494
    .local v2, "status":Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->DEFAULT:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    if-eq v2, v3, :cond_1

    .line 495
    const-string v3, ", gr_t="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 498
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 499
    return-void
.end method

.method private editContactInfo(JLjava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V
    .locals 6
    .param p1, "account"    # J
    .param p3, "contact"    # Ljava/lang/String;
    .param p4, "status"    # Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    .prologue
    .line 278
    iget-object v4, p0, Lcom/google/android/gtalkservice/RosterManager;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v4, p3, p1, p2}, Lcom/google/android/gtalkservice/DatabaseHelper;->getNicknameForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v2

    .line 279
    .local v2, "nickname":Ljava/lang/String;
    new-instance v3, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v3}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 280
    .local v3, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 282
    new-instance v1, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    invoke-direct {v1, p3, v2}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .local v1, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {v1, p4}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    .line 284
    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 287
    iget-object v4, p0, Lcom/google/android/gtalkservice/RosterManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v0

    .line 288
    .local v0, "iqMgr":Lcom/google/android/gtalkservice/IQPacketManager;
    new-instance v4, Lcom/google/android/gtalkservice/RosterManager$3;

    invoke-direct {v4, p0}, Lcom/google/android/gtalkservice/RosterManager$3;-><init>(Lcom/google/android/gtalkservice/RosterManager;)V

    const/4 v5, 0x1

    invoke-virtual {v0, v3, v4, v5}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V

    .line 304
    return-void
.end method

.method private fireRosterChangedEvent(JJLjava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 7
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .param p5, "addedEntries"    # Ljava/util/Collection;
    .param p6, "updatedEntries"    # Ljava/util/Collection;
    .param p7, "deletedEntries"    # Ljava/util/Collection;

    .prologue
    .line 700
    const/4 v6, 0x0

    .line 703
    .local v6, "notified":Z
    if-eqz p5, :cond_0

    invoke-interface {p5}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 704
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/RosterListenerImpl;->entriesAdded(JJLjava/util/Collection;)V

    .line 705
    const/4 v6, 0x1

    .line 707
    :cond_0
    if-eqz p6, :cond_1

    invoke-interface {p6}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 708
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/RosterListenerImpl;->entriesUpdated(JJLjava/util/Collection;)V

    .line 709
    const/4 v6, 0x1

    .line 711
    :cond_1
    if-eqz p7, :cond_2

    invoke-interface {p7}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 712
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p7

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/RosterListenerImpl;->entriesDeleted(JJLjava/util/Collection;)V

    .line 713
    const/4 v6, 0x1

    .line 716
    :cond_2
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->setRosterFetched(Z)V

    .line 718
    if-nez v6, :cond_3

    .line 721
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged()Z

    .line 723
    :cond_3
    return-void
.end method

.method private fireRosterPresenceEvent(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 339
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gtalkservice/RosterListenerImpl;->presenceChanged(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V

    .line 340
    return-void
.end method

.method private handleBlockedEntry(Lorg/jivesoftware/smack/RosterEntry;)V
    .locals 3
    .param p1, "entry"    # Lorg/jivesoftware/smack/RosterEntry;

    .prologue
    .line 507
    invoke-virtual {p1}, Lorg/jivesoftware/smack/RosterEntry;->isBlocked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 508
    invoke-virtual {p1}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v0

    .line 509
    .local v0, "user":Ljava/lang/String;
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    .line 510
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "remove presence for blocked contact = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 512
    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/RosterManager;->removePresenceForUser(Ljava/lang/String;)V

    .line 514
    .end local v0    # "user":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 726
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RosterMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 727
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 730
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RosterMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": empty cursor, possibly low memory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    return-void
.end method

.method private processLongRosterUpdate(Lorg/jivesoftware/smack/packet/RosterPacket;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;Z)V
    .locals 17
    .param p1, "rosterPacket"    # Lorg/jivesoftware/smack/packet/RosterPacket;
    .param p5, "removeObsolete"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/packet/RosterPacket;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 633
    .local p2, "addedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    .local p3, "updatedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    .local p4, "deletedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/RosterPacket;->getRosterItemsList()Ljava/util/ArrayList;

    move-result-object v14

    .line 634
    .local v14, "rosterItemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smack/packet/RosterPacket$Item;>;"
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/RosterPacket;->getRosterItemCount()I

    move-result v15

    .line 635
    .local v15, "size":I
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13, v15}, Ljava/util/HashMap;-><init>(I)V

    .line 637
    .local v13, "itemsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$Item;>;"
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "processLongRosterUpdate: size="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 639
    :cond_0
    monitor-enter v14

    .line 640
    :try_start_0
    invoke-virtual {v14}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .line 641
    .local v12, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {v12}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v4, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 643
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v12    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    :catchall_0
    move-exception v4

    monitor-exit v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .restart local v11    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    monitor-exit v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 652
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager;->mResolver:Landroid/content/ContentResolver;

    move-object v4, v0

    sget-object v5, Landroid/provider/Im$Contacts;->CONTENT_URI_CONTACTS_BAREBONE:Landroid/net/Uri;

    sget-object v6, Lcom/google/android/gtalkservice/RosterManager;->CONTACT_PROJECTION:[Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 658
    .local v10, "c":Landroid/database/Cursor;
    if-eqz v10, :cond_5

    .line 660
    :cond_2
    :goto_1
    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 661
    const/4 v4, 0x0

    invoke-interface {v10, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 662
    .local v16, "user":Ljava/lang/String;
    move-object v0, v13

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .line 664
    .restart local v12    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    if-nez v12, :cond_3

    .line 666
    if-eqz p5, :cond_2

    const/4 v4, 0x1

    invoke-interface {v10, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_2

    .line 669
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/RosterManager;->createDeleteRosterEntry(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterEntry;

    move-result-object v4

    move-object/from16 v0, p4

    move-object v1, v4

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    .line 683
    .end local v12    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v16    # "user":Ljava/lang/String;
    :catchall_1
    move-exception v4

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v4

    .line 676
    .restart local v12    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .restart local v16    # "user":Ljava/lang/String;
    :cond_3
    :try_start_3
    monitor-enter v14
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 677
    :try_start_4
    invoke-virtual {v14, v12}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 678
    monitor-exit v14
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 680
    :try_start_5
    move-object/from16 v0, p0

    move-object v1, v12

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/RosterManager;->processRosterEntry(Lorg/jivesoftware/smack/packet/RosterPacket$Item;Ljava/util/Collection;Ljava/util/Collection;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    .line 678
    :catchall_2
    move-exception v4

    :try_start_6
    monitor-exit v14
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :try_start_7
    throw v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 683
    .end local v12    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v16    # "user":Ljava/lang/String;
    :cond_4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 689
    :goto_2
    monitor-enter v14

    .line 690
    :try_start_8
    invoke-virtual {v14}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_3
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .line 691
    .restart local v12    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    move-object/from16 v0, p0

    move-object v1, v12

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/RosterManager;->processRosterEntry(Lorg/jivesoftware/smack/packet/RosterPacket$Item;Ljava/util/Collection;Ljava/util/Collection;)V

    goto :goto_3

    .line 693
    .end local v12    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    :catchall_3
    move-exception v4

    monitor-exit v14
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    throw v4

    .line 686
    :cond_5
    const-string v4, "processLongRosterUpdate"

    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/RosterManager;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_2

    .line 693
    :cond_6
    :try_start_9
    monitor-exit v14
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 694
    return-void
.end method

.method private processRosterEntry(Lorg/jivesoftware/smack/packet/RosterPacket$Item;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 5
    .param p1, "item"    # Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/packet/RosterPacket$Item;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "updateEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    .local p3, "deleteEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    const-string v4, ","

    .line 519
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getItemType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v1

    .line 520
    .local v1, "itemType":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterManager;->createRosterEntry(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)Lorg/jivesoftware/smack/RosterEntry;

    move-result-object v0

    .line 523
    .local v0, "entry":Lorg/jivesoftware/smack/RosterEntry;
    sget-object v2, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->REMOVE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 524
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "delete rosterEntry for"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 525
    :cond_0
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 533
    :goto_0
    return-void

    .line 527
    :cond_1
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "add/update rosterEntry for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 530
    :cond_2
    invoke-interface {p2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 531
    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/RosterManager;->handleBlockedEntry(Lorg/jivesoftware/smack/RosterEntry;)V

    goto :goto_0
.end method

.method private processShortRosterUpdate(Lorg/jivesoftware/smack/packet/RosterPacket;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 20
    .param p1, "rosterPacket"    # Lorg/jivesoftware/smack/packet/RosterPacket;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/packet/RosterPacket;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/RosterEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 552
    .local p2, "addedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    .local p3, "updatedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    .local p4, "deletedEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/RosterEntry;>;"
    const/4 v8, 0x0

    .line 553
    .local v8, "selectionArgs":[Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/RosterPacket;->getRosterItemCount()I

    move-result v18

    .line 555
    .local v18, "size":I
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "processShortRosterUpdate: size="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 557
    :cond_0
    if-lez v18, :cond_1

    .line 558
    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object v8, v0

    .line 561
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/RosterPacket;->getRosterItemsList()Ljava/util/ArrayList;

    move-result-object v17

    .line 562
    .local v17, "rosterItemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smack/packet/RosterPacket$Item;>;"
    new-instance v16, Ljava/util/HashMap;

    invoke-direct/range {v16 .. v16}, Ljava/util/HashMap;-><init>()V

    .line 564
    .local v16, "itemsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$Item;>;"
    const/4 v13, 0x0

    .line 565
    .local v13, "index":I
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 566
    .local v10, "buf":Ljava/lang/StringBuilder;
    monitor-enter v17

    .line 567
    :try_start_0
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    move v14, v13

    .end local v13    # "index":I
    .local v14, "index":I
    :goto_0
    :try_start_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .line 568
    .local v15, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->getUser()Ljava/lang/String;

    move-result-object v19

    .line 569
    .local v19, "user":Ljava/lang/String;
    aput-object v19, v8, v14

    .line 571
    move-object/from16 v0, v16

    move-object/from16 v1, v19

    move-object v2, v15

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 573
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "index":I
    .restart local v13    # "index":I
    if-lez v14, :cond_2

    .line 574
    :try_start_2
    const-string v4, " OR "

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    :cond_2
    const-string v4, "username"

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "=?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move v14, v13

    .line 577
    .end local v13    # "index":I
    .restart local v14    # "index":I
    goto :goto_0

    .line 578
    .end local v15    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v19    # "user":Ljava/lang/String;
    :cond_3
    :try_start_3
    monitor-exit v17
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 580
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 581
    .local v7, "selection":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/RosterManager;->mResolver:Landroid/content/ContentResolver;

    move-object v4, v0

    sget-object v5, Landroid/provider/Im$Contacts;->CONTENT_URI_CONTACTS_BAREBONE:Landroid/net/Uri;

    sget-object v6, Lcom/google/android/gtalkservice/RosterManager;->CONTACT_PROJECTION:[Ljava/lang/String;

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 587
    .local v11, "c":Landroid/database/Cursor;
    if-eqz v11, :cond_6

    .line 589
    :cond_4
    :goto_1
    :try_start_4
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 590
    const/4 v4, 0x0

    invoke-interface {v11, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 591
    .restart local v19    # "user":Ljava/lang/String;
    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .line 593
    .restart local v15    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    if-eqz v15, :cond_4

    .line 598
    monitor-enter v17
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 599
    :try_start_5
    move-object/from16 v0, v17

    move-object v1, v15

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 600
    monitor-exit v17
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 602
    :try_start_6
    move-object/from16 v0, p0

    move-object v1, v15

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/RosterManager;->processRosterEntry(Lorg/jivesoftware/smack/packet/RosterPacket$Item;Ljava/util/Collection;Ljava/util/Collection;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1

    .line 605
    .end local v15    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v19    # "user":Ljava/lang/String;
    :catchall_0
    move-exception v4

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    throw v4

    .line 578
    .end local v7    # "selection":Ljava/lang/String;
    .end local v11    # "c":Landroid/database/Cursor;
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v14    # "index":I
    .restart local v13    # "index":I
    :catchall_1
    move-exception v4

    :goto_2
    :try_start_7
    monitor-exit v17
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw v4

    .line 600
    .end local v13    # "index":I
    .restart local v7    # "selection":Ljava/lang/String;
    .restart local v11    # "c":Landroid/database/Cursor;
    .restart local v12    # "i$":Ljava/util/Iterator;
    .restart local v14    # "index":I
    .restart local v15    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .restart local v19    # "user":Ljava/lang/String;
    :catchall_2
    move-exception v4

    :try_start_8
    monitor-exit v17
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :try_start_9
    throw v4
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 605
    .end local v15    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v19    # "user":Ljava/lang/String;
    :cond_5
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 611
    :goto_3
    monitor-enter v17

    .line 612
    :try_start_a
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .line 613
    .restart local v15    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    move-object/from16 v0, p0

    move-object v1, v15

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/RosterManager;->processRosterEntry(Lorg/jivesoftware/smack/packet/RosterPacket$Item;Ljava/util/Collection;Ljava/util/Collection;)V

    goto :goto_4

    .line 615
    .end local v15    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    :catchall_3
    move-exception v4

    monitor-exit v17
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    throw v4

    .line 608
    :cond_6
    const-string v4, "processLongRosterUpdate"

    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/RosterManager;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_3

    .line 615
    :cond_7
    :try_start_b
    monitor-exit v17
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 616
    return-void

    .line 578
    .end local v7    # "selection":Ljava/lang/String;
    .end local v11    # "c":Landroid/database/Cursor;
    :catchall_4
    move-exception v4

    move v13, v14

    .end local v14    # "index":I
    .restart local v13    # "index":I
    goto :goto_2
.end method

.method private removePresenceForUser(Ljava/lang/String;)V
    .locals 1
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 350
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gtalkservice/RosterManager;->fireRosterPresenceEvent(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V

    .line 351
    return-void
.end method


# virtual methods
.method public blockContact(JLjava/lang/String;)V
    .locals 1
    .param p1, "account"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    .line 259
    sget-object v0, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->BLOCKED:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/gtalkservice/RosterManager;->editContactInfo(JLjava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    .line 260
    return-void
.end method

.method public clearContactFlags(JLjava/lang/String;)V
    .locals 1
    .param p1, "account"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    .line 271
    sget-object v0, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->DEFAULT:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/gtalkservice/RosterManager;->editContactInfo(JLjava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    .line 272
    return-void
.end method

.method public clearRosterFetchFlags()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 137
    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/RosterManager;->setHasRequestedRoster(Z)V

    .line 138
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->setRosterFetched(Z)V

    .line 139
    return-void
.end method

.method public createContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V
    .locals 6
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "groups"    # [Ljava/lang/String;
    .param p4, "subscribe"    # Z

    .prologue
    .line 195
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "createContact: contact="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", nickname="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", subscribe="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 204
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    if-nez p4, :cond_1

    .line 205
    :cond_0
    new-instance v3, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v3}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 206
    .local v3, "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 207
    new-instance v1, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    invoke-direct {v1, p1, p2}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    .local v1, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 211
    iget-object v4, p0, Lcom/google/android/gtalkservice/RosterManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v0

    .line 212
    .local v0, "iqMgr":Lcom/google/android/gtalkservice/IQPacketManager;
    new-instance v4, Lcom/google/android/gtalkservice/RosterManager$1;

    invoke-direct {v4, p0}, Lcom/google/android/gtalkservice/RosterManager$1;-><init>(Lcom/google/android/gtalkservice/RosterManager;)V

    const/4 v5, 0x1

    invoke-virtual {v0, v3, v4, v5}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V

    .line 223
    .end local v0    # "iqMgr":Lcom/google/android/gtalkservice/IQPacketManager;
    .end local v1    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v3    # "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    :cond_1
    if-eqz p4, :cond_2

    .line 225
    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v4, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v4}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 226
    .local v2, "presencePacket":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 227
    iget-object v4, p0, Lcom/google/android/gtalkservice/RosterManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z

    .line 229
    .end local v2    # "presencePacket":Lorg/jivesoftware/smack/packet/Presence;
    :cond_2
    return-void
.end method

.method public getRosterEtag()Ljava/lang/String;
    .locals 4

    .prologue
    .line 142
    iget-object v3, p0, Lcom/google/android/gtalkservice/RosterManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v2

    .line 143
    .local v2, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v0

    .line 144
    .local v0, "accountId":J
    iget-object v3, p0, Lcom/google/android/gtalkservice/RosterManager;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v3, v0, v1}, Landroid/provider/Im$ContactsEtag;->getRosterEtag(Landroid/content/ContentResolver;J)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public hasRequestedRoster()Z
    .locals 1

    .prologue
    .line 124
    monitor-enter p0

    .line 125
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterRequested:Z

    monitor-exit p0

    return v0

    .line 126
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public hideContact(JLjava/lang/String;)V
    .locals 1
    .param p1, "account"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    .line 267
    sget-object v0, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->HIDDEN:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/gtalkservice/RosterManager;->editContactInfo(JLjava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    .line 268
    return-void
.end method

.method public init(Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resolver"    # Landroid/content/ContentResolver;
    .param p3, "connectionCtx"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/google/android/gtalkservice/RosterManager;->mContext:Landroid/content/Context;

    .line 88
    iput-object p3, p0, Lcom/google/android/gtalkservice/RosterManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .line 89
    iput-object p2, p0, Lcom/google/android/gtalkservice/RosterManager;->mResolver:Landroid/content/ContentResolver;

    .line 90
    invoke-virtual {p3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterHandler()Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    .line 91
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterRequestPendingMap:Ljava/util/HashMap;

    .line 92
    return-void
.end method

.method initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    const/4 v2, 0x0

    .line 95
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_0

    const-string v0, "initConnection: set up roster and presence packet filters"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterPacketListener:Lorg/jivesoftware/smack/PacketListener;

    if-nez v0, :cond_1

    .line 98
    new-instance v0, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;

    invoke-direct {v0, p0, v2}, Lcom/google/android/gtalkservice/RosterManager$RosterPacketListener;-><init>(Lcom/google/android/gtalkservice/RosterManager;Lcom/google/android/gtalkservice/RosterManager$1;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterPacketListener:Lorg/jivesoftware/smack/PacketListener;

    .line 99
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterPacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 102
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mPresencePacketListener:Lorg/jivesoftware/smack/PacketListener;

    if-nez v0, :cond_2

    .line 103
    new-instance v0, Lcom/google/android/gtalkservice/RosterManager$PresencePacketListener;

    invoke-direct {v0, p0, v2}, Lcom/google/android/gtalkservice/RosterManager$PresencePacketListener;-><init>(Lcom/google/android/gtalkservice/RosterManager;Lcom/google/android/gtalkservice/RosterManager$1;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mPresencePacketListener:Lorg/jivesoftware/smack/PacketListener;

    .line 104
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mPresencePacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 108
    :cond_2
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mBatchPresencePacketListener:Lorg/jivesoftware/smack/PacketListener;

    if-nez v0, :cond_3

    .line 109
    new-instance v0, Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;

    invoke-direct {v0, p0, v2}, Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;-><init>(Lcom/google/android/gtalkservice/RosterManager;Lcom/google/android/gtalkservice/RosterManager$1;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mBatchPresencePacketListener:Lorg/jivesoftware/smack/PacketListener;

    .line 110
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/BatchPresence;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mBatchPresencePacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 114
    :cond_3
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterPacketListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v1, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterPacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 117
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mPresencePacketListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v1, p0, Lcom/google/android/gtalkservice/RosterManager;->mPresencePacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 120
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mBatchPresencePacketListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v1, p0, Lcom/google/android/gtalkservice/RosterManager;->mBatchPresencePacketFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 121
    return-void
.end method

.method public isRosterRequestPendingForAccount(J)Z
    .locals 3
    .param p1, "accountId"    # J

    .prologue
    .line 190
    iget-object v1, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterRequestPendingMap:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 191
    .local v0, "flag":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method notifyPresenceChanged()V
    .locals 1

    .prologue
    .line 346
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyPresenceChanged()Z

    .line 347
    return-void
.end method

.method public pinContact(JLjava/lang/String;)V
    .locals 1
    .param p1, "account"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    .line 263
    sget-object v0, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->PINNED:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/gtalkservice/RosterManager;->editContactInfo(JLjava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    .line 264
    return-void
.end method

.method public removeContact(JLjava/lang/String;)V
    .locals 5
    .param p1, "accountId"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    .line 232
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "removeContact: contact="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 234
    iget-object v3, p0, Lcom/google/android/gtalkservice/RosterManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-static {v3, p3, p1, p2}, Lcom/google/android/gtalkservice/DatabaseHelper;->rosterHasContact(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    move-result v3

    if-nez v3, :cond_0

    .line 256
    :goto_0
    return-void

    .line 238
    :cond_0
    new-instance v2, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 239
    .local v2, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 241
    new-instance v1, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    const/4 v3, 0x0

    invoke-direct {v1, p3, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .local v1, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    sget-object v3, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->REMOVE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    .line 244
    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 246
    iget-object v3, p0, Lcom/google/android/gtalkservice/RosterManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v0

    .line 247
    .local v0, "iqMgr":Lcom/google/android/gtalkservice/IQPacketManager;
    new-instance v3, Lcom/google/android/gtalkservice/RosterManager$2;

    invoke-direct {v3, p0}, Lcom/google/android/gtalkservice/RosterManager$2;-><init>(Lcom/google/android/gtalkservice/RosterManager;)V

    const/4 v4, 0x1

    invoke-virtual {v0, v2, v3, v4}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V

    goto :goto_0
.end method

.method public requestRoster()Z
    .locals 5

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 148
    iget-object v2, p0, Lcom/google/android/gtalkservice/RosterManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 150
    .local v0, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/RosterManager;->hasRequestedRoster()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 152
    const-string v2, "GTalkService"

    const-string v3, "requestRoster: already requested, abort"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v4

    .line 169
    :goto_0
    return v2

    .line 156
    :cond_0
    invoke-virtual {p0, v3}, Lcom/google/android/gtalkservice/RosterManager;->setHasRequestedRoster(Z)V

    .line 158
    new-instance v1, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v1}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 159
    .local v1, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/RosterManager;->getRosterEtag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->setEtag(Ljava/lang/String;)V

    .line 163
    invoke-virtual {v0, v1, v4}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v3

    .line 165
    goto :goto_0

    .line 168
    :cond_1
    invoke-virtual {p0, v4}, Lcom/google/android/gtalkservice/RosterManager;->setHasRequestedRoster(Z)V

    move v2, v4

    .line 169
    goto :goto_0
.end method

.method public setHasRequestedRoster(Z)V
    .locals 2
    .param p1, "flag"    # Z

    .prologue
    .line 130
    monitor-enter p0

    .line 131
    :try_start_0
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setHasRequestedRoster = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 132
    :cond_0
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterRequested:Z

    .line 133
    monitor-exit p0

    .line 134
    return-void

    .line 133
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setRosterRequestPendingForAccount(JZ)V
    .locals 3
    .param p1, "accountId"    # J
    .param p3, "flag"    # Z

    .prologue
    .line 180
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setRosterRequestPendingForAccount: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/RosterManager;->log(Ljava/lang/String;)V

    .line 182
    :cond_0
    if-eqz p3, :cond_1

    .line 183
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterRequestPendingMap:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    :goto_0
    return-void

    .line 185
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/RosterManager;->mRosterRequestPendingMap:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
