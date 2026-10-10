.class public Lcom/google/android/gtalkservice/Account;
.super Ljava/lang/Object;
.source "Account.java"


# static fields
.field public static final DEFAULT_ACTIVE_HEARTBEAT_INTERVAL_MS:I = 0x6ddd0

.field public static final DEFAULT_AWAY_HEARTBEAT_INTERVAL_MS:I = 0xdbba0

.field public static final DEFAULT_GTALK_HOST:Ljava/lang/String; = "mtalk.google.com"

.field public static final DEFAULT_HEARTBEAT_ACK_INTERVAL_MS:I = 0xea60

.field public static final DEFAULT_MAX_CONNECTION_HISTORY_RECORDS:I = 0xa

.field public static final DEFAULT_MAX_RECONNECT_DELAY:I = 0x927c0

.field public static final DEFAULT_MIN_RECONNECT_DELAY_LONG:I = 0x7530

.field public static final DEFAULT_MIN_RECONNECT_DELAY_SHORT:I = 0x3a98

.field public static final DEFAULT_NOSYNC_HEARTBEAT_INTERVAL_MS:I = 0x19a280

.field public static final DEFAULT_OLD_CHAT_MESSAGE_THRESHOLD_MS:I = 0x7530

.field public static final DEFAULT_RECONNECT_VARIANT_LONG:I = 0x15f90

.field public static final DEFAULT_RECONNECT_VARIANT_SHORT:I = 0x3a98

.field public static final DEFAULT_SECURE_GTALK_PORT:I = 0x146c

.field public static final DEFAULT_SHORT_NETWORK_DOWNTIME:I = 0x2932e0

.field public static final DEFAULT_SYNC_HEARTBEAT_INTERVAL_MS:I = 0xdbba0

.field public static final DEFAULT_USE_RMQ2:Z = false

.field public static final DEFAULT_WIFI_MAX_HEARTBEAT_INTERVAL_MS:I = 0xdbba0


# instance fields
.field private mActiveHeartbeatInterval:I

.field private mAuthToken:Ljava/lang/String;

.field private mDeviceId:Ljava/lang/String;

.field private mDomain:Ljava/lang/String;

.field private mHeartbeatAckTimeout:I

.field private mHost:Ljava/lang/String;

.field private mIdleHeartbeatInterval:I

.field private mLoginSettings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mMaxConnectionHistoryRecords:I

.field private mMaxReconnectDelay:I

.field private mMinReconnectDelayLong:I

.field private mMinReconnectDelayShort:I

.field private mName:Ljava/lang/String;

.field private mNosyncHeartbeatInterval:I

.field private mOldChatMessageThresholdMs:I

.field private mPort:I

.field private mReconnectVariantLong:I

.field private mReconnectVariantShort:I

.field private mRmq2IncludeStreamId:Z

.field private mRmqAckInterval:I

.field private mService:Lcom/google/android/gtalkservice/service/GTalkService;

.field private mShortNetworkDowntime:I

.field private mSupportRmqAndRmq2:Z

.field private mSyncHeartbeatInterval:I

.field private mUseRmq2:Z

.field private mUsername:Ljava/lang/String;

.field private mWifiHeartbeatInterval:I


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Ljava/lang/String;IIIIIIIIIIIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZIILjava/util/Map;)V
    .locals 4
    .param p1, "service"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I
    .param p5, "rmqAckInterval"    # I
    .param p6, "minReconnectDelayShort"    # I
    .param p7, "reconnectVariantShort"    # I
    .param p8, "minReconnectDelayLong"    # I
    .param p9, "reconnectVariantLong"    # I
    .param p10, "maxReconnectDelay"    # I
    .param p11, "shortNetworkDowntime"    # I
    .param p12, "activeHeartbeat"    # I
    .param p13, "idleHeartbeat"    # I
    .param p14, "syncHeartbeat"    # I
    .param p15, "nosyncHeartbeat"    # I
    .param p16, "wifiHeartbeat"    # I
    .param p17, "heartbeatAckTimeout"    # I
    .param p18, "username"    # Ljava/lang/String;
    .param p19, "authToken"    # Ljava/lang/String;
    .param p20, "deviceId"    # Ljava/lang/String;
    .param p21, "useRmq2"    # Z
    .param p22, "supportRmqAndRmq2"    # Z
    .param p23, "rmq2IncludeStreamId"    # Z
    .param p24, "oldChatMsgThresholdMs"    # I
    .param p25, "maxConnectionHistoryRecords"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gtalkservice/service/GTalkService;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIIIIIIIIIIIII",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZZII",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p26, "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    iput-object p1, p0, Lcom/google/android/gtalkservice/Account;->mService:Lcom/google/android/gtalkservice/service/GTalkService;

    .line 119
    iput-object p2, p0, Lcom/google/android/gtalkservice/Account;->mName:Ljava/lang/String;

    .line 120
    iput-object p3, p0, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    .line 121
    iput p4, p0, Lcom/google/android/gtalkservice/Account;->mPort:I

    .line 122
    iput p5, p0, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    .line 123
    iput p6, p0, Lcom/google/android/gtalkservice/Account;->mMinReconnectDelayShort:I

    .line 124
    iput p7, p0, Lcom/google/android/gtalkservice/Account;->mReconnectVariantShort:I

    .line 125
    iput p8, p0, Lcom/google/android/gtalkservice/Account;->mMinReconnectDelayLong:I

    .line 126
    iput p9, p0, Lcom/google/android/gtalkservice/Account;->mReconnectVariantLong:I

    .line 127
    iput p10, p0, Lcom/google/android/gtalkservice/Account;->mMaxReconnectDelay:I

    .line 128
    iput p11, p0, Lcom/google/android/gtalkservice/Account;->mShortNetworkDowntime:I

    .line 130
    move/from16 v0, p12

    move-object v1, p0

    iput v0, v1, Lcom/google/android/gtalkservice/Account;->mActiveHeartbeatInterval:I

    .line 131
    move/from16 v0, p13

    move-object v1, p0

    iput v0, v1, Lcom/google/android/gtalkservice/Account;->mIdleHeartbeatInterval:I

    .line 132
    move/from16 v0, p14

    move-object v1, p0

    iput v0, v1, Lcom/google/android/gtalkservice/Account;->mSyncHeartbeatInterval:I

    .line 133
    move/from16 v0, p15

    move-object v1, p0

    iput v0, v1, Lcom/google/android/gtalkservice/Account;->mNosyncHeartbeatInterval:I

    .line 134
    move/from16 v0, p16

    move-object v1, p0

    iput v0, v1, Lcom/google/android/gtalkservice/Account;->mWifiHeartbeatInterval:I

    .line 135
    move/from16 v0, p17

    move-object v1, p0

    iput v0, v1, Lcom/google/android/gtalkservice/Account;->mHeartbeatAckTimeout:I

    .line 137
    move-object/from16 v0, p18

    move-object v1, p0

    iput-object v0, v1, Lcom/google/android/gtalkservice/Account;->mUsername:Ljava/lang/String;

    .line 138
    iget-object v2, p0, Lcom/google/android/gtalkservice/Account;->mUsername:Ljava/lang/String;

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gtalkservice/Account;->mDomain:Ljava/lang/String;

    .line 139
    move-object/from16 v0, p19

    move-object v1, p0

    iput-object v0, v1, Lcom/google/android/gtalkservice/Account;->mAuthToken:Ljava/lang/String;

    .line 140
    if-nez p20, :cond_0

    .line 141
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "deviceId must not be null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 143
    :cond_0
    move-object/from16 v0, p20

    move-object v1, p0

    iput-object v0, v1, Lcom/google/android/gtalkservice/Account;->mDeviceId:Ljava/lang/String;

    .line 145
    move/from16 v0, p21

    move-object v1, p0

    iput-boolean v0, v1, Lcom/google/android/gtalkservice/Account;->mUseRmq2:Z

    .line 146
    move/from16 v0, p22

    move-object v1, p0

    iput-boolean v0, v1, Lcom/google/android/gtalkservice/Account;->mSupportRmqAndRmq2:Z

    .line 147
    move/from16 v0, p23

    move-object v1, p0

    iput-boolean v0, v1, Lcom/google/android/gtalkservice/Account;->mRmq2IncludeStreamId:Z

    .line 149
    move/from16 v0, p24

    move-object v1, p0

    iput v0, v1, Lcom/google/android/gtalkservice/Account;->mOldChatMessageThresholdMs:I

    .line 150
    move/from16 v0, p25

    move-object v1, p0

    iput v0, v1, Lcom/google/android/gtalkservice/Account;->mMaxConnectionHistoryRecords:I

    .line 152
    move-object/from16 v0, p26

    move-object v1, p0

    iput-object v0, v1, Lcom/google/android/gtalkservice/Account;->mLoginSettings:Ljava/util/Map;

    .line 153
    return-void
.end method

.method public static createAccountFromSettings(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gtalkservice/Account;
    .locals 28
    .param p0, "service"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "authToken"    # Ljava/lang/String;
    .param p3, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 421
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getGservices()Landroid/provider/Settings$Gservices$QueryMap;

    move-result-object v19

    .line 423
    .local v19, "gservices":Landroid/provider/Settings$Gservices$QueryMap;
    const-string v3, "gtalk_hostname"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 426
    .local v4, "host":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 427
    const-string v3, "GTalkService"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .end local v4    # "host":Ljava/lang/String;
    move-result v3

    if-eqz v3, :cond_0

    .line 428
    const-string v3, "GTalkService"

    const-string v4, "createAccountFromSettings: gservices has no hostname!"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    :cond_0
    const-string v4, "mtalk.google.com"

    .line 434
    .restart local v4    # "host":Ljava/lang/String;
    :cond_1
    const-string v3, "gtalk_secure_port"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 435
    .local v3, "portStr":Ljava/lang/String;
    const/16 v5, 0x146c

    .line 437
    .local v5, "port":I
    :try_start_0
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 443
    .end local v3    # "portStr":Ljava/lang/String;
    :goto_0
    const-string v3, "talk.google.com"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x1467

    if-ne v5, v3, :cond_2

    .line 447
    const-string v4, "mtalk.google.com"

    .line 448
    const/16 v5, 0x146c

    .line 451
    :cond_2
    const-string v3, "gtalk_rmq_ack_interval"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 453
    .local v3, "rmqAckIntervalStr":Ljava/lang/String;
    const/16 v6, 0xa

    .line 455
    .local v6, "rmqAckInterval":I
    :try_start_1
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 456
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v6

    .line 463
    .end local v3    # "rmqAckIntervalStr":Ljava/lang/String;
    :cond_3
    :goto_1
    const-string v3, "gtalk_min_reconnect_delay_short"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 465
    .local v3, "minReconnectDelayShortStr":Ljava/lang/String;
    const/16 v7, 0x3a98

    .line 467
    .local v7, "minReconnectDelayShort":I
    :try_start_2
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 468
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    move-result v7

    .line 475
    .end local v3    # "minReconnectDelayShortStr":Ljava/lang/String;
    :cond_4
    :goto_2
    const-string v3, "gtalk_reconnect_variant_short"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 477
    .local v3, "reconnectVariantShortStr":Ljava/lang/String;
    const/16 v8, 0x3a98

    .line 479
    .local v8, "reconnectVariantShort":I
    :try_start_3
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_5

    .line 480
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    move-result v8

    .line 487
    .end local v3    # "reconnectVariantShortStr":Ljava/lang/String;
    :cond_5
    :goto_3
    const-string v3, "gtalk_min_reconnect_delay_long"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 489
    .local v3, "minReconnectDelayLongStr":Ljava/lang/String;
    const/16 v9, 0x7530

    .line 491
    .local v9, "minReconnectDelayLong":I
    :try_start_4
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 492
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_4

    move-result v9

    .line 499
    .end local v3    # "minReconnectDelayLongStr":Ljava/lang/String;
    :cond_6
    :goto_4
    const-string v3, "gtalk_reconnect_variant_long"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 501
    .local v3, "reconnectVariantLongStr":Ljava/lang/String;
    const v10, 0x15f90

    .line 503
    .local v10, "reconnectVariantLong":I
    :try_start_5
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_7

    .line 504
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_5

    move-result v10

    .line 511
    .end local v3    # "reconnectVariantLongStr":Ljava/lang/String;
    :cond_7
    :goto_5
    const-string v3, "gtalk_short_network_downtime"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 513
    .local v3, "shortNetworkDowntimeStr":Ljava/lang/String;
    const v12, 0x2932e0

    .line 515
    .local v12, "shortNetworkDowntime":I
    :try_start_6
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_8

    .line 516
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_6

    move-result v12

    .line 523
    .end local v3    # "shortNetworkDowntimeStr":Ljava/lang/String;
    :cond_8
    :goto_6
    const-string v3, "gtalk_max_reconnect_delay"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 525
    .local v3, "maxReconnectDelayStr":Ljava/lang/String;
    const v11, 0x927c0

    .line 527
    .local v11, "maxReconnectDelay":I
    :try_start_7
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_9

    .line 528
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_7

    move-result v11

    .line 535
    .end local v3    # "maxReconnectDelayStr":Ljava/lang/String;
    :cond_9
    :goto_7
    const-string v3, "gtalk_active_heartbeat_ping_interval_ms"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 537
    .local v3, "activeHeartbeatStr":Ljava/lang/String;
    const v13, 0x6ddd0

    .line 539
    .local v13, "activeHeartbeat":I
    :try_start_8
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_a

    .line 540
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_8
    .catch Ljava/lang/NumberFormatException; {:try_start_8 .. :try_end_8} :catch_8

    move-result v13

    .line 547
    .end local v3    # "activeHeartbeatStr":Ljava/lang/String;
    :cond_a
    :goto_8
    const-string v3, "gtalk_heartbeat_ping_interval_ms"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 549
    .local v3, "awayHeartbeatStr":Ljava/lang/String;
    const v14, 0xdbba0

    .line 551
    .local v14, "idleHeartbeat":I
    :try_start_9
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_b

    .line 552
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_9} :catch_9

    move-result v14

    .line 559
    .end local v3    # "awayHeartbeatStr":Ljava/lang/String;
    :cond_b
    :goto_9
    const-string v3, "gtalk_sync_heartbeat_ping_interval_ms"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 561
    .local v3, "syncHeartbeatStr":Ljava/lang/String;
    const v15, 0xdbba0

    .line 563
    .local v15, "syncHeartbeat":I
    :try_start_a
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v16

    if-nez v16, :cond_c

    .line 564
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_a
    .catch Ljava/lang/NumberFormatException; {:try_start_a .. :try_end_a} :catch_a

    move-result v15

    .line 571
    .end local v3    # "syncHeartbeatStr":Ljava/lang/String;
    :cond_c
    :goto_a
    const-string v3, "gtalk_nosync_heartbeat_ping_interval_ms"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 573
    .local v3, "nosyncHeartbeatStr":Ljava/lang/String;
    const v16, 0x19a280

    .line 575
    .local v16, "nosyncHeartbeat":I
    :try_start_b
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_d

    .line 576
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_b
    .catch Ljava/lang/NumberFormatException; {:try_start_b .. :try_end_b} :catch_b

    move-result v16

    .line 583
    .end local v3    # "nosyncHeartbeatStr":Ljava/lang/String;
    :cond_d
    :goto_b
    const-string v3, "gtalk_wifi_max_heartbeat_ping_interval_ms"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 585
    .local v3, "wifiHeartbeatStr":Ljava/lang/String;
    const v17, 0xdbba0

    .line 587
    .local v17, "wifiHeartbeat":I
    :try_start_c
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-nez v18, :cond_e

    .line 588
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_c
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_c} :catch_c

    move-result v17

    .line 595
    .end local v3    # "wifiHeartbeatStr":Ljava/lang/String;
    :cond_e
    :goto_c
    const-string v3, "gtalk_heartbeat_ack_timeout_ms"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 597
    .local v3, "heartbeatAckStr":Ljava/lang/String;
    const v18, 0xea60

    .line 599
    .local v18, "heartbeatAck":I
    :try_start_d
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_f

    .line 600
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_d
    .catch Ljava/lang/NumberFormatException; {:try_start_d .. :try_end_d} :catch_d

    move-result v18

    .line 607
    .end local v3    # "heartbeatAckStr":Ljava/lang/String;
    :cond_f
    :goto_d
    const-string v3, "gtalk_use_rmq2"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 608
    .local v3, "useRmq2Str":Ljava/lang/String;
    const/16 v22, 0x0

    .line 609
    .local v22, "useRmq2":Z
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_10

    .line 610
    const-string v20, "true"

    move-object/from16 v0, v20

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    .line 613
    :cond_10
    const-string v3, "gtalk_support_rmq_and_rmq2"

    .end local v3    # "useRmq2Str":Ljava/lang/String;
    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 615
    .local v3, "setting":Ljava/lang/String;
    const/16 v23, 0x1

    .line 616
    .local v23, "supportRmqAndRmq2":Z
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_11

    .line 617
    const-string v20, "true"

    move-object/from16 v0, v20

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    .line 620
    :cond_11
    const-string v3, "gtalk_rmq2_include_stream_id"

    .end local v3    # "setting":Ljava/lang/String;
    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 621
    .local v3, "str":Ljava/lang/String;
    const/16 v24, 0x0

    .line 622
    .local v24, "rmq2IncludeStreamId":Z
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_12

    .line 623
    const-string v20, "true"

    move-object/from16 v0, v20

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v24

    .line 626
    :cond_12
    const-string v3, "gtalk_old_chat_msg_threshold_in_sec"

    .end local v3    # "str":Ljava/lang/String;
    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 628
    .local v3, "oldChatMsgThresholdStr":Ljava/lang/String;
    const/16 v25, 0x7530

    .line 630
    .local v25, "oldChatMsgThresholdMs":I
    :try_start_e
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_13

    .line 631
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_e
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_e} :catch_e

    move-result v3

    .end local v3    # "oldChatMsgThresholdStr":Ljava/lang/String;
    move v0, v3

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v25, v0

    .line 638
    :cond_13
    :goto_e
    const-string v3, "gtalk_max_conn_history_records"

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/provider/Settings$Gservices$QueryMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 640
    .local v3, "maxConnectionHistoryRecordsStr":Ljava/lang/String;
    const/16 v26, 0xa

    .line 642
    .local v26, "maxConnectionHistoryRecords":I
    :try_start_f
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_14

    .line 643
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_f
    .catch Ljava/lang/NumberFormatException; {:try_start_f .. :try_end_f} :catch_f

    move-result v26

    .line 651
    .end local v3    # "maxConnectionHistoryRecordsStr":Ljava/lang/String;
    :cond_14
    :goto_f
    new-instance v27, Ljava/util/HashMap;

    invoke-direct/range {v27 .. v27}, Ljava/util/HashMap;-><init>()V

    .line 652
    .local v27, "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual/range {v19 .. v19}, Landroid/provider/Settings$Gservices$QueryMap;->getRows()Ljava/util/Map;

    move-result-object v3

    .line 653
    .local v3, "rows":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/content/ContentValues;>;"
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    .end local v3    # "rows":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/content/ContentValues;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .local v19, "i$":Ljava/util/Iterator;
    :cond_15
    :goto_10
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 654
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/content/ContentValues;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 655
    .local v20, "name":Ljava/lang/String;
    if-eqz v20, :cond_15

    .line 659
    const-string v21, "gtalk:"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_15

    .line 660
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/content/ContentValues;>;"
    check-cast v3, Landroid/content/ContentValues;

    .line 661
    .local v3, "cv":Landroid/content/ContentValues;
    if-nez v3, :cond_16

    const/4 v3, 0x0

    .line 663
    .local v3, "value":Ljava/lang/String;
    :goto_11
    const-string v21, "gtalk:"

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    .end local v20    # "name":Ljava/lang/String;
    move-object/from16 v0, v27

    move-object/from16 v1, v20

    move-object v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    .line 438
    .end local v6    # "rmqAckInterval":I
    .end local v7    # "minReconnectDelayShort":I
    .end local v8    # "reconnectVariantShort":I
    .end local v9    # "minReconnectDelayLong":I
    .end local v10    # "reconnectVariantLong":I
    .end local v11    # "maxReconnectDelay":I
    .end local v12    # "shortNetworkDowntime":I
    .end local v13    # "activeHeartbeat":I
    .end local v14    # "idleHeartbeat":I
    .end local v15    # "syncHeartbeat":I
    .end local v16    # "nosyncHeartbeat":I
    .end local v17    # "wifiHeartbeat":I
    .end local v18    # "heartbeatAck":I
    .end local v22    # "useRmq2":Z
    .end local v23    # "supportRmqAndRmq2":Z
    .end local v24    # "rmq2IncludeStreamId":Z
    .end local v25    # "oldChatMsgThresholdMs":I
    .end local v26    # "maxConnectionHistoryRecords":I
    .end local v27    # "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v3, "portStr":Ljava/lang/String;
    .local v19, "gservices":Landroid/provider/Settings$Gservices$QueryMap;
    :catch_0
    move-exception v3

    .line 439
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v6, "GTalkService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "createAccountFromSettings caught"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v7, ", use default port "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 458
    .local v3, "rmqAckIntervalStr":Ljava/lang/String;
    .restart local v6    # "rmqAckInterval":I
    :catch_1
    move-exception v3

    .line 459
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v7, "GTalkService"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "createAccountFromSettings caught"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v8, ", use default rmqAckInterval"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 470
    .local v3, "minReconnectDelayShortStr":Ljava/lang/String;
    .restart local v7    # "minReconnectDelayShort":I
    :catch_2
    move-exception v3

    .line 471
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v8, "GTalkService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "createAccountFromSettings caught"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v9, ", use default min_reconnect_delay_short"

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 482
    .local v3, "reconnectVariantShortStr":Ljava/lang/String;
    .restart local v8    # "reconnectVariantShort":I
    :catch_3
    move-exception v3

    .line 483
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v9, "GTalkService"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "createAccountFromSettings caught"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v10, ", use default reconnect_variant_short"

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 494
    .local v3, "minReconnectDelayLongStr":Ljava/lang/String;
    .restart local v9    # "minReconnectDelayLong":I
    :catch_4
    move-exception v3

    .line 495
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v10, "GTalkService"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "createAccountFromSettings caught"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v11, ", use default min_reconnect_delay_long"

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v10, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4

    .line 506
    .local v3, "reconnectVariantLongStr":Ljava/lang/String;
    .restart local v10    # "reconnectVariantLong":I
    :catch_5
    move-exception v3

    .line 507
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v11, "GTalkService"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "createAccountFromSettings caught"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v12, ", use default reconnect_variant_long"

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v11, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    .line 518
    .local v3, "shortNetworkDowntimeStr":Ljava/lang/String;
    .restart local v12    # "shortNetworkDowntime":I
    :catch_6
    move-exception v3

    .line 519
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v11, "GTalkService"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "createAccountFromSettings caught"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v13, ", use default short_network_downtime"

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v11, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 530
    .local v3, "maxReconnectDelayStr":Ljava/lang/String;
    .restart local v11    # "maxReconnectDelay":I
    :catch_7
    move-exception v3

    .line 531
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v13, "GTalkService"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "createAccountFromSettings caught"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v14, ", use default max_reconnect_delay"

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v13, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7

    .line 542
    .local v3, "activeHeartbeatStr":Ljava/lang/String;
    .restart local v13    # "activeHeartbeat":I
    :catch_8
    move-exception v3

    .line 543
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v14, "GTalkService"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "createAccountFromSettings caught"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v15, ", use DEFAULT_ACTIVE_HEARTBEAT_INTERVAL_MS"

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v14, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 554
    .local v3, "awayHeartbeatStr":Ljava/lang/String;
    .restart local v14    # "idleHeartbeat":I
    :catch_9
    move-exception v3

    .line 555
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v15, "GTalkService"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "createAccountFromSettings caught"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v16, ", use DEFAULT_AWAY_HEARTBEAT_INTERVAL_MS"

    move-object v0, v3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v15, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_9

    .line 566
    .local v3, "syncHeartbeatStr":Ljava/lang/String;
    .restart local v15    # "syncHeartbeat":I
    :catch_a
    move-exception v3

    .line 567
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v16, "GTalkService"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "createAccountFromSettings caught"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v17, ", use DEFAULT_SYNC_HEARTBEAT_INTERVAL_MS"

    move-object v0, v3

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v16

    move-object v1, v3

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a

    .line 578
    .local v3, "nosyncHeartbeatStr":Ljava/lang/String;
    .restart local v16    # "nosyncHeartbeat":I
    :catch_b
    move-exception v3

    .line 579
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v17, "GTalkService"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "createAccountFromSettings caught"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v18, ", use DEFAULT_NOSYNC_HEARTBEAT_INTERVAL_MS"

    move-object v0, v3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    move-object v1, v3

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_b

    .line 590
    .local v3, "wifiHeartbeatStr":Ljava/lang/String;
    .restart local v17    # "wifiHeartbeat":I
    :catch_c
    move-exception v3

    .line 591
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v18, "GTalkService"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "createAccountFromSettings caught"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v20, ", use DEFAULT_WIFI_MAX_HEARTBEAT_INTERVAL_MS"

    move-object v0, v3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    move-object v1, v3

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_c

    .line 602
    .local v3, "heartbeatAckStr":Ljava/lang/String;
    .restart local v18    # "heartbeatAck":I
    :catch_d
    move-exception v3

    .line 603
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v20, "GTalkService"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "createAccountFromSettings caught"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v21, ", use DEFAULT_HEARTBEAT_ACK_INTERVAL_MS"

    move-object v0, v3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v20

    move-object v1, v3

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d

    .line 633
    .local v3, "oldChatMsgThresholdStr":Ljava/lang/String;
    .restart local v22    # "useRmq2":Z
    .restart local v23    # "supportRmqAndRmq2":Z
    .restart local v24    # "rmq2IncludeStreamId":Z
    .restart local v25    # "oldChatMsgThresholdMs":I
    :catch_e
    move-exception v3

    .line 634
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v20, "GTalkService"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "createAccountFromSettings caught"

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v21, ", use DEFAULT_OLD_CHAT_MESSAGE_THRESHOLD_MS"

    move-object v0, v3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v20

    move-object v1, v3

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    .line 645
    .local v3, "maxConnectionHistoryRecordsStr":Ljava/lang/String;
    .restart local v26    # "maxConnectionHistoryRecords":I
    :catch_f
    move-exception v3

    .line 646
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const-string v20, "GTalkService"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "createAccountFromSettings caught"

    move-object/from16 v0, v21

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    const-string v21, ", use DEFAULT_MAX_CONNECTION_HISTORY_RECORDS"

    move-object v0, v3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v20

    move-object v1, v3

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_f

    .line 661
    .local v3, "cv":Landroid/content/ContentValues;
    .local v19, "i$":Ljava/util/Iterator;
    .restart local v20    # "name":Ljava/lang/String;
    .restart local v27    # "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_16
    const-string v21, "value"

    move-object v0, v3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_11

    .end local v3    # "cv":Landroid/content/ContentValues;
    .end local v20    # "name":Ljava/lang/String;
    :cond_17
    move-object/from16 v3, p0

    move-object/from16 v19, p1

    move-object/from16 v20, p2

    move-object/from16 v21, p3

    .line 667
    invoke-static/range {v3 .. v27}, Lcom/google/android/gtalkservice/Account;->createGTalkAccount(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;IIIIIIIIIIIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZIILjava/util/Map;)Lcom/google/android/gtalkservice/Account;

    .end local v19    # "i$":Ljava/util/Iterator;
    move-result-object p0

    .line 695
    .local p0, "account":Lcom/google/android/gtalkservice/Account;
    return-object p0
.end method

.method private static createGTalkAccount(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;IIIIIIIIIIIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZIILjava/util/Map;)Lcom/google/android/gtalkservice/Account;
    .locals 30
    .param p0, "service"    # Lcom/google/android/gtalkservice/service/GTalkService;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "rmqAckInterval"    # I
    .param p4, "minReconnectDelayShort"    # I
    .param p5, "reconnectVariantShort"    # I
    .param p6, "minReconnectDelayLong"    # I
    .param p7, "reconnectVariantLong"    # I
    .param p8, "maxReconnectDelay"    # I
    .param p9, "shortNetworkDowntime"    # I
    .param p10, "heartbeatActive"    # I
    .param p11, "heartbeatIdle"    # I
    .param p12, "heartbeatSync"    # I
    .param p13, "heartbeatLong"    # I
    .param p14, "heartbeatWifi"    # I
    .param p15, "heartbeatAck"    # I
    .param p16, "username"    # Ljava/lang/String;
    .param p17, "authToken"    # Ljava/lang/String;
    .param p18, "deviceId"    # Ljava/lang/String;
    .param p19, "useRmq2"    # Z
    .param p20, "supportRmqAndRmq2"    # Z
    .param p21, "rmq2IncludeStreamId"    # Z
    .param p22, "oldChatMsgThreshold"    # I
    .param p23, "maxConnectionHistoryRecords"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gtalkservice/service/GTalkService;",
            "Ljava/lang/String;",
            "IIIIIIIIIIIIII",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZZII",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gtalkservice/Account;"
        }
    .end annotation

    .prologue
    .line 291
    .local p24, "loginSettings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "GTalkService"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 292
    const-string v3, "GTalkService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "create GTalk account: HOST="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", PORT="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", RMQ_ACK_INTERVAL="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", MIN_RECONNECT_DELAY_SHORT="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", RECONNECT_VARIANT_SHORT="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", MIN_RECONNECT_DELAY_LONG="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", RECONNECT_VARIANT_LONG="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", MAX_RECONNECT_DELAY="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", SHORT_NETWORK_DOWNTIME="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p9

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", HEART_BEAT_ACTIVE="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", HEART_BEAT_IDLE="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p11

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", HEART_BEAT_SYNC="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p12

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", HEART_BEAT_LONG="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p13

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", HEART_BEAT_WIFI="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p14

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", HEART_BEAT_ACK="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p15

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", USERNAME="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", DEVICE_ID="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move-object/from16 v1, p18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", USE_RMQ2="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", SUPPORT_RMQ_AND_RMQ2="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", RMQ2_INCL_STREAM_ID="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", OLD_CHAT_MSG_THRESHOLD="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", MAX_CONN_HISTORY_REC="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v0, v4

    move/from16 v1, p23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    :cond_0
    :try_start_0
    new-instance v3, Lcom/google/android/gtalkservice/Account;

    const/4 v5, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p4

    move/from16 v10, p5

    move/from16 v11, p6

    move/from16 v12, p7

    move/from16 v13, p8

    move/from16 v14, p9

    move/from16 v15, p10

    move/from16 v16, p11

    move/from16 v17, p12

    move/from16 v18, p13

    move/from16 v19, p14

    move/from16 v20, p15

    move-object/from16 v21, p16

    move-object/from16 v22, p17

    move-object/from16 v23, p18

    move/from16 v24, p19

    move/from16 v25, p20

    move/from16 v26, p21

    move/from16 v27, p22

    move/from16 v28, p23

    move-object/from16 v29, p24

    invoke-direct/range {v3 .. v29}, Lcom/google/android/gtalkservice/Account;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Ljava/lang/String;IIIIIIIIIIIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZIILjava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object/from16 p0, v3

    .line 327
    .end local p0    # "service":Lcom/google/android/gtalkservice/service/GTalkService;
    .end local p1    # "host":Ljava/lang/String;
    .end local p2    # "port":I
    :goto_0
    return-object p0

    .line 325
    .restart local p0    # "service":Lcom/google/android/gtalkservice/service/GTalkService;
    .restart local p1    # "host":Ljava/lang/String;
    .restart local p2    # "port":I
    :catch_0
    move-exception p0

    .line 326
    .local p0, "ex":Ljava/lang/Exception;
    const-string p1, "GTalkService"

    .end local p1    # "host":Ljava/lang/String;
    const-string p2, "Unable to create GTalk account"

    .end local p2    # "port":I
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 327
    const/16 p0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public connectionSettingsMatch(Lcom/google/android/gtalkservice/Account;)Z
    .locals 9
    .param p1, "other"    # Lcom/google/android/gtalkservice/Account;

    .prologue
    const/4 v8, 0x1

    const/4 v6, 0x0

    const-string v7, "/"

    const-string v5, "GTalkService"

    .line 332
    if-nez p1, :cond_0

    move v3, v6

    .line 367
    :goto_0
    return v3

    .line 338
    :cond_0
    iget-object v3, p1, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    if-nez v3, :cond_6

    .line 339
    iget-object v3, p0, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    if-nez v3, :cond_5

    move v0, v8

    .line 344
    .local v0, "hostMatch":Z
    :goto_1
    const-string v3, "GTalkService"

    const/4 v3, 0x3

    invoke-static {v5, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 345
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 347
    .local v2, "sb":Ljava/lang/StringBuilder;
    const-string v3, "GTalkService"

    const-string v3, "Account.settingsMatch():"

    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    if-nez v0, :cond_1

    .line 349
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " mHost: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    :cond_1
    iget v3, p1, Lcom/google/android/gtalkservice/Account;->mPort:I

    iget v4, p0, Lcom/google/android/gtalkservice/Account;->mPort:I

    if-eq v3, v4, :cond_2

    .line 352
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " mPort: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/google/android/gtalkservice/Account;->mPort:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/google/android/gtalkservice/Account;->mPort:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    :cond_2
    iget v3, p1, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    iget v4, p0, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    if-eq v3, v4, :cond_3

    .line 356
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " mRmqAckInterval: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 360
    .local v1, "out":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 361
    const-string v3, "GTalkService"

    const-string v3, "No changes"

    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    .end local v1    # "out":Ljava/lang/String;
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_4
    :goto_2
    if-eqz v0, :cond_8

    iget v3, p1, Lcom/google/android/gtalkservice/Account;->mPort:I

    iget v4, p0, Lcom/google/android/gtalkservice/Account;->mPort:I

    if-ne v3, v4, :cond_8

    iget v3, p1, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    iget v4, p0, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    if-ne v3, v4, :cond_8

    iget-boolean v3, p1, Lcom/google/android/gtalkservice/Account;->mUseRmq2:Z

    iget-boolean v4, p0, Lcom/google/android/gtalkservice/Account;->mUseRmq2:Z

    if-ne v3, v4, :cond_8

    iget-boolean v3, p1, Lcom/google/android/gtalkservice/Account;->mSupportRmqAndRmq2:Z

    iget-boolean v4, p0, Lcom/google/android/gtalkservice/Account;->mSupportRmqAndRmq2:Z

    if-ne v3, v4, :cond_8

    iget-boolean v3, p1, Lcom/google/android/gtalkservice/Account;->mRmq2IncludeStreamId:Z

    iget-boolean v4, p0, Lcom/google/android/gtalkservice/Account;->mRmq2IncludeStreamId:Z

    if-ne v3, v4, :cond_8

    move v3, v8

    goto/16 :goto_0

    .end local v0    # "hostMatch":Z
    :cond_5
    move v0, v6

    .line 339
    goto/16 :goto_1

    .line 341
    :cond_6
    iget-object v3, p1, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .restart local v0    # "hostMatch":Z
    goto/16 :goto_1

    .line 363
    .restart local v1    # "out":Ljava/lang/String;
    .restart local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_7
    const-string v3, "GTalkService"

    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .end local v1    # "out":Ljava/lang/String;
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_8
    move v3, v6

    .line 367
    goto/16 :goto_0
.end method

.method public copyHeartbeatSettings(Lcom/google/android/gtalkservice/Account;)V
    .locals 1
    .param p1, "other"    # Lcom/google/android/gtalkservice/Account;

    .prologue
    .line 388
    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mActiveHeartbeatInterval:I

    iput v0, p0, Lcom/google/android/gtalkservice/Account;->mActiveHeartbeatInterval:I

    .line 389
    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mIdleHeartbeatInterval:I

    iput v0, p0, Lcom/google/android/gtalkservice/Account;->mIdleHeartbeatInterval:I

    .line 390
    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mSyncHeartbeatInterval:I

    iput v0, p0, Lcom/google/android/gtalkservice/Account;->mSyncHeartbeatInterval:I

    .line 391
    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mNosyncHeartbeatInterval:I

    iput v0, p0, Lcom/google/android/gtalkservice/Account;->mNosyncHeartbeatInterval:I

    .line 392
    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mHeartbeatAckTimeout:I

    iput v0, p0, Lcom/google/android/gtalkservice/Account;->mHeartbeatAckTimeout:I

    .line 393
    return-void
.end method

.method public getActiveHeartbeatInterval()I
    .locals 1

    .prologue
    .line 233
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mActiveHeartbeatInterval:I

    return v0
.end method

.method public getAuthToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/google/android/gtalkservice/Account;->mAuthToken:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/google/android/gtalkservice/Account;->mDeviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/google/android/gtalkservice/Account;->mDomain:Ljava/lang/String;

    return-object v0
.end method

.method public getFullUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 185
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/Account;->getUsername()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeartbeatAckTimeout()I
    .locals 1

    .prologue
    .line 253
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mHeartbeatAckTimeout:I

    return v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    return-object v0
.end method

.method public getIdleHeartbeatInterval()I
    .locals 1

    .prologue
    .line 237
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mIdleHeartbeatInterval:I

    return v0
.end method

.method public getLoginSettings()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 277
    iget-object v0, p0, Lcom/google/android/gtalkservice/Account;->mLoginSettings:Ljava/util/Map;

    return-object v0
.end method

.method public getMaxConnectionHistoryRecords()I
    .locals 1

    .prologue
    .line 273
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mMaxConnectionHistoryRecords:I

    return v0
.end method

.method public getMaxReconnectDelay()I
    .locals 1

    .prologue
    .line 225
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mMaxReconnectDelay:I

    return v0
.end method

.method public getMinReconnectDelayLong()I
    .locals 1

    .prologue
    .line 217
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mMinReconnectDelayLong:I

    return v0
.end method

.method public getMinReconnectDelayShort()I
    .locals 1

    .prologue
    .line 209
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mMinReconnectDelayShort:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/google/android/gtalkservice/Account;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getNosyncHeartbeatInterval()I
    .locals 1

    .prologue
    .line 245
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mNosyncHeartbeatInterval:I

    return v0
.end method

.method public getOldChatMessageThresholdMs()I
    .locals 1

    .prologue
    .line 269
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mOldChatMessageThresholdMs:I

    return v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 173
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mPort:I

    return v0
.end method

.method public getReconnectVariantLong()I
    .locals 1

    .prologue
    .line 221
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mReconnectVariantLong:I

    return v0
.end method

.method public getReconnectVariantShort()I
    .locals 1

    .prologue
    .line 213
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mReconnectVariantShort:I

    return v0
.end method

.method public getRmq2IncludeStreamId()Z
    .locals 1

    .prologue
    .line 265
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/Account;->mRmq2IncludeStreamId:Z

    return v0
.end method

.method public getRmqAckInterval()I
    .locals 1

    .prologue
    .line 197
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    return v0
.end method

.method public getShortNetworkDowntime()I
    .locals 1

    .prologue
    .line 229
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mShortNetworkDowntime:I

    return v0
.end method

.method public getSupportRmqAndRmq2()Z
    .locals 1

    .prologue
    .line 261
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/Account;->mSupportRmqAndRmq2:Z

    return v0
.end method

.method public getSyncHeartbeatInterval()I
    .locals 1

    .prologue
    .line 241
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mSyncHeartbeatInterval:I

    return v0
.end method

.method public getUseRmq2()Z
    .locals 1

    .prologue
    .line 257
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/Account;->mUseRmq2:Z

    return v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/google/android/gtalkservice/Account;->mUsername:Ljava/lang/String;

    return-object v0
.end method

.method public getWifiHeartbeatInterval()I
    .locals 1

    .prologue
    .line 249
    iget v0, p0, Lcom/google/android/gtalkservice/Account;->mWifiHeartbeatInterval:I

    return v0
.end method

.method public heartbeatSettingsMatch(Lcom/google/android/gtalkservice/Account;)Z
    .locals 3
    .param p1, "other"    # Lcom/google/android/gtalkservice/Account;

    .prologue
    const/4 v2, 0x0

    .line 376
    if-nez p1, :cond_0

    move v0, v2

    .line 380
    :goto_0
    return v0

    :cond_0
    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mActiveHeartbeatInterval:I

    iget v1, p0, Lcom/google/android/gtalkservice/Account;->mActiveHeartbeatInterval:I

    if-ne v0, v1, :cond_1

    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mIdleHeartbeatInterval:I

    iget v1, p0, Lcom/google/android/gtalkservice/Account;->mIdleHeartbeatInterval:I

    if-ne v0, v1, :cond_1

    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mSyncHeartbeatInterval:I

    iget v1, p0, Lcom/google/android/gtalkservice/Account;->mSyncHeartbeatInterval:I

    if-ne v0, v1, :cond_1

    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mNosyncHeartbeatInterval:I

    iget v1, p0, Lcom/google/android/gtalkservice/Account;->mNosyncHeartbeatInterval:I

    if-ne v0, v1, :cond_1

    iget v0, p1, Lcom/google/android/gtalkservice/Account;->mHeartbeatAckTimeout:I

    iget v1, p0, Lcom/google/android/gtalkservice/Account;->mHeartbeatAckTimeout:I

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_0
.end method

.method public setAuthToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/google/android/gtalkservice/Account;->mAuthToken:Ljava/lang/String;

    .line 190
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/google/android/gtalkservice/Account;->mName:Ljava/lang/String;

    .line 157
    return-void
.end method

.method public setRmqAckInterval(I)V
    .locals 0
    .param p1, "interval"    # I

    .prologue
    .line 201
    iput p1, p0, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    .line 202
    return-void
.end method

.method public setServer(Ljava/lang/String;I)V
    .locals 0
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 164
    iput-object p1, p0, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    .line 165
    iput p2, p0, Lcom/google/android/gtalkservice/Account;->mPort:I

    .line 166
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 397
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Account:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 398
    .local v0, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mName="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/Account;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mHost="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/Account;->mHost:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mPort="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mPort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mDomain="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/Account;->mDomain:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mUsername="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/Account;->mUsername:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mDeviceId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/Account;->mDeviceId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mRmqAckInterval="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mRmqAckInterval:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mMinReconnectDelay="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mMinReconnectDelayShort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mReconnectVariantShort="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mReconnectVariantShort:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mMinReconnectDelayLong="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mMinReconnectDelayLong:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mReconnectVariantLong="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mReconnectVariantLong:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mMaxReconnectDelay="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mMaxReconnectDelay:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mShortNetworkDowntime="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mShortNetworkDowntime:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mActiveHeartbeatInterval="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mActiveHeartbeatInterval:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mIdleHeartbeatInterval="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mIdleHeartbeatInterval:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mSyncHeartbeatInterval="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mSyncHeartbeatInterval:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mNosyncHeartbeatInterval="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mNosyncHeartbeatInterval:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mHeartbeatAckTimeout="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gtalkservice/Account;->mHeartbeatAckTimeout:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
