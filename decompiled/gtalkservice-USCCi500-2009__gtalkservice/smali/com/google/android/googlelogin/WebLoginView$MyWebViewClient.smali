.class Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "WebLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/googlelogin/WebLoginView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/googlelogin/WebLoginView;


# direct methods
.method private constructor <init>(Lcom/google/android/googlelogin/WebLoginView;)V
    .locals 0

    .prologue
    .line 201
    iput-object p1, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/googlelogin/WebLoginView;Lcom/google/android/googlelogin/WebLoginView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/googlelogin/WebLoginView;
    .param p2, "x1"    # Lcom/google/android/googlelogin/WebLoginView$1;

    .prologue
    .line 201
    invoke-direct {p0, p1}, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;-><init>(Lcom/google/android/googlelogin/WebLoginView;)V

    return-void
.end method

.method private hideWebUI()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 255
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$200(Lcom/google/android/googlelogin/WebLoginView;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->clearView()V

    .line 256
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$200(Lcom/google/android/googlelogin/WebLoginView;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 257
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$600(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 258
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$700(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 259
    return-void
.end method

.method private maybeFinish(Landroid/webkit/WebView;)Z
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;

    .prologue
    const/4 v3, 0x0

    .line 296
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$1100(Lcom/google/android/googlelogin/WebLoginView;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/googlelogin/SAMLUtils;->extractHID(Landroid/webkit/CookieManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 297
    .local v0, "HID":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    move v1, v3

    .line 305
    :goto_0
    return v1

    .line 301
    :cond_0
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 302
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v1, v3}, Lcom/google/android/googlelogin/WebLoginView;->access$402(Lcom/google/android/googlelogin/WebLoginView;Z)Z

    .line 303
    invoke-direct {p0}, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->hideWebUI()V

    .line 304
    iget-object v1, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v1}, Lcom/google/android/googlelogin/WebLoginView;->access$500(Lcom/google/android/googlelogin/WebLoginView;)Lcom/google/android/googlelogin/WebLoginView$Callback;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/google/android/googlelogin/WebLoginView$Callback;->onWebLoginCompleted(Ljava/lang/String;)V

    .line 305
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 7
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    const/16 v4, 0x8

    const-string v5, "WebLoginView"

    .line 270
    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$400(Lcom/google/android/googlelogin/WebLoginView;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 271
    const-string v2, "WebLoginView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Web view ingoring loaded url "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    :goto_0
    return-void

    .line 274
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->maybeFinish(Landroid/webkit/WebView;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 275
    const-string v2, "WebLoginView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not finished at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 277
    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$800(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 278
    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$600(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 279
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 280
    .local v1, "uri":Landroid/net/Uri;
    const-string v0, ""

    .line 281
    .local v0, "titleString":Ljava/lang/String;
    const-string v2, "https"

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 282
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "https://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 284
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v3}, Lcom/google/android/googlelogin/WebLoginView;->access$200(Lcom/google/android/googlelogin/WebLoginView;)Landroid/webkit/WebView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 285
    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$900(Lcom/google/android/googlelogin/WebLoginView;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 286
    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$700(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 287
    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$1000(Lcom/google/android/googlelogin/WebLoginView;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 288
    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$200(Lcom/google/android/googlelogin/WebLoginView;)Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 289
    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$200(Lcom/google/android/googlelogin/WebLoginView;)Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebView;->requestFocus()Z

    goto/16 :goto_0

    .line 291
    .end local v0    # "titleString":Ljava/lang/String;
    .end local v1    # "uri":Landroid/net/Uri;
    :cond_2
    const-string v2, "WebLoginView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Finished at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 218
    const-string v0, "WebLoginView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPageStarted "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v2}, Lcom/google/android/googlelogin/WebLoginView;->access$400(Lcom/google/android/googlelogin/WebLoginView;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, " - loading"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$400(Lcom/google/android/googlelogin/WebLoginView;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 220
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$200(Lcom/google/android/googlelogin/WebLoginView;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 226
    :cond_0
    :goto_1
    return-void

    .line 218
    :cond_1
    const-string v2, " - not loading"

    goto :goto_0

    .line 223
    :cond_2
    invoke-direct {p0, p1}, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->maybeFinish(Landroid/webkit/WebView;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 224
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_1
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 235
    const-string v0, "WebLoginView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceivedError "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/googlelogin/WebLoginView;->access$402(Lcom/google/android/googlelogin/WebLoginView;Z)Z

    .line 237
    invoke-direct {p0}, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->hideWebUI()V

    .line 238
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$500(Lcom/google/android/googlelogin/WebLoginView;)Lcom/google/android/googlelogin/WebLoginView$Callback;

    move-result-object v0

    sget-object v1, Lcom/google/android/googlelogin/WebLoginView$Error;->HttpError:Lcom/google/android/googlelogin/WebLoginView$Error;

    invoke-interface {v0, v1, p2, p3}, Lcom/google/android/googlelogin/WebLoginView$Callback;->onWebLoginError(Lcom/google/android/googlelogin/WebLoginView$Error;ILjava/lang/String;)V

    .line 239
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 240
    return-void
.end method

.method public onTooManyRedirects(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "cancelMsg"    # Landroid/os/Message;
    .param p3, "continueMsg"    # Landroid/os/Message;

    .prologue
    .line 248
    const-string v0, "WebLoginView"

    const-string v1, "onTooManyRedirects"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    invoke-direct {p0}, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->hideWebUI()V

    .line 250
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onTooManyRedirects(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V

    .line 251
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyWebViewClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$500(Lcom/google/android/googlelogin/WebLoginView;)Lcom/google/android/googlelogin/WebLoginView$Callback;

    move-result-object v0

    sget-object v1, Lcom/google/android/googlelogin/WebLoginView$Error;->TooManyRedirects:Lcom/google/android/googlelogin/WebLoginView$Error;

    const/4 v2, 0x0

    const-string v3, ""

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/googlelogin/WebLoginView$Callback;->onWebLoginError(Lcom/google/android/googlelogin/WebLoginView$Error;ILjava/lang/String;)V

    .line 252
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 207
    const-string v0, "WebLoginView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Web view is loading "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    const/4 v0, 0x0

    return v0
.end method
