.class public Lcom/google/android/gtalkservice/VCardMgr;
.super Ljava/lang/Object;
.source "VCardMgr.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/VCardMgr$1;,
        Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;,
        Lcom/google/android/gtalkservice/VCardMgr$VCardLoader;
    }
.end annotation


# static fields
.field private static final AVATAR_DIMENSION_LIMIT:I = 0x60

.field private static final AVATAR_HASH_COLUMN_INDEX:I = 0x0

.field private static final AVATAR_HASH_PROJECTION:[Ljava/lang/String;

.field private static final AVATAR_HASH_QUERY_SELECTION:Ljava/lang/String; = "contact=?"

.field private static final DISABLE_VCARD:Z = false

.field private static final LOCAL_DEBUG:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "GTalkService"

.field private static final STR_PHOTO:Ljava/lang/String; = "photo"


# instance fields
.field private mAccountId:J

.field private mAvatarChangedNotificationMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mAvatarHashSelectionArgs:[Ljava/lang/String;

.field private mAvatarUri:Landroid/net/Uri;

.field private mBatchPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private mCurrentlyLoadingList:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

.field private mPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private mProviderId:J

.field private mResolver:Landroid/content/ContentResolver;

.field private mUsername:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 58
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "hash"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gtalkservice/VCardMgr;->AVATAR_HASH_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAvatarChangedNotificationMap:Ljava/util/HashMap;

    .line 99
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/VCardMgr;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/VCardMgr;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/VCardMgr;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/gtalkservice/VCardMgr;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/VCardMgr;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/VCardMgr;->addToLoadingList(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/gtalkservice/VCardMgr;)Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/VCardMgr;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/gtalkservice/VCardMgr;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/VCardMgr;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/VCardMgr;->removeFromLoadingList(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/gtalkservice/VCardMgr;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/VCardMgr;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mUsername:Ljava/lang/String;

    return-object v0
.end method

.method private addToLoadingList(Ljava/lang/String;)V
    .locals 3
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 142
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mCurrentlyLoadingList:Ljava/util/Map;

    monitor-enter v0

    .line 143
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mCurrentlyLoadingList:Ljava/util/Map;

    const-string v2, ""

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    monitor-exit v0

    .line 145
    return-void

    .line 144
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private checkAndLoadVCard(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "hash"    # Ljava/lang/String;

    .prologue
    .line 314
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/VCardMgr;->getStoredAvatarHashForContact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 322
    .local v0, "oldhash":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 327
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gtalkservice/VCardMgr;->loadAvatarForUser(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    :cond_1
    return-void
.end method

.method private checkAvatarUpdates(Lorg/jivesoftware/smack/packet/Presence;Ljava/lang/String;)V
    .locals 2
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;
    .param p2, "user"    # Ljava/lang/String;

    .prologue
    .line 297
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Presence;->getAvatarHash()Ljava/lang/String;

    move-result-object v0

    .line 303
    .local v0, "hash":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 304
    invoke-direct {p0, p2, v0}, Lcom/google/android/gtalkservice/VCardMgr;->checkAndLoadVCard(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    :cond_0
    return-void
.end method

.method private getAvatarUri(JJ)Landroid/net/Uri;
    .locals 2
    .param p1, "providerId"    # J
    .param p3, "accountId"    # J

    .prologue
    .line 341
    sget-object v1, Landroid/provider/Im$Avatars;->CONTENT_URI_AVATARS_BY:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 342
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 343
    invoke-static {v0, p3, p4}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 344
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method private isCurrentlyLoadingVCard(Ljava/lang/String;)Z
    .locals 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mCurrentlyLoadingList:Ljava/util/Map;

    monitor-enter v0

    .line 158
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mCurrentlyLoadingList:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    monitor-exit v0

    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 159
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 411
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[VCargMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 412
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 517
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[VCardMgr] "

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

    .line 518
    return-void
.end method

.method private logw(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 415
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WARNING [VCargMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    return-void
.end method

.method private notifyAvatarChanged(Ljava/lang/String;JJ)V
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J

    .prologue
    .line 401
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "### notifyAvatarChanged for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/VCardMgr;->log(Ljava/lang/String;)V

    .line 403
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GTALK_AVATAR_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 404
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "from"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 405
    const-string v1, "providerId"

    invoke-virtual {v0, v1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 406
    const-string v1, "accountId"

    invoke-virtual {v0, v1, p4, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 407
    iget-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 408
    return-void
.end method

.method private processPresencePacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 247
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/Presence;

    move-object v1, v0

    .line 248
    .local v1, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v2

    .line 249
    .local v2, "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 252
    .local v3, "user":Ljava/lang/String;
    invoke-static {v3}, Lcom/google/android/gtalkservice/XmppUtils;->isGroupChat(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 264
    :cond_0
    :goto_0
    return-void

    .line 257
    :cond_1
    sget-object v4, Lorg/jivesoftware/smack/packet/Presence$Type;->AVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v2, v4, :cond_0

    .line 258
    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/VCardMgr;->isCurrentlyLoadingVCard(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 259
    invoke-direct {p0, v1, v3}, Lcom/google/android/gtalkservice/VCardMgr;->checkAvatarUpdates(Lorg/jivesoftware/smack/packet/Presence;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private removeFromLoadingList(Ljava/lang/String;)V
    .locals 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mCurrentlyLoadingList:Ljava/util/Map;

    monitor-enter v0

    .line 149
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mCurrentlyLoadingList:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    monitor-exit v0

    .line 151
    return-void

    .line 150
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private validateAvatar([B)Z
    .locals 4
    .param p1, "data"    # [B

    .prologue
    const/16 v3, 0x60

    const/4 v2, 0x0

    .line 217
    array-length v1, p1

    invoke-static {p1, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 218
    .local v0, "avatar":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-gt v1, v3, :cond_0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-le v1, v3, :cond_1

    :cond_0
    move v1, v2

    .line 223
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addToNotificationMap(Ljava/lang/String;)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 332
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAvatarChangedNotificationMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    return-void
.end method

.method public getStoredAvatarHashForContact(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v1, 0x0

    .line 348
    if-nez p1, :cond_0

    .line 349
    const-string v0, "GTalkService"

    const-string v1, "getStoredAvatarHashForContact: null contact!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v5

    .line 375
    :goto_0
    return-object v0

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAvatarHashSelectionArgs:[Ljava/lang/String;

    aput-object p1, v0, v1

    .line 355
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAvatarUri:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/gtalkservice/VCardMgr;->AVATAR_HASH_PROJECTION:[Ljava/lang/String;

    const-string v3, "contact=?"

    iget-object v4, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAvatarHashSelectionArgs:[Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 361
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 363
    .local v7, "hash":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 365
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 366
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 369
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :goto_1
    move-object v0, v7

    .line 375
    goto :goto_0

    .line 369
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 372
    :cond_2
    const-string v0, "getStoredAvatarHashForContact"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/VCardMgr;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public init(Landroid/content/Context;Lcom/google/android/gtalkservice/GTalkConnectionContext;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "connectionContext"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .prologue
    .line 102
    iput-object p2, p0, Lcom/google/android/gtalkservice/VCardMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    .line 103
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mResolver:Landroid/content/ContentResolver;

    .line 105
    iget-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v0

    .line 106
    .local v0, "conn":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-static {v0}, Lcom/google/android/gtalkservice/ImAccountInfo;->getProviderId(Lcom/google/android/gtalkservice/GTalkConnection;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mProviderId:J

    .line 107
    invoke-static {v0}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountId(Lcom/google/android/gtalkservice/GTalkConnection;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAccountId:J

    .line 108
    iget-wide v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mProviderId:J

    iget-wide v3, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAccountId:J

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/google/android/gtalkservice/VCardMgr;->getAvatarUri(JJ)Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAvatarUri:Landroid/net/Uri;

    .line 110
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAvatarHashSelectionArgs:[Ljava/lang/String;

    .line 111
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mCurrentlyLoadingList:Ljava/util/Map;

    .line 112
    return-void
.end method

.method initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 124
    if-eqz p1, :cond_2

    .line 125
    invoke-virtual {p1}, Lorg/jivesoftware/smack/XMPPConnection;->getUser()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mUsername:Ljava/lang/String;

    .line 127
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    if-nez v0, :cond_0

    .line 128
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 131
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 133
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mBatchPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    if-nez v0, :cond_1

    .line 134
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/BatchPresence;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mBatchPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 137
    :cond_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mBatchPresenceFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {p1, p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 139
    :cond_2
    return-void
.end method

.method public loadAvatarForUser(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "avatarHash"    # Ljava/lang/String;

    .prologue
    .line 336
    new-instance v0, Lcom/google/android/gtalkservice/VCardMgr$VCardLoader;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gtalkservice/VCardMgr$VCardLoader;-><init>(Lcom/google/android/gtalkservice/VCardMgr;Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    .local v0, "vcardLoader":Lcom/google/android/gtalkservice/VCardMgr$VCardLoader;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/VCardMgr$VCardLoader;->sendLoadRequest()V

    .line 338
    return-void
.end method

.method onLogout()V
    .locals 1

    .prologue
    .line 270
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mCurrentlyLoadingList:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 271
    return-void
.end method

.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 236
    instance-of v4, p1, Lorg/jivesoftware/smack/packet/Presence;

    if-eqz v4, :cond_1

    .line 237
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/VCardMgr;->processPresencePacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 244
    :cond_0
    return-void

    .line 238
    :cond_1
    instance-of v4, p1, Lorg/jivesoftware/smack/packet/BatchPresence;

    if-eqz v4, :cond_0

    .line 239
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/BatchPresence;

    move-object v1, v0

    .line 240
    .local v1, "batchPresence":Lorg/jivesoftware/smack/packet/BatchPresence;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/BatchPresence;->getPresenceStanzaList()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/Presence;

    .line 241
    .local v3, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/VCardMgr;->processPresencePacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0
.end method

.method public storeAvatarData(Ljava/lang/String;[BLjava/lang/String;)V
    .locals 7
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "hash"    # Ljava/lang/String;

    .prologue
    .line 384
    new-instance v6, Landroid/content/ContentValues;

    const/4 v0, 0x3

    invoke-direct {v6, v0}, Landroid/content/ContentValues;-><init>(I)V

    .line 385
    .local v6, "values":Landroid/content/ContentValues;
    const-string v0, "contact"

    invoke-virtual {v6, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 386
    const-string v0, "data"

    invoke-virtual {v6, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 387
    const-string v0, "hash"

    invoke-virtual {v6, v0, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mProviderId:J

    iget-wide v3, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAccountId:J

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/google/android/gtalkservice/VCardMgr;->getAvatarUri(JJ)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v6}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 392
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAvatarChangedNotificationMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 393
    iget-wide v2, p0, Lcom/google/android/gtalkservice/VCardMgr;->mProviderId:J

    iget-wide v4, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAccountId:J

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gtalkservice/VCardMgr;->notifyAvatarChanged(Ljava/lang/String;JJ)V

    .line 397
    :goto_0
    return-void

    .line 395
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mGTalkConnectionContext:Lcom/google/android/gtalkservice/GTalkConnectionContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterHandler()Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/RosterListenerImpl;->notifyRosterChanged()Z

    goto :goto_0
.end method

.method public uploadAvatar(Landroid/graphics/Bitmap;)V
    .locals 6
    .param p1, "avatar"    # Landroid/graphics/Bitmap;

    .prologue
    const/16 v5, 0x60

    const/4 v4, 0x0

    .line 163
    if-nez p1, :cond_0

    .line 189
    :goto_0
    return-void

    .line 167
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 168
    .local v3, "width":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 170
    .local v0, "height":I
    if-gt v3, v5, :cond_1

    if-le v0, v5, :cond_2

    .line 173
    :cond_1
    if-le v3, v0, :cond_3

    .line 174
    div-int/lit8 v2, v3, 0x60

    .line 179
    .local v2, "scale":I
    :goto_1
    div-int/2addr v3, v2

    .line 180
    div-int/2addr v0, v2

    .line 183
    invoke-static {p1, v4, v4, v3, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 186
    .end local v2    # "scale":I
    :cond_2
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 187
    .local v1, "os":Ljava/io/ByteArrayOutputStream;
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x4b

    invoke-virtual {p1, v4, v5, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 188
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/google/android/gtalkservice/VCardMgr;->uploadAvatar([B)V

    goto :goto_0

    .line 176
    .end local v1    # "os":Ljava/io/ByteArrayOutputStream;
    :cond_3
    div-int/lit8 v2, v0, 0x60

    .restart local v2    # "scale":I
    goto :goto_1
.end method

.method public uploadAvatar([B)V
    .locals 2
    .param p1, "avatarData"    # [B

    .prologue
    .line 227
    new-instance v0, Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;-><init>(Lcom/google/android/gtalkservice/VCardMgr;Lcom/google/android/gtalkservice/VCardMgr$1;)V

    .line 228
    .local v0, "vcard":Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;->uploadToServer([B)V

    .line 229
    return-void
.end method

.method public uploadAvatarFromDb(Ljava/lang/String;)V
    .locals 9
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    const-string v8, "data"

    .line 192
    iget-object v0, p0, Lcom/google/android/gtalkservice/VCardMgr;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/google/android/gtalkservice/VCardMgr;->mAvatarUri:Landroid/net/Uri;

    new-array v2, v4, [Ljava/lang/String;

    const-string v3, "data"

    aput-object v8, v2, v5

    const-string v3, "contact=?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object p1, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 198
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_2

    .line 200
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    const-string v0, "data"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    .line 202
    .local v7, "rawData":[B
    if-eqz v7, :cond_1

    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/VCardMgr;->validateAvatar([B)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 203
    invoke-virtual {p0, v7}, Lcom/google/android/gtalkservice/VCardMgr;->uploadAvatar([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    .end local v7    # "rawData":[B
    :cond_0
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 214
    :goto_1
    return-void

    .line 205
    .restart local v7    # "rawData":[B
    :cond_1
    :try_start_1
    const-string v0, "GTalkService"

    const-string v1, "uploadAvatarFromDb: avatar data invalid"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 209
    .end local v7    # "rawData":[B
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 212
    :cond_2
    const-string v0, "uploadAvatarFromDb"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/VCardMgr;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_1
.end method
