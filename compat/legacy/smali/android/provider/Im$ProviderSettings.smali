.class public Landroid/provider/Im$ProviderSettings;
.super Ljava/lang/Object;
.source "Im.java"

# interfaces
.implements Landroid/provider/Im$ProviderSettingsColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Im;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProviderSettings"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/provider/Im$ProviderSettings$QueryMap;
    }
.end annotation


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android-dir/gtalk-providerSettings"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final LAST_RMQ_RECEIVED:Ljava/lang/String; = "last_rmq_rec"

.field public static final SETTING_AUTOMATICALLY_CONNECT_GTALK:Ljava/lang/String; = "gtalk_auto_connect"

.field public static final SETTING_AUTOMATICALLY_START_SERVICE:Ljava/lang/String; = "auto_start_service"

.field public static final SETTING_ENABLE_NOTIFICATION:Ljava/lang/String; = "enable_notification"

.field public static final SETTING_HEARTBEAT_INTERVAL:Ljava/lang/String; = "heartbeat_interval"

.field public static final SETTING_HIDE_OFFLINE_CONTACTS:Ljava/lang/String; = "hide_offline_contacts"

.field public static final SETTING_JID_RESOURCE:Ljava/lang/String; = "jid_resource"

.field public static final SETTING_RINGTONE:Ljava/lang/String; = "ringtone"

.field public static final SETTING_RINGTONE_DEFAULT:Ljava/lang/String; = "content://settings/system/notification_sound"

.field public static final SETTING_SHOW_AWAY_ON_IDLE:Ljava/lang/String; = "show_away_on_idle"

.field public static final SETTING_SHOW_MOBILE_INDICATOR:Ljava/lang/String; = "mobile_indicator"

.field public static final SETTING_UPLOAD_HEARTBEAT_STAT:Ljava/lang/String; = "upload_heartbeat_stat"

.field public static final SETTING_VIBRATE:Ljava/lang/String; = "vibrate"

.field public static final SHOW_OFFLINE_CONTACTS:Ljava/lang/String; = "show_offline_contacts"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1598
    const-string v0, "content://com.google.android.providers.talk/providerSettings"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1592
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1593
    return-void
.end method

.method public static getBooleanValue(Landroid/content/ContentResolver;JLjava/lang/String;)Z
    .registers 8
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "settingName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1711
    const/4 v1, 0x0

    .line 1712
    .local v1, "ret":Z
    invoke-static {p0, p1, p2, p3}, Landroid/provider/Im$ProviderSettings;->getSettingValue(Landroid/content/ContentResolver;JLjava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1713
    .local v0, "c":Landroid/database/Cursor;
    if-eqz v0, :cond_13

    .line 1714
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-eqz v2, :cond_14

    const/4 v2, 0x1

    move v1, v2

    .line 1715
    :goto_10
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 1717
    :cond_13
    return v1

    :cond_14
    move v1, v3

    .line 1714
    goto :goto_10
.end method

.method private static getSettingValue(Landroid/content/ContentResolver;JLjava/lang/String;)Landroid/database/Cursor;
    .registers 12
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "settingName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 1721
    sget-object v0, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/String;

    const-string v0, "value"

    aput-object v0, v2, v7

    const-string v3, "name=?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object p3, v4, v7

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1723
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_27

    .line 1724
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_27

    .line 1725
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v0, v5

    .line 1729
    :goto_26
    return-object v0

    :cond_27
    move-object v0, v6

    goto :goto_26
.end method

.method public static getStringValue(Landroid/content/ContentResolver;JLjava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "settingName"    # Ljava/lang/String;

    .prologue
    .line 1692
    const/4 v1, 0x0

    .line 1693
    .local v1, "ret":Ljava/lang/String;
    invoke-static {p0, p1, p2, p3}, Landroid/provider/Im$ProviderSettings;->getSettingValue(Landroid/content/ContentResolver;JLjava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1694
    .local v0, "c":Landroid/database/Cursor;
    if-eqz v0, :cond_f

    .line 1695
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1696
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 1699
    :cond_f
    return-object v1
.end method

.method public static putBooleanValue(Landroid/content/ContentResolver;JLjava/lang/String;Z)V
    .registers 8
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Z

    .prologue
    .line 1760
    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    .line 1761
    .local v0, "v":Landroid/content/ContentValues;
    const-string v1, "provider"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1762
    const-string v1, "name"

    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1763
    const-string v1, "value"

    invoke-static {p4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1765
    sget-object v1, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v1, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 1766
    return-void
.end method

.method public static putLongValue(Landroid/content/ContentResolver;JLjava/lang/String;J)V
    .registers 9
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # J

    .prologue
    .line 1742
    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    .line 1743
    .local v0, "v":Landroid/content/ContentValues;
    const-string v1, "provider"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1744
    const-string v1, "name"

    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1745
    const-string v1, "value"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1747
    sget-object v1, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v1, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 1748
    return-void
.end method

.method public static putStringValue(Landroid/content/ContentResolver;JLjava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 1778
    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    .line 1779
    .local v0, "v":Landroid/content/ContentValues;
    const-string v1, "provider"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1780
    const-string v1, "name"

    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1781
    const-string v1, "value"

    invoke-virtual {v0, v1, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1783
    sget-object v1, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v1, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 1784
    return-void
.end method

.method public static queryProviderSettings(Landroid/content/ContentResolver;J)Ljava/util/HashMap;
    .registers 13
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "J)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v3, 0x0

    .line 1666
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 1668
    .local v7, "settings":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "name"

    aput-object v0, v2, v8

    const-string v0, "value"

    aput-object v0, v2, v9

    .line 1669
    .local v2, "projection":[Ljava/lang/String;
    sget-object v0, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    move-object v0, p0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1670
    .local v6, "c":Landroid/database/Cursor;
    if-nez v6, :cond_24

    move-object v0, v3

    .line 1680
    :goto_23
    return-object v0

    .line 1674
    :cond_24
    :goto_24
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_36

    .line 1675
    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v6, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_24

    .line 1678
    :cond_36
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v0, v7

    .line 1680
    goto :goto_23
.end method

.method public static setAutomaticallyConnectGTalk(Landroid/content/ContentResolver;JZ)V
    .registers 5
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "autoConnect"    # Z

    .prologue
    .line 1795
    const-string v0, "gtalk_auto_connect"

    invoke-static {p0, p1, p2, v0, p3}, Landroid/provider/Im$ProviderSettings;->putBooleanValue(Landroid/content/ContentResolver;JLjava/lang/String;Z)V

    .line 1797
    return-void
.end method

.method public static setEnableNotification(Landroid/content/ContentResolver;JZ)V
    .registers 5
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "enable"    # Z

    .prologue
    .line 1819
    const-string v0, "enable_notification"

    invoke-static {p0, p1, p2, v0, p3}, Landroid/provider/Im$ProviderSettings;->putBooleanValue(Landroid/content/ContentResolver;JLjava/lang/String;Z)V

    .line 1820
    return-void
.end method

.method public static setHeartbeatInterval(Landroid/content/ContentResolver;JJ)V
    .registers 11
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "interval"    # J

    .prologue
    .line 1886
    const-string v3, "heartbeat_interval"

    move-object v0, p0

    move-wide v1, p1

    move-wide v4, p3

    invoke-static/range {v0 .. v5}, Landroid/provider/Im$ProviderSettings;->putLongValue(Landroid/content/ContentResolver;JLjava/lang/String;J)V

    .line 1887
    return-void
.end method

.method public static setHideOfflineContacts(Landroid/content/ContentResolver;JZ)V
    .registers 5
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "hideOfflineContacts"    # Z

    .prologue
    .line 1807
    const-string v0, "hide_offline_contacts"

    invoke-static {p0, p1, p2, v0, p3}, Landroid/provider/Im$ProviderSettings;->putBooleanValue(Landroid/content/ContentResolver;JLjava/lang/String;Z)V

    .line 1809
    return-void
.end method

.method public static setJidResource(Landroid/content/ContentResolver;JLjava/lang/String;)V
    .registers 5
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "jidResource"    # Ljava/lang/String;

    .prologue
    .line 1894
    const-string v0, "jid_resource"

    invoke-static {p0, p1, p2, v0, p3}, Landroid/provider/Im$ProviderSettings;->putStringValue(Landroid/content/ContentResolver;JLjava/lang/String;Ljava/lang/String;)V

    .line 1895
    return-void
.end method

.method public static setRingtoneURI(Landroid/content/ContentResolver;JLjava/lang/String;)V
    .registers 5
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "ringtoneUri"    # Ljava/lang/String;

    .prologue
    .line 1841
    const-string v0, "ringtone"

    invoke-static {p0, p1, p2, v0, p3}, Landroid/provider/Im$ProviderSettings;->putStringValue(Landroid/content/ContentResolver;JLjava/lang/String;Ljava/lang/String;)V

    .line 1842
    return-void
.end method

.method public static setShowAwayOnIdle(Landroid/content/ContentResolver;JZ)V
    .registers 5
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "showAway"    # Z

    .prologue
    .line 1864
    const-string v0, "show_away_on_idle"

    invoke-static {p0, p1, p2, v0, p3}, Landroid/provider/Im$ProviderSettings;->putBooleanValue(Landroid/content/ContentResolver;JLjava/lang/String;Z)V

    .line 1865
    return-void
.end method

.method public static setShowMobileIndicator(Landroid/content/ContentResolver;JZ)V
    .registers 5
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "showMobileIndicator"    # Z

    .prologue
    .line 1852
    const-string v0, "mobile_indicator"

    invoke-static {p0, p1, p2, v0, p3}, Landroid/provider/Im$ProviderSettings;->putBooleanValue(Landroid/content/ContentResolver;JLjava/lang/String;Z)V

    .line 1854
    return-void
.end method

.method public static setUploadHeartbeatStat(Landroid/content/ContentResolver;JZ)V
    .registers 5
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "uploadStat"    # Z

    .prologue
    .line 1875
    const-string v0, "upload_heartbeat_stat"

    invoke-static {p0, p1, p2, v0, p3}, Landroid/provider/Im$ProviderSettings;->putBooleanValue(Landroid/content/ContentResolver;JLjava/lang/String;Z)V

    .line 1876
    return-void
.end method

.method public static setVibrate(Landroid/content/ContentResolver;JZ)V
    .registers 5
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "providerId"    # J
    .param p3, "vibrate"    # Z

    .prologue
    .line 1830
    const-string v0, "vibrate"

    invoke-static {p0, p1, p2, v0, p3}, Landroid/provider/Im$ProviderSettings;->putBooleanValue(Landroid/content/ContentResolver;JLjava/lang/String;Z)V

    .line 1831
    return-void
.end method
