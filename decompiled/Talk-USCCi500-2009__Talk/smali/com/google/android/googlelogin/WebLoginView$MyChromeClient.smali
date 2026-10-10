.class Lcom/google/android/googlelogin/WebLoginView$MyChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "WebLoginView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/googlelogin/WebLoginView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyChromeClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/googlelogin/WebLoginView;


# direct methods
.method private constructor <init>(Lcom/google/android/googlelogin/WebLoginView;)V
    .locals 0

    .prologue
    .line 182
    iput-object p1, p0, Lcom/google/android/googlelogin/WebLoginView$MyChromeClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/googlelogin/WebLoginView;Lcom/google/android/googlelogin/WebLoginView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/googlelogin/WebLoginView;
    .param p2, "x1"    # Lcom/google/android/googlelogin/WebLoginView$1;

    .prologue
    .line 182
    invoke-direct {p0, p1}, Lcom/google/android/googlelogin/WebLoginView$MyChromeClient;-><init>(Lcom/google/android/googlelogin/WebLoginView;)V

    return-void
.end method


# virtual methods
.method public onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "dialog"    # Z
    .param p3, "userGesture"    # Z
    .param p4, "resultMsg"    # Landroid/os/Message;

    .prologue
    .line 186
    const-string v0, "WebLoginView"

    const-string v1, "onCreateWindow"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyChromeClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$200(Lcom/google/android/googlelogin/WebLoginView;)Landroid/webkit/WebView;

    move-result-object v0

    iput-object v0, p4, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 188
    invoke-virtual {p4}, Landroid/os/Message;->sendToTarget()V

    .line 189
    const/4 v0, 0x1

    return v0
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 194
    iget-object v0, p0, Lcom/google/android/googlelogin/WebLoginView$MyChromeClient;->this$0:Lcom/google/android/googlelogin/WebLoginView;

    invoke-static {v0}, Lcom/google/android/googlelogin/WebLoginView;->access$300(Lcom/google/android/googlelogin/WebLoginView;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 195
    return-void
.end method
