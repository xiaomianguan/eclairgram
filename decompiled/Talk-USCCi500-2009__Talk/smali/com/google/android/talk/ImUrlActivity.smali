.class public Lcom/google/android/talk/ImUrlActivity;
.super Landroid/app/Activity;
.source "ImUrlActivity.java"


# static fields
.field private static final ACCOUNT_PROJECTION:[Ljava/lang/String;

.field private static final ID_COLUMN:I


# instance fields
.field private mAccountId:J

.field private mApp:Lcom/google/android/talk/TalkApp;

.field private final mHandler:Landroid/os/Handler;

.field private mLogLevel:I

.field private mProviderName:Ljava/lang/String;

.field private mToAddress:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 43
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/ImUrlActivity;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 54
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/ImUrlActivity;->mHandler:Landroid/os/Handler;

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/ImUrlActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/ImUrlActivity;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/google/android/talk/ImUrlActivity;->serviceStateChanged()V

    return-void
.end method

.method private findMatchingProvider(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 153
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 154
    const/4 v4, 0x0

    .line 166
    :goto_0
    return-object v4

    .line 157
    :cond_0
    const/4 v2, 0x0

    .line 158
    .local v2, "retVal":Ljava/lang/String;
    iget-object v4, p0, Lcom/google/android/talk/ImUrlActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v4}, Lcom/google/android/talk/TalkApp;->getSupportedProviders()Ljava/util/ArrayList;

    move-result-object v3

    .line 160
    .local v3, "supportedProviders":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 161
    .local v1, "providerName":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 162
    move-object v2, v1

    goto :goto_1

    .end local v1    # "providerName":Ljava/lang/String;
    :cond_2
    move-object v4, v2

    .line 166
    goto :goto_0
.end method

.method private getProviderNameForCategory(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "providerCategory"    # Ljava/lang/String;

    .prologue
    .line 143
    if-eqz p1, :cond_0

    .line 144
    const-string v0, "com.android.im.category.GTALK"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    const-string v0, "GTalk"

    .line 149
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private inviteFriend(JLjava/lang/String;)V
    .locals 3
    .param p1, "accountId"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    .line 290
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 291
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/google/android/talk/AddBuddyScreen;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 292
    const-string v1, "accountId"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 293
    const-string v1, "contact"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 294
    invoke-virtual {p0, v0}, Lcom/google/android/talk/ImUrlActivity;->startActivity(Landroid/content/Intent;)V

    .line 295
    return-void
.end method

.method private isValidToAddress()Z
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 170
    iget-object v0, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    .line 182
    :goto_0
    return v0

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-eq v0, v3, :cond_1

    move v0, v2

    .line 175
    goto :goto_0

    .line 178
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v3, :cond_2

    move v0, v2

    .line 179
    goto :goto_0

    .line 182
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 319
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ImUrlActivity] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 323
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ImUrlActivity] "

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

    .line 325
    return-void
.end method

.method private openChat(JLjava/lang/String;)V
    .locals 6
    .param p1, "accountId"    # J
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    .line 275
    iget v4, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    const/4 v5, 0x1

    if-lt v4, v5, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ImUrlReceiver: openChat with "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/talk/ImUrlActivity;->log(Ljava/lang/String;)V

    .line 277
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/talk/ImUrlActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-static {v4, p1, p2}, Landroid/provider/Im$Account;->getProviderIdForAccount(Landroid/content/ContentResolver;J)J

    move-result-wide v1

    .line 278
    .local v1, "providerId":J
    invoke-static {p1, p2, p3}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 280
    .local v3, "uri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v0, v4, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 281
    .local v0, "intent":Landroid/content/Intent;
    const-string v4, "com.android.im.category.GTALK"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 282
    const-string v4, "from"

    invoke-virtual {v0, v4, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 283
    const-string v4, "providerId"

    invoke-virtual {v0, v4, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 284
    const-string v4, "accountId"

    invoke-virtual {v0, v4, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 286
    invoke-virtual {p0, v0}, Lcom/google/android/talk/ImUrlActivity;->startActivity(Landroid/content/Intent;)V

    .line 287
    return-void
.end method

.method private parseIntent(Landroid/content/Intent;)Z
    .locals 11
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 91
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 92
    .local v2, "data":Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 94
    .local v3, "host":Ljava/lang/String;
    iget v8, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    const/4 v9, 0x1

    if-lt v8, v9, :cond_0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parseIntent: host="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/talk/ImUrlActivity;->log(Ljava/lang/String;)V

    .line 96
    :cond_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 99
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    .line 100
    invoke-virtual {p1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v0

    .line 102
    .local v0, "categories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v0, :cond_4

    .line 103
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 104
    .local v5, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 105
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 106
    .local v1, "category":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/google/android/talk/ImUrlActivity;->getProviderNameForCategory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 107
    .local v7, "providerName":Ljava/lang/String;
    invoke-direct {p0, v7}, Lcom/google/android/talk/ImUrlActivity;->findMatchingProvider(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mProviderName:Ljava/lang/String;

    .line 108
    iget-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mProviderName:Ljava/lang/String;

    if-nez v8, :cond_4

    .line 109
    const-string v8, "talk"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "parseIntent: IM provider "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " not supported"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const/4 v8, 0x0

    .line 139
    .end local v0    # "categories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v1    # "category":Ljava/lang/String;
    .end local v5    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v7    # "providerName":Ljava/lang/String;
    :goto_0
    return v8

    .line 116
    :cond_1
    invoke-direct {p0, v3}, Lcom/google/android/talk/ImUrlActivity;->findMatchingProvider(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mProviderName:Ljava/lang/String;

    .line 118
    iget-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mProviderName:Ljava/lang/String;

    if-nez v8, :cond_2

    .line 119
    const-string v8, "talk"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "parseIntent: IM provider "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " not supported"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    const/4 v8, 0x0

    goto :goto_0

    .line 123
    :cond_2
    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 125
    .local v6, "path":Ljava/lang/String;
    iget v8, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    const/4 v9, 0x1

    if-lt v8, v9, :cond_3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parseIntent: path="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/talk/ImUrlActivity;->log(Ljava/lang/String;)V

    .line 127
    :cond_3
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 129
    const/16 v8, 0x2f

    invoke-virtual {v6, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .local v4, "index":I
    const/4 v8, -0x1

    if-eq v4, v8, :cond_4

    .line 130
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    .line 135
    .end local v4    # "index":I
    .end local v6    # "path":Ljava/lang/String;
    :cond_4
    iget v8, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    const/4 v9, 0x1

    if-lt v8, v9, :cond_5

    .line 136
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parseIntent: provider="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/google/android/talk/ImUrlActivity;->mProviderName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", to="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/talk/ImUrlActivity;->log(Ljava/lang/String;)V

    .line 139
    :cond_5
    const/4 v8, 0x1

    goto/16 :goto_0
.end method

.method private queryProviderAndAccountIds()V
    .locals 9

    .prologue
    const/4 v4, 0x0

    .line 245
    iget-object v1, p0, Lcom/google/android/talk/ImUrlActivity;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v2, p0, Lcom/google/android/talk/ImUrlActivity;->mProviderName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/talk/TalkApp;->getProviderDef(Ljava/lang/String;)Lcom/google/android/talk/ProviderDef;

    move-result-object v7

    .line 246
    .local v7, "def":Lcom/google/android/talk/ProviderDef;
    if-nez v7, :cond_1

    .line 272
    :cond_0
    :goto_0
    return-void

    .line 250
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v1, "active"

    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 251
    .local v8, "where":Ljava/lang/StringBuilder;
    const-string v1, "=1 AND "

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "provider"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, v7, Lcom/google/android/talk/ProviderDef;->mId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 253
    invoke-virtual {p0}, Lcom/google/android/talk/ImUrlActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 254
    .local v0, "cr":Landroid/content/ContentResolver;
    sget-object v1, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/talk/ImUrlActivity;->ACCOUNT_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 259
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_3

    .line 261
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 262
    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 265
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 271
    :goto_1
    iget v1, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getAccount: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/talk/ImUrlActivity;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 265
    :catchall_0
    move-exception v1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v1

    .line 268
    :cond_3
    const-string v1, "queryProviderAndAccountIds"

    invoke-direct {p0, v1}, Lcom/google/android/talk/ImUrlActivity;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private serviceStateChanged()V
    .locals 11

    .prologue
    const-wide/16 v8, 0x0

    const-string v10, "talk"

    .line 186
    iget-object v6, p0, Lcom/google/android/talk/ImUrlActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v6}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v4

    .line 187
    .local v4, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v4, :cond_8

    .line 192
    :try_start_0
    iget-object v6, p0, Lcom/google/android/talk/ImUrlActivity;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v6}, Lcom/google/android/talk/TalkApp;->getPrimaryGTalkConnection()Lcom/google/android/gtalkservice/IGTalkConnection;

    move-result-object v2

    .line 194
    .local v2, "gtalkConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    if-eqz v2, :cond_7

    .line 195
    iget-object v6, p0, Lcom/google/android/talk/ImUrlActivity;->mProviderName:Ljava/lang/String;

    invoke-interface {v2, v6}, Lcom/google/android/gtalkservice/IGTalkConnection;->createImSessionForProvider(Ljava/lang/String;)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v5

    .line 196
    .local v5, "session":Lcom/google/android/gtalkservice/IImSession;
    if-eqz v5, :cond_6

    .line 197
    invoke-interface {v5}, Lcom/google/android/gtalkservice/IImSession;->getAccountId()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J

    .line 198
    invoke-interface {v5}, Lcom/google/android/gtalkservice/IImSession;->getPresence()Lcom/google/android/gtalkservice/Presence;

    move-result-object v3

    .line 199
    .local v3, "presence":Lcom/google/android/gtalkservice/Presence;
    invoke-virtual {v3}, Lcom/google/android/gtalkservice/Presence;->isAvailable()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 200
    invoke-direct {p0}, Lcom/google/android/talk/ImUrlActivity;->isValidToAddress()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 201
    invoke-virtual {p0}, Lcom/google/android/talk/ImUrlActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    iget-wide v8, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J

    invoke-static {v6, v7, v8, v9}, Lcom/google/android/talk/DatabaseUtils;->IsUserInRosterList(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 203
    iget-wide v6, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J

    iget-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    invoke-direct {p0, v6, v7, v8}, Lcom/google/android/talk/ImUrlActivity;->openChat(JLjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    .end local v2    # "gtalkConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    .end local v3    # "presence":Lcom/google/android/gtalkservice/Presence;
    .end local v5    # "session":Lcom/google/android/gtalkservice/IImSession;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/talk/ImUrlActivity;->finish()V

    .line 242
    :cond_1
    :goto_1
    return-void

    .line 205
    .restart local v2    # "gtalkConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    .restart local v3    # "presence":Lcom/google/android/gtalkservice/Presence;
    .restart local v5    # "session":Lcom/google/android/gtalkservice/IImSession;
    :cond_2
    :try_start_1
    iget-wide v6, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J

    iget-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    invoke-direct {p0, v6, v7, v8}, Lcom/google/android/talk/ImUrlActivity;->inviteFriend(JLjava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 234
    .end local v2    # "gtalkConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    .end local v3    # "presence":Lcom/google/android/gtalkservice/Presence;
    .end local v5    # "session":Lcom/google/android/gtalkservice/IImSession;
    :catch_0
    move-exception v6

    move-object v1, v6

    .line 235
    .local v1, "ex":Landroid/os/RemoteException;
    const-string v6, "talk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[ImUrlActivity] onServiceConnected: caught "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v10, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 208
    .end local v1    # "ex":Landroid/os/RemoteException;
    .restart local v2    # "gtalkConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    .restart local v3    # "presence":Lcom/google/android/gtalkservice/Presence;
    .restart local v5    # "session":Lcom/google/android/gtalkservice/IImSession;
    :cond_3
    :try_start_2
    iget-wide v6, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J

    invoke-direct {p0, v6, v7}, Lcom/google/android/talk/ImUrlActivity;->showFriendList(J)V

    goto :goto_0

    .line 211
    :cond_4
    iget-wide v6, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J

    cmp-long v6, v6, v8

    if-nez v6, :cond_5

    .line 212
    invoke-direct {p0}, Lcom/google/android/talk/ImUrlActivity;->queryProviderAndAccountIds()V

    .line 218
    :cond_5
    iget-wide v6, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J

    cmp-long v6, v6, v8

    if-lez v6, :cond_0

    .line 219
    sget-object v6, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v7, p0, Lcom/google/android/talk/ImUrlActivity;->mAccountId:J

    invoke-static {v6, v7, v8}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 221
    .local v0, "accountUri":Landroid/net/Uri;
    invoke-direct {p0, v0}, Lcom/google/android/talk/ImUrlActivity;->startLogin(Landroid/net/Uri;)V

    goto :goto_0

    .line 225
    .end local v0    # "accountUri":Landroid/net/Uri;
    .end local v3    # "presence":Lcom/google/android/gtalkservice/Presence;
    :cond_6
    const-string v6, "talk"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[ImUrlActivity] cannot create IImSession for provider "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mProviderName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 230
    .end local v5    # "session":Lcom/google/android/gtalkservice/IImSession;
    :cond_7
    const-string v6, "talk"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[ImUrlActivity] cannot find a gtalkConnection for provider "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/talk/ImUrlActivity;->mProviderName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 240
    .end local v2    # "gtalkConnection":Lcom/google/android/gtalkservice/IGTalkConnection;
    :cond_8
    iget v6, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    const/4 v7, 0x1

    if-lt v6, v7, :cond_1

    const-string v6, "service disconnected, wait..."

    invoke-direct {p0, v6}, Lcom/google/android/talk/ImUrlActivity;->log(Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method private showFriendList(J)V
    .locals 3
    .param p1, "accountId"    # J

    .prologue
    .line 298
    iget v1, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    const-string v1, "ImUrlReceiver: show friendlist screen"

    invoke-direct {p0, v1}, Lcom/google/android/talk/ImUrlActivity;->log(Ljava/lang/String;)V

    .line 300
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 301
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 302
    const-string v1, "com.android.im.category.GTALK"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 303
    const-string v1, "accountId"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 305
    invoke-virtual {p0, v0}, Lcom/google/android/talk/ImUrlActivity;->startActivity(Landroid/content/Intent;)V

    .line 306
    return-void
.end method

.method private startLogin(Landroid/net/Uri;)V
    .locals 4
    .param p1, "accountUri"    # Landroid/net/Uri;

    .prologue
    .line 309
    iget v1, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "show SigningIn screen for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/talk/ImUrlActivity;->log(Ljava/lang/String;)V

    .line 310
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SENDTO"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "im:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 311
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/google/android/talk/SigningInActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 312
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 313
    const-string v1, "Send2_U"

    iget-object v2, p0, Lcom/google/android/talk/ImUrlActivity;->mToAddress:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 315
    invoke-virtual {p0, v0}, Lcom/google/android/talk/ImUrlActivity;->startActivity(Landroid/content/Intent;)V

    .line 316
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedStates"    # Landroid/os/Bundle;

    .prologue
    .line 60
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    invoke-static {}, Lcom/google/android/talk/TalkApp;->queryDebugLevel()I

    move-result v2

    iput v2, p0, Lcom/google/android/talk/ImUrlActivity;->mLogLevel:I

    .line 64
    invoke-virtual {p0}, Lcom/google/android/talk/ImUrlActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 65
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 66
    .local v0, "action":Ljava/lang/String;
    const-string v2, "android.intent.action.SENDTO"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 67
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/talk/ImUrlActivity;->mApp:Lcom/google/android/talk/TalkApp;

    .line 69
    invoke-direct {p0, v1}, Lcom/google/android/talk/ImUrlActivity;->parseIntent(Landroid/content/Intent;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 70
    invoke-virtual {p0}, Lcom/google/android/talk/ImUrlActivity;->finish()V

    .line 82
    :goto_0
    return-void

    .line 74
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/ImUrlActivity;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v3, p0, Lcom/google/android/talk/ImUrlActivity;->mHandler:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/talk/ImUrlActivity$1;

    invoke-direct {v4, p0}, Lcom/google/android/talk/ImUrlActivity$1;-><init>(Lcom/google/android/talk/ImUrlActivity;)V

    invoke-virtual {v2, v3, v4}, Lcom/google/android/talk/TalkApp;->addServiceStateChangedCallback(Landroid/os/Handler;Ljava/lang/Runnable;)V

    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/talk/ImUrlActivity;->finish()V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 86
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 87
    iget-object v0, p0, Lcom/google/android/talk/ImUrlActivity;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/ImUrlActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/TalkApp;->removeServiceStateChangedCallback(Landroid/os/Handler;)V

    .line 88
    return-void
.end method
