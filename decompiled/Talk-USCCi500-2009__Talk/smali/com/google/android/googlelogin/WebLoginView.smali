.class public Lcom/google/android/googlelogin/WebLoginView;
.super Ljava/lang/Object;
.source "WebLoginView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/googlelogin/WebLoginView$1;,
        Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;,
        Lcom/google/android/googlelogin/WebLoginView$MyChromeClient;,
        Lcom/google/android/googlelogin/WebLoginView$Callback;,
        Lcom/google/android/googlelogin/WebLoginView$Error;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "WebLoginView"


# instance fields
.field private mBackButton:Landroid/view/View;

.field private mBottomBar:Landroid/view/View;

.field private mCallback:Lcom/google/android/googlelogin/WebLoginView$Callback;

.field private mCancelButton:Landroid/view/View;

.field private mDomainName:Ljava/lang/String;

.field private mIsLoading:Z

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mProgressView:Landroid/view/View;

.field private mStartUrl:Ljava/lang/String;

.field private mTitleTextView:Landroid/widget/TextView;

.field private mTitleView:Landroid/view/View;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;Landroid/view/View;Landroid/widget/ProgressBar;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/widget/TextView;Landroid/view/View;Lcom/google/android/googlelogin/WebLoginView$Callback;)V
    .locals 2
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "progressView"    # Landroid/view/View;
    .param p3, "progressBar"    # Landroid/widget/ProgressBar;
    .param p4, "backButton"    # Landroid/view/View;
    .param p5, "cancelButton"    # Landroid/view/View;
    .param p6, "titleView"    # Landroid/view/View;
    .param p7, "titleTextView"    # Landroid/widget/TextView;
    .param p8, "bottomBar"    # Landroid/view/View;
    .param p9, "callback"    # Lcom/google/android/googlelogin/WebLoginView$Callback;

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput-object p1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    .line 93
    iput-object p2, p0, Lcom/google/android/googlelogin/WebLoginView;->mProgressView:Landroid/view/View;

    .line 94
    iput-object p3, p0, Lcom/google/android/googlelogin/WebLoginView;->mProgressBar:Landroid/widget/ProgressBar;

    .line 95
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 96
    iput-object p9, p0, Lcom/google/android/googlelogin/WebLoginView;->mCallback:Lcom/google/android/googlelogin/WebLoginView$Callback;

    .line 97
    iput-object p4, p0, Lcom/google/android/googlelogin/WebLoginView;->mBackButton:Landroid/view/View;

    .line 98
    iput-object p5, p0, Lcom/google/android/googlelogin/WebLoginView;->mCancelButton:Landroid/view/View;

    .line 99
    iput-object p6, p0, Lcom/google/android/googlelogin/WebLoginView;->mTitleView:Landroid/view/View;

    .line 100
    iput-object p7, p0, Lcom/google/android/googlelogin/WebLoginView;->mTitleTextView:Landroid/widget/TextView;

    .line 101
    iput-object p8, p0, Lcom/google/android/googlelogin/WebLoginView;->mBottomBar:Landroid/view/View;

    .line 102
    invoke-direct {p0}, Lcom/google/android/googlelogin/WebLoginView;->setupOptionsAndCallbacks()V

    .line 103
    return-void
.end method

.method static synthetic access$1000(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mCancelButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/google/android/googlelogin/WebLoginView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mDomainName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/googlelogin/WebLoginView;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/googlelogin/WebLoginView;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mProgressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/googlelogin/WebLoginView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mIsLoading:Z

    return v0
.end method

.method static synthetic access$402(Lcom/google/android/googlelogin/WebLoginView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;
    .param p1, "x1"    # Z

    .prologue
    .line 54
    iput-boolean p1, p0, Lcom/google/android/googlelogin/WebLoginView;->mIsLoading:Z

    return p1
.end method

.method static synthetic access$500(Lcom/google/android/googlelogin/WebLoginView;)Lcom/google/android/googlelogin/WebLoginView$Callback;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mCallback:Lcom/google/android/googlelogin/WebLoginView$Callback;

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mTitleView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mBottomBar:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$800(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mProgressView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$900(Lcom/google/android/googlelogin/WebLoginView;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/googlelogin/WebLoginView;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mTitleTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method private doLogin()V
    .locals 5

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 122
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 123
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/CookieManager;->removeAllCookie()V

    .line 126
    :goto_0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/CookieManager;->hasCookies()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    const-wide/16 v1, 0x64

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 129
    :catch_0
    move-exception v0

    .line 133
    :cond_0
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mTitleView:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 134
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 135
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mBackButton:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 136
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mCancelButton:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 137
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 138
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mProgressView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 139
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView;->mStartUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 140
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mIsLoading:Z

    .line 141
    return-void
.end method

.method private setupOptionsAndCallbacks()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 157
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;

    invoke-direct {v2, p0, v5}, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;-><init>(Lcom/google/android/googlelogin/WebLoginView;Lcom/google/android/googlelogin/WebLoginView$1;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 158
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/google/android/googlelogin/WebLoginView$MyChromeClient;

    invoke-direct {v2, p0, v5}, Lcom/google/android/googlelogin/WebLoginView$MyChromeClient;-><init>(Lcom/google/android/googlelogin/WebLoginView;Lcom/google/android/googlelogin/WebLoginView$1;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 159
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 160
    .local v0, "s":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 161
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 163
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 164
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 165
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 166
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 167
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 169
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setLoadsImagesAutomatically(Z)V

    .line 170
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setLightTouchEnabled(Z)V

    .line 171
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setNeedInitialFocus(Z)V

    .line 172
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 174
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->setMapTrackballToArrowKeys(Z)V

    .line 175
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setFocusable(Z)V

    .line 176
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setFocusableInTouchMode(Z)V

    .line 177
    return-void
.end method


# virtual methods
.method public login(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "startUrl"    # Ljava/lang/String;
    .param p2, "domainName"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/google/android/googlelogin/WebLoginView;->mStartUrl:Ljava/lang/String;

    .line 113
    iput-object p2, p0, Lcom/google/android/googlelogin/WebLoginView;->mDomainName:Ljava/lang/String;

    .line 114
    invoke-direct {p0}, Lcom/google/android/googlelogin/WebLoginView;->doLogin()V

    .line 115
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 147
    iget-boolean v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mIsLoading:Z

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 149
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/googlelogin/WebLoginView;->mIsLoading:Z

    .line 151
    :cond_0
    return-void
.end method
