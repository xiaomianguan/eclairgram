.class public Lcom/google/android/datamessaging/DataMessagingService;
.super Ljava/lang/Object;
.source "DataMessagingService.java"


# static fields
.field public static final EXTRA_REMOTE_INTENT_FROM_ADDRESS:Ljava/lang/String; = "from"

.field public static final EXTRA_REMOTE_INTENT_FROM_TRUSTED_SERVER:Ljava/lang/String; = "android.intent.extra.from_trusted_server"

.field public static final EXTRA_REMOTE_INTENT_TO_ADDRESS:Ljava/lang/String; = "account"

.field private static final LOG_TAG:Ljava/lang/String; = "DataMessagingService"

.field public static final PUSH_MESSAGING_EXTRA_ERROR:Ljava/lang/String; = "android.intent.extra.push_message_error"

.field public static final PUSH_MESSAGING_REGISTRATION_RESULT_ACTION:Ljava/lang/String; = "android.intent.action.push_message_reg_result"

.field public static final PUSH_MESSAGING_REGISTRATION_RESULT_EXTRA:Ljava/lang/String; = "android.intent.extra.push_message_reg_token"

.field public static final PUSH_MESSAGING_REMOVE_REGISTRATION_RESULT_EXTRA:Ljava/lang/String; = "android.intent.extra.push_message_removed_reg"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mService:Lcom/google/android/datamessaging/IDataMessagingService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/IBinder;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Lcom/google/android/datamessaging/DataMessagingService;->mContext:Landroid/content/Context;

    .line 87
    invoke-static {p2}, Lcom/google/android/datamessaging/IDataMessagingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/datamessaging/IDataMessagingService;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/datamessaging/DataMessagingService;->mService:Lcom/google/android/datamessaging/IDataMessagingService;

    .line 88
    return-void
.end method

.method private createPendingIntent()Landroid/app/PendingIntent;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 94
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingService;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-static {v0, v2, v1, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public static createPushMessagingRegistrationErrorIntent(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .param p0, "intentCategory"    # Ljava/lang/String;
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 167
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.push_message_reg_result"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 168
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 169
    const-string v1, "android.intent.extra.push_message_error"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    return-object v0
.end method

.method private sendErrorIntent(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/google/android/datamessaging/DataMessagingService;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 175
    return-void
.end method


# virtual methods
.method public registerForPushMessaging(Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .param p1, "developerId"    # Ljava/lang/String;
    .param p2, "extraParams"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 128
    invoke-direct {p0}, Lcom/google/android/datamessaging/DataMessagingService;->createPendingIntent()Landroid/app/PendingIntent;

    move-result-object v0

    .line 130
    .local v0, "pIntent":Landroid/app/PendingIntent;
    iget-object v1, p0, Lcom/google/android/datamessaging/DataMessagingService;->mService:Lcom/google/android/datamessaging/IDataMessagingService;

    if-nez v1, :cond_0

    .line 131
    invoke-virtual {v0}, Landroid/app/PendingIntent;->getTargetPackage()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError;->SERVICE_NOT_RUNNING:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual {v2}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/datamessaging/DataMessagingService;->createPushMessagingRegistrationErrorIntent(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/datamessaging/DataMessagingService;->sendErrorIntent(Landroid/content/Intent;)V

    .line 137
    :goto_0
    return-void

    .line 136
    :cond_0
    iget-object v1, p0, Lcom/google/android/datamessaging/DataMessagingService;->mService:Lcom/google/android/datamessaging/IDataMessagingService;

    invoke-interface {v1, v0, p1, p2}, Lcom/google/android/datamessaging/IDataMessagingService;->registerForPushMessaging(Landroid/app/PendingIntent;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0
.end method

.method public unregisterForPushMessaging()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 154
    invoke-direct {p0}, Lcom/google/android/datamessaging/DataMessagingService;->createPendingIntent()Landroid/app/PendingIntent;

    move-result-object v0

    .line 156
    .local v0, "pIntent":Landroid/app/PendingIntent;
    iget-object v1, p0, Lcom/google/android/datamessaging/DataMessagingService;->mService:Lcom/google/android/datamessaging/IDataMessagingService;

    if-nez v1, :cond_0

    .line 157
    invoke-virtual {v0}, Landroid/app/PendingIntent;->getTargetPackage()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/google/android/datamessaging/DataMessagingError;->SERVICE_NOT_RUNNING:Lcom/google/android/datamessaging/DataMessagingError;

    invoke-virtual {v2}, Lcom/google/android/datamessaging/DataMessagingError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/datamessaging/DataMessagingService;->createPushMessagingRegistrationErrorIntent(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/datamessaging/DataMessagingService;->sendErrorIntent(Landroid/content/Intent;)V

    .line 163
    :goto_0
    return-void

    .line 162
    :cond_0
    iget-object v1, p0, Lcom/google/android/datamessaging/DataMessagingService;->mService:Lcom/google/android/datamessaging/IDataMessagingService;

    invoke-interface {v1, v0}, Lcom/google/android/datamessaging/IDataMessagingService;->unregisterForPushMessaging(Landroid/app/PendingIntent;)V

    goto :goto_0
.end method
