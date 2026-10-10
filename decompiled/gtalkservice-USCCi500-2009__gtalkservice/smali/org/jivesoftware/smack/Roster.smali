.class public Lorg/jivesoftware/smack/Roster;
.super Ljava/lang/Object;
.source "Roster.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/Roster$1;,
        Lorg/jivesoftware/smack/Roster$RosterPacketListener;,
        Lorg/jivesoftware/smack/Roster$PresencePacketListener;
    }
.end annotation


# static fields
.field private static final BATCH_BROADCAST_PRESENCE:Z = true

.field public static final EVENT_PRESENCE_CHANGED:I = 0x64

.field public static final EVENT_ROSTER_ADDED:I = 0xc8

.field public static final EVENT_ROSTER_REMOVED:I = 0x190

.field public static final EVENT_ROSTER_UPDATED:I = 0x12c

.field private static final LOG_TAG:Ljava/lang/String; = "Smack"

.field public static final SUBSCRIPTION_ACCEPT_ALL:I = 0x0

.field public static final SUBSCRIPTION_MANUAL:I = 0x2

.field public static final SUBSCRIPTION_REJECT_ALL:I = 0x1

.field public static final SUPPORT_FEATURE_GROUPS:Z

.field private static final _debug:Z

.field private static defaultSubscriptionMode:I


# instance fields
.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private entries:Ljava/util/List;

.field private groups:Ljava/util/Map;

.field private presenceMap:Ljava/util/Map;

.field rosterInitialized:Z

.field private rosterListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/RosterListener;",
            ">;"
        }
    .end annotation
.end field

.field private subscriptionMode:I

.field private unfiledEntries:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x0

    sput v0, Lorg/jivesoftware/smack/Roster;->defaultSubscriptionMode:I

    return-void
.end method

.method constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 4
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    const/4 v3, 0x0

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    .line 103
    invoke-static {}, Lorg/jivesoftware/smack/Roster;->getDefaultSubscriptionMode()I

    move-result v2

    iput v2, p0, Lorg/jivesoftware/smack/Roster;->subscriptionMode:I

    .line 135
    iput-object p1, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 136
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    iput-object v2, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    .line 137
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    .line 138
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/List;

    .line 141
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    .line 146
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    .line 151
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 152
    .local v1, "rosterFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v2, Lorg/jivesoftware/smack/Roster$RosterPacketListener;

    invoke-direct {v2, p0, v3}, Lorg/jivesoftware/smack/Roster$RosterPacketListener;-><init>(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Roster$1;)V

    invoke-virtual {p1, v2, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 154
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v0, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 155
    .local v0, "presenceFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v2, Lorg/jivesoftware/smack/Roster$PresencePacketListener;

    invoke-direct {v2, p0, v3}, Lorg/jivesoftware/smack/Roster$PresencePacketListener;-><init>(Lorg/jivesoftware/smack/Roster;Lorg/jivesoftware/smack/Roster$1;)V

    invoke-virtual {p1, v2, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 156
    return-void
.end method

.method static synthetic access$1000(Lorg/jivesoftware/smack/Roster;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p1, "x1"    # Ljava/util/Collection;
    .param p2, "x2"    # Ljava/util/Collection;
    .param p3, "x3"    # Ljava/util/Collection;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lorg/jivesoftware/smack/Roster;->fireRosterChangedEvent(Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V

    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smack/Roster;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/Roster;->fireRosterPresenceEvent(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V

    return-void
.end method

.method static synthetic access$600(Lorg/jivesoftware/smack/Roster;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/Roster;->removePresenceForUser(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$700(Lorg/jivesoftware/smack/Roster;)I
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 47
    iget v0, p0, Lorg/jivesoftware/smack/Roster;->subscriptionMode:I

    return v0
.end method

.method static synthetic access$800(Lorg/jivesoftware/smack/Roster;)Lorg/jivesoftware/smack/XMPPConnection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    return-object v0
.end method

.method static synthetic access$900(Lorg/jivesoftware/smack/Roster;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    return-object v0
.end method

.method private fireRosterChangedEvent(Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 7
    .param p1, "addedEntries"    # Ljava/util/Collection;
    .param p2, "updatedEntries"    # Ljava/util/Collection;
    .param p3, "deletedEntries"    # Ljava/util/Collection;

    .prologue
    const-wide/16 v1, 0x0

    .line 635
    iget-object v3, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterListener;

    .line 636
    .local v0, "listener":Lorg/jivesoftware/smack/RosterListener;
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    move-wide v3, v1

    move-object v5, p1

    .line 637
    invoke-interface/range {v0 .. v5}, Lorg/jivesoftware/smack/RosterListener;->entriesAdded(JJLjava/util/Collection;)V

    .line 639
    :cond_1
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    move-wide v3, v1

    move-object v5, p2

    .line 640
    invoke-interface/range {v0 .. v5}, Lorg/jivesoftware/smack/RosterListener;->entriesUpdated(JJLjava/util/Collection;)V

    .line 642
    :cond_2
    invoke-interface {p3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    move-wide v3, v1

    move-object v5, p3

    .line 643
    invoke-interface/range {v0 .. v5}, Lorg/jivesoftware/smack/RosterListener;->entriesDeleted(JJLjava/util/Collection;)V

    goto :goto_0

    .line 665
    .end local v0    # "listener":Lorg/jivesoftware/smack/RosterListener;
    :cond_3
    return-void
.end method

.method private fireRosterPresenceEvent(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 3
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 675
    iget-object v2, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/RosterListener;

    .line 676
    .local v1, "listener":Lorg/jivesoftware/smack/RosterListener;
    invoke-interface {v1, p1, p2}, Lorg/jivesoftware/smack/RosterListener;->presenceChanged(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V

    goto :goto_0

    .line 689
    .end local v1    # "listener":Lorg/jivesoftware/smack/RosterListener;
    :cond_0
    return-void
.end method

.method public static getDefaultSubscriptionMode()I
    .locals 1

    .prologue
    .line 114
    sget v0, Lorg/jivesoftware/smack/Roster;->defaultSubscriptionMode:I

    return v0
.end method

.method private getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 608
    if-nez p1, :cond_0

    .line 609
    const/4 v1, 0x0

    .line 615
    :goto_0
    return-object v1

    .line 611
    :cond_0
    move-object v0, p1

    .line 612
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/Roster;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 613
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 615
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1019
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[Roster] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1020
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1023
    const-string v0, "Smack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[Roster] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1024
    return-void
.end method

.method private removePresenceForUser(Ljava/lang/String;Z)V
    .locals 6
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "force"    # Z

    .prologue
    const/4 v5, 0x0

    .line 692
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 694
    .local v2, "key":Ljava/lang/String;
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 695
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 697
    .local v3, "userPresences":Ljava/util/Map;
    monitor-enter v3

    .line 698
    if-eqz p2, :cond_1

    .line 699
    :try_start_0
    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 703
    :goto_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 704
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 705
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 709
    .end local v3    # "userPresences":Ljava/util/Map;
    :cond_0
    if-eqz p2, :cond_2

    .line 710
    invoke-direct {p0, p1, v5}, Lorg/jivesoftware/smack/Roster;->fireRosterPresenceEvent(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V

    .line 723
    :goto_1
    return-void

    .line 701
    .restart local v3    # "userPresences":Ljava/util/Map;
    :cond_1
    :try_start_1
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 703
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 713
    .end local v3    # "userPresences":Ljava/util/Map;
    :cond_2
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/List;

    monitor-enter v4

    .line 714
    :try_start_2
    iget-object v5, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 715
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    .line 716
    .local v0, "entry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 717
    const/4 v5, 0x0

    invoke-direct {p0, p1, v5}, Lorg/jivesoftware/smack/Roster;->fireRosterPresenceEvent(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V

    .line 721
    .end local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    :cond_4
    monitor-exit v4

    goto :goto_1

    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_1
    move-exception v5

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v5
.end method

.method public static setDefaultSubscriptionMode(I)V
    .locals 0
    .param p0, "subscriptionMode"    # I

    .prologue
    .line 126
    sput p0, Lorg/jivesoftware/smack/Roster;->defaultSubscriptionMode:I

    .line 127
    return-void
.end method


# virtual methods
.method public addRosterListener(Lorg/jivesoftware/smack/RosterListener;)V
    .locals 2
    .param p1, "rosterListener"    # Lorg/jivesoftware/smack/RosterListener;

    .prologue
    .line 212
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    monitor-enter v0

    .line 213
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 214
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    :cond_0
    monitor-exit v0

    .line 217
    return-void

    .line 216
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 442
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/Roster;->getEntry(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public createEntry(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V
    .locals 9
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "groups"    # [Ljava/lang/String;
    .param p4, "subscribe"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 262
    new-instance v5, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v5}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 263
    .local v5, "rosterPacket":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v6, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 264
    new-instance v2, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    invoke-direct {v2, p1, p2}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .local v2, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    if-eqz p3, :cond_1

    .line 266
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v6, p3

    if-ge v1, v6, :cond_1

    .line 267
    aget-object v6, p3, v1

    if-eqz v6, :cond_0

    .line 268
    aget-object v6, p3, v1

    invoke-virtual {v2, v6}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->addGroupName(Ljava/lang/String;)V

    .line 266
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 272
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {v5, v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 274
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/RosterPacket;->getPacketID()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 276
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6, v5}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 277
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v0, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/packet/IQ;

    .line 278
    .local v4, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 279
    if-nez v4, :cond_2

    .line 280
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "No response from the server."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 283
    :cond_2
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v6, v7, :cond_3

    .line 284
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v6

    .line 288
    :cond_3
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v6, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v3, v6}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 289
    .local v3, "presencePacket":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 290
    iget-object v6, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v6, v3}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 291
    return-void
.end method

.method public createGroup(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterGroup;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 241
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    monitor-enter v1

    .line 242
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 243
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Group with name "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " alread exists."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 248
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 245
    :cond_0
    :try_start_1
    new-instance v0, Lorg/jivesoftware/smack/RosterGroup;

    iget-object v2, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-direct {v0, p1, v2}, Lorg/jivesoftware/smack/RosterGroup;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/XMPPConnection;)V

    .line 246
    .local v0, "group":Lorg/jivesoftware/smack/RosterGroup;
    iget-object v2, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v0
.end method

.method public getEntries()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 382
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Roster;->getUnfiledEntries()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getEntry(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterEntry;
    .locals 6
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 419
    if-nez p1, :cond_0

    move-object v3, v5

    .line 431
    :goto_0
    return-object v3

    .line 422
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 423
    .local v2, "userLowerCase":Ljava/lang/String;
    iget-object v3, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/List;

    monitor-enter v3

    .line 424
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 425
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterEntry;

    .line 426
    .local v0, "entry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 427
    monitor-exit v3

    move-object v3, v0

    goto :goto_0

    .line 430
    .end local v0    # "entry":Lorg/jivesoftware/smack/RosterEntry;
    :cond_2
    monitor-exit v3

    move-object v3, v5

    .line 431
    goto :goto_0

    .line 430
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public getEntryCount()I
    .locals 1

    .prologue
    .line 352
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Roster;->getUnfiledEntryCount()I

    move-result v0

    return v0
.end method

.method public getGroup(Ljava/lang/String;)Lorg/jivesoftware/smack/RosterGroup;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 453
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    monitor-enter v0

    .line 454
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/Roster;
    check-cast p0, Lorg/jivesoftware/smack/RosterGroup;

    monitor-exit v0

    return-object p0

    .line 455
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getGroupCount()I
    .locals 2

    .prologue
    .line 464
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    monitor-enter v0

    .line 465
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->groups:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    monitor-exit v0

    return v1

    .line 466
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getGroups()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 482
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getPresence(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence;
    .locals 11
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 508
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 509
    .local v3, "key":Ljava/lang/String;
    const/4 v7, 0x0

    .line 512
    .local v7, "userPresences":Ljava/util/Map;
    :try_start_0
    iget-object v8, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v8, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/util/Map;

    move-object v7, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 518
    :goto_0
    if-nez v7, :cond_0

    .line 519
    const/4 v8, 0x0

    .line 548
    :goto_1
    return-object v8

    .line 514
    :catch_0
    move-exception v8

    move-object v1, v8

    .line 515
    .local v1, "ex":Ljava/lang/Exception;
    const-string v8, "Smack"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getPresence: caught "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 528
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_0
    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 530
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const/4 v5, 0x0

    .line 532
    .local v5, "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_1
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 533
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 534
    .local v6, "theKey":Ljava/lang/String;
    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/packet/Presence;

    .line 539
    .local v4, "p":Lorg/jivesoftware/smack/packet/Presence;
    if-nez v5, :cond_2

    .line 540
    move-object v5, v4

    goto :goto_2

    .line 543
    :cond_2
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v8

    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v9

    if-le v8, v9, :cond_1

    .line 544
    move-object v5, v4

    goto :goto_2

    .end local v4    # "p":Lorg/jivesoftware/smack/packet/Presence;
    .end local v6    # "theKey":Ljava/lang/String;
    :cond_3
    move-object v8, v5

    .line 548
    goto :goto_1
.end method

.method public getPresenceResource(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence;
    .locals 4
    .param p1, "userResource"    # Ljava/lang/String;

    .prologue
    .line 562
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 563
    .local v0, "key":Ljava/lang/String;
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 564
    .local v1, "resource":Ljava/lang/String;
    iget-object v3, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 565
    .local v2, "userPresences":Ljava/util/Map;
    if-nez v2, :cond_0

    .line 566
    const/4 v3, 0x0

    .line 569
    .end local p0    # "this":Lorg/jivesoftware/smack/Roster;
    :goto_0
    return-object v3

    .restart local p0    # "this":Lorg/jivesoftware/smack/Roster;
    :cond_0
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lorg/jivesoftware/smack/Roster;
    check-cast p0, Lorg/jivesoftware/smack/packet/Presence;

    move-object v3, p0

    goto :goto_0
.end method

.method public getPresences(Ljava/lang/String;)Ljava/util/Iterator;
    .locals 3
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 584
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Roster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 585
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lorg/jivesoftware/smack/Roster;->presenceMap:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 586
    .local v1, "userPresences":Ljava/util/Map;
    if-nez v1, :cond_0

    .line 587
    const/4 v2, 0x0

    .line 591
    :goto_0
    return-object v2

    .line 590
    :cond_0
    monitor-enter v1

    .line 591
    :try_start_0
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    monitor-exit v1

    goto :goto_0

    .line 592
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getSubscriptionMode()I
    .locals 1

    .prologue
    .line 170
    iget v0, p0, Lorg/jivesoftware/smack/Roster;->subscriptionMode:I

    return v0
.end method

.method public getUnfiledEntries()Ljava/util/Iterator;
    .locals 3

    .prologue
    .line 405
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    monitor-enter v0

    .line 406
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 407
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getUnfiledEntryCount()I
    .locals 2

    .prologue
    .line 393
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    monitor-enter v0

    .line 394
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->unfiledEntries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    monitor-exit v0

    return v1

    .line 395
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public reload()V
    .locals 2

    .prologue
    .line 200
    new-instance v0, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 202
    .local v0, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 203
    return-void
.end method

.method public removeEntry(Lorg/jivesoftware/smack/RosterEntry;)V
    .locals 7
    .param p1, "entry"    # Lorg/jivesoftware/smack/RosterEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 304
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/List;

    monitor-enter v4

    .line 305
    :try_start_0
    iget-object v5, p0, Lorg/jivesoftware/smack/Roster;->entries:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 306
    monitor-exit v4

    .line 330
    :cond_0
    return-void

    .line 308
    :cond_1
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 309
    new-instance v2, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 310
    .local v2, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 311
    invoke-static {p1}, Lorg/jivesoftware/smack/RosterEntry;->toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    move-result-object v1

    .line 313
    .local v1, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    sget-object v4, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->REMOVE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    .line 314
    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 315
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->getPacketID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/XMPPConnection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 317
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smack/Roster;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 318
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 319
    .local v3, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 320
    if-nez v3, :cond_2

    .line 321
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string v5, "No response from the server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 308
    .end local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .end local v1    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v2    # "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    .end local v3    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 324
    .restart local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .restart local v1    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .restart local v2    # "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    .restart local v3    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :cond_2
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v4, v5, :cond_0

    .line 325
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4
.end method

.method public removeRosterListener(Lorg/jivesoftware/smack/RosterListener;)V
    .locals 2
    .param p1, "rosterListener"    # Lorg/jivesoftware/smack/RosterListener;

    .prologue
    .line 226
    iget-object v0, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    monitor-enter v0

    .line 227
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/Roster;->rosterListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 228
    monitor-exit v0

    .line 229
    return-void

    .line 228
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setSubscriptionMode(I)V
    .locals 2
    .param p1, "subscriptionMode"    # I

    .prologue
    .line 185
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    .line 189
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid mode."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :cond_0
    iput p1, p0, Lorg/jivesoftware/smack/Roster;->subscriptionMode:I

    .line 192
    return-void
.end method
