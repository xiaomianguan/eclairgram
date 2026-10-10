.class public Lorg/jivesoftware/smack/RosterEntry;
.super Ljava/lang/Object;
.source "RosterEntry.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private gRejected:Z

.field private gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

.field private name:Ljava/lang/String;

.field private quickContact:Z

.field private status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

.field private type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

.field private user:Ljava/lang/String;

.field vcard:Lorg/jivesoftware/smackx/packet/VCard;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .param p4, "status"    # Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .param p5, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    .line 65
    iput-object p2, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    .line 66
    iput-object p3, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    .line 67
    iput-object p4, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    .line 68
    iput-object p5, p0, Lorg/jivesoftware/smack/RosterEntry;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 69
    sget-object v0, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->DEFAULT:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    iput-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    .line 70
    return-void
.end method

.method private getAbbreviatedUser()Ljava/lang/String;
    .locals 3

    .prologue
    .line 106
    iget-object v1, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    .line 108
    .local v1, "retVal":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 109
    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 110
    .local v0, "at":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 111
    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 115
    .end local v0    # "at":I
    :cond_0
    return-object v1
.end method

.method static toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .locals 6
    .param p0, "entry"    # Lorg/jivesoftware/smack/RosterEntry;

    .prologue
    .line 343
    new-instance v1, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v4, v5}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    .local v1, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    .line 345
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemStatus(Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;)V

    .line 347
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getGroups()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "j":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 348
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterGroup;

    .line 349
    .local v0, "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->addGroupName(Ljava/lang/String;)V

    goto :goto_0

    .line 353
    .end local v0    # "group":Lorg/jivesoftware/smack/RosterGroup;
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->googleGetStatus()Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    move-result-object v3

    .line 354
    .local v3, "status":Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;
    sget-object v4, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->DEFAULT:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    if-eq v3, v4, :cond_1

    .line 355
    invoke-virtual {v1, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    .line 358
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->googleGetRejected()Z

    move-result v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetRejected(Z)V

    .line 359
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->isQuickContact()Z

    move-result v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setQuickContact(Z)V

    .line 361
    return-object v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 331
    if-ne p0, p1, :cond_0

    .line 332
    const/4 v0, 0x1

    .line 338
    .end local p1    # "object":Ljava/lang/Object;
    :goto_0
    return v0

    .line 334
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_0
    if-eqz p1, :cond_1

    instance-of v0, p1, Lorg/jivesoftware/smack/RosterEntry;

    if-eqz v0, :cond_1

    .line 335
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    check-cast p1, Lorg/jivesoftware/smack/RosterEntry;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 338
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDisplayName(Z)Ljava/lang/String;
    .locals 2
    .param p1, "omitDomain"    # Z

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    .line 93
    .local v0, "retVal":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 94
    if-eqz p1, :cond_1

    .line 95
    invoke-direct {p0}, Lorg/jivesoftware/smack/RosterEntry;->getAbbreviatedUser()Ljava/lang/String;

    move-result-object v0

    .line 102
    :cond_0
    :goto_0
    return-object v0

    .line 98
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    goto :goto_0
.end method

.method public getGroups()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 183
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    return-object v0
.end method

.method public getType()Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    return-object v0
.end method

.method public getVCard()Lorg/jivesoftware/smackx/packet/VCard;
    .locals 1

    .prologue
    .line 284
    monitor-enter p0

    .line 285
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->vcard:Lorg/jivesoftware/smackx/packet/VCard;

    monitor-exit p0

    return-object v0

    .line 286
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public googleGetRejected()Z
    .locals 1

    .prologue
    .line 261
    iget-boolean v0, p0, Lorg/jivesoftware/smack/RosterEntry;->gRejected:Z

    return v0
.end method

.method public googleGetStatus()Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    return-object v0
.end method

.method public googleSetRejected(Z)V
    .locals 0
    .param p1, "rejected"    # Z

    .prologue
    .line 265
    iput-boolean p1, p0, Lorg/jivesoftware/smack/RosterEntry;->gRejected:Z

    .line 266
    return-void
.end method

.method public googleSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V
    .locals 0
    .param p1, "status"    # Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    .prologue
    .line 249
    iput-object p1, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    .line 250
    return-void
.end method

.method public isBlocked()Z
    .locals 2

    .prologue
    .line 269
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    sget-object v1, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->BLOCKED:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isHidden()Z
    .locals 2

    .prologue
    .line 273
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    sget-object v1, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->HIDDEN:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isInvited()Z
    .locals 2

    .prologue
    .line 232
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    sget-object v1, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->NONE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    sget-object v1, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->FROM:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    if-ne v0, v1, :cond_1

    .line 234
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    sget-object v1, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->SUBSCRIPTION_PENDING:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    if-ne v0, v1, :cond_1

    .line 235
    const/4 v0, 0x1

    .line 238
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPinned()Z
    .locals 2

    .prologue
    .line 277
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    sget-object v1, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->PINNED:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isQuickContact()Z
    .locals 1

    .prologue
    .line 253
    iget-boolean v0, p0, Lorg/jivesoftware/smack/RosterEntry;->quickContact:Z

    return v0
.end method

.method public isSubscribed()Z
    .locals 2

    .prologue
    .line 217
    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    sget-object v1, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->BOTH:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    sget-object v1, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->TO:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    if-ne v0, v1, :cond_1

    .line 219
    :cond_0
    const/4 v0, 0x1

    .line 221
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 125
    if-eqz p1, :cond_0

    iget-object v1, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 133
    :goto_0
    return-void

    .line 128
    :cond_0
    iput-object p1, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    .line 129
    new-instance v0, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 130
    .local v0, "packet":Lorg/jivesoftware/smack/packet/RosterPacket;
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 131
    invoke-static {p0}, Lorg/jivesoftware/smack/RosterEntry;->toRosterItem(Lorg/jivesoftware/smack/RosterEntry;)Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 132
    iget-object v1, p0, Lorg/jivesoftware/smack/RosterEntry;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0
.end method

.method public setQuickContact(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 257
    iput-boolean p1, p0, Lorg/jivesoftware/smack/RosterEntry;->quickContact:Z

    .line 258
    return-void
.end method

.method public setVCard(Lorg/jivesoftware/smackx/packet/VCard;)V
    .locals 1
    .param p1, "vcard"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 290
    monitor-enter p0

    .line 291
    :try_start_0
    iput-object p1, p0, Lorg/jivesoftware/smack/RosterEntry;->vcard:Lorg/jivesoftware/smackx/packet/VCard;

    .line 292
    monitor-exit p0

    .line 293
    return-void

    .line 292
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 296
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 297
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 298
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 300
    :cond_0
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->user:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 301
    invoke-virtual {p0}, Lorg/jivesoftware/smack/RosterEntry;->getGroups()Ljava/util/Iterator;

    move-result-object v2

    .line 302
    .local v2, "groups":Ljava/util/Iterator;
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 303
    const-string v3, " ["

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 304
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/RosterGroup;

    .line 305
    .local v1, "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 306
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 307
    const-string v3, ", "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 308
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "group":Lorg/jivesoftware/smack/RosterGroup;
    check-cast v1, Lorg/jivesoftware/smack/RosterGroup;

    .line 309
    .restart local v1    # "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 311
    :cond_1
    const-string v3, "]"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 315
    .end local v1    # "group":Lorg/jivesoftware/smack/RosterGroup;
    :cond_2
    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    sget-object v4, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->DEFAULT:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    if-eq v3, v4, :cond_3

    .line 316
    const-string v3, ", gr_t="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 319
    :cond_3
    iget-boolean v3, p0, Lorg/jivesoftware/smack/RosterEntry;->gRejected:Z

    if-eqz v3, :cond_4

    .line 320
    const-string v3, ", gr_rejected="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-boolean v4, p0, Lorg/jivesoftware/smack/RosterEntry;->gRejected:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 323
    :cond_4
    iget-boolean v3, p0, Lorg/jivesoftware/smack/RosterEntry;->quickContact:Z

    if-eqz v3, :cond_5

    .line 324
    const-string v3, ", qc=\'true\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 327
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method updateState(Ljava/lang/String;Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    .param p3, "status"    # Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    .prologue
    .line 143
    iput-object p1, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    .line 144
    iput-object p2, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    .line 145
    iput-object p3, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    .line 146
    return-void
.end method

.method updateState(Lorg/jivesoftware/smack/RosterEntry;)V
    .locals 1
    .param p1, "entry"    # Lorg/jivesoftware/smack/RosterEntry;

    .prologue
    .line 154
    iget-object v0, p1, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    iput-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->name:Ljava/lang/String;

    .line 155
    iget-object v0, p1, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    iput-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->type:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    .line 156
    iget-object v0, p1, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    iput-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->status:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    .line 159
    iget-object v0, p1, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    iput-object v0, p0, Lorg/jivesoftware/smack/RosterEntry;->gStatus:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    .line 160
    iget-boolean v0, p1, Lorg/jivesoftware/smack/RosterEntry;->gRejected:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/RosterEntry;->gRejected:Z

    .line 161
    iget-boolean v0, p1, Lorg/jivesoftware/smack/RosterEntry;->quickContact:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/RosterEntry;->quickContact:Z

    .line 162
    return-void
.end method
