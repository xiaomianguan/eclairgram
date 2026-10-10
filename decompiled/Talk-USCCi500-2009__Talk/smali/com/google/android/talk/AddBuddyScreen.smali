.class public Lcom/google/android/talk/AddBuddyScreen;
.super Landroid/app/Activity;
.source "AddBuddyScreen.java"

# interfaces
.implements Landroid/text/TextWatcher;


# static fields
.field private static final DEFAULT_DOMAIN:Ljava/lang/String; = "gmail.com"

.field private static final LOG_TAG:Ljava/lang/String; = "talk"

.field private static mValidator:Landroid/text/util/Rfc822Validator;


# instance fields
.field private mAddressAdapter:Lcom/google/android/talk/EmailAddressAdapter;

.field protected mApp:Lcom/google/android/talk/TalkApp;

.field mButtonHandler:Landroid/view/View$OnClickListener;

.field private mEmailList:Landroid/widget/MultiAutoCompleteTextView;

.field protected final mHandler:Landroid/os/Handler;

.field protected mImSession:Lcom/google/android/gtalkservice/IImSession;

.field private mInviteButton:Landroid/widget/Button;

.field private mInvitee:Ljava/lang/String;

.field mKeyHandler:Landroid/view/View$OnKeyListener;

.field protected mService:Lcom/google/android/gtalkservice/IGTalkService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 59
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mHandler:Landroid/os/Handler;

    .line 185
    new-instance v0, Lcom/google/android/talk/AddBuddyScreen$2;

    invoke-direct {v0, p0}, Lcom/google/android/talk/AddBuddyScreen$2;-><init>(Lcom/google/android/talk/AddBuddyScreen;)V

    iput-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mButtonHandler:Landroid/view/View$OnClickListener;

    .line 191
    new-instance v0, Lcom/google/android/talk/AddBuddyScreen$3;

    invoke-direct {v0, p0}, Lcom/google/android/talk/AddBuddyScreen$3;-><init>(Lcom/google/android/talk/AddBuddyScreen;)V

    iput-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mKeyHandler:Landroid/view/View$OnKeyListener;

    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/AddBuddyScreen;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/AddBuddyScreen;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/google/android/talk/AddBuddyScreen;->serviceStateChanged()V

    return-void
.end method

.method private initView()V
    .locals 2

    .prologue
    .line 139
    const/high16 v0, 0x7f0b0000

    invoke-virtual {p0, v0}, Lcom/google/android/talk/AddBuddyScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/MultiAutoCompleteTextView;

    iput-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mEmailList:Landroid/widget/MultiAutoCompleteTextView;

    .line 140
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mEmailList:Landroid/widget/MultiAutoCompleteTextView;

    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mAddressAdapter:Lcom/google/android/talk/EmailAddressAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/MultiAutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 141
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mEmailList:Landroid/widget/MultiAutoCompleteTextView;

    new-instance v1, Landroid/text/util/Rfc822Tokenizer;

    invoke-direct {v1}, Landroid/text/util/Rfc822Tokenizer;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/MultiAutoCompleteTextView;->setTokenizer(Landroid/widget/MultiAutoCompleteTextView$Tokenizer;)V

    .line 142
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mEmailList:Landroid/widget/MultiAutoCompleteTextView;

    sget-object v1, Lcom/google/android/talk/AddBuddyScreen;->mValidator:Landroid/text/util/Rfc822Validator;

    invoke-virtual {v0, v1}, Landroid/widget/MultiAutoCompleteTextView;->setValidator(Landroid/widget/AutoCompleteTextView$Validator;)V

    .line 143
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mEmailList:Landroid/widget/MultiAutoCompleteTextView;

    invoke-virtual {v0, p0}, Landroid/widget/MultiAutoCompleteTextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 144
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mEmailList:Landroid/widget/MultiAutoCompleteTextView;

    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mKeyHandler:Landroid/view/View$OnKeyListener;

    invoke-virtual {v0, v1}, Landroid/widget/MultiAutoCompleteTextView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 146
    const v0, 0x7f0b0002

    invoke-virtual {p0, v0}, Lcom/google/android/talk/AddBuddyScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mInviteButton:Landroid/widget/Button;

    .line 147
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mInviteButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mButtonHandler:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mInviteButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 150
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mInvitee:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mEmailList:Landroid/widget/MultiAutoCompleteTextView;

    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mInvitee:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/MultiAutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    :cond_0
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 206
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[AddBuddyScreen] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 210
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[AddBuddyScreen] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    return-void
.end method

.method private registerForServiceStateChanged()V
    .locals 3

    .prologue
    .line 110
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/talk/AddBuddyScreen$1;

    invoke-direct {v2, p0}, Lcom/google/android/talk/AddBuddyScreen$1;-><init>(Lcom/google/android/talk/AddBuddyScreen;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/talk/TalkApp;->addServiceStateChangedCallback(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 115
    return-void
.end method

.method private serviceStateChanged()V
    .locals 3

    .prologue
    .line 122
    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    .line 124
    .local v0, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v0, :cond_1

    .line 125
    iput-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    .line 126
    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {p0}, Lcom/google/android/talk/AddBuddyScreen;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/talk/TalkApp;->getImSessionFromActivityIntent(Landroid/content/Intent;)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    .line 127
    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    if-nez v1, :cond_0

    .line 128
    const-string v1, "talk"

    const-string v2, "Empty IM session. Finish!"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    invoke-static {p0}, Lcom/google/android/talk/ActivityUtils;->showLandingPage(Landroid/app/Activity;)V

    .line 136
    :cond_0
    :goto_0
    return-void

    .line 133
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/talk/AddBuddyScreen;->finish()V

    goto :goto_0
.end method

.method private unregisterForServiceStateChanged()V
    .locals 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mApp:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/TalkApp;->removeServiceStateChangedCallback(Landroid/os/Handler;)V

    .line 119
    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 224
    iget-object v0, p0, Lcom/google/android/talk/AddBuddyScreen;->mInviteButton:Landroid/widget/Button;

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 225
    return-void

    .line 224
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 217
    return-void
.end method

.method closeScreen()V
    .locals 0

    .prologue
    .line 182
    invoke-virtual {p0}, Lcom/google/android/talk/AddBuddyScreen;->finish()V

    .line 183
    return-void
.end method

.method inviteBuddies()V
    .locals 10

    .prologue
    .line 156
    iget-object v8, p0, Lcom/google/android/talk/AddBuddyScreen;->mEmailList:Landroid/widget/MultiAutoCompleteTextView;

    invoke-virtual {v8}, Landroid/widget/MultiAutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-static {v8}, Landroid/text/util/Rfc822Tokenizer;->tokenize(Ljava/lang/CharSequence;)[Landroid/text/util/Rfc822Token;

    move-result-object v6

    .line 159
    .local v6, "recipients":[Landroid/text/util/Rfc822Token;
    move-object v0, v6

    .local v0, "arr$":[Landroid/text/util/Rfc822Token;
    :try_start_0
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v5, v0, v2

    .line 160
    .local v5, "recipient":Landroid/text/util/Rfc822Token;
    invoke-virtual {v5}, Landroid/text/util/Rfc822Token;->getAddress()Ljava/lang/String;

    move-result-object v7

    .line 161
    .local v7, "username":Ljava/lang/String;
    const/4 v4, 0x0

    .line 163
    .local v4, "nickname":Ljava/lang/String;
    invoke-virtual {v5}, Landroid/text/util/Rfc822Token;->getAddress()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 164
    invoke-virtual {v5}, Landroid/text/util/Rfc822Token;->getName()Ljava/lang/String;

    move-result-object v4

    .line 167
    :cond_0
    const-string v8, "talk"

    const/4 v9, 0x3

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 168
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "inviteBuddies: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", nickname="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/talk/AddBuddyScreen;->log(Ljava/lang/String;)V

    .line 170
    :cond_1
    iget-object v8, p0, Lcom/google/android/talk/AddBuddyScreen;->mImSession:Lcom/google/android/gtalkservice/IImSession;

    const/4 v9, 0x0

    invoke-interface {v8, v7, v4, v9}, Lcom/google/android/gtalkservice/IImSession;->addContact(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 172
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "nickname":Ljava/lang/String;
    .end local v5    # "recipient":Landroid/text/util/Rfc822Token;
    .end local v7    # "username":Ljava/lang/String;
    :catch_0
    move-exception v8

    move-object v1, v8

    .line 173
    .local v1, "ex":Landroid/os/RemoteException;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "inviteBuddies: caught "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/google/android/talk/AddBuddyScreen;->loge(Ljava/lang/String;)V

    .line 178
    .end local v1    # "ex":Landroid/os/RemoteException;
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/talk/AddBuddyScreen;->closeScreen()V

    .line 179
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 63
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 65
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/talk/AddBuddyScreen;->mApp:Lcom/google/android/talk/TalkApp;

    .line 66
    new-instance v4, Lcom/google/android/talk/EmailAddressAdapter;

    invoke-direct {v4, p0}, Lcom/google/android/talk/EmailAddressAdapter;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/google/android/talk/AddBuddyScreen;->mAddressAdapter:Lcom/google/android/talk/EmailAddressAdapter;

    .line 67
    const/4 v1, 0x0

    .line 68
    .local v1, "domain":Ljava/lang/String;
    iget-object v4, p0, Lcom/google/android/talk/AddBuddyScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v4}, Lcom/google/android/talk/TalkApp;->getCurrentAccountInfo()Lcom/google/android/talk/TalkApp$AccountInfo;

    move-result-object v2

    .line 69
    .local v2, "info":Lcom/google/android/talk/TalkApp$AccountInfo;
    if-eqz v2, :cond_0

    .line 70
    iget-object v3, v2, Lcom/google/android/talk/TalkApp$AccountInfo;->mUsername:Ljava/lang/String;

    .line 71
    .local v3, "username":Ljava/lang/String;
    const/16 v4, 0x40

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 72
    .local v0, "atSignIndex":I
    if-lez v0, :cond_0

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_0

    .line 73
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 76
    .end local v0    # "atSignIndex":I
    .end local v3    # "username":Ljava/lang/String;
    :cond_0
    if-nez v1, :cond_1

    .line 77
    const-string v1, "gmail.com"

    .line 79
    :cond_1
    new-instance v4, Landroid/text/util/Rfc822Validator;

    invoke-direct {v4, v1}, Landroid/text/util/Rfc822Validator;-><init>(Ljava/lang/String;)V

    sput-object v4, Lcom/google/android/talk/AddBuddyScreen;->mValidator:Landroid/text/util/Rfc822Validator;

    .line 81
    invoke-virtual {p0}, Lcom/google/android/talk/AddBuddyScreen;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "contact"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/talk/AddBuddyScreen;->mInvitee:Ljava/lang/String;

    .line 83
    const/high16 v4, 0x7f030000

    invoke-virtual {p0, v4}, Lcom/google/android/talk/AddBuddyScreen;->setContentView(I)V

    .line 84
    invoke-virtual {p0}, Lcom/google/android/talk/AddBuddyScreen;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 85
    invoke-direct {p0}, Lcom/google/android/talk/AddBuddyScreen;->initView()V

    .line 87
    invoke-direct {p0}, Lcom/google/android/talk/AddBuddyScreen;->registerForServiceStateChanged()V

    .line 88
    return-void
.end method

.method protected onRestart()V
    .locals 2

    .prologue
    .line 92
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 94
    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    .line 95
    .local v0, "service":Lcom/google/android/gtalkservice/IGTalkService;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mService:Lcom/google/android/gtalkservice/IGTalkService;

    if-eq v1, v0, :cond_1

    .line 96
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen;->mApp:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->handleDisconnectedService()V

    .line 97
    invoke-direct {p0}, Lcom/google/android/talk/AddBuddyScreen;->registerForServiceStateChanged()V

    .line 101
    :goto_0
    return-void

    .line 99
    :cond_1
    invoke-direct {p0}, Lcom/google/android/talk/AddBuddyScreen;->serviceStateChanged()V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 105
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 106
    invoke-direct {p0}, Lcom/google/android/talk/AddBuddyScreen;->unregisterForServiceStateChanged()V

    .line 107
    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 221
    return-void
.end method
