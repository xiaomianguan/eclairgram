.class public Lcom/google/android/talk/PreferencesActivity;
.super Landroid/preference/PreferenceActivity;
.source "PreferencesActivity.java"


# static fields
.field private static final CONFIRM_CLEAR_SEARCH_HISTORY_DIALOG:I = 0x3

.field private static final KEY_AUTO_LOGIN:Ljava/lang/String; = "gtalk-auto-login"

.field private static final KEY_ENABLE_NOTIFICATIONS:Ljava/lang/String; = "gtalk-enable-notifications"

.field private static final KEY_MOBILE_INDICATOR:Ljava/lang/String; = "gtalk-mobile-indicator"

.field private static final KEY_SHOW_AWAY_ON_IDLE:Ljava/lang/String; = "gtalk-show-away-on-idle"

.field private static final KEY_VIBRATE:Ljava/lang/String; = "gtalk-vibrate"


# instance fields
.field private mProviderId:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method private setInitialValues()V
    .locals 7

    .prologue
    .line 56
    new-instance v0, Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {p0}, Lcom/google/android/talk/PreferencesActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/talk/PreferencesActivity;->mProviderId:J

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Landroid/provider/Im$ProviderSettings$QueryMap;-><init>(Landroid/content/ContentResolver;JZLandroid/os/Handler;)V

    .line 62
    .local v0, "settings":Landroid/provider/Im$ProviderSettings$QueryMap;
    const-string v1, "gtalk-auto-login"

    invoke-virtual {p0, v1}, Lcom/google/android/talk/PreferencesActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    check-cast v6, Landroid/preference/CheckBoxPreference;

    .line 63
    .local v6, "pref":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getAutomaticallyConnectToGTalkServer()Z

    move-result v1

    invoke-virtual {v6, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 65
    const-string v1, "gtalk-mobile-indicator"

    invoke-virtual {p0, v1}, Lcom/google/android/talk/PreferencesActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    .end local v6    # "pref":Landroid/preference/CheckBoxPreference;
    check-cast v6, Landroid/preference/CheckBoxPreference;

    .line 66
    .restart local v6    # "pref":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getShowMobileIndicator()Z

    move-result v1

    invoke-virtual {v6, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 68
    const-string v1, "gtalk-enable-notifications"

    invoke-virtual {p0, v1}, Lcom/google/android/talk/PreferencesActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    .end local v6    # "pref":Landroid/preference/CheckBoxPreference;
    check-cast v6, Landroid/preference/CheckBoxPreference;

    .line 69
    .restart local v6    # "pref":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getEnableNotification()Z

    move-result v1

    invoke-virtual {v6, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 71
    const-string v1, "gtalk-vibrate"

    invoke-virtual {p0, v1}, Lcom/google/android/talk/PreferencesActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    .end local v6    # "pref":Landroid/preference/CheckBoxPreference;
    check-cast v6, Landroid/preference/CheckBoxPreference;

    .line 72
    .restart local v6    # "pref":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getVibrate()Z

    move-result v1

    invoke-virtual {v6, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 74
    const-string v1, "gtalk-show-away-on-idle"

    invoke-virtual {p0, v1}, Lcom/google/android/talk/PreferencesActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    .end local v6    # "pref":Landroid/preference/CheckBoxPreference;
    check-cast v6, Landroid/preference/CheckBoxPreference;

    .line 75
    .restart local v6    # "pref":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->getShowAwayOnIdle()Z

    move-result v1

    invoke-virtual {v6, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 77
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->close()V

    .line 78
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 45
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 46
    const/high16 v0, 0x7f040000

    invoke-virtual {p0, v0}, Lcom/google/android/talk/PreferencesActivity;->addPreferencesFromResource(I)V

    .line 47
    invoke-virtual {p0}, Lcom/google/android/talk/PreferencesActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "providerId"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/talk/PreferencesActivity;->mProviderId:J

    .line 48
    iget-wide v0, p0, Lcom/google/android/talk/PreferencesActivity;->mProviderId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 49
    const-string v0, "talk"

    const-string v1, "PreferencesActivity intent requires provider id extra"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "PreferencesActivity must be created with an provider id"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/PreferencesActivity;->setInitialValues()V

    .line 53
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 115
    packed-switch p1, :pswitch_data_0

    .line 130
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    .line 117
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f06009a

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f06009b

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    new-instance v2, Lcom/google/android/talk/PreferencesActivity$1;

    invoke-direct {v2, p0}, Lcom/google/android/talk/PreferencesActivity$1;-><init>(Lcom/google/android/talk/PreferencesActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    .line 115
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 9
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v8, 0x1

    const/4 v4, 0x0

    .line 82
    instance-of v1, p2, Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_5

    .line 83
    new-instance v0, Landroid/provider/Im$ProviderSettings$QueryMap;

    invoke-virtual {p0}, Lcom/google/android/talk/PreferencesActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/talk/PreferencesActivity;->mProviderId:J

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Landroid/provider/Im$ProviderSettings$QueryMap;-><init>(Landroid/content/ContentResolver;JZLandroid/os/Handler;)V

    .line 87
    .local v0, "settings":Landroid/provider/Im$ProviderSettings$QueryMap;
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v6

    .line 88
    .local v6, "key":Ljava/lang/String;
    check-cast p2, Landroid/preference/CheckBoxPreference;

    .end local p2    # "preference":Landroid/preference/Preference;
    invoke-virtual {p2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v7

    .line 90
    .local v7, "value":Z
    const-string v1, "gtalk-auto-login"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 91
    invoke-virtual {v0, v7}, Landroid/provider/Im$ProviderSettings$QueryMap;->setAutomaticallyConnectToGTalkServer(Z)V

    .line 102
    :cond_0
    :goto_0
    invoke-virtual {v0}, Landroid/provider/Im$ProviderSettings$QueryMap;->close()V

    move v1, v8

    .line 110
    .end local v0    # "settings":Landroid/provider/Im$ProviderSettings$QueryMap;
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "value":Z
    :goto_1
    return v1

    .line 92
    .restart local v0    # "settings":Landroid/provider/Im$ProviderSettings$QueryMap;
    .restart local v6    # "key":Ljava/lang/String;
    .restart local v7    # "value":Z
    :cond_1
    const-string v1, "gtalk-enable-notifications"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 93
    invoke-virtual {v0, v7}, Landroid/provider/Im$ProviderSettings$QueryMap;->setEnableNotification(Z)V

    goto :goto_0

    .line 94
    :cond_2
    const-string v1, "gtalk-vibrate"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 95
    invoke-virtual {v0, v7}, Landroid/provider/Im$ProviderSettings$QueryMap;->setVibrate(Z)V

    goto :goto_0

    .line 96
    :cond_3
    const-string v1, "gtalk-mobile-indicator"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 97
    invoke-virtual {v0, v7}, Landroid/provider/Im$ProviderSettings$QueryMap;->setShowMobileIndicator(Z)V

    goto :goto_0

    .line 98
    :cond_4
    const-string v1, "gtalk-show-away-on-idle"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 99
    invoke-virtual {v0, v7}, Landroid/provider/Im$ProviderSettings$QueryMap;->setShowAwayOnIdle(Z)V

    goto :goto_0

    .line 105
    .end local v0    # "settings":Landroid/provider/Im$ProviderSettings$QueryMap;
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "value":Z
    .restart local p2    # "preference":Landroid/preference/Preference;
    :cond_5
    const-string v1, "pref_gtalk_clear_history_key"

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 106
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lcom/google/android/talk/PreferencesActivity;->showDialog(I)V

    move v1, v8

    .line 107
    goto :goto_1

    :cond_6
    move v1, v4

    .line 110
    goto :goto_1
.end method
