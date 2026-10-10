.class public Lcom/google/android/talk/ImRingtonePreference;
.super Landroid/preference/RingtonePreference;
.source "ImRingtonePreference.java"


# instance fields
.field private mProviderId:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Landroid/preference/RingtonePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 39
    return-void
.end method


# virtual methods
.method protected onRestoreRingtone()Landroid/net/Uri;
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 51
    invoke-virtual {p0}, Lcom/google/android/talk/ImRingtonePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "GTalk"

    invoke-static {v1, v2}, Landroid/provider/Im$Provider;->getProviderIdForName(Landroid/content/ContentResolver;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/talk/ImRingtonePreference;->mProviderId:J

    .line 53
    new-instance v0, Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {p0}, Lcom/google/android/talk/ImRingtonePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/talk/ImRingtonePreference;->mProviderId:J

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Landroid/provider/Im$ProviderSettings$QueryMap;-><init>(Landroid/content/ContentResolver;JZLandroid/os/Handler;)V

    .line 57
    .local v0, "settings":Landroid/provider/Im$ProviderSettings$QueryMap;
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getRingtoneURI()Ljava/lang/String;

    move-result-object v7

    .line 59
    .local v7, "uri":Ljava/lang/String;
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    .line 60
    const-string v1, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRestoreRingtone() finds uri="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " key="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/android/talk/ImRingtonePreference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    :cond_0
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v1, v5

    .line 71
    :goto_0
    return-object v1

    .line 67
    :cond_1
    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 69
    .local v6, "result":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->close()V

    move-object v1, v6

    .line 71
    goto :goto_0
.end method

.method protected onSaveRingtone(Landroid/net/Uri;)V
    .locals 6
    .param p1, "ringtoneUri"    # Landroid/net/Uri;

    .prologue
    .line 76
    new-instance v0, Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {p0}, Lcom/google/android/talk/ImRingtonePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/talk/ImRingtonePreference;->mProviderId:J

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Landroid/provider/Im$ProviderSettings$QueryMap;-><init>(Landroid/content/ContentResolver;JZLandroid/os/Handler;)V

    .line 80
    .local v0, "settings":Landroid/provider/Im$ProviderSettings$QueryMap;
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    .line 81
    const-string v1, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSaveRingtone("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :cond_0
    if-nez p1, :cond_1

    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Landroid/provider/Im$ProviderSettings$QueryMap;->setRingtoneURI(Ljava/lang/String;)V

    .line 86
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->close()V

    .line 87
    return-void

    .line 85
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .locals 1
    .param p1, "restorePersistedValue"    # Z
    .param p2, "defaultValueObj"    # Ljava/lang/Object;

    .prologue
    .line 46
    const/4 v0, 0x1

    invoke-super {p0, v0, p2}, Landroid/preference/RingtonePreference;->onSetInitialValue(ZLjava/lang/Object;)V

    .line 47
    return-void
.end method
