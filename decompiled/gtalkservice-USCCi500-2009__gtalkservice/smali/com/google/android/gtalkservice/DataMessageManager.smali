.class public Lcom/google/android/gtalkservice/DataMessageManager;
.super Ljava/lang/Object;
.source "DataMessageManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;,
        Lcom/google/android/gtalkservice/DataMessageManager$BroadcastDoneReceiver;
    }
.end annotation


# static fields
.field private static final RESERVED_INTENT_KEYS:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TEST_LOCAL_DATA_MESSAGING:Z = true

.field private static TOKEN_PREFIX:Ljava/lang/String; = null

.field private static final WAKELOCK_KEY:Ljava/lang/String; = "GOOGLE_DATA_MESSAGING"

.field private static sToken:J


# instance fields
.field private mContext:Landroid/content/Context;

.field private mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

.field private mHandler:Landroid/os/Handler;

.field private mLockObject:Ljava/lang/Object;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x5

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->randomString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gtalkservice/DataMessageManager;->TOKEN_PREFIX:Ljava/lang/String;

    .line 59
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/google/android/gtalkservice/DataMessageManager;->sToken:J

    .line 65
    invoke-static {}, Lcom/google/android/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v0

    sput-object v0, Lcom/google/android/gtalkservice/DataMessageManager;->RESERVED_INTENT_KEYS:Ljava/util/HashSet;

    .line 66
    sget-object v0, Lcom/google/android/gtalkservice/DataMessageManager;->RESERVED_INTENT_KEYS:Ljava/util/HashSet;

    const-string v1, "from"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 67
    sget-object v0, Lcom/google/android/gtalkservice/DataMessageManager;->RESERVED_INTENT_KEYS:Ljava/util/HashSet;

    const-string v1, "android.intent.extra.from_trusted_server"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 68
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mLockObject:Ljava/lang/Object;

    .line 135
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-static {p0}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/DataMessageManager;Landroid/content/Intent;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/DataMessageManager;
    .param p1, "x1"    # Landroid/content/Intent;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/DataMessageManager;->reportNoReceiverError(Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method private internalSendDataMessage(Ljava/lang/String;Landroid/content/Intent;)V
    .locals 6
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 320
    iget-object v3, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    if-nez v3, :cond_0

    .line 347
    :goto_0
    return-void

    .line 324
    :cond_0
    invoke-static {}, Lcom/google/android/gtalkservice/DataMessageManager;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 326
    .local v2, "token":Ljava/lang/String;
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_1

    .line 327
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "send data message: JID: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; intent: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 330
    :cond_1
    invoke-static {p1, v2, p2}, Lorg/jivesoftware/smack/packet/DataMessage;->create(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)Lorg/jivesoftware/smack/packet/DataMessage;

    move-result-object v0

    .line 334
    .local v0, "dataMsg":Lorg/jivesoftware/smack/packet/DataMessage;
    iget-object v3, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v3}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 335
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Testing local data messaging intent broadcast: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/DataMessage;->toXML()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 336
    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/DataMessageManager;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0

    .line 343
    :cond_2
    :try_start_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v3, v0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 344
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 345
    .local v1, "ex":Ljava/lang/IllegalStateException;
    const-string v3, "GTalkService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "internalSendDataMessage caught "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 356
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[DataMsgMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    return-void
.end method

.method private static declared-synchronized nextToken()Ljava/lang/String;
    .locals 6

    .prologue
    .line 296
    const-class v0, Lcom/google/android/gtalkservice/DataMessageManager;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/google/android/gtalkservice/DataMessageManager;->TOKEN_PREFIX:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-wide v2, Lcom/google/android/gtalkservice/DataMessageManager;->sToken:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    sput-wide v4, Lcom/google/android/gtalkservice/DataMessageManager;->sToken:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private parseDataMessageIntent(Lorg/jivesoftware/smack/packet/DataMessage;)Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;
    .locals 14
    .param p1, "dataMsg"    # Lorg/jivesoftware/smack/packet/DataMessage;

    .prologue
    const-string v13, "GTalkService"

    const-string v12, ", "

    .line 227
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/DataMessage;->getFrom()Ljava/lang/String;

    move-result-object v2

    .line 228
    .local v2, "from":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/DataMessage;->getTo()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 229
    .local v7, "to":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/DataMessage;->isFromTrustedServer()Z

    move-result v3

    .line 238
    .local v3, "fromTrustedServer":Z
    sget-boolean v10, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v10, :cond_0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "parseDataMessageIntent: from="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 240
    :cond_0
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/DataMessage;->getCategory()Ljava/lang/String;

    move-result-object v1

    .line 241
    .local v1, "category":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 242
    const-string v10, "GTalkService"

    const-string v10, "[DataMsgMgr] found msg w/o category, dropping"

    invoke-static {v13, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    const/4 v10, 0x0

    .line 292
    :goto_0
    return-object v10

    .line 246
    :cond_1
    iget-object v10, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    if-eqz v10, :cond_2

    .line 247
    iget-object v10, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v10}, Lcom/google/android/gtalkservice/GTalkConnection;->notifyLastDataMessageReceived()V

    .line 250
    :cond_2
    new-instance v4, Landroid/content/Intent;

    const-string v10, "android.intent.action.REMOTE_INTENT"

    invoke-direct {v4, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 252
    .local v4, "intent":Landroid/content/Intent;
    invoke-virtual {v4, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 260
    const-string v10, "account"

    invoke-virtual {v4, v10, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 262
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/DataMessage;->getAppDataIterator()Ljava/util/Iterator;

    move-result-object v5

    .line 263
    .local v5, "itor":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smack/packet/DataMessage$AppData;>;"
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 264
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/DataMessage$AppData;

    .line 265
    .local v0, "appData":Lorg/jivesoftware/smack/packet/DataMessage$AppData;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/DataMessage$AppData;->getKey()Ljava/lang/String;

    move-result-object v6

    .line 266
    .local v6, "key":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/DataMessage$AppData;->getValue()Ljava/lang/String;

    move-result-object v9

    .line 268
    .local v9, "value":Ljava/lang/String;
    sget-object v10, Lcom/google/android/gtalkservice/DataMessageManager;->RESERVED_INTENT_KEYS:Ljava/util/HashSet;

    invoke-virtual {v10, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 269
    const-string v10, "GTalkService"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "[DataMsgMgr] parseDataMessageIntent: not including app data -- key is reserved: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v13, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 275
    :cond_3
    sget-boolean v10, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v10, :cond_4

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "parse intent data: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 276
    :cond_4
    invoke-virtual {v4, v6, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 280
    .end local v0    # "appData":Lorg/jivesoftware/smack/packet/DataMessage$AppData;
    .end local v6    # "key":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    :cond_5
    const-string v10, "from"

    invoke-virtual {v4, v10, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 281
    const-string v10, "android.intent.extra.from_trusted_server"

    invoke-virtual {v4, v10, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 285
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/DataMessage;->getToken()Ljava/lang/String;

    move-result-object v8

    .line 286
    .local v8, "token":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 287
    const-string v10, "android.intent.extra.remote_intent_token"

    invoke-virtual {v4, v10, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 290
    :cond_6
    sget-boolean v10, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v10, :cond_7

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "parse intent, category="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", token="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 292
    :cond_7
    new-instance v10, Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/DataMessage;->getPermission()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v4, v11}, Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;-><init>(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private reportNoReceiverError(Landroid/content/Intent;Ljava/lang/String;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "from"    # Ljava/lang/String;

    .prologue
    .line 351
    const-string v0, "GTalkService"

    const-string v1, "TODO: implement reportNoReceiverError!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    return-void
.end method


# virtual methods
.method public acquireWakeLock()V
    .locals 2

    .prologue
    .line 155
    iget-object v0, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mLockObject:Ljava/lang/Object;

    monitor-enter v0

    .line 156
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 157
    monitor-exit v0

    .line 158
    return-void

    .line 157
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public findReceiverForIntent(Landroid/content/Intent;)Z
    .locals 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v7, 0x0

    .line 175
    iget-object v4, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 176
    .local v0, "pm":Landroid/content/pm/PackageManager;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 177
    .local v2, "ts":J
    invoke-virtual {v0, p1, v7}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 179
    .local v1, "receivers":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    .line 180
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "findReceiverForIntent: queryBroadcastReceivers took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    sub-long/2addr v5, v2

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 184
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_1

    move v4, v7

    .line 188
    :goto_0
    return v4

    :cond_1
    const/4 v4, 0x1

    goto :goto_0
.end method

.method public getWakeLock()Landroid/os/PowerManager$WakeLock;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method public init(Landroid/content/Context;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "connContext"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    const/4 v3, 0x1

    .line 138
    iput-object p1, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mContext:Landroid/content/Context;

    .line 139
    iput-object p3, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mHandler:Landroid/os/Handler;

    .line 141
    if-eqz p2, :cond_0

    .line 142
    invoke-virtual {p2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 145
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mContext:Landroid/content/Context;

    const-string v2, "power"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 146
    .local v0, "pm":Landroid/os/PowerManager;
    const-string v1, "GOOGLE_DATA_MESSAGING"

    invoke-virtual {v0, v3, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 147
    iget-object v1, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1, v3}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 148
    return-void
.end method

.method public initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 167
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    const-string v1, "initConnection: set up data message packet listener"

    invoke-static {v1}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 170
    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/DataMessage;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 171
    .local v0, "dataMsgFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-virtual {p1, p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 172
    return-void
.end method

.method public processDataMessageIntent(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "permission"    # Ljava/lang/String;
    .param p3, "callbackReceiver"    # Landroid/content/BroadcastReceiver;

    .prologue
    const/4 v6, 0x0

    .line 202
    if-nez p1, :cond_0

    .line 203
    const-string v0, "GTalkService"

    const-string v1, "parseDataMessageIntent() returned null intent!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :goto_0
    return-void

    .line 207
    :cond_0
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_1

    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "broadcast "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 209
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    .line 210
    .local v8, "extras":Landroid/os/Bundle;
    if-eqz v8, :cond_1

    invoke-virtual {v8}, Landroid/os/Bundle;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "extras: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v8}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 215
    .end local v8    # "extras":Landroid/os/Bundle;
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/DataMessageManager;->acquireWakeLock()V

    .line 217
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_2

    .line 218
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "send ordered broadcast for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-nez p2, :cond_3

    const-string v1, ""

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gtalkservice/DataMessageManager;->log(Ljava/lang/String;)V

    .line 222
    :cond_2
    iget-object v0, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v7, v6

    invoke-virtual/range {v0 .. v7}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0

    .line 218
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " with permission="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 10
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 192
    instance-of v1, p1, Lorg/jivesoftware/smack/packet/DataMessage;

    if-eqz v1, :cond_0

    .line 193
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/DataMessage;

    move-object v1, v0

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/DataMessageManager;->parseDataMessageIntent(Lorg/jivesoftware/smack/packet/DataMessage;)Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;

    move-result-object v7

    .line 194
    .local v7, "result":Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;
    iget-object v8, v7, Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;->intent:Landroid/content/Intent;

    iget-object v9, v7, Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;->permission:Ljava/lang/String;

    new-instance v1, Lcom/google/android/gtalkservice/DataMessageManager$BroadcastDoneReceiver;

    iget-object v3, v7, Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;->intent:Landroid/content/Intent;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getFrom()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gtalkservice/DataMessageManager$BroadcastDoneReceiver;-><init>(Lcom/google/android/gtalkservice/DataMessageManager;Landroid/content/Intent;Ljava/lang/String;J)V

    invoke-virtual {p0, v8, v9, v1}, Lcom/google/android/gtalkservice/DataMessageManager;->processDataMessageIntent(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;)V

    .line 198
    .end local v7    # "result":Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;
    :cond_0
    return-void
.end method

.method public releaseWakeLock()V
    .locals 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mLockObject:Ljava/lang/Object;

    monitor-enter v0

    .line 162
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/DataMessageManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 163
    monitor-exit v0

    .line 164
    return-void

    .line 163
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public sendDataMessage(Ljava/lang/String;Landroid/content/Intent;)V
    .locals 5
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "dataMessage"    # Landroid/content/Intent;

    .prologue
    const-string v3, "GTalkService"

    .line 302
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1

    .line 305
    .local v1, "origId":J
    if-nez p1, :cond_0

    .line 306
    :try_start_0
    const-string v3, "GTalkService"

    const-string v4, "sendDataMessage: to==null, failed to send message!"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 315
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 317
    :goto_0
    return-void

    .line 311
    :cond_0
    :try_start_1
    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/DataMessageManager;->internalSendDataMessage(Ljava/lang/String;Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 315
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_0

    .line 312
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 313
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_2
    const-string v3, "GTalkService"

    const-string v4, "sendDataMessage: caught "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 315
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_0

    .end local v0    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v3
.end method
