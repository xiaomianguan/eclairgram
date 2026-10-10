.class Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;
.super Ljava/lang/Object;
.source "GoogleLoginServiceBlockingHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;


# direct methods
.method constructor <init>(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)V
    .locals 0

    .prologue
    .line 115
    iput-object p1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "className"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 97
    :try_start_0
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-static {v0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$000(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 105
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    iget-object v1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-static {v1}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$200(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/googlelogin/GoogleAppsVerifier;->isGoogleAppsVerified(Landroid/content/Context;)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$102(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;Z)Z

    .line 107
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-static {p2}, Lcom/google/android/googleapps/IGoogleLoginService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/googleapps/IGoogleLoginService;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$302(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;Lcom/google/android/googleapps/IGoogleLoginService;)Lcom/google/android/googleapps/IGoogleLoginService;

    .line 109
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-static {v0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$400(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-static {v0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$000(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 113
    return-void

    .line 111
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-static {v1}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$000(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "className"    # Landroid/content/ComponentName;

    .prologue
    .line 116
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-static {v0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$000(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 117
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$302(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;Lcom/google/android/googleapps/IGoogleLoginService;)Lcom/google/android/googleapps/IGoogleLoginService;

    .line 118
    iget-object v0, p0, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper$1;->this$0:Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;

    invoke-static {v0}, Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;->access$000(Lcom/google/android/googlelogin/GoogleLoginServiceBlockingHelper;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 119
    return-void
.end method
