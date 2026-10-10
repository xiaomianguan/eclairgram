.class public Lcom/google/android/talk/TalkApp;
.super Landroid/app/Application;
.source "TalkApp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/TalkApp$AccountInfo;,
        Lcom/google/android/talk/TalkApp$GTalkConnectionListener;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final ACCOUNT_PROJECTION:[Ljava/lang/String;

.field public static final ACCOUNT_USER_KEY:Ljava/lang/String; = "AcctUser"

.field static final DEFAULT_CHAT_EXPIRATION_TIME:J = 0x5265c00L

.field static final DEFAULT_CHAT_MESSAGE_LIFETIME:J = 0x240c8400L

.field static final DEFAULT_OTR_MESSAGE_LIFETIME:J = 0x5265c00L

.field static final EVENT_SERVICE_STATUS_CHANGED:I = 0x64

.field public static final EXTRA_INTENT_SEND_TO_PROVIDER:Ljava/lang/String; = "Send2_P"

.field public static final EXTRA_INTENT_SEND_TO_USER:Ljava/lang/String; = "Send2_U"

.field public static final EXTRA_INTENT_USER_ID:Ljava/lang/String; = "userId"

.field public static final GTALK_CATEGORY:Ljava/lang/String; = "com.android.im.category.GTALK"

.field public static final LOG_LEVEL_DEBUG:I = 0x1

.field public static final LOG_LEVEL_NONE:I = 0x0

.field public static final LOG_LEVEL_VERBOSE:I = 0x2

.field static final NEXT_ACTIVITY_LOGOUT:I = 0x1

.field static final NEXT_ACTIVITY_NONE:I = 0x0

.field static final NEXT_ACTIVITY_RECONNECT:I = 0x2

.field private static final PROVIDER_NAME:Ljava/lang/String; = "GTalk"

.field private static final PROVIDER_PROJECTION:[Ljava/lang/String;

.field static final SUPPORT_AIM:Z

.field private static sTalkApp:Lcom/google/android/talk/TalkApp;


# instance fields
.field mAndroidConnectionIconForChat:Landroid/graphics/drawable/Drawable;

.field mAvailablePresenceIcon:Landroid/graphics/drawable/Drawable;

.field mAwayPresenceIcon:Landroid/graphics/drawable/Drawable;

.field mBusyPresenceIcon:Landroid/graphics/drawable/Drawable;

.field private mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

.field public mChatStatusIcon:Landroid/graphics/drawable/Drawable;

.field private mConnection:Landroid/content/ServiceConnection;

.field mDefaultStatusStrings:[Ljava/lang/String;

.field private mGTalkConnectionListener:Lcom/google/android/talk/TalkApp$GTalkConnectionListener;

.field private mGTalkServiceIntent:Landroid/content/Intent;

.field public mGenericAvatars:[Landroid/graphics/drawable/Drawable;

.field private mGmail:Landroid/provider/Gmail;

.field public mGroupAvatar:Landroid/graphics/drawable/Drawable;

.field public mGroupChatInvitations:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gtalkservice/GroupChatInvitation;",
            ">;"
        }
    .end annotation
.end field

.field mIdlePresenceIcon:Landroid/graphics/drawable/Drawable;

.field mInvisiblePresenceIcon:Landroid/graphics/drawable/Drawable;

.field private mLogLevel:I

.field mMobileConnectionIconForChat:Landroid/graphics/drawable/Drawable;

.field public mNewChatStatusIcon:Landroid/graphics/drawable/Drawable;

.field mOfflineColorFilter:Landroid/graphics/ColorFilter;

.field mOfflinePreseneIcon:Landroid/graphics/drawable/Drawable;

.field private mPrivateContext:Landroid/content/Context;

.field private mPrivateResources:Landroid/content/res/Resources;

.field private mProviderDefs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/talk/ProviderDef;",
            ">;"
        }
    .end annotation
.end field

.field private mRecentSuggestions:Landroid/provider/SearchRecentSuggestions;

.field private mService:Lcom/google/android/gtalkservice/IGTalkService;

.field mServiceStateChangedListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/os/Message;",
            ">;"
        }
    .end annotation
.end field

.field private mSupportedProviders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 54
    const-class v0, Lcom/google/android/talk/TalkApp;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v4

    :goto_0
    sput-boolean v0, Lcom/google/android/talk/TalkApp;->$assertionsDisabled:Z

    .line 75
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "name"

    aput-object v1, v0, v4

    const-string v1, "fullname"

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-string v2, "signup_url"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/TalkApp;->PROVIDER_PROJECTION:[Ljava/lang/String;

    .line 86
    const/4 v0, 0x0

    sput-object v0, Lcom/google/android/talk/TalkApp;->sTalkApp:Lcom/google/android/talk/TalkApp;

    .line 125
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "provider"

    aput-object v1, v0, v3

    const-string v1, "username"

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/android/talk/TalkApp;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    return-void

    :cond_0
    move v0, v3

    .line 54
    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 176
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 118
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    .line 130
    new-instance v0, Lcom/google/android/talk/TalkApp$1;

    invoke-direct {v0, p0}, Lcom/google/android/talk/TalkApp$1;-><init>(Lcom/google/android/talk/TalkApp;)V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mConnection:Landroid/content/ServiceConnection;

    .line 163
    new-instance v0, Lcom/google/android/talk/TalkApp$GTalkConnectionListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/talk/TalkApp$GTalkConnectionListener;-><init>(Lcom/google/android/talk/TalkApp;Lcom/google/android/talk/TalkApp$1;)V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mGTalkConnectionListener:Lcom/google/android/talk/TalkApp$GTalkConnectionListener;

    .line 177
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mProviderDefs:Ljava/util/HashMap;

    .line 178
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mSupportedProviders:Ljava/util/ArrayList;

    .line 179
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mGroupChatInvitations:Ljava/util/HashMap;

    .line 180
    iput-object p0, p0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    .line 181
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v0

    iput v0, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    .line 182
    sput-object p0, Lcom/google/android/talk/TalkApp;->sTalkApp:Lcom/google/android/talk/TalkApp;

    .line 183
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/TalkApp;)Lcom/google/android/gtalkservice/IGTalkService;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/TalkApp;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    return-object v0
.end method

.method static synthetic access$002(Lcom/google/android/talk/TalkApp;Lcom/google/android/gtalkservice/IGTalkService;)Lcom/google/android/gtalkservice/IGTalkService;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/TalkApp;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IGTalkService;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    return-object p1
.end method

.method static synthetic access$100(Lcom/google/android/talk/TalkApp;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/TalkApp;

    .prologue
    .line 54
    iget v0, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    return v0
.end method

.method static synthetic access$200(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/talk/TalkApp;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/TalkApp;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->createDefaultGTalkConnection()V

    return-void
.end method

.method static synthetic access$400(Lcom/google/android/talk/TalkApp;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/TalkApp;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->broadcastServiceStateChanged()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/android/talk/TalkApp;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/TalkApp;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mProviderDefs:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/talk/TalkApp;Lcom/google/android/gtalkservice/IImSession;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/TalkApp;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IImSession;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/google/android/talk/TalkApp;->pruneOldChats(Lcom/google/android/gtalkservice/IImSession;)V

    return-void
.end method

.method private bindService()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 261
    iget v0, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    if-lt v0, v3, :cond_0

    const-string v0, "bindService"

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->log(Ljava/lang/String;)V

    .line 264
    :cond_0
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/google/android/gtalkservice/IGTalkService;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mGTalkServiceIntent:Landroid/content/Intent;

    .line 265
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/talk/TalkApp;->mGTalkServiceIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 267
    iget v0, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    if-lt v0, v3, :cond_1

    const-string v0, "--- bindGTalkService ---"

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->log(Ljava/lang/String;)V

    .line 268
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/talk/TalkApp;->mGTalkServiceIntent:Landroid/content/Intent;

    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 271
    return-void
.end method

.method private broadcastServiceStateChanged()V
    .locals 4

    .prologue
    .line 429
    iget-object v3, p0, Lcom/google/android/talk/TalkApp;->mServiceStateChangedListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 430
    .local v0, "count":I
    const/4 v3, 0x1

    sub-int v1, v0, v3

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_0

    .line 431
    iget-object v3, p0, Lcom/google/android/talk/TalkApp;->mServiceStateChangedListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Message;

    .line 432
    .local v2, "message":Landroid/os/Message;
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 430
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 434
    .end local v2    # "message":Landroid/os/Message;
    :cond_0
    return-void
.end method

.method private constructCachedDrawables()V
    .locals 9

    .prologue
    const v8, 0x1080067

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 298
    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 300
    .local v1, "r":Landroid/content/res/Resources;
    new-array v2, v7, [Landroid/graphics/drawable/Drawable;

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mGenericAvatars:[Landroid/graphics/drawable/Drawable;

    .line 301
    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mGenericAvatars:[Landroid/graphics/drawable/Drawable;

    const v3, 0x7f02001a

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    aput-object v3, v2, v4

    .line 302
    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mGenericAvatars:[Landroid/graphics/drawable/Drawable;

    const v3, 0x7f02001b

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    aput-object v3, v2, v5

    .line 303
    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mGenericAvatars:[Landroid/graphics/drawable/Drawable;

    const v3, 0x7f02001c

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    aput-object v3, v2, v6

    .line 305
    const v2, 0x7f020020

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mGroupAvatar:Landroid/graphics/drawable/Drawable;

    .line 307
    const v2, 0x108006b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mAvailablePresenceIcon:Landroid/graphics/drawable/Drawable;

    .line 308
    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mAwayPresenceIcon:Landroid/graphics/drawable/Drawable;

    .line 309
    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mIdlePresenceIcon:Landroid/graphics/drawable/Drawable;

    .line 310
    const v2, 0x1080068

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mBusyPresenceIcon:Landroid/graphics/drawable/Drawable;

    .line 311
    const v2, 0x108006a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mOfflinePreseneIcon:Landroid/graphics/drawable/Drawable;

    .line 312
    const v2, 0x1080069

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mInvisiblePresenceIcon:Landroid/graphics/drawable/Drawable;

    .line 314
    const v2, 0x7f02003c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mAndroidConnectionIconForChat:Landroid/graphics/drawable/Drawable;

    .line 315
    const v2, 0x7f02003f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mMobileConnectionIconForChat:Landroid/graphics/drawable/Drawable;

    .line 317
    const v2, 0x7f020043

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mChatStatusIcon:Landroid/graphics/drawable/Drawable;

    .line 319
    const v2, 0x7f060003

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 320
    .local v0, "awayString":Ljava/lang/String;
    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const v3, 0x7f060004

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    const v3, 0x7f060005

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    aput-object v0, v2, v6

    aput-object v0, v2, v7

    const/4 v3, 0x4

    const v4, 0x7f060002

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const v4, 0x7f060001

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mDefaultStatusStrings:[Ljava/lang/String;

    .line 329
    new-instance v2, Landroid/graphics/PorterDuffColorFilter;

    const v3, -0x557f7f80

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v3, v4}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    iput-object v2, p0, Lcom/google/android/talk/TalkApp;->mOfflineColorFilter:Landroid/graphics/ColorFilter;

    .line 331
    return-void
.end method

.method private createDefaultGTalkConnection()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 437
    iget v1, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    .line 438
    const-string v1, "createDefaultGTalkConnection: wait for async connection to be created"

    invoke-static {v1}, Lcom/google/android/talk/TalkApp;->log(Ljava/lang/String;)V

    .line 441
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/talk/TalkApp;->mGTalkConnectionListener:Lcom/google/android/talk/TalkApp$GTalkConnectionListener;

    invoke-interface {v1, v2, v3}, Lcom/google/android/gtalkservice/IGTalkService;->asyncCreateGTalkConnection(Ljava/lang/String;Lcom/google/android/gtalkservice/IGTalkConnectionListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 450
    :goto_0
    return-void

    .line 442
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 443
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "talk"

    const-string v2, "createDefaultGTalkConnection caught "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 447
    iput-object v4, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    .line 448
    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->handleDisconnectedService()V

    goto :goto_0
.end method

.method private createPrimaryGTalkConnection()Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 5

    .prologue
    const-string v4, "talk"

    .line 490
    const/4 v1, 0x0

    .line 492
    .local v1, "retVal":Lcom/google/android/gtalkservice/IGTalkConnection;
    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eqz v2, :cond_0

    .line 494
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lcom/google/android/gtalkservice/IGTalkService;->createGTalkConnection(Ljava/lang/String;)Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 503
    :goto_0
    return-object v1

    .line 495
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 496
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[TalkApp] createPrimaryGTalkConnection: caught"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 499
    .end local v0    # "ex":Landroid/os/RemoteException;
    :cond_0
    const-string v2, "talk"

    const-string v2, "[TalkApp] createPrimaryGTalkConnection: mService is null!"

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 187
    sget-object v0, Lcom/google/android/talk/TalkApp;->sTalkApp:Lcom/google/android/talk/TalkApp;

    if-nez v0, :cond_1

    .line 188
    sget-boolean v0, Lcom/google/android/talk/TalkApp;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 189
    :cond_0
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->initialize(Landroid/app/Activity;)V

    .line 192
    :cond_1
    sget-object v0, Lcom/google/android/talk/TalkApp;->sTalkApp:Lcom/google/android/talk/TalkApp;

    return-object v0
.end method

.method private initProviderDef()V
    .locals 7

    .prologue
    const-string v3, "GTalk"

    .line 538
    iget-object v6, p0, Lcom/google/android/talk/TalkApp;->mProviderDefs:Ljava/util/HashMap;

    const-string v0, "GTalk"

    new-instance v0, Lcom/google/android/talk/ProviderDef;

    const-wide/16 v1, 0x1

    const-string v4, "GTalk"

    const/high16 v4, 0x7f060000

    invoke-virtual {p0, v4}, Lcom/google/android/talk/TalkApp;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/talk/ProviderDef;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 541
    return-void
.end method

.method private static initialize(Landroid/app/Activity;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 205
    new-instance v0, Lcom/google/android/talk/TalkApp;

    invoke-direct {v0}, Lcom/google/android/talk/TalkApp;-><init>()V

    sput-object v0, Lcom/google/android/talk/TalkApp;->sTalkApp:Lcom/google/android/talk/TalkApp;

    .line 206
    sget-object v0, Lcom/google/android/talk/TalkApp;->sTalkApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    .line 207
    sget-object v0, Lcom/google/android/talk/TalkApp;->sTalkApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/talk/TalkApp;->mPrivateResources:Landroid/content/res/Resources;

    .line 208
    sget-object v0, Lcom/google/android/talk/TalkApp;->sTalkApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->onCreate()V

    .line 209
    invoke-static {p0}, Lcom/google/android/talk/PictureCache;->initialize(Landroid/content/Context;)V

    .line 210
    return-void
.end method

.method private isServiceConnected()Z
    .locals 1

    .prologue
    .line 457
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private loadSupportedProviders()V
    .locals 2

    .prologue
    .line 544
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mSupportedProviders:Ljava/util/ArrayList;

    const-string v1, "GTalk"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 545
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 563
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[TalkApp] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 564
    return-void
.end method

.method private static logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p0, "function"    # Ljava/lang/String;

    .prologue
    .line 567
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[TalkApp] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": empty cursor, possibly low memory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 568
    return-void
.end method

.method private pruneOldChats(Lcom/google/android/gtalkservice/IImSession;)V
    .locals 10
    .param p1, "imSession"    # Lcom/google/android/gtalkservice/IImSession;

    .prologue
    const-string v9, "talk"

    .line 608
    if-nez p1, :cond_0

    .line 609
    const-string v3, "talk"

    const-string v3, "pruneOldChats: empty IM session, bail."

    invoke-static {v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 622
    :goto_0
    return-void

    .line 614
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "gtalk_chat_expiration_time"

    const-wide/32 v7, 0x5265c00

    invoke-static {v5, v6, v7, v8}, Landroid/provider/Settings$Gservices;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v5

    sub-long v1, v3, v5

    .line 618
    .local v1, "expire":J
    invoke-interface {p1, v1, v2}, Lcom/google/android/gtalkservice/IImSession;->pruneOldChatSessions(J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 619
    .end local v1    # "expire":J
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 620
    .local v0, "e":Landroid/os/RemoteException;
    const-string v3, "talk"

    const-string v3, "asyncPruneChats caught "

    invoke-static {v9, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static queryDebugLevel()I
    .locals 3

    .prologue
    const/4 v1, 0x2

    const-string v2, "talk"

    .line 166
    const-string v0, "talk"

    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    .line 171
    :goto_0
    return v0

    .line 168
    :cond_0
    const-string v0, "talk"

    const/4 v0, 0x3

    invoke-static {v2, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 169
    const/4 v0, 0x1

    goto :goto_0

    .line 171
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addServiceStateChangedCallback(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .locals 5
    .param p1, "target"    # Landroid/os/Handler;
    .param p2, "callback"    # Ljava/lang/Runnable;

    .prologue
    .line 400
    invoke-static {p1, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;Ljava/lang/Runnable;)Landroid/os/Message;

    move-result-object v3

    .line 402
    .local v3, "msg":Landroid/os/Message;
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->isServiceConnected()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 403
    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    .line 415
    :cond_0
    :goto_0
    return-void

    .line 405
    :cond_1
    iget-object v4, p0, Lcom/google/android/talk/TalkApp;->mServiceStateChangedListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 406
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_2

    .line 407
    iget-object v4, p0, Lcom/google/android/talk/TalkApp;->mServiceStateChangedListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Message;

    .line 408
    .local v2, "message":Landroid/os/Message;
    invoke-virtual {v2}, Landroid/os/Message;->getTarget()Landroid/os/Handler;

    move-result-object v4

    if-eq v4, p1, :cond_0

    .line 406
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 413
    .end local v2    # "message":Landroid/os/Message;
    :cond_2
    iget-object v4, p0, Lcom/google/android/talk/TalkApp;->mServiceStateChangedListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public asyncPruneOldChatsAndMessages(Lcom/google/android/gtalkservice/IImSession;)V
    .locals 2
    .param p1, "imSession"    # Lcom/google/android/gtalkservice/IImSession;

    .prologue
    .line 597
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/android/talk/TalkApp$2;

    invoke-direct {v1, p0, p1}, Lcom/google/android/talk/TalkApp$2;-><init>(Lcom/google/android/talk/TalkApp;Lcom/google/android/gtalkservice/IImSession;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 605
    return-void
.end method

.method public createDrawableFromRes(I)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p1, "res"    # I

    .prologue
    .line 461
    const/4 v0, 0x0

    .line 462
    .local v0, "retVal":Landroid/graphics/drawable/Drawable;
    if-eqz p1, :cond_0

    .line 463
    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 466
    :cond_0
    return-object v0
.end method

.method public getAccountInfo(J)Lcom/google/android/talk/TalkApp$AccountInfo;
    .locals 7
    .param p1, "accountId"    # J

    .prologue
    const/4 v4, 0x0

    const-string v2, "talk"

    .line 640
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-wide v0, v0, Lcom/google/android/talk/TalkApp$AccountInfo;->mAccountId:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 642
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    .line 677
    :goto_0
    return-object v0

    .line 645
    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_2

    .line 646
    const-string v0, "talk"

    const/4 v0, 0x2

    invoke-static {v2, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 647
    const-string v0, "talk"

    const-string v0, "initAccount: missing account id"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    move-object v0, v4

    .line 649
    goto :goto_0

    .line 651
    :cond_2
    iput-object v4, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    .line 652
    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/TalkApp;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 658
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_5

    .line 660
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 661
    new-instance v0, Lcom/google/android/talk/TalkApp$AccountInfo;

    invoke-direct {v0}, Lcom/google/android/talk/TalkApp$AccountInfo;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    .line 662
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    const-string v1, "provider"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/google/android/talk/TalkApp$AccountInfo;->mProviderId:J

    .line 664
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    const-string v1, "username"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/talk/TalkApp$AccountInfo;->mUsername:Ljava/lang/String;

    .line 666
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iput-wide p1, v0, Lcom/google/android/talk/TalkApp$AccountInfo;->mAccountId:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 669
    :cond_3
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 675
    :goto_1
    iget v0, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getAccountInfo: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->log(Ljava/lang/String;)V

    .line 677
    :cond_4
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    goto/16 :goto_0

    .line 669
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .line 672
    :cond_5
    const-string v0, "initAccount"

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public getConnectionTypeIndicator(IZ)Landroid/graphics/drawable/Drawable;
    .locals 3
    .param p1, "clientType"    # I
    .param p2, "insideChatBubble"    # Z

    .prologue
    .line 379
    const/4 v0, 0x0

    .line 381
    .local v0, "retVal":Landroid/graphics/drawable/Drawable;
    packed-switch p1, :pswitch_data_0

    .line 396
    :goto_0
    return-object v0

    .line 383
    :pswitch_0
    if-eqz p2, :cond_0

    iget-object v1, p0, Lcom/google/android/talk/TalkApp;->mAndroidConnectionIconForChat:Landroid/graphics/drawable/Drawable;

    move-object v0, v1

    .line 385
    :goto_1
    goto :goto_0

    .line 383
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02003a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    move-object v0, v1

    goto :goto_1

    .line 388
    :pswitch_1
    if-eqz p2, :cond_1

    iget-object v1, p0, Lcom/google/android/talk/TalkApp;->mMobileConnectionIconForChat:Landroid/graphics/drawable/Drawable;

    move-object v0, v1

    .line 390
    :goto_2
    goto :goto_0

    .line 388
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02003d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    move-object v0, v1

    goto :goto_2

    .line 381
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getContentResolver()Landroid/content/ContentResolver;
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    if-ne v0, p0, :cond_0

    .line 224
    invoke-super {p0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 227
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    goto :goto_0
.end method

.method public getCurrentAccountInfo()Lcom/google/android/talk/TalkApp$AccountInfo;
    .locals 1

    .prologue
    .line 681
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mCachedAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    return-object v0
.end method

.method public getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;
    .locals 1

    .prologue
    .line 453
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    return-object v0
.end method

.method public getGenericAvatar()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 374
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mGenericAvatars:[Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getGmailProvider()Landroid/provider/Gmail;
    .locals 2

    .prologue
    .line 575
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mGmail:Landroid/provider/Gmail;

    if-nez v0, :cond_0

    .line 576
    new-instance v0, Landroid/provider/Gmail;

    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/provider/Gmail;-><init>(Landroid/content/ContentResolver;)V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mGmail:Landroid/provider/Gmail;

    .line 578
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mGmail:Landroid/provider/Gmail;

    return-object v0
.end method

.method getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;
    .locals 6
    .param p1, "accountId"    # J

    .prologue
    const/4 v4, 0x0

    const-string v5, "talk"

    .line 517
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-nez v2, :cond_0

    move-object v2, v4

    .line 534
    :goto_0
    return-object v2

    .line 521
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-nez v2, :cond_1

    .line 522
    const-string v2, "talk"

    const-string v2, "[TalkApp] getImSessionForAccountId: null GTalk service!"

    invoke-static {v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v4

    .line 523
    goto :goto_0

    .line 526
    :cond_1
    const/4 v1, 0x0

    .line 529
    .local v1, "retVal":Lcom/google/android/gtalkservice/IImSession;
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    invoke-interface {v2, p1, p2}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    :goto_1
    move-object v2, v1

    .line 534
    goto :goto_0

    .line 530
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 531
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getImSessionForAccountId: caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method getImSessionFromActivityIntent(Landroid/content/Intent;)Lcom/google/android/gtalkservice/IImSession;
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 507
    if-nez p1, :cond_0

    .line 508
    const-string v1, "talk"

    const-string v2, "[TalkApp] getImSessionFromActivityIntent: null intent"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    const/4 v1, 0x0

    .line 513
    :goto_0
    return-object v1

    .line 512
    :cond_0
    const-string v1, "accountId"

    const-wide/16 v2, 0x0

    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 513
    .local v0, "accountId":Ljava/lang/Long;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lcom/google/android/talk/TalkApp;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    goto :goto_0
.end method

.method public getPrimaryGTalkConnection()Lcom/google/android/gtalkservice/IGTalkConnection;
    .locals 4

    .prologue
    const-string v3, "talk"

    .line 470
    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-nez v2, :cond_0

    .line 471
    const-string v2, "talk"

    const-string v2, "[TalkApp] getPrimaryGTalkConnection: null GTalk service!"

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    const/4 v2, 0x0

    .line 486
    :goto_0
    return-object v2

    .line 475
    :cond_0
    const/4 v1, 0x0

    .line 478
    .local v1, "retVal":Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    invoke-interface {v2}, Lcom/google/android/gtalkservice/IGTalkService;->getDefaultConnection()Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v1

    .line 479
    if-nez v1, :cond_1

    .line 480
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->createPrimaryGTalkConnection()Lcom/google/android/gtalkservice/IGTalkConnection;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    :cond_1
    :goto_1
    move-object v2, v1

    .line 486
    goto :goto_0

    .line 482
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 483
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v2, "talk"

    const-string v2, "getPrimaryGTalkConnection: caught "

    invoke-static {v3, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public getProviderDef(Ljava/lang/String;)Lcom/google/android/talk/ProviderDef;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 553
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mProviderDefs:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/talk/TalkApp;
    check-cast p0, Lcom/google/android/talk/ProviderDef;

    return-object p0
.end method

.method public getRecentSuggestions()Landroid/provider/SearchRecentSuggestions;
    .locals 3

    .prologue
    .line 586
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mRecentSuggestions:Landroid/provider/SearchRecentSuggestions;

    if-nez v0, :cond_0

    .line 587
    new-instance v0, Landroid/provider/SearchRecentSuggestions;

    const-string v1, "com.google.android.talk.SuggestionProvider"

    const/4 v2, 0x3

    invoke-direct {v0, p0, v1, v2}, Landroid/provider/SearchRecentSuggestions;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mRecentSuggestions:Landroid/provider/SearchRecentSuggestions;

    .line 590
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mRecentSuggestions:Landroid/provider/SearchRecentSuggestions;

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    if-ne v0, p0, :cond_0

    .line 215
    invoke-super {p0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 218
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mPrivateResources:Landroid/content/res/Resources;

    goto :goto_0
.end method

.method public getStatusIcon(I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p1, "status"    # I

    .prologue
    .line 334
    packed-switch p1, :pswitch_data_0

    .line 352
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mOfflinePreseneIcon:Landroid/graphics/drawable/Drawable;

    :goto_0
    return-object v0

    .line 336
    :pswitch_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mAvailablePresenceIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    .line 339
    :pswitch_1
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mIdlePresenceIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    .line 342
    :pswitch_2
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mAwayPresenceIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    .line 345
    :pswitch_3
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mBusyPresenceIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    .line 348
    :pswitch_4
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mInvisiblePresenceIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    .line 334
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method getSupportedProviders()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 549
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mSupportedProviders:Ljava/util/ArrayList;

    return-object v0
.end method

.method public handleDisconnectedService()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 283
    invoke-virtual {p0}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 284
    iget v0, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    if-lt v0, v1, :cond_0

    .line 285
    const-string v0, "handleDisconnectedService: mService isn\'t null!"

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->log(Ljava/lang/String;)V

    .line 295
    :cond_0
    :goto_0
    return-void

    .line 290
    :cond_1
    iget v0, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    if-lt v0, v1, :cond_2

    .line 291
    const-string v0, "handleDisconnectedService"

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->log(Ljava/lang/String;)V

    .line 294
    :cond_2
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->bindService()V

    goto :goto_0
.end method

.method public isBackgroundDataEnabled()Z
    .locals 3

    .prologue
    .line 557
    iget-object v1, p0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 559
    .local v0, "manager":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getBackgroundDataSetting()Z

    move-result v1

    return v1
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 232
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 234
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->loadSupportedProviders()V

    .line 235
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->initProviderDef()V

    .line 237
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mServiceStateChangedListeners:Ljava/util/ArrayList;

    .line 239
    invoke-static {p0}, Lcom/google/android/talk/AvatarCache;->initialize(Lcom/google/android/talk/TalkApp;)V

    .line 241
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->bindService()V

    .line 243
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->constructCachedDrawables()V

    .line 244
    return-void
.end method

.method public onTerminate()V
    .locals 2

    .prologue
    .line 249
    invoke-static {p0}, Lcom/google/android/talk/AvatarCache;->destroyAll(Landroid/content/Context;)V

    .line 250
    invoke-static {p0}, Lcom/google/android/talk/PictureCache;->destroyAll(Landroid/content/Context;)V

    .line 252
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mConnection:Landroid/content/ServiceConnection;

    if-eqz v0, :cond_1

    .line 253
    iget v0, p0, Lcom/google/android/talk/TalkApp;->mLogLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    const-string v0, "##### onTerminate #####"

    invoke-static {v0}, Lcom/google/android/talk/TalkApp;->log(Ljava/lang/String;)V

    .line 254
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/talk/TalkApp;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 255
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mConnection:Landroid/content/ServiceConnection;

    .line 257
    :cond_1
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 258
    return-void
.end method

.method rebindService()V
    .locals 2

    .prologue
    .line 274
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eqz v0, :cond_0

    .line 275
    iget-object v0, p0, Lcom/google/android/talk/TalkApp;->mPrivateContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/talk/TalkApp;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 276
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/talk/TalkApp;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    .line 279
    :cond_0
    invoke-direct {p0}, Lcom/google/android/talk/TalkApp;->bindService()V

    .line 280
    return-void
.end method

.method public removeServiceStateChangedCallback(Landroid/os/Handler;)V
    .locals 4
    .param p1, "target"    # Landroid/os/Handler;

    .prologue
    .line 418
    iget-object v3, p0, Lcom/google/android/talk/TalkApp;->mServiceStateChangedListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 419
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 420
    iget-object v3, p0, Lcom/google/android/talk/TalkApp;->mServiceStateChangedListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Message;

    .line 421
    .local v2, "message":Landroid/os/Message;
    invoke-virtual {v2}, Landroid/os/Message;->getTarget()Landroid/os/Handler;

    move-result-object v3

    if-ne v3, p1, :cond_1

    .line 422
    iget-object v3, p0, Lcom/google/android/talk/TalkApp;->mServiceStateChangedListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 426
    .end local v2    # "message":Landroid/os/Message;
    :cond_0
    return-void

    .line 419
    .restart local v2    # "message":Landroid/os/Message;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
