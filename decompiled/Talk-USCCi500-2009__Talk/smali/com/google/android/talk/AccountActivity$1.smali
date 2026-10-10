.class Lcom/google/android/talk/AccountActivity$1;
.super Ljava/lang/Object;
.source "AccountActivity.java"

# interfaces
.implements Landroid/accounts/AccountManagerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/AccountActivity;->checkForAccount()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/accounts/AccountManagerCallback",
        "<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/AccountActivity;


# direct methods
.method constructor <init>(Lcom/google/android/talk/AccountActivity;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/google/android/talk/AccountActivity$1;->this$0:Lcom/google/android/talk/AccountActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/accounts/AccountManagerFuture;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/AccountManagerFuture",
            "<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "future":Landroid/accounts/AccountManagerFuture;, "Landroid/accounts/AccountManagerFuture<Landroid/os/Bundle;>;"
    const-string v2, "talk"

    .line 70
    :try_start_0
    invoke-interface {p1}, Landroid/accounts/AccountManagerFuture;->getResult()Ljava/lang/Object;

    .line 72
    const-string v0, "talk"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$1;->this$0:Lcom/google/android/talk/AccountActivity;

    const-string v1, "setup wizard finished"

    invoke-static {v0, v1}, Lcom/google/android/talk/AccountActivity;->access$000(Lcom/google/android/talk/AccountActivity;Ljava/lang/String;)V

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$1;->this$0:Lcom/google/android/talk/AccountActivity;

    invoke-static {v0}, Lcom/google/android/talk/AccountActivity;->access$100(Lcom/google/android/talk/AccountActivity;)V
    :try_end_0
    .catch Landroid/accounts/OperationCanceledException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/accounts/AuthenticatorException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 85
    :goto_1
    const-string v0, "talk"

    const-string v0, "[AccountActivity] launch setup wizard failed"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$1;->this$0:Lcom/google/android/talk/AccountActivity;

    invoke-virtual {v0}, Lcom/google/android/talk/AccountActivity;->finish()V

    goto :goto_0

    .line 80
    :catch_1
    move-exception v0

    goto :goto_1

    .line 78
    :catch_2
    move-exception v0

    goto :goto_1
.end method
