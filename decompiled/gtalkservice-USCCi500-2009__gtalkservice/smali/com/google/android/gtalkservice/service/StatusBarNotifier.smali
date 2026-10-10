.class public Lcom/google/android/gtalkservice/service/StatusBarNotifier;
.super Ljava/lang/Object;
.source "StatusBarNotifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;,
        Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    }
.end annotation


# static fields
.field private static final AVATAR_DATA_COLUMN:I = 0x0

.field private static final AVATAR_PROJECTION:[Ljava/lang/String;

.field private static final ELLIPSIS_CHAR:C = '\u2026'

.field private static final LOCAL_DEBUG:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "GTalkService"

.field private static final MAX_AVATARS_IN_DASHBOARD:I = 0x6

.field private static final MAX_NUMBER_NAMES:I = 0x5

.field private static final MULTI_CHATS_NOTIFICATION_INTENT:Landroid/content/Intent;

.field private static final NOTIFICATION_DELETED_ACTION:Ljava/lang/String; = "com.google.android.GTalkService.NOTIFICATION_DELETED_ACTION"

.field private static final NOTIFICATION_ID_EXTRA:Ljava/lang/String; = "notification_id"

.field private static final RICH_CHAT_NOTIFICATION:Z = false

.field private static final SHOW_BUDDY_LIST_FOR_MULTIPLE_CHATS:Z = true

.field private static final SUPPRESS_SOUND_INTERVAL_MS:J = 0xbb8L


# instance fields
.field private mAuthErrorNotification:Landroid/app/Notification;

.field private mContext:Landroid/content/Context;

.field private mLastSoundPlayedMs:J

.field private mNotificationDeletedReceiver:Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;

.field private mNotificationInfos:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mNotificationMgr:Landroid/app/NotificationManager;

.field private mNotificationOnDeleteIntent:Landroid/content/Intent;

.field private mPresenceNotificationFilter:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 63
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    sget-object v2, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "com.android.im.category.GTALK"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    sput-object v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->MULTI_CHATS_NOTIFICATION_INTENT:Landroid/content/Intent;

    .line 75
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "avatars_data"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->AVATAR_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;J)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "settingsProviderId"    # J

    .prologue
    const/4 v5, 0x0

    const-string v7, "com.google.android.GTalkService.NOTIFICATION_DELETED_ACTION"

    .line 422
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mPresenceNotificationFilter:Ljava/util/ArrayList;

    .line 404
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationInfos:Ljava/util/HashMap;

    .line 418
    new-instance v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;-><init>(Lcom/google/android/gtalkservice/service/StatusBarNotifier;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationDeletedReceiver:Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;

    .line 420
    iput-object v5, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    .line 423
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "StatusBarNotifier providerId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 424
    :cond_0
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    .line 425
    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationMgr:Landroid/app/NotificationManager;

    .line 427
    new-instance v0, Landroid/provider/Im$ProviderSettings$QueryMap;

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v4, 0x1

    move-wide v2, p2

    invoke-direct/range {v0 .. v5}, Landroid/provider/Im$ProviderSettings$QueryMap;-><init>(Landroid/content/ContentResolver;JZLandroid/os/Handler;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    .line 431
    new-instance v6, Landroid/content/IntentFilter;

    invoke-direct {v6}, Landroid/content/IntentFilter;-><init>()V

    .line 432
    .local v6, "intentFilter":Landroid/content/IntentFilter;
    const-string v0, "com.google.android.GTalkService.NOTIFICATION_DELETED_ACTION"

    invoke-virtual {v6, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 433
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationDeletedReceiver:Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;

    invoke-virtual {p1, v0, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 436
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.GTalkService.NOTIFICATION_DELETED_ACTION"

    invoke-direct {v0, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationOnDeleteIntent:Landroid/content/Intent;

    .line 437
    return-void
.end method

.method static synthetic access$000()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->AVATAR_PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/service/StatusBarNotifier;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/StatusBarNotifier;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->logEmptyCursor(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/gtalkservice/service/StatusBarNotifier;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/StatusBarNotifier;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->MULTI_CHATS_NOTIFICATION_INTENT:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/gtalkservice/service/StatusBarNotifier;I)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/service/StatusBarNotifier;
    .param p1, "x1"    # I

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->internalRemoveNotifications(I)V

    return-void
.end method

.method private cancelNotify(Ljava/lang/String;I)V
    .locals 10
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "notificationId"    # I

    .prologue
    .line 640
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 642
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cancelNotify for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 646
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationInfos:Ljava/util/HashMap;

    monitor-enter v0

    .line 647
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationInfos:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;

    .line 648
    .local v9, "notificationInfo":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    if-nez v9, :cond_2

    .line 649
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_1

    const-string v1, "cancelNotify: no notification found"

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 650
    :cond_1
    monitor-exit v0

    .line 685
    :goto_0
    return-void

    .line 652
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 654
    monitor-enter v9

    .line 655
    :try_start_1
    invoke-virtual {v9, p1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->remove(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 656
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cancelNotify: cannot find notification for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 657
    :cond_3
    monitor-exit v9

    goto :goto_0

    .line 659
    :catchall_0
    move-exception v0

    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 652
    .end local v9    # "notificationInfo":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    .line 659
    .restart local v9    # "notificationInfo":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    :cond_4
    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 664
    invoke-virtual {v9}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->hasNotification()Z

    move-result v0

    if-nez v0, :cond_6

    .line 665
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cancelNotify: removed notification for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 666
    :cond_5
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationMgr:Landroid/app/NotificationManager;

    invoke-virtual {v0, p2}, Landroid/app/NotificationManager;->cancel(I)V

    goto :goto_0

    .line 668
    :cond_6
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_7

    .line 669
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cancelNotify: re-post notification, #notifications="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v9}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->access$500(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;)Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$ItemsListMap;->getList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", title="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v9, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mIntent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v9, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 675
    :cond_7
    const/4 v2, 0x0

    iget-object v3, v9, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mTitle:Ljava/lang/String;

    iget-object v4, v9, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mSnippet:Ljava/lang/String;

    invoke-virtual {v9}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->getRemoteView()Landroid/widget/RemoteViews;

    move-result-object v5

    iget-object v6, v9, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mIntent:Landroid/content/Intent;

    const/4 v7, 0x1

    move-object v0, p0

    move v1, p2

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->createNotification(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/RemoteViews;Landroid/content/Intent;Z)Landroid/app/Notification;

    move-result-object v8

    .line 683
    .local v8, "notification":Landroid/app/Notification;
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationMgr:Landroid/app/NotificationManager;

    invoke-virtual {v0, p2, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_0
.end method

.method private computeNotificationId(J)I
    .locals 1
    .param p1, "providerId"    # J

    .prologue
    .line 448
    long-to-int v0, p1

    return v0
.end method

.method private createNotification(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/RemoteViews;Landroid/content/Intent;Z)Landroid/app/Notification;
    .locals 7
    .param p1, "notificationId"    # I
    .param p2, "tickerText"    # Ljava/lang/String;
    .param p3, "contentTitle"    # Ljava/lang/String;
    .param p4, "contentMessage"    # Ljava/lang/String;
    .param p5, "remoteView"    # Landroid/widget/RemoteViews;
    .param p6, "notificationIntent"    # Landroid/content/Intent;
    .param p7, "lightWeightNotify"    # Z

    .prologue
    const/4 v6, 0x0

    .line 714
    new-instance v0, Landroid/app/Notification;

    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    .line 715
    .local v0, "notification":Landroid/app/Notification;
    const v3, 0x1080077

    iput v3, v0, Landroid/app/Notification;->icon:I

    .line 716
    if-eqz p7, :cond_1

    const/4 v3, 0x0

    :goto_0
    iput-object v3, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 718
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 719
    .local v1, "now":J
    iput-wide v1, v0, Landroid/app/Notification;->when:J

    .line 735
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    const/high16 v5, 0x8000000

    invoke-static {v4, v6, p6, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v0, v3, p3, p4, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 742
    iget v3, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v3, v3, 0x1

    iput v3, v0, Landroid/app/Notification;->flags:I

    .line 743
    const v3, -0xff0100

    iput v3, v0, Landroid/app/Notification;->ledARGB:I

    .line 744
    const/16 v3, 0x1f4

    iput v3, v0, Landroid/app/Notification;->ledOnMS:I

    .line 745
    const/16 v3, 0x7d0

    iput v3, v0, Landroid/app/Notification;->ledOffMS:I

    .line 748
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationOnDeleteIntent:Landroid/content/Intent;

    const-string v4, "notification_id"

    invoke-virtual {v3, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 749
    iget-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationOnDeleteIntent:Landroid/content/Intent;

    invoke-static {v3, v6, v4, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    iput-object v3, v0, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 752
    if-nez p7, :cond_2

    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->shouldSuppressSoundNotification()Z

    move-result v3

    if-nez v3, :cond_2

    .line 753
    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->setRinger(Landroid/app/Notification;)V

    .line 758
    :cond_0
    :goto_1
    return-object v0

    .end local v1    # "now":J
    :cond_1
    move-object v3, p2

    .line 716
    goto :goto_0

    .line 754
    .restart local v1    # "now":J
    :cond_2
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v3, :cond_0

    .line 755
    const-string v3, "createNotification: suppress sound notification"

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private internalRemoveNotifications(I)V
    .locals 3
    .param p1, "notificationId"    # I

    .prologue
    .line 698
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationInfos:Ljava/util/HashMap;

    monitor-enter v0

    .line 699
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationInfos:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    monitor-exit v0

    .line 701
    return-void

    .line 700
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isPresenceNotificationEnabled(J)Z
    .locals 3
    .param p1, "providerId"    # J

    .prologue
    .line 464
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mPresenceNotificationFilter:Ljava/util/ArrayList;

    monitor-enter v0

    .line 465
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mPresenceNotificationFilter:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

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

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 807
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[StatusBarNotify] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 808
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 811
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[StatusBarNotify] "

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

    .line 812
    return-void
.end method

.method private notify(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;Z)V
    .locals 17
    .param p1, "accountId"    # J
    .param p3, "from"    # Ljava/lang/String;
    .param p4, "nickname"    # Ljava/lang/String;
    .param p5, "title"    # Ljava/lang/String;
    .param p6, "tickerText"    # Ljava/lang/String;
    .param p7, "message"    # Ljava/lang/String;
    .param p8, "notificationId"    # I
    .param p9, "intent"    # Landroid/content/Intent;
    .param p10, "lightWeightNotify"    # Z

    .prologue
    .line 600
    const/4 v13, 0x0

    .line 601
    .local v13, "contentTitle":Ljava/lang/String;
    const/4 v12, 0x0

    .line 602
    .local v12, "contentMessage":Ljava/lang/String;
    const/16 v16, 0x0

    .line 603
    .local v16, "remoteView":Landroid/widget/RemoteViews;
    move-object/from16 v15, p9

    .line 607
    .local v15, "notificationIntent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationInfos:Ljava/util/HashMap;

    move-object v4, v0

    monitor-enter v4

    .line 608
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationInfos:Ljava/util/HashMap;

    move-object v5, v0

    invoke-static/range {p8 .. p8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;

    .line 609
    .local v3, "notificationInfo":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    if-nez v3, :cond_0

    .line 610
    new-instance v3, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;

    .end local v3    # "notificationInfo":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    move-object v5, v0

    move-object v0, v3

    move-object/from16 v1, p0

    move-object v2, v5

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;-><init>(Lcom/google/android/gtalkservice/service/StatusBarNotifier;Landroid/content/Context;)V

    .line 611
    .restart local v3    # "notificationInfo":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationInfos:Ljava/util/HashMap;

    move-object v5, v0

    invoke-static/range {p8 .. p8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 613
    :cond_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 615
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 616
    monitor-enter v3

    move-wide/from16 v4, p1

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p7

    move-object/from16 v10, p9

    .line 617
    :try_start_1
    invoke-virtual/range {v3 .. v10}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->add(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)Z

    .line 618
    iget-object v7, v3, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mTitle:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 619
    .end local v13    # "contentTitle":Ljava/lang/String;
    .local v7, "contentTitle":Ljava/lang/String;
    :try_start_2
    iget-object v8, v3, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mSnippet:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 620
    .end local v12    # "contentMessage":Ljava/lang/String;
    .local v8, "contentMessage":Ljava/lang/String;
    :try_start_3
    invoke-virtual {v3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->getRemoteView()Landroid/widget/RemoteViews;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move-result-object v9

    .line 621
    .end local v16    # "remoteView":Landroid/widget/RemoteViews;
    .local v9, "remoteView":Landroid/widget/RemoteViews;
    :try_start_4
    iget-object v10, v3, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->mIntent:Landroid/content/Intent;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 622
    .end local v15    # "notificationIntent":Landroid/content/Intent;
    .local v10, "notificationIntent":Landroid/content/Intent;
    :try_start_5
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    :goto_0
    move-object/from16 v4, p0

    move/from16 v5, p8

    move-object/from16 v6, p6

    move/from16 v11, p10

    .line 628
    invoke-direct/range {v4 .. v11}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->createNotification(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/RemoteViews;Landroid/content/Intent;Z)Landroid/app/Notification;

    move-result-object v14

    .line 636
    .local v14, "notification":Landroid/app/Notification;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationMgr:Landroid/app/NotificationManager;

    move-object v4, v0

    move-object v0, v4

    move/from16 v1, p8

    move-object v2, v14

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 637
    return-void

    .line 613
    .end local v3    # "notificationInfo":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    .end local v7    # "contentTitle":Ljava/lang/String;
    .end local v8    # "contentMessage":Ljava/lang/String;
    .end local v9    # "remoteView":Landroid/widget/RemoteViews;
    .end local v10    # "notificationIntent":Landroid/content/Intent;
    .end local v14    # "notification":Landroid/app/Notification;
    .restart local v12    # "contentMessage":Ljava/lang/String;
    .restart local v13    # "contentTitle":Ljava/lang/String;
    .restart local v15    # "notificationIntent":Landroid/content/Intent;
    .restart local v16    # "remoteView":Landroid/widget/RemoteViews;
    :catchall_0
    move-exception v5

    :try_start_6
    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v5

    .line 622
    .restart local v3    # "notificationInfo":Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
    :catchall_1
    move-exception v4

    move-object v10, v15

    .end local v15    # "notificationIntent":Landroid/content/Intent;
    .restart local v10    # "notificationIntent":Landroid/content/Intent;
    move-object/from16 v9, v16

    .end local v16    # "remoteView":Landroid/widget/RemoteViews;
    .restart local v9    # "remoteView":Landroid/widget/RemoteViews;
    move-object v8, v12

    .end local v12    # "contentMessage":Ljava/lang/String;
    .restart local v8    # "contentMessage":Ljava/lang/String;
    move-object v7, v13

    .end local v13    # "contentTitle":Ljava/lang/String;
    .restart local v7    # "contentTitle":Ljava/lang/String;
    :goto_1
    :try_start_7
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    throw v4

    .end local v8    # "contentMessage":Ljava/lang/String;
    .end local v9    # "remoteView":Landroid/widget/RemoteViews;
    .end local v10    # "notificationIntent":Landroid/content/Intent;
    .restart local v12    # "contentMessage":Ljava/lang/String;
    .restart local v15    # "notificationIntent":Landroid/content/Intent;
    .restart local v16    # "remoteView":Landroid/widget/RemoteViews;
    :catchall_2
    move-exception v4

    move-object v10, v15

    .end local v15    # "notificationIntent":Landroid/content/Intent;
    .restart local v10    # "notificationIntent":Landroid/content/Intent;
    move-object/from16 v9, v16

    .end local v16    # "remoteView":Landroid/widget/RemoteViews;
    .restart local v9    # "remoteView":Landroid/widget/RemoteViews;
    move-object v8, v12

    .end local v12    # "contentMessage":Ljava/lang/String;
    .restart local v8    # "contentMessage":Ljava/lang/String;
    goto :goto_1

    .end local v9    # "remoteView":Landroid/widget/RemoteViews;
    .end local v10    # "notificationIntent":Landroid/content/Intent;
    .restart local v15    # "notificationIntent":Landroid/content/Intent;
    .restart local v16    # "remoteView":Landroid/widget/RemoteViews;
    :catchall_3
    move-exception v4

    move-object v10, v15

    .end local v15    # "notificationIntent":Landroid/content/Intent;
    .restart local v10    # "notificationIntent":Landroid/content/Intent;
    move-object/from16 v9, v16

    .end local v16    # "remoteView":Landroid/widget/RemoteViews;
    .restart local v9    # "remoteView":Landroid/widget/RemoteViews;
    goto :goto_1

    .end local v10    # "notificationIntent":Landroid/content/Intent;
    .restart local v15    # "notificationIntent":Landroid/content/Intent;
    :catchall_4
    move-exception v4

    move-object v10, v15

    .end local v15    # "notificationIntent":Landroid/content/Intent;
    .restart local v10    # "notificationIntent":Landroid/content/Intent;
    goto :goto_1

    :catchall_5
    move-exception v4

    goto :goto_1

    .end local v7    # "contentTitle":Ljava/lang/String;
    .end local v8    # "contentMessage":Ljava/lang/String;
    .end local v9    # "remoteView":Landroid/widget/RemoteViews;
    .end local v10    # "notificationIntent":Landroid/content/Intent;
    .restart local v12    # "contentMessage":Ljava/lang/String;
    .restart local v13    # "contentTitle":Ljava/lang/String;
    .restart local v15    # "notificationIntent":Landroid/content/Intent;
    .restart local v16    # "remoteView":Landroid/widget/RemoteViews;
    :cond_1
    move-object v10, v15

    .end local v15    # "notificationIntent":Landroid/content/Intent;
    .restart local v10    # "notificationIntent":Landroid/content/Intent;
    move-object/from16 v9, v16

    .end local v16    # "remoteView":Landroid/widget/RemoteViews;
    .restart local v9    # "remoteView":Landroid/widget/RemoteViews;
    move-object v8, v12

    .end local v12    # "contentMessage":Ljava/lang/String;
    .restart local v8    # "contentMessage":Ljava/lang/String;
    move-object v7, v13

    .end local v13    # "contentTitle":Ljava/lang/String;
    .restart local v7    # "contentTitle":Ljava/lang/String;
    goto :goto_0
.end method

.method private setRinger(Landroid/app/Notification;)V
    .locals 4
    .param p1, "notification"    # Landroid/app/Notification;

    .prologue
    .line 762
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v2}, Landroid/provider/Im$ProviderSettings$QueryMap;->getRingtoneURI()Ljava/lang/String;

    move-result-object v0

    .line 763
    .local v0, "ringtoneUri":Ljava/lang/String;
    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v2}, Landroid/provider/Im$ProviderSettings$QueryMap;->getVibrate()Z

    move-result v1

    .line 765
    .local v1, "vibrate":Z
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x0

    :goto_0
    iput-object v2, p1, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 766
    iget-object v2, p1, Landroid/app/Notification;->sound:Landroid/net/Uri;

    if-eqz v2, :cond_0

    .line 767
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mLastSoundPlayedMs:J

    .line 770
    :cond_0
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setRinger: notification.sound = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Landroid/app/Notification;->sound:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 772
    :cond_1
    if-eqz v1, :cond_2

    .line 773
    iget v2, p1, Landroid/app/Notification;->defaults:I

    or-int/lit8 v2, v2, 0x2

    iput v2, p1, Landroid/app/Notification;->defaults:I

    .line 774
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v2, :cond_2

    const-string v2, "setRinger: defaults |= vibrate"

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 776
    :cond_2
    return-void

    .line 765
    :cond_3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    goto :goto_0
.end method

.method private shouldSuppressSoundNotification()Z
    .locals 4

    .prologue
    .line 585
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mLastSoundPlayedMs:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0xbb8

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public dismissNotificationFor(Ljava/lang/String;J)V
    .locals 1
    .param p1, "buddy"    # Ljava/lang/String;
    .param p2, "providerId"    # J

    .prologue
    .line 704
    invoke-direct {p0, p2, p3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->computeNotificationId(J)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->cancelNotify(Ljava/lang/String;I)V

    .line 705
    return-void
.end method

.method public dismissNotifications(J)V
    .locals 3
    .param p1, "providerId"    # J

    .prologue
    .line 688
    long-to-int v0, p1

    .line 689
    .local v0, "notificationId":I
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dismissChatNotifications: id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 690
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationMgr:Landroid/app/NotificationManager;

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->cancel(I)V

    .line 692
    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->internalRemoveNotifications(I)V

    .line 693
    return-void
.end method

.method public enablePresenceNotification(JZ)V
    .locals 3
    .param p1, "providerId"    # J
    .param p3, "flag"    # Z

    .prologue
    .line 452
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mPresenceNotificationFilter:Ljava/util/ArrayList;

    monitor-enter v0

    .line 453
    if-eqz p3, :cond_1

    .line 454
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mPresenceNotificationFilter:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 455
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mPresenceNotificationFilter:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 460
    :cond_0
    :goto_0
    monitor-exit v0

    .line 461
    return-void

    .line 458
    :cond_1
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mPresenceNotificationFilter:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 460
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public notifyAuthError(JLjava/lang/String;J)V
    .locals 6
    .param p1, "providerId"    # J
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "accountId"    # J

    .prologue
    const/4 v5, 0x0

    .line 780
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    if-nez v1, :cond_0

    .line 781
    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    iput-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    .line 783
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    const v2, 0x108008a

    iput v2, v1, Landroid/app/Notification;->icon:I

    .line 784
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Landroid/app/Notification;->when:J

    .line 785
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    const v3, 0x7f050016

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 788
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    iget v2, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x10

    iput v2, v1, Landroid/app/Notification;->flags:I

    .line 790
    invoke-direct {p0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->shouldSuppressSoundNotification()Z

    move-result v1

    if-nez v1, :cond_1

    .line 791
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->setRinger(Landroid/app/Notification;)V

    .line 794
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 795
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    const-class v2, Lcom/google/android/gtalkservice/ConnectionAuthErrorDialog;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 796
    const-string v1, "accountId"

    invoke-virtual {v0, v1, p4, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 797
    const-string v1, "username"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 798
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    const v4, 0x7f050017

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    invoke-static {v4, v5, v0, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v1, v2, v3, p3, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 803
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationMgr:Landroid/app/NotificationManager;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->computeNotificationId(J)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mAuthErrorNotification:Landroid/app/Notification;

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 804
    return-void
.end method

.method public notifyChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJJZ)V
    .locals 16
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "providerId"    # J
    .param p6, "accountId"    # J
    .param p8, "groupId"    # J
    .param p10, "lightWeightNotify"    # Z

    .prologue
    .line 494
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    move-object v4, v0

    invoke-virtual {v4}, Landroid/provider/Im$ProviderSettings$QueryMap;->getEnableNotification()Z

    move-result v4

    if-nez v4, :cond_1

    .line 495
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    const-string v4, "notifyChat: notification not enabled"

    move-object/from16 v0, p0

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 523
    :cond_0
    :goto_0
    return-void

    .line 499
    :cond_1
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 500
    .local v7, "bareJid":Ljava/lang/String;
    const-wide/16 v4, 0x0

    cmp-long v4, p8, v4

    if-eqz v4, :cond_3

    invoke-static/range {p8 .. p9}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v4

    move-object v15, v4

    .line 504
    .local v15, "uri":Landroid/net/Uri;
    :goto_1
    new-instance v13, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v13, v4, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 505
    .local v13, "intent":Landroid/content/Intent;
    const/high16 v4, 0x34000000

    invoke-virtual {v13, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 508
    const-string v4, "from"

    move-object v0, v13

    move-object v1, v4

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 509
    const-string v4, "providerId"

    move-object v0, v13

    move-object v1, v4

    move-wide/from16 v2, p4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 510
    const-string v4, "accountId"

    move-object v0, v13

    move-object v1, v4

    move-wide/from16 v2, p6

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 511
    const-string v4, "from_notify"

    const/4 v5, 0x1

    invoke-virtual {v13, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 513
    const-wide/16 v4, 0x0

    cmp-long v4, p8, v4

    if-eqz v4, :cond_2

    .line 514
    const-string v4, "is_muc"

    const/4 v5, 0x1

    invoke-virtual {v13, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 517
    :cond_2
    move-object/from16 v9, p2

    .line 518
    .local v9, "title":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    move-object v4, v0

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050012

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p2, v6, v8

    const/4 v8, 0x1

    aput-object p3, v6, v8

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 521
    .local v10, "snippet":Ljava/lang/String;
    move-object/from16 v0, p0

    move-wide/from16 v1, p4

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->computeNotificationId(J)I

    move-result v12

    move-object/from16 v4, p0

    move-wide/from16 v5, p6

    move-object/from16 v8, p2

    move-object/from16 v11, p3

    move/from16 v14, p10

    invoke-direct/range {v4 .. v14}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->notify(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;Z)V

    goto :goto_0

    .line 500
    .end local v9    # "title":Ljava/lang/String;
    .end local v10    # "snippet":Ljava/lang/String;
    .end local v13    # "intent":Landroid/content/Intent;
    .end local v15    # "uri":Landroid/net/Uri;
    :cond_3
    move-wide/from16 v0, p6

    move-object v2, v7

    invoke-static {v0, v1, v2}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    move-object v15, v4

    goto :goto_1
.end method

.method public notifyGroupChatInvitation(Lcom/google/android/gtalkservice/GroupChatInvitation;JJ)V
    .locals 16
    .param p1, "invitation"    # Lcom/google/android/gtalkservice/GroupChatInvitation;
    .param p2, "providerId"    # J
    .param p4, "accountId"    # J

    .prologue
    .line 556
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getGroupContactId()J

    move-result-wide v4

    invoke-static {v4, v5}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v15

    .line 557
    .local v15, "uri":Landroid/net/Uri;
    new-instance v13, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v13, v4, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 558
    .local v13, "intent":Landroid/content/Intent;
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getRoomAddress()Ljava/lang/String;

    move-result-object v7

    .line 559
    .local v7, "roomJid":Ljava/lang/String;
    const-string v4, "from"

    invoke-virtual {v13, v4, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 560
    const-string v4, "providerId"

    move-object v0, v13

    move-object v1, v4

    move-wide/from16 v2, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 561
    const-string v4, "accountId"

    move-object v0, v13

    move-object v1, v4

    move-wide/from16 v2, p4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 562
    const-string v4, "is_muc"

    const/4 v5, 0x1

    invoke-virtual {v13, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 563
    const-string v4, "muc_inviter"

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getInviter()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 564
    const-string v4, "muc_password"

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getPassword()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 565
    const-string v4, "from_notify"

    const/4 v5, 0x1

    invoke-virtual {v13, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 568
    const-string v4, "state"

    const/4 v5, 0x1

    invoke-virtual {v13, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 570
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    move-object v4, v0

    const v5, 0x7f050010

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 571
    .local v9, "title":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getInviter()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 572
    .local v8, "inviter":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    move-object v4, v0

    const v5, 0x7f050014

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v8, v6, v10

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 575
    .local v10, "snippet":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gtalkservice/GroupChatInvitation;->getReason()Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->computeNotificationId(J)I

    move-result v12

    const/4 v14, 0x0

    move-object/from16 v4, p0

    move-wide/from16 v5, p4

    invoke-direct/range {v4 .. v14}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->notify(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;Z)V

    .line 578
    return-void
.end method

.method public notifySubscriptionRequest(Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 15
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "providerId"    # J
    .param p5, "accountId"    # J

    .prologue
    .line 532
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "notifySubs: contact="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", msg="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->log(Ljava/lang/String;)V

    .line 534
    :cond_0
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 535
    .local v7, "bareJid":Ljava/lang/String;
    new-instance v13, Landroid/content/Intent;

    const-string v4, "android.intent.action.GTALK_MANAGE_SUBSCRIPTION"

    const/4 v5, 0x0

    invoke-direct {v13, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 536
    .local v13, "intent":Landroid/content/Intent;
    const-string v4, "vnd.android.cursor.item/gtalk-contacts"

    invoke-virtual {v13, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 537
    const-string v4, "from"

    move-object v0, v13

    move-object v1, v4

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 538
    const-string v4, "accountId"

    move-object v0, v13

    move-object v1, v4

    move-wide/from16 v2, p5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 539
    const-string v4, "from_notify"

    const/4 v5, 0x1

    invoke-virtual {v13, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 541
    move-object/from16 v9, p1

    .line 543
    .local v9, "title":Ljava/lang/String;
    move-object v0, p0

    move-wide/from16 v1, p3

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->computeNotificationId(J)I

    move-result v12

    const/4 v14, 0x0

    move-object v4, p0

    move-wide/from16 v5, p5

    move-object v8, v7

    move-object/from16 v10, p2

    move-object/from16 v11, p2

    invoke-direct/range {v4 .. v14}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->notify(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/content/Intent;Z)V

    .line 546
    return-void
.end method

.method public onServiceDestroyed()V
    .locals 2

    .prologue
    .line 440
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    if-eqz v0, :cond_0

    .line 441
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mSettingsQueryMap:Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->close()V

    .line 444
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->mNotificationDeletedReceiver:Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 445
    return-void
.end method

.method public removeChatNotificationFor(Ljava/lang/String;J)V
    .locals 1
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "providerId"    # J

    .prologue
    .line 526
    invoke-direct {p0, p2, p3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->computeNotificationId(J)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->cancelNotify(Ljava/lang/String;I)V

    .line 527
    return-void
.end method

.method public removeGroupChatInvitationNotificationFor(Ljava/lang/String;J)V
    .locals 1
    .param p1, "roomJid"    # Ljava/lang/String;
    .param p2, "providerId"    # J

    .prologue
    .line 581
    invoke-direct {p0, p2, p3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->computeNotificationId(J)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->cancelNotify(Ljava/lang/String;I)V

    .line 582
    return-void
.end method

.method public removeSubscriptionNotificationFor(Ljava/lang/String;J)V
    .locals 2
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "providerId"    # J

    .prologue
    .line 549
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p2, p3}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->computeNotificationId(J)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->cancelNotify(Ljava/lang/String;I)V

    .line 551
    return-void
.end method
