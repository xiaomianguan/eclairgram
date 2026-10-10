.class public Lcom/google/android/talk/SigningInActivity;
.super Landroid/app/Activity;
.source "SigningInActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;,
        Lcom/google/android/talk/SigningInActivity$MyConnectionListener;
    }
.end annotation


# static fields
.field private static final ACCOUNT_QUERY_ID_COLUMN:I = 0x0

.field private static final ACCOUNT_QUERY_PASSWORD_COLUMN:I = 0x3

.field private static final ACCOUNT_QUERY_PROVIDER_COLUMN:I = 0x1

.field private static final ACCOUNT_QUERY_USERNAME_COLUMN:I = 0x2

.field private static final AUTH_ERROR_DIALOG:I = 0x2

.field private static final AUTH_ERROR_MESSAGE:Ljava/lang/String; = "talk:authErrorMessage"

.field private static final BACKGROUND_DATA_DIALOG:I = 0x1

.field protected static final ID_CANCEL_SIGNIN:I = 0x2

.field private static final PROVIDER_PROJECTION:[Ljava/lang/String;

.field static final PROVIDER_QUERY_ACCOUNT_COLUMN:I = 0x1

.field static final PROVIDER_QUERY_CONN_STATUS_COLUMN:I = 0x4

.field static final PROVIDER_QUERY_ID_COLUMN:I = 0x0

.field static final PROVIDER_QUERY_PASSWORD_COLUMN:I = 0x3

.field static final PROVIDER_QUERY_USERNAME_COLUMN:I = 0x2

.field private static final RESULT_CODE_CREATE_ACCOUNT:I = 0x3

.field private static final RESULT_CODE_FAIL:I = 0x0

.field private static final RESULT_CODE_LOGIN:I = 0x1

.field private static final RESULT_CODE_SHOW_BUDDYLIST:I = 0x2

.field private static final SYNC_SETTINGS_ACTION:Ljava/lang/String; = "android.settings.SYNC_SETTINGS"

.field private static final SYNC_SETTINGS_CATEGORY:Ljava/lang/String; = "android.intent.category.DEFAULT"


# instance fields
.field private ACCOUNT_SELECTION:[Ljava/lang/String;

.field private mAccountId:J

.field private mApp:Lcom/google/android/talk/TalkApp;

.field private mAuthErrorMessage:Ljava/lang/String;

.field private mErrorToast:Landroid/widget/Toast;

.field private mHandler:Landroid/os/Handler;

.field private mImSession:Lcom/google/android/gtalkservice/IImSession;

.field private mListener:Lcom/google/android/talk/SigningInActivity$MyConnectionListener;

.field private mLogLevel:I

.field private mPassword:Ljava/lang/String;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mProgressText:Landroid/widget/TextView;

.field private mProviderId:J

.field private mSendToUser:Ljava/lang/String;

.field private mUsername:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 76
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "account_id"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "account_username"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "account_pw"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "account_connStatus"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/SigningInActivity;->PROVIDER_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 51
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 65
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-string v2, "provider"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "username"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "pw"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/google/android/talk/SigningInActivity;->ACCOUNT_SELECTION:[Ljava/lang/String;

    .line 109
    iput v3, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    .line 111
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mHandler:Landroid/os/Handler;

    .line 605
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/talk/SigningInActivity;)Lcom/google/android/talk/TalkApp;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mApp:Lcom/google/android/talk/TalkApp;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/talk/SigningInActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->signInAccount()V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/talk/SigningInActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;

    .prologue
    .line 51
    iget v0, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    return v0
.end method

.method static synthetic access$400(Lcom/google/android/talk/SigningInActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->displayInProgressMode()V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/talk/SigningInActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;
    .param p1, "x1"    # I

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/google/android/talk/SigningInActivity;->showNetworkError(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/android/talk/SigningInActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/google/android/talk/SigningInActivity;->displayPendingConnectMode(Z)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/android/talk/SigningInActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mAuthErrorMessage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$702(Lcom/google/android/talk/SigningInActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/google/android/talk/SigningInActivity;->mAuthErrorMessage:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$800(Lcom/google/android/talk/SigningInActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->promptForAuthError()V

    return-void
.end method

.method static synthetic access$900(Lcom/google/android/talk/SigningInActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SigningInActivity;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->hideNetworkError()V

    return-void
.end method

.method private createAccount(J)V
    .locals 3
    .param p1, "providerId"    # J

    .prologue
    .line 386
    iget v1, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    const-string v1, "createAccount"

    invoke-static {v1}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 388
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 389
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.action.INSERT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 390
    sget-object v1, Landroid/provider/Im$Provider;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 391
    const-string v1, "com.android.im.category.GTALK"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 393
    invoke-virtual {p0, v0}, Lcom/google/android/talk/SigningInActivity;->startActivity(Landroid/content/Intent;)V

    .line 394
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    .line 395
    return-void
.end method

.method private displayInProgressMode()V
    .locals 2

    .prologue
    .line 436
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mProgressText:Landroid/widget/TextView;

    const v1, 0x7f060011

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 437
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mProgressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 438
    return-void
.end method

.method private displayPendingConnectMode(Z)V
    .locals 3
    .param p1, "noNetwork"    # Z

    .prologue
    const/4 v2, 0x1

    .line 421
    iget v0, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    if-lt v0, v2, :cond_0

    .line 422
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "displayPendingConnectMode: showProgress="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-nez p1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 425
    :cond_0
    if-eqz p1, :cond_2

    .line 426
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mProgressText:Landroid/widget/TextView;

    const v1, 0x7f060066

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 431
    :goto_1
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 432
    return-void

    .line 422
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 428
    :cond_2
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mProgressText:Landroid/widget/TextView;

    const v1, 0x7f060065

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1
.end method

.method private gotoChat(Ljava/lang/String;)V
    .locals 5
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 370
    iget v2, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    const/4 v3, 0x1

    if-lt v2, v3, :cond_0

    .line 371
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "gotoChat: start chat for SEND_TO "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 374
    :cond_0
    iget-wide v2, p0, Lcom/google/android/talk/SigningInActivity;->mAccountId:J

    invoke-static {v2, v3, p1}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 375
    .local v1, "uri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 376
    .local v0, "intent":Landroid/content/Intent;
    const-class v2, Lcom/google/android/talk/ChatScreen;

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 377
    const-string v2, "from"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 378
    const-string v2, "providerId"

    iget-wide v3, p0, Lcom/google/android/talk/SigningInActivity;->mProviderId:J

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 379
    const-string v2, "accountId"

    iget-wide v3, p0, Lcom/google/android/talk/SigningInActivity;->mAccountId:J

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 381
    invoke-virtual {p0, v0}, Lcom/google/android/talk/SigningInActivity;->startActivity(Landroid/content/Intent;)V

    .line 382
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    .line 383
    return-void
.end method

.method private hideNetworkError()V
    .locals 1

    .prologue
    .line 595
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mErrorToast:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 596
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mErrorToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 597
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mErrorToast:Landroid/widget/Toast;

    .line 599
    :cond_0
    return-void
.end method

.method private isSignedIn(Landroid/database/Cursor;)Z
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 354
    const/4 v1, 0x4

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 355
    .local v0, "connectionStatus":I
    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 602
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[SigningIn] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 603
    return-void
.end method

.method private promptForAuthError()V
    .locals 1

    .prologue
    .line 412
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SigningInActivity;->showDialog(I)V

    .line 413
    return-void
.end method

.method private promptForBackgroundDataSetting()V
    .locals 1

    .prologue
    .line 405
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SigningInActivity;->showDialog(I)V

    .line 406
    return-void
.end method

.method private resolveIntent(Landroid/content/Intent;)I
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 242
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 243
    .local v1, "uri":Landroid/net/Uri;
    iget v2, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    const/4 v3, 0x1

    if-lt v2, v3, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resolveIntent: url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 247
    :cond_0
    if-nez v1, :cond_1

    .line 249
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->resolveIntentFromLauncher()I

    move-result v0

    .line 257
    .local v0, "retVal":I
    :goto_0
    return v0

    .line 254
    .end local v0    # "retVal":I
    :cond_1
    invoke-direct {p0, p1}, Lcom/google/android/talk/SigningInActivity;->resolveIntentUsingAccountUri(Landroid/content/Intent;)I

    move-result v0

    .restart local v0    # "retVal":I
    goto :goto_0
.end method

.method private resolveIntentFromLauncher()I
    .locals 12

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 309
    iget v0, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    if-lt v0, v8, :cond_0

    const-string v0, "resolveIntentFromLauncher"

    invoke-static {v0}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 311
    :cond_0
    new-array v4, v8, [Ljava/lang/String;

    .line 312
    .local v4, "selectionArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getSupportedProviders()Ljava/util/ArrayList;

    move-result-object v7

    .line 313
    .local v7, "supportedProviders":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    aput-object v0, v4, v9

    .line 315
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Im$Provider;->CONTENT_URI_WITH_ACCOUNT:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/SigningInActivity;->PROVIDER_PROJECTION:[Ljava/lang/String;

    const-string v3, "providers.name=?"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 323
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_1

    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_3

    .line 325
    :cond_1
    const-string v0, "talk"

    const-string v1, "[Signing in] resolveIntentFromLauncher: cannot find provider for Google Talk!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 349
    if-eqz v6, :cond_2

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    move v0, v9

    :goto_0
    return v0

    .line 330
    :cond_3
    const/4 v0, 0x0

    :try_start_1
    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/talk/SigningInActivity;->mProviderId:J

    .line 332
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 333
    iget v0, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    if-lt v0, v8, :cond_4

    .line 334
    const-string v0, "cannot find account for Google Talk, create account..."

    invoke-static {v0}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 349
    :cond_4
    if-eqz v6, :cond_5

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_5
    move v0, v11

    goto :goto_0

    .line 339
    :cond_6
    const/4 v0, 0x1

    :try_start_2
    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/talk/SigningInActivity;->mAccountId:J

    .line 341
    invoke-direct {p0, v6}, Lcom/google/android/talk/SigningInActivity;->isSignedIn(Landroid/database/Cursor;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v0

    if-eqz v0, :cond_8

    .line 349
    if-eqz v6, :cond_7

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_7
    move v0, v10

    goto :goto_0

    .line 344
    :cond_8
    const/4 v0, 0x2

    :try_start_3
    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mUsername:Ljava/lang/String;

    .line 345
    const/4 v0, 0x3

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mPassword:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 349
    if-eqz v6, :cond_9

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_9
    move v0, v8

    goto :goto_0

    :catchall_0
    move-exception v0

    if-eqz v6, :cond_a

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_a
    throw v0
.end method

.method private resolveIntentUsingAccountUri(Landroid/content/Intent;)I
    .locals 11
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const-wide/16 v9, 0x0

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v7, 0x1

    .line 261
    iget v2, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    if-lt v2, v7, :cond_0

    const-string v2, "resolveIntentFromLandingPage"

    invoke-static {v2}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 263
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 276
    .local v1, "uri":Landroid/net/Uri;
    const-string v2, "Send2_U"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/SigningInActivity;->mSendToUser:Ljava/lang/String;

    .line 278
    iget-wide v4, p0, Lcom/google/android/talk/SigningInActivity;->mAccountId:J

    cmp-long v2, v4, v9

    if-lez v2, :cond_1

    iget-wide v4, p0, Lcom/google/android/talk/SigningInActivity;->mProviderId:J

    cmp-long v2, v4, v9

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/google/android/talk/SigningInActivity;->mUsername:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 279
    :cond_1
    iget v2, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    if-lt v2, v7, :cond_2

    .line 280
    const-string v2, "resolveIntentFromLandingPage: query username & pw..."

    invoke-static {v2}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 283
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 284
    .local v0, "cr":Landroid/content/ContentResolver;
    iget-object v2, p0, Lcom/google/android/talk/SigningInActivity;->ACCOUNT_SELECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 291
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_3

    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-nez v2, :cond_5

    .line 292
    :cond_3
    const-string v2, "talk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[SigningInActivity] No data for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 301
    if-eqz v6, :cond_4

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    move v2, v8

    .line 305
    .end local v0    # "cr":Landroid/content/ContentResolver;
    .end local v6    # "c":Landroid/database/Cursor;
    :goto_0
    return v2

    .line 296
    .restart local v0    # "cr":Landroid/content/ContentResolver;
    .restart local v6    # "c":Landroid/database/Cursor;
    :cond_5
    const/4 v2, 0x0

    :try_start_1
    invoke-interface {v6, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/talk/SigningInActivity;->mAccountId:J

    .line 297
    const/4 v2, 0x1

    invoke-interface {v6, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/talk/SigningInActivity;->mProviderId:J

    .line 298
    const/4 v2, 0x2

    invoke-interface {v6, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/SigningInActivity;->mUsername:Ljava/lang/String;

    .line 299
    const/4 v2, 0x3

    invoke-interface {v6, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/SigningInActivity;->mPassword:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 301
    if-eqz v6, :cond_6

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .end local v0    # "cr":Landroid/content/ContentResolver;
    .end local v6    # "c":Landroid/database/Cursor;
    :cond_6
    move v2, v7

    .line 305
    goto :goto_0

    .line 301
    .restart local v0    # "cr":Landroid/content/ContentResolver;
    .restart local v6    # "c":Landroid/database/Cursor;
    :catchall_0
    move-exception v2

    if-eqz v6, :cond_7

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_7
    throw v2
.end method

.method private setupView()V
    .locals 1

    .prologue
    .line 416
    const v0, 0x7f0b003a

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SigningInActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mProgressBar:Landroid/widget/ProgressBar;

    .line 417
    const v0, 0x7f0b003b

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SigningInActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mProgressText:Landroid/widget/TextView;

    .line 418
    return-void
.end method

.method private showBuddyList()V
    .locals 4

    .prologue
    .line 359
    iget v1, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "show BuddyList: account="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/talk/SigningInActivity;->mAccountId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 361
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 362
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/google/android/talk/BuddyList;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 363
    const-string v1, "accountId"

    iget-wide v2, p0, Lcom/google/android/talk/SigningInActivity;->mAccountId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 365
    invoke-virtual {p0, v0}, Lcom/google/android/talk/SigningInActivity;->startActivity(Landroid/content/Intent;)V

    .line 366
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    .line 367
    return-void
.end method

.method private showNetworkError(I)V
    .locals 2
    .param p1, "stringRes"    # I

    .prologue
    const/4 v1, 0x0

    .line 584
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mErrorToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 585
    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mErrorToast:Landroid/widget/Toast;

    .line 590
    :goto_0
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mErrorToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 591
    return-void

    .line 588
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mErrorToast:Landroid/widget/Toast;

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    goto :goto_0
.end method

.method private signInAccount()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const-string v6, "talk"

    .line 445
    :try_start_0
    iget-object v6, p0, Lcom/google/android/talk/SigningInActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v6}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v6

    iget-wide v7, p0, Lcom/google/android/talk/SigningInActivity;->mAccountId:J

    invoke-interface {v6, v7, v8}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v4

    .line 450
    .local v4, "imSession":Lcom/google/android/gtalkservice/IImSession;
    if-nez v4, :cond_7

    .line 451
    iget-object v6, p0, Lcom/google/android/talk/SigningInActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v6}, Lcom/google/android/talk/TalkApp;->getPrimaryGTalkConnection()Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v3

    .line 452
    .local v3, "gtalkSession":Lcom/google/android/gtalkservice/IGTalkConnection;
    if-nez v3, :cond_1

    .line 453
    iget-object v6, p0, Lcom/google/android/talk/SigningInActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v6}, Lcom/google/android/talk/TalkApp;->isBackgroundDataEnabled()Z

    move-result v6

    if-nez v6, :cond_0

    .line 454
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->promptForBackgroundDataSetting()V

    .line 508
    .end local v3    # "gtalkSession":Lcom/google/android/gtalkservice/IGTalkConnection;
    .end local v4    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :goto_0
    return-void

    .line 458
    .restart local v3    # "gtalkSession":Lcom/google/android/gtalkservice/IGTalkConnection;
    .restart local v4    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :cond_0
    const-string v6, "talk"

    const-string v7, "signInAccount: failed to get GTalk connection!"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 505
    .end local v3    # "gtalkSession":Lcom/google/android/gtalkservice/IGTalkConnection;
    .end local v4    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :catch_0
    move-exception v6

    move-object v2, v6

    .line 506
    .local v2, "e":Landroid/os/RemoteException;
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    goto :goto_0

    .line 463
    .end local v2    # "e":Landroid/os/RemoteException;
    .restart local v3    # "gtalkSession":Lcom/google/android/gtalkservice/IGTalkConnection;
    .restart local v4    # "imSession":Lcom/google/android/gtalkservice/IImSession;
    :cond_1
    :try_start_1
    iget-wide v6, p0, Lcom/google/android/talk/SigningInActivity;->mProviderId:J

    invoke-interface {v3, v6, v7}, Lcom/google/android/gtalkservice/IGTalkConnection;->createImSessionForProviderId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v4

    .line 465
    if-nez v4, :cond_2

    .line 466
    const-string v6, "talk"

    const-string v7, "signInAccount: failed to create ImSession!"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    goto :goto_0

    .line 471
    :cond_2
    invoke-interface {v4}, Lcom/google/android/gtalkservice/IImSession;->getAccountId()J

    move-result-wide v0

    .line 472
    .local v0, "accountId":J
    iget v6, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    if-lt v6, v9, :cond_3

    .line 473
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "signInAccount: created ImSession for mProvider="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, p0, Lcom/google/android/talk/SigningInActivity;->mProviderId:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", imSession.accountId="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 477
    :cond_3
    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    if-lez v6, :cond_5

    .line 479
    iget v6, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    if-lt v6, v9, :cond_4

    .line 480
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "signInAccount: logout of existing session for account="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 482
    :cond_4
    invoke-interface {v4}, Lcom/google/android/gtalkservice/IImSession;->logout()V

    .line 499
    .end local v0    # "accountId":J
    .end local v3    # "gtalkSession":Lcom/google/android/gtalkservice/IGTalkConnection;
    :cond_5
    iget-object v6, p0, Lcom/google/android/talk/SigningInActivity;->mListener:Lcom/google/android/talk/SigningInActivity$MyConnectionListener;

    invoke-interface {v4, v6}, Lcom/google/android/gtalkservice/IImSession;->addConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V

    .line 501
    iget v6, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    if-lt v6, v9, :cond_6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "signInAccount: login for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/talk/SigningInActivity;->mUsername:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 502
    :cond_6
    iget-object v6, p0, Lcom/google/android/talk/SigningInActivity;->mUsername:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/talk/SigningInActivity;->mPassword:Ljava/lang/String;

    const/4 v8, 0x1

    invoke-interface {v4, v6, v7, v8}, Lcom/google/android/gtalkservice/IImSession;->login(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 504
    iput-object v4, p0, Lcom/google/android/talk/SigningInActivity;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    goto/16 :goto_0

    .line 486
    :cond_7
    invoke-interface {v4}, Lcom/google/android/gtalkservice/IImSession;->getConnectionState()Lcom/google/android/gtalkservice/ConnectionState;

    move-result-object v5

    .line 487
    .local v5, "state":Lcom/google/android/gtalkservice/ConnectionState;
    invoke-virtual {v5}, Lcom/google/android/gtalkservice/ConnectionState;->isOnline()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 489
    iget v6, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    if-lt v6, v9, :cond_8

    .line 490
    const-string v6, "signInAccount: already online"

    invoke-static {v6}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 492
    :cond_8
    const/4 v6, 0x0

    invoke-virtual {p0, v5, v6}, Lcom/google/android/talk/SigningInActivity;->handleConnectionEvent(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method


# virtual methods
.method handleConnectionEvent(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V
    .locals 2
    .param p1, "state"    # Lcom/google/android/gtalkservice/ConnectionState;
    .param p2, "error"    # Lcom/google/android/gtalkservice/ConnectionError;

    .prologue
    .line 564
    iget v0, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 565
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleConnectionEvent: state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gtalkservice/ConnectionState;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 568
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/ConnectionState;->isOnline()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 570
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->hideNetworkError()V

    .line 572
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mSendToUser:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 573
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mSendToUser:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/talk/SigningInActivity;->gotoChat(Ljava/lang/String;)V

    .line 580
    :goto_0
    return-void

    .line 575
    :cond_1
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->showBuddyList()V

    goto :goto_0

    .line 578
    :cond_2
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;

    invoke-direct {v1, p0, p2}, Lcom/google/android/talk/SigningInActivity$ConnectionErrorCallback;-><init>(Lcom/google/android/talk/SigningInActivity;Lcom/google/android/gtalkservice/ConnectionError;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 124
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 126
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v1

    iput v1, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    .line 127
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mApp:Lcom/google/android/talk/TalkApp;

    .line 129
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/view/Window;->requestFeature(I)Z

    .line 130
    const v1, 0x7f030016

    invoke-virtual {p0, v1}, Lcom/google/android/talk/SigningInActivity;->setContentView(I)V

    .line 131
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->setupView()V

    .line 132
    const v1, 0x7f060010

    invoke-virtual {p0, v1}, Lcom/google/android/talk/SigningInActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/talk/SigningInActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 134
    if-eqz p1, :cond_0

    .line 135
    const-string v1, "talk:authErrorMessage"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mAuthErrorMessage:Ljava/lang/String;

    .line 138
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/talk/SigningInActivity;->resolveIntent(Landroid/content/Intent;)I

    move-result v0

    .line 140
    .local v0, "resultCode":I
    iget v1, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCreate: resolveIntent => "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 142
    :cond_1
    packed-switch v0, :pswitch_data_0

    .line 160
    :pswitch_0
    new-instance v1, Lcom/google/android/talk/SigningInActivity$MyConnectionListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/android/talk/SigningInActivity$MyConnectionListener;-><init>(Lcom/google/android/talk/SigningInActivity;Lcom/google/android/talk/SigningInActivity$1;)V

    iput-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mListener:Lcom/google/android/talk/SigningInActivity$MyConnectionListener;

    .line 161
    iget-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v2, p0, Lcom/google/android/talk/SigningInActivity;->mHandler:Landroid/os/Handler;

    new-instance v3, Lcom/google/android/talk/SigningInActivity$1;

    invoke-direct {v3, p0}, Lcom/google/android/talk/SigningInActivity$1;-><init>(Lcom/google/android/talk/SigningInActivity;)V

    invoke-virtual {v1, v2, v3}, Lcom/google/android/talk/TalkApp;->addServiceStateChangedCallback(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 173
    :goto_0
    return-void

    .line 144
    :pswitch_1
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    goto :goto_0

    .line 148
    :pswitch_2
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->showBuddyList()V

    goto :goto_0

    .line 152
    :pswitch_3
    iget-wide v1, p0, Lcom/google/android/talk/SigningInActivity;->mProviderId:J

    invoke-direct {p0, v1, v2}, Lcom/google/android/talk/SigningInActivity;->createAccount(J)V

    goto :goto_0

    .line 142
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .param p1, "id"    # I

    .prologue
    const v3, 0x1080027

    const/4 v2, 0x0

    .line 512
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 513
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f06005f

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f060060

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f060061

    new-instance v2, Lcom/google/android/talk/SigningInActivity$3;

    invoke-direct {v2, p0}, Lcom/google/android/talk/SigningInActivity$3;-><init>(Lcom/google/android/talk/SigningInActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f060062

    new-instance v2, Lcom/google/android/talk/SigningInActivity$2;

    invoke-direct {v2, p0}, Lcom/google/android/talk/SigningInActivity$2;-><init>(Lcom/google/android/talk/SigningInActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 551
    :goto_0
    return-object v0

    .line 533
    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 534
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f060064

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mAuthErrorMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f06006c

    new-instance v2, Lcom/google/android/talk/SigningInActivity$4;

    invoke-direct {v2, p0}, Lcom/google/android/talk/SigningInActivity$4;-><init>(Lcom/google/android/talk/SigningInActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto :goto_0

    .line 551
    :cond_1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v2, 0x0

    .line 218
    const/4 v0, 0x2

    const v1, 0x7f060012

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080038

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 220
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 225
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 226
    iget-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    .line 228
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-interface {v1}, Lcom/google/android/gtalkservice/IImSession;->logout()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    .line 235
    const/4 v1, 0x1

    .line 237
    :goto_1
    return v1

    .line 229
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 230
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cancel signIn caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 237
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_1
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_1
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 557
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onPrepareDialog(ILandroid/app/Dialog;)V

    .line 558
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 559
    check-cast p2, Landroid/app/AlertDialog;

    .end local p2    # "dialog":Landroid/app/Dialog;
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mAuthErrorMessage:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 561
    :cond_0
    return-void
.end method

.method protected onRestart()V
    .locals 2

    .prologue
    .line 177
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 179
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 180
    invoke-direct {p0}, Lcom/google/android/talk/SigningInActivity;->signInAccount()V

    .line 187
    :goto_0
    return-void

    .line 182
    :cond_0
    iget v0, p0, Lcom/google/android/talk/SigningInActivity;->mLogLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 183
    const-string v0, "onRestart: service disconnected or background data disabled..."

    invoke-static {v0}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 185
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 212
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 213
    const-string v0, "talk:authErrorMessage"

    iget-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mAuthErrorMessage:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    return-void
.end method

.method protected onStop()V
    .locals 4

    .prologue
    .line 191
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 193
    iget-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-eqz v1, :cond_0

    .line 196
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    iget-object v2, p0, Lcom/google/android/talk/SigningInActivity;->mListener:Lcom/google/android/talk/SigningInActivity$MyConnectionListener;

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->removeConnectionStateListener(Lcom/google/android/gtalkservice/IConnectionStateListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/google/android/talk/SigningInActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->isBackgroundDataEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 206
    invoke-virtual {p0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    .line 208
    :cond_1
    return-void

    .line 197
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 198
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[SigningInActivity] onStop caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
