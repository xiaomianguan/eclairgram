.class public Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;
.super Landroid/content/BroadcastReceiver;
.source "GTalkHeartbeatAlarm.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$1;,
        Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    }
.end annotation


# static fields
.field private static final HEARTBEAT_INTENT_ACTION:Ljava/lang/String; = "com.google.android.intent.action.GTALK_HEARTBEAT"


# instance fields
.field private mAlarmManager:Landroid/app/AlarmManager;

.field private mConnection:Lorg/jivesoftware/smack/XMPPConnection;

.field private mContext:Landroid/content/Context;

.field private mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

.field private mHeartbeatAlarmIntent:Landroid/content/Intent;

.field private mHeartbeatAlarmSender:Landroid/app/PendingIntent;

.field private mHeartbeatInterval:J

.field private mNextAlarmTime:J

.field private mResetConnectionTs:J

.field private mTimer:J

.field private mUseWifiHeartbeatInterval:Z

.field private mWaitingForAck:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/AlarmManager;Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "alarmManager"    # Landroid/app/AlarmManager;
    .param p3, "gTalkConnection"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 79
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 80
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mContext:Landroid/content/Context;

    .line 81
    iput-object p2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mAlarmManager:Landroid/app/AlarmManager;

    .line 82
    iput-object p3, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 83
    return-void
.end method

.method private cancelAlarm()V
    .locals 2

    .prologue
    .line 229
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mAlarmManager:Landroid/app/AlarmManager;

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmSender:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 230
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mNextAlarmTime:J

    .line 231
    return-void
.end method

.method private computeHeartbeatInterval()J
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 183
    iget-object v7, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v7}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccount()Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    .line 185
    .local v0, "account":Lcom/google/android/gtalkservice/Account;
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->computeHeartbeatType()Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;

    move-result-object v5

    .line 187
    .local v5, "type":Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    sget-object v7, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$1;->$SwitchMap$com$google$android$gtalkservice$GTalkHeartbeatAlarm$HeartbeatType:[I

    invoke-virtual {v5}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    .line 198
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getNosyncHeartbeatInterval()I

    move-result v7

    int-to-long v1, v7

    .line 203
    .local v1, "retVal":J
    :goto_0
    iget-object v7, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v7}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gtalkservice/service/GTalkService;->getHeartbeatInterval()J

    move-result-wide v3

    .line 204
    .local v3, "serverInterval":J
    const-wide/16 v7, 0x0

    cmp-long v7, v3, v7

    if-lez v7, :cond_0

    cmp-long v7, v1, v3

    if-lez v7, :cond_0

    .line 205
    move-wide v1, v3

    .line 208
    :cond_0
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mUseWifiHeartbeatInterval:Z

    .line 211
    iget-object v7, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v7}, Lcom/google/android/gtalkservice/GTalkConnection;->getLastBroadcastNetworkType()I

    move-result v7

    if-ne v7, v9, :cond_1

    .line 212
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getWifiHeartbeatInterval()I

    move-result v6

    .line 214
    .local v6, "wifiHeartbeatInterval":I
    int-to-long v7, v6

    cmp-long v7, v1, v7

    if-lez v7, :cond_1

    .line 215
    int-to-long v1, v6

    .line 216
    iput-boolean v9, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mUseWifiHeartbeatInterval:Z

    .line 217
    sget-boolean v7, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v7, :cond_1

    const-string v7, "use wifi heartbeat interval"

    invoke-direct {p0, v7}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->log(Ljava/lang/String;)V

    .line 221
    .end local v6    # "wifiHeartbeatInterval":I
    :cond_1
    return-wide v1

    .line 189
    .end local v1    # "retVal":J
    .end local v3    # "serverInterval":J
    :pswitch_0
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getActiveHeartbeatInterval()I

    move-result v7

    int-to-long v1, v7

    .line 190
    .restart local v1    # "retVal":J
    goto :goto_0

    .line 192
    .end local v1    # "retVal":J
    :pswitch_1
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getIdleHeartbeatInterval()I

    move-result v7

    int-to-long v1, v7

    .line 193
    .restart local v1    # "retVal":J
    goto :goto_0

    .line 195
    .end local v1    # "retVal":J
    :pswitch_2
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getSyncHeartbeatInterval()I

    move-result v7

    int-to-long v1, v7

    .line 196
    .restart local v1    # "retVal":J
    goto :goto_0

    .line 187
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private computeHeartbeatType()Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    .locals 5

    .prologue
    .line 151
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->getDefaultImSessionImpl()Lcom/google/android/gtalkservice/ImSession;

    move-result-object v0

    .line 152
    .local v0, "imSession":Lcom/google/android/gtalkservice/ImSession;
    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v1

    .line 155
    .local v1, "presence":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 157
    invoke-virtual {v1}, Lcom/google/android/gtalkservice/Presence;->getShow()Lcom/google/android/gtalkservice/Presence$Show;

    move-result-object v3

    .line 158
    .local v3, "show":Lcom/google/android/gtalkservice/Presence$Show;
    sget-object v4, Lcom/google/android/gtalkservice/Presence$Show;->AWAY:Lcom/google/android/gtalkservice/Presence$Show;

    if-eq v3, v4, :cond_0

    sget-object v4, Lcom/google/android/gtalkservice/Presence$Show;->EXTENDED_AWAY:Lcom/google/android/gtalkservice/Presence$Show;

    if-ne v3, v4, :cond_1

    .line 159
    :cond_0
    sget-object v2, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;->IDLE:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;

    .line 171
    .end local v3    # "show":Lcom/google/android/gtalkservice/Presence$Show;
    .local v2, "retVal":Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    :goto_0
    return-object v2

    .line 161
    .end local v2    # "retVal":Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    .restart local v3    # "show":Lcom/google/android/gtalkservice/Presence$Show;
    :cond_1
    sget-object v2, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;->ACTIVE:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;

    .restart local v2    # "retVal":Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    goto :goto_0

    .line 164
    .end local v2    # "retVal":Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    .end local v3    # "show":Lcom/google/android/gtalkservice/Presence$Show;
    :cond_2
    iget-object v4, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/service/GTalkService;->isAutoSyncEnabled()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 165
    sget-object v2, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;->SYNC:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;

    .restart local v2    # "retVal":Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    goto :goto_0

    .line 167
    .end local v2    # "retVal":Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    :cond_3
    sget-object v2, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;->NOSYNC:Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;

    .restart local v2    # "retVal":Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm$HeartbeatType;
    goto :goto_0
.end method

.method private getHeartbeatAckInterval()I
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccount()Lcom/google/android/gtalkservice/Account;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/Account;->getHeartbeatAckTimeout()I

    move-result v0

    return v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 386
    const-string v0, "GTalkService/c"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[HeartbeatAlarm] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    return-void
.end method

.method private resetHeartbeatTimer()V
    .locals 0

    .prologue
    .line 323
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->cancelAlarm()V

    .line 324
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->setAlarm()V

    .line 325
    return-void
.end method

.method private setAlarm()V
    .locals 7

    .prologue
    .line 126
    iget-wide v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mTimer:J

    .line 128
    .local v0, "oldTimer":J
    iget-boolean v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mWaitingForAck:Z

    if-eqz v2, :cond_1

    .line 129
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->getHeartbeatAckInterval()I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mTimer:J

    .line 136
    :goto_0
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mTimer:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 137
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setAlarm: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mTimer:J

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "s from now"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->log(Ljava/lang/String;)V

    .line 140
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mTimer:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mNextAlarmTime:J

    .line 141
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mAlarmManager:Landroid/app/AlarmManager;

    const/4 v3, 0x2

    iget-wide v4, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mNextAlarmTime:J

    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmSender:Landroid/app/PendingIntent;

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 144
    return-void

    .line 131
    :cond_1
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->computeHeartbeatInterval()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatInterval:J

    iput-wide v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mTimer:J

    .line 133
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getHeartbeatStat()Lorg/jivesoftware/smack/packet/HeartbeatStat;

    move-result-object v2

    iget-wide v3, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatInterval:J

    iput-wide v3, v2, Lorg/jivesoftware/smack/packet/HeartbeatStat;->interval:J

    goto :goto_0
.end method


# virtual methods
.method public clearAlarm()V
    .locals 1

    .prologue
    .line 237
    monitor-enter p0

    .line 238
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmIntent:Landroid/content/Intent;

    if-eqz v0, :cond_2

    .line 239
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    const-string v0, "clearAlarm"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->log(Ljava/lang/String;)V

    .line 241
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->cancelAlarm()V

    .line 242
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 243
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmIntent:Landroid/content/Intent;

    .line 244
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmSender:Landroid/app/PendingIntent;

    invoke-virtual {v0}, Landroid/app/PendingIntent;->cancel()V

    .line 245
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmSender:Landroid/app/PendingIntent;

    .line 246
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 247
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mWaitingForAck:Z

    .line 251
    :cond_1
    :goto_0
    monitor-exit p0

    .line 252
    return-void

    .line 248
    :cond_2
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_1

    .line 249
    const-string v0, "clearAlarm: alarm not set!"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 251
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public dump(Ljava/io/PrintWriter;)V
    .locals 11
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    const-wide/16 v9, 0x0

    const-wide/16 v7, 0x3e8

    .line 363
    const-string v4, "Heartbeat"

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 364
    const-string v4, "---------"

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 365
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Heartbeat interval: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatInterval:J

    div-long/2addr v5, v7

    invoke-static {v5, v6}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 366
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "heartbeat type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mUseWifiHeartbeatInterval:Z

    if-eqz v5, :cond_1

    const-string v5, "wifi"

    :goto_0
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 367
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Current timer: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mTimer:J

    div-long/2addr v5, v7

    invoke-static {v5, v6}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 368
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "WaitingForAck: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mWaitingForAck:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 370
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 371
    .local v2, "now":J
    iget-wide v4, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mNextAlarmTime:J

    sub-long/2addr v4, v2

    div-long v0, v4, v7

    .line 372
    .local v0, "diff":J
    cmp-long v4, v0, v9

    if-lez v4, :cond_2

    .line 373
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Next heartbeat alarm will trigger in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0, v1}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 379
    :goto_1
    iget-wide v4, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mResetConnectionTs:J

    cmp-long v4, v4, v9

    if-lez v4, :cond_0

    .line 380
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Heartbeat reset connection "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mResetConnectionTs:J

    sub-long v5, v2, v5

    div-long/2addr v5, v7

    invoke-static {v5, v6}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ago"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 383
    :cond_0
    return-void

    .line 366
    .end local v0    # "diff":J
    .end local v2    # "now":J
    :cond_1
    const-string v5, "cell"

    goto/16 :goto_0

    .line 376
    .restart local v0    # "diff":J
    .restart local v2    # "now":J
    :cond_2
    const-string v4, "No heartbeat alarm set"

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public markPacketReception()V
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmIntent:Landroid/content/Intent;

    if-eqz v0, :cond_1

    .line 337
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mWaitingForAck:Z

    if-eqz v0, :cond_0

    .line 338
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mWaitingForAck:Z

    .line 340
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->resetHeartbeatTimer()V

    .line 341
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendDeviceIdleIfInactive()V

    .line 343
    :cond_1
    return-void
.end method

.method public markPacketTransmission()V
    .locals 0

    .prologue
    .line 360
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 263
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->acquireSimpleWakeLock()V

    .line 265
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 266
    :cond_0
    const-string v0, "GTalkService"

    const-string v1, "Ignoring attempt to send heartbeat on dead connection."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseSimpleWakeLock()V

    .line 303
    :goto_0
    return-void

    .line 270
    :cond_1
    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mWaitingForAck:Z

    if-eqz v0, :cond_3

    .line 271
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_2

    .line 272
    const-string v0, "reset connection, heartbeat timeout!"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->log(Ljava/lang/String;)V

    .line 275
    :cond_2
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->setConnectionError(I)V

    .line 278
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    new-instance v1, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->addConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V

    .line 283
    iget-wide v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatInterval:J

    long-to-int v0, v0

    div-int/lit16 v0, v0, 0x3e8

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    iget v1, v1, Lcom/google/android/gtalkservice/GTalkConnection;->mLastBroadcastNetworkType:I

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/XMPPConnection;->getHostIpAddress()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/google/android/gtalkservice/LogTag;->logHeartbeatReset(IILjava/lang/String;)V

    .line 288
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getHeartbeatStat()Lorg/jivesoftware/smack/packet/HeartbeatStat;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lorg/jivesoftware/smack/packet/HeartbeatStat;->timeout:Z

    .line 290
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    new-instance v1, Ljava/io/IOException;

    const-string v2, "GTalkHeartbeatAlarm timed out waiting for ack"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->resetConnection(Ljava/lang/Exception;)V

    .line 292
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mResetConnectionTs:J

    .line 294
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->clearAlarm()V

    .line 295
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mWaitingForAck:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 301
    :goto_1
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseSimpleWakeLock()V

    goto :goto_0

    .line 297
    :cond_3
    :try_start_2
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->sendHeartbeatToServer()V

    .line 298
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->sendDeviceIdleIfInactive()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 301
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseSimpleWakeLock()V

    throw v0
.end method

.method public sendHeartbeatToServer()V
    .locals 2

    .prologue
    .line 308
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    .line 309
    const-string v0, "sent heartbeat to server"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->log(Ljava/lang/String;)V

    .line 311
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->maybeSendHeartbeat(I)V

    .line 312
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mWaitingForAck:Z

    .line 313
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->resetHeartbeatTimer()V

    .line 314
    return-void
.end method

.method public setConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 0
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mConnection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 92
    return-void
.end method

.method public startAlarm()V
    .locals 4

    .prologue
    const-string v0, "com.google.android.intent.action.GTALK_HEARTBEAT"

    .line 98
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mResetConnectionTs:J

    .line 100
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmIntent:Landroid/content/Intent;

    if-eqz v0, :cond_1

    .line 101
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_0

    const-string v0, "startAlarm: already started, bail"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->log(Ljava/lang/String;)V

    .line 120
    :cond_0
    :goto_0
    return-void

    .line 105
    :cond_1
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebugConnection:Z

    if-eqz v0, :cond_2

    const-string v0, "startAlarm"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->log(Ljava/lang/String;)V

    .line 107
    :cond_2
    monitor-enter p0

    .line 108
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mWaitingForAck:Z

    .line 110
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.google.android.intent.action.GTALK_HEARTBEAT"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 111
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.intent.action.GTALK_HEARTBEAT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmIntent:Landroid/content/Intent;

    .line 112
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmIntent:Landroid/content/Intent;

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->mHeartbeatAlarmSender:Landroid/app/PendingIntent;

    .line 118
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkHeartbeatAlarm;->setAlarm()V

    .line 119
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
