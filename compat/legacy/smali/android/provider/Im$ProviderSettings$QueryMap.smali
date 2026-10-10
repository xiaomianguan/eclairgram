.class public Landroid/provider/Im$ProviderSettings$QueryMap;
.super Landroid/content/ContentQueryMap;
.source "Im.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Im$ProviderSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueryMap"
.end annotation


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mProviderId:J


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;JZLandroid/os/Handler;)V
    .registers 13
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;
    .param p2, "providerId"    # J
    .param p4, "keepUpdated"    # Z
    .param p5, "handlerForUpdateNotifications"    # Landroid/os/Handler;

    .prologue
    const/4 v4, 0x0

    const-string v6, "name"

    .line 1903
    sget-object v1, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "name"

    aput-object v6, v2, v0

    const/4 v0, 0x1

    const-string v3, "value"

    aput-object v3, v2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "provider="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p1

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    const-string v1, "name"

    invoke-direct {p0, v0, v6, p4, p5}, Landroid/content/ContentQueryMap;-><init>(Landroid/database/Cursor;Ljava/lang/String;ZLandroid/os/Handler;)V

    .line 1909
    iput-object p1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    .line 1910
    iput-wide p2, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    .line 1911
    return-void
.end method

.method private getBoolean(Ljava/lang/String;Z)Z
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # Z

    .prologue
    .line 2108
    invoke-virtual {p0, p1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v0

    .line 2109
    .local v0, "values":Landroid/content/ContentValues;
    if-eqz v0, :cond_11

    const-string v1, "value"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    :goto_10
    return v1

    :cond_11
    move v1, p2

    goto :goto_10
.end method

.method private getInteger(Ljava/lang/String;I)I
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # I

    .prologue
    .line 2134
    invoke-virtual {p0, p1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v0

    .line 2135
    .local v0, "values":Landroid/content/ContentValues;
    if-eqz v0, :cond_11

    const-string v1, "value"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_10
    return v1

    :cond_11
    move v1, p2

    goto :goto_10
.end method

.method private getLong(Ljava/lang/String;J)J
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # J

    .prologue
    .line 2147
    invoke-virtual {p0, p1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v0

    .line 2148
    .local v0, "values":Landroid/content/ContentValues;
    if-eqz v0, :cond_11

    const-string v1, "value"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    :goto_10
    return-wide v1

    :cond_11
    move-wide v1, p2

    goto :goto_10
.end method

.method private getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # Ljava/lang/String;

    .prologue
    .line 2121
    invoke-virtual {p0, p1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v0

    .line 2122
    .local v0, "values":Landroid/content/ContentValues;
    if-eqz v0, :cond_d

    const-string v1, "value"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_c
    return-object v1

    :cond_d
    move-object v1, p2

    goto :goto_c
.end method


# virtual methods
.method public getAutomaticallyConnectToGTalkServer()Z
    .registers 3

    .prologue
    .line 1928
    const-string v0, "gtalk_auto_connect"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getEnableNotification()Z
    .registers 3

    .prologue
    .line 1967
    const-string v0, "enable_notification"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getHeartbeatInterval()J
    .registers 4

    .prologue
    .line 2079
    const-string v0, "heartbeat_interval"

    const-wide/16 v1, 0x0

    invoke-direct {p0, v0, v1, v2}, Landroid/provider/Im$ProviderSettings$QueryMap;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHideOfflineContacts()Z
    .registers 3

    .prologue
    .line 1948
    const-string v0, "hide_offline_contacts"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getJidResource()Ljava/lang/String;
    .registers 3

    .prologue
    .line 2096
    const-string v0, "jid_resource"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRingtoneURI()Ljava/lang/String;
    .registers 3

    .prologue
    .line 2004
    const-string v0, "ringtone"

    const-string v1, "content://settings/system/notification_sound"

    invoke-direct {p0, v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShowAwayOnIdle()Z
    .registers 3

    .prologue
    .line 2041
    const-string v0, "show_away_on_idle"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getShowMobileIndicator()Z
    .registers 3

    .prologue
    .line 2022
    const-string v0, "mobile_indicator"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getUploadHeartbeatStat()Z
    .registers 3

    .prologue
    .line 2060
    const-string v0, "upload_heartbeat_stat"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getVibrate()Z
    .registers 3

    .prologue
    .line 1986
    const-string v0, "vibrate"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public setAutomaticallyConnectToGTalkServer(Z)V
    .registers 5
    .param p1, "autoConnect"    # Z

    .prologue
    .line 1919
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1}, Landroid/provider/Im$ProviderSettings;->setAutomaticallyConnectGTalk(Landroid/content/ContentResolver;JZ)V

    .line 1921
    return-void
.end method

.method public setEnableNotification(Z)V
    .registers 5
    .param p1, "enable"    # Z

    .prologue
    .line 1958
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1}, Landroid/provider/Im$ProviderSettings;->setEnableNotification(Landroid/content/ContentResolver;JZ)V

    .line 1959
    return-void
.end method

.method public setHeartbeatInterval(J)V
    .registers 6
    .param p1, "interval"    # J

    .prologue
    .line 2070
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1, p2}, Landroid/provider/Im$ProviderSettings;->setHeartbeatInterval(Landroid/content/ContentResolver;JJ)V

    .line 2071
    return-void
.end method

.method public setHideOfflineContacts(Z)V
    .registers 5
    .param p1, "hideOfflineContacts"    # Z

    .prologue
    .line 1938
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1}, Landroid/provider/Im$ProviderSettings;->setHideOfflineContacts(Landroid/content/ContentResolver;JZ)V

    .line 1940
    return-void
.end method

.method public setJidResource(Ljava/lang/String;)V
    .registers 5
    .param p1, "jidResource"    # Ljava/lang/String;

    .prologue
    .line 2088
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1}, Landroid/provider/Im$ProviderSettings;->setJidResource(Landroid/content/ContentResolver;JLjava/lang/String;)V

    .line 2089
    return-void
.end method

.method public setRingtoneURI(Ljava/lang/String;)V
    .registers 5
    .param p1, "ringtoneUri"    # Ljava/lang/String;

    .prologue
    .line 1995
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1}, Landroid/provider/Im$ProviderSettings;->setRingtoneURI(Landroid/content/ContentResolver;JLjava/lang/String;)V

    .line 1996
    return-void
.end method

.method public setShowAwayOnIdle(Z)V
    .registers 5
    .param p1, "showAway"    # Z

    .prologue
    .line 2032
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1}, Landroid/provider/Im$ProviderSettings;->setShowAwayOnIdle(Landroid/content/ContentResolver;JZ)V

    .line 2033
    return-void
.end method

.method public setShowMobileIndicator(Z)V
    .registers 5
    .param p1, "showMobile"    # Z

    .prologue
    .line 2013
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1}, Landroid/provider/Im$ProviderSettings;->setShowMobileIndicator(Landroid/content/ContentResolver;JZ)V

    .line 2014
    return-void
.end method

.method public setUploadHeartbeatStat(Z)V
    .registers 5
    .param p1, "uploadStat"    # Z

    .prologue
    .line 2051
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1}, Landroid/provider/Im$ProviderSettings;->setUploadHeartbeatStat(Landroid/content/ContentResolver;JZ)V

    .line 2052
    return-void
.end method

.method public setVibrate(Z)V
    .registers 5
    .param p1, "vibrate"    # Z

    .prologue
    .line 1977
    iget-object v0, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mContentResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Landroid/provider/Im$ProviderSettings$QueryMap;->mProviderId:J

    invoke-static {v0, v1, v2, p1}, Landroid/provider/Im$ProviderSettings;->setVibrate(Landroid/content/ContentResolver;JZ)V

    .line 1978
    return-void
.end method
