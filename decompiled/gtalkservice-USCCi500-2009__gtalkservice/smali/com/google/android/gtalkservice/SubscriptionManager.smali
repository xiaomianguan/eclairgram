.class public Lcom/google/android/gtalkservice/SubscriptionManager;
.super Ljava/lang/Object;
.source "SubscriptionManager.java"


# static fields
.field private static final CONTACT_SUBSCRIPTION_PROJECTION:[Ljava/lang/String;

.field private static final LOG_TAG:Ljava/lang/String; = "GTalkService"


# instance fields
.field private mBatchPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

.field private mPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private mResolver:Landroid/content/ContentResolver;

.field private mSelectionArgs:[Ljava/lang/String;

.field private mSubscribeListener:Lorg/jivesoftware/smack/PacketListener;

.field private mWhereClause:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 43
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "username"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "subscriptionStatus"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "subscriptionType"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gtalkservice/SubscriptionManager;->CONTACT_SUBSCRIPTION_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSubscribeListener:Lorg/jivesoftware/smack/PacketListener;

    .line 58
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/gtalkservice/SubscriptionManager;Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/SubscriptionManager;
    .param p1, "x1"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/SubscriptionManager;->processPresencePacket(Lorg/jivesoftware/smack/packet/Presence;)V

    return-void
.end method

.method private computeWhereClause()V
    .locals 3

    .prologue
    const-string v2, "=? AND "

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "username"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .local v0, "whereClause":Ljava/lang/StringBuilder;
    const-string v1, "=? AND "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    const-string v1, "provider"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    const-string v1, "=? AND "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    const-string v1, "account"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    const-string v1, "=?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mWhereClause:Ljava/lang/String;

    .line 99
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSelectionArgs:[Ljava/lang/String;

    .line 100
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 354
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[SubsMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 358
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[SubsMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    return-void
.end method

.method private notifyNewSubscriptionRequest(Ljava/lang/String;JJ)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "provider"    # J
    .param p4, "account"    # J

    .prologue
    .line 330
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterHandler()Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged()Z

    .line 331
    invoke-virtual/range {p0 .. p5}, Lcom/google/android/gtalkservice/SubscriptionManager;->notifyInvitationViaStatusNotifier(Ljava/lang/String;JJ)V

    .line 332
    return-void
.end method

.method private notifySubscriptionRequestRemoved(Ljava/lang/String;JJ)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "provider"    # J
    .param p4, "account"    # J

    .prologue
    .line 346
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterHandler()Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged()Z

    .line 349
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->removeSubscriptionNotificationFor(Ljava/lang/String;J)V

    .line 351
    return-void
.end method

.method private processPresencePacket(Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 19
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 206
    if-eqz p1, :cond_1

    .line 207
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v16

    .line 208
    .local v16, "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v9

    .line 209
    .local v9, "from":Ljava/lang/String;
    invoke-static {v9}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 210
    .local v3, "bareJid":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v11

    .line 213
    .local v11, "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object/from16 v0, v16

    move-object v1, v2

    if-ne v0, v1, :cond_2

    .line 214
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "got presence SUBSCRIBE from "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    .line 215
    :cond_0
    invoke-static {v11}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v10

    .line 216
    .local v10, "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    iget-wide v4, v10, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    iget-wide v6, v10, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/google/android/gtalkservice/SubscriptionManager;->receivedSubscriptionRequestFromContact(Ljava/lang/String;JJ)V

    .line 326
    .end local v3    # "bareJid":Ljava/lang/String;
    .end local v9    # "from":Ljava/lang/String;
    .end local v10    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    .end local v11    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    .end local v16    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    :cond_1
    :goto_0
    return-void

    .line 218
    .restart local v3    # "bareJid":Ljava/lang/String;
    .restart local v9    # "from":Ljava/lang/String;
    .restart local v11    # "connection":Lcom/google/android/gtalkservice/GTalkConnection;
    .restart local v16    # "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    :cond_2
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object/from16 v0, v16

    move-object v1, v2

    if-ne v0, v1, :cond_4

    .line 225
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "got presence UNSUBSCRIBE from "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    .line 227
    :cond_3
    invoke-static {v11}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v10

    .line 228
    .restart local v10    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    iget-wide v4, v10, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    iget-wide v6, v10, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/google/android/gtalkservice/SubscriptionManager;->removeSubscriptionRequestFromUser(Ljava/lang/String;JJ)V

    .line 236
    new-instance v18, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object/from16 v0, v18

    move-object v1, v2

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 237
    .local v18, "unsubscribed":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v18

    move-object v1, v2

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 239
    :try_start_0
    move-object v0, v11

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 240
    :catch_0
    move-exception v12

    .line 241
    .local v12, "ex":Ljava/lang/IllegalStateException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ProcessPacketCallback: caught "

    .end local v3    # "bareJid":Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 244
    .end local v10    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    .end local v12    # "ex":Ljava/lang/IllegalStateException;
    .end local v18    # "unsubscribed":Lorg/jivesoftware/smack/packet/Presence;
    .restart local v3    # "bareJid":Ljava/lang/String;
    :cond_4
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object/from16 v0, v16

    move-object v1, v2

    if-ne v0, v1, :cond_8

    .line 247
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "got presence SUBSCRIBED from "

    .end local v3    # "bareJid":Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    .line 254
    :cond_5
    new-instance v15, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v15, v2}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 255
    .local v15, "subscribe":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15, v2}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 257
    :try_start_1
    invoke-virtual {v11, v15}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 262
    :goto_1
    invoke-static {v11}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountInfoForConnection(Lcom/google/android/gtalkservice/GTalkConnection;)Lcom/google/android/gtalkservice/ImAccountInfo;

    move-result-object v10

    .line 265
    .restart local v10    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mResolver:Landroid/content/ContentResolver;

    move-object v2, v0

    iget-wide v4, v10, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    invoke-static {v2, v9, v4, v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v13

    .line 267
    .local v13, "fromContactId":J
    const-wide/16 v4, 0x0

    cmp-long v2, v13, v4

    if-lez v2, :cond_1

    .line 268
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_6

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fromContactId is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    .line 269
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mResolver:Landroid/content/ContentResolver;

    move-object v2, v0

    invoke-static {v2, v13, v14}, Lcom/google/android/gtalkservice/DatabaseHelper;->presenceHasUser(Landroid/content/ContentResolver;J)Z

    move-result v2

    if-nez v2, :cond_1

    .line 270
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_7

    const-string v2, "contact has a pending subscription"

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    .line 272
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v2

    iget-wide v4, v10, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    invoke-virtual {v2, v9, v4, v5}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->removeSubscriptionNotificationFor(Ljava/lang/String;J)V

    .line 280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mResolver:Landroid/content/ContentResolver;

    move-object v4, v0

    iget-wide v5, v10, Lcom/google/android/gtalkservice/ImAccountInfo;->providerId:J

    iget-wide v7, v10, Lcom/google/android/gtalkservice/ImAccountInfo;->accountId:J

    invoke-static/range {v4 .. v9}, Lcom/google/android/gtalkservice/DatabaseHelper;->deleteContact(Landroid/content/ContentResolver;JJLjava/lang/String;)I

    .line 283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v9, v3, v4, v5}, Lcom/google/android/gtalkservice/RosterManager;->createContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 258
    .end local v10    # "accountInfo":Lcom/google/android/gtalkservice/ImAccountInfo;
    .end local v13    # "fromContactId":J
    :catch_1
    move-exception v12

    .line 259
    .restart local v12    # "ex":Ljava/lang/IllegalStateException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ProcessPacketCallback: caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->loge(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 289
    .end local v12    # "ex":Ljava/lang/IllegalStateException;
    .end local v15    # "subscribe":Lorg/jivesoftware/smack/packet/Presence;
    .restart local v3    # "bareJid":Ljava/lang/String;
    :cond_8
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object/from16 v0, v16

    move-object v1, v2

    if-ne v0, v1, :cond_1

    .line 297
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_9

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "got presence UNSUBSCRIBED from "

    .end local v3    # "bareJid":Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    .line 317
    :cond_9
    new-instance v17, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    move-object/from16 v0, v17

    move-object v1, v2

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 318
    .local v17, "unsubscribe":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    move-object v1, v2

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 320
    :try_start_2
    move-object v0, v11

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 321
    :catch_2
    move-exception v12

    .line 322
    .restart local v12    # "ex":Ljava/lang/IllegalStateException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ProcessPacketCallback: caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move-object v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->loge(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private updateSelectionArgs(Ljava/lang/String;JJ)V
    .locals 3
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J

    .prologue
    .line 103
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSelectionArgs:[Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 104
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSelectionArgs:[Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 105
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSelectionArgs:[Ljava/lang/String;

    const/4 v1, 0x2

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 106
    return-void
.end method


# virtual methods
.method public acceptRequestForUser(JJLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 8
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .param p5, "username"    # Ljava/lang/String;
    .param p6, "nickname"    # Ljava/lang/String;
    .param p7, "groups"    # [Ljava/lang/String;

    .prologue
    .line 163
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "accept subscription request from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", provider="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", account="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    :cond_0
    move-object v0, p0

    move-object v1, p5

    move-wide v2, p1

    move-wide v4, p3

    .line 166
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/SubscriptionManager;->removeSubscriptionRequestFromUser(Ljava/lang/String;JJ)V

    .line 174
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p5, p6, p7, v1}, Lcom/google/android/gtalkservice/RosterManager;->createContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 177
    new-instance v7, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->SUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v7, v0}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 178
    .local v7, "response":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v7, p5}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 181
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :goto_0
    return-void

    .line 182
    :catch_0
    move-exception v0

    move-object v6, v0

    .line 184
    .local v6, "ex":Ljava/lang/IllegalStateException;
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "acceptRequestForUser caught "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public declineRequestForUser(JJLjava/lang/String;)V
    .locals 8
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J
    .param p5, "user"    # Ljava/lang/String;

    .prologue
    .line 189
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "decline subscription request from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", provider="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", account="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    :cond_0
    move-object v0, p0

    move-object v1, p5

    move-wide v2, p1

    move-wide v4, p3

    .line 192
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gtalkservice/SubscriptionManager;->removeSubscriptionRequestFromUser(Ljava/lang/String;JJ)V

    .line 194
    new-instance v7, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$Type;->UNSUBSCRIBED:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v7, v0}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 195
    .local v7, "response":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v7, p5}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 198
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    invoke-virtual {v0, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    :goto_0
    return-void

    .line 199
    :catch_0
    move-exception v0

    move-object v6, v0

    .line 201
    .local v6, "ex":Ljava/lang/IllegalStateException;
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "declineRequestForUser caught "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method init(Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V
    .locals 0
    .param p1, "resolver"    # Landroid/content/ContentResolver;
    .param p2, "mc"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mResolver:Landroid/content/ContentResolver;

    .line 62
    iput-object p2, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .line 63
    invoke-direct {p0}, Lcom/google/android/gtalkservice/SubscriptionManager;->computeWhereClause()V

    .line 64
    return-void
.end method

.method initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSubscribeListener:Lorg/jivesoftware/smack/PacketListener;

    if-nez v0, :cond_0

    .line 70
    new-instance v0, Lcom/google/android/gtalkservice/SubscriptionManager$1;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/SubscriptionManager$1;-><init>(Lcom/google/android/gtalkservice/SubscriptionManager;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSubscribeListener:Lorg/jivesoftware/smack/PacketListener;

    .line 83
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 84
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/BatchPresence;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mBatchPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSubscribeListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v1, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 88
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSubscribeListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v1, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mBatchPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 89
    return-void
.end method

.method public notifyInvitationViaStatusNotifier(Ljava/lang/String;JJ)V
    .locals 9
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "provider"    # J
    .param p4, "account"    # J

    .prologue
    .line 335
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyNewSubscriptionRequest ("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ") call notifier"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    .line 337
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v8

    .line 338
    .local v8, "service":Lcom/google/android/gtalkservice/service/GTalkService;
    invoke-virtual {v8}, Lcom/google/android/gtalkservice/service/GTalkService;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 339
    .local v7, "resource":Landroid/content/res/Resources;
    const v1, 0x7f050013

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v7, v1, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 341
    .local v2, "message":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v0

    .local v0, "notifier":Lcom/google/android/gtalkservice/service/StatusBarNotifier;
    move-object v1, p1

    move-wide v3, p2

    move-wide v5, p4

    .line 342
    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->notifySubscriptionRequest(Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 343
    return-void
.end method

.method receivedSubscriptionRequestFromContact(Ljava/lang/String;JJ)V
    .locals 17
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J

    .prologue
    .line 109
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "receivedSubscriptionRequestFromContact: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object v1, v3

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    .line 111
    :cond_0
    invoke-direct/range {p0 .. p5}, Lcom/google/android/gtalkservice/SubscriptionManager;->updateSelectionArgs(Ljava/lang/String;JJ)V

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mResolver:Landroid/content/ContentResolver;

    move-object v3, v0

    sget-object v4, Landroid/provider/Im$Contacts;->CONTENT_URI_CONTACTS_BAREBONE:Landroid/net/Uri;

    sget-object v5, Lcom/google/android/gtalkservice/SubscriptionManager;->CONTACT_SUBSCRIPTION_PROJECTION:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mWhereClause:Ljava/lang/String;

    move-object v6, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mSelectionArgs:[Ljava/lang/String;

    move-object v7, v0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 119
    .local v15, "c":Landroid/database/Cursor;
    const/16 v16, 0x0

    .line 122
    .local v16, "exist":Z
    :try_start_0
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-lez v3, :cond_2

    const/4 v3, 0x1

    move/from16 v16, v3

    .line 124
    :goto_0
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 127
    if-nez v16, :cond_3

    .line 128
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "add "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", provider="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-wide/from16 v1, p2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", account="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-wide/from16 v1, p4

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to contacts db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object v1, v3

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/SubscriptionManager;->log(Ljava/lang/String;)V

    .line 131
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mResolver:Landroid/content/ContentResolver;

    move-object v3, v0

    const-wide/16 v8, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/4 v14, 0x5

    move-wide/from16 v4, p2

    move-wide/from16 v6, p4

    move-object/from16 v10, p1

    move-object/from16 v11, p1

    invoke-static/range {v3 .. v14}, Lcom/google/android/gtalkservice/DatabaseHelper;->addContact(Landroid/content/ContentResolver;JJJLjava/lang/String;Ljava/lang/String;III)Landroid/net/Uri;

    .line 153
    :goto_1
    invoke-direct/range {p0 .. p5}, Lcom/google/android/gtalkservice/SubscriptionManager;->notifyNewSubscriptionRequest(Ljava/lang/String;JJ)V

    .line 154
    return-void

    .line 122
    :cond_2
    const/4 v3, 0x0

    move/from16 v16, v3

    goto :goto_0

    .line 124
    :catchall_0
    move-exception v3

    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    throw v3

    .line 141
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/SubscriptionManager;->mResolver:Landroid/content/ContentResolver;

    move-object v3, v0

    const-wide/16 v8, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/4 v14, 0x5

    move-wide/from16 v4, p2

    move-wide/from16 v6, p4

    move-object/from16 v10, p1

    move-object/from16 v11, p1

    invoke-static/range {v3 .. v14}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateContact(Landroid/content/ContentResolver;JJJLjava/lang/String;Ljava/lang/String;III)I

    goto :goto_1
.end method

.method removeSubscriptionRequestFromUser(Ljava/lang/String;JJ)V
    .locals 6
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J

    .prologue
    .line 157
    iget-object v0, p0, Lcom/google/android/gtalkservice/SubscriptionManager;->mResolver:Landroid/content/ContentResolver;

    move-wide v1, p2

    move-wide v3, p4

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->deleteContact(Landroid/content/ContentResolver;JJLjava/lang/String;)I

    .line 158
    invoke-direct/range {p0 .. p5}, Lcom/google/android/gtalkservice/SubscriptionManager;->notifySubscriptionRequestRemoved(Ljava/lang/String;JJ)V

    .line 159
    return-void
.end method
