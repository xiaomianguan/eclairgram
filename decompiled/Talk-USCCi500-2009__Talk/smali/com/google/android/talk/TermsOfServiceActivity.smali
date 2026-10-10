.class public Lcom/google/android/talk/TermsOfServiceActivity;
.super Lcom/android/internal/app/AlertActivity;
.source "TermsOfServiceActivity.java"


# instance fields
.field private mHelper:Lcom/google/android/util/GoogleWebContentHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/android/internal/app/AlertActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/google/android/talk/TermsOfServiceActivity;->mHelper:Lcom/google/android/util/GoogleWebContentHelper;

    invoke-virtual {v0, p1}, Lcom/google/android/util/GoogleWebContentHelper;->handleKey(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    const/4 v0, 0x1

    .line 69
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const-string v7, "gtalk_terms_of_service_url"

    .line 39
    invoke-super {p0, p1}, Lcom/android/internal/app/AlertActivity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    invoke-virtual {p0}, Lcom/google/android/talk/TermsOfServiceActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 43
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    const-string v5, "mobile_transcoder_url"

    invoke-static {v0, v5}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 45
    .local v4, "transcodeUrl":Ljava/lang/String;
    const-string v5, "gtalk_terms_of_service_url"

    invoke-static {v0, v7}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 47
    .local v3, "termsUrl":Ljava/lang/String;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 49
    const-string v5, "gtalk_terms_of_service_url"

    invoke-static {v0, v7}, Landroid/provider/Settings$Gservices;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 52
    .local v2, "prettyUrl":Ljava/lang/String;
    new-instance v5, Lcom/google/android/util/GoogleWebContentHelper;

    invoke-direct {v5, p0}, Lcom/google/android/util/GoogleWebContentHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v3, v2}, Lcom/google/android/util/GoogleWebContentHelper;->setUrls(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/util/GoogleWebContentHelper;

    move-result-object v5

    const v6, 0x7f06008a

    invoke-virtual {p0, v6}, Lcom/google/android/talk/TermsOfServiceActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/android/util/GoogleWebContentHelper;->setUnsuccessfulMessage(Ljava/lang/String;)Lcom/google/android/util/GoogleWebContentHelper;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/util/GoogleWebContentHelper;->loadUrl()Lcom/google/android/util/GoogleWebContentHelper;

    move-result-object v5

    iput-object v5, p0, Lcom/google/android/talk/TermsOfServiceActivity;->mHelper:Lcom/google/android/util/GoogleWebContentHelper;

    .line 58
    iget-object v1, p0, Lcom/google/android/talk/TermsOfServiceActivity;->mAlertParams:Lcom/android/internal/app/AlertController$AlertParams;

    .line 59
    .local v1, "p":Lcom/android/internal/app/AlertController$AlertParams;
    const v5, 0x7f060089

    invoke-virtual {p0, v5}, Lcom/google/android/talk/TermsOfServiceActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/android/internal/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 60
    iget-object v5, p0, Lcom/google/android/talk/TermsOfServiceActivity;->mHelper:Lcom/google/android/util/GoogleWebContentHelper;

    invoke-virtual {v5}, Lcom/google/android/util/GoogleWebContentHelper;->getLayout()Landroid/view/ViewGroup;

    move-result-object v5

    iput-object v5, v1, Lcom/android/internal/app/AlertController$AlertParams;->mView:Landroid/view/View;

    .line 61
    invoke-virtual {p0}, Lcom/google/android/talk/TermsOfServiceActivity;->setupAlert()V

    .line 62
    return-void
.end method
