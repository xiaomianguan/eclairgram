.class final Lcom/google/android/talk/GTalkDiagnostics$MyConnectionListener;
.super Lcom/google/android/gtalkservice/IConnectionStateListener$Stub;
.source "GTalkDiagnostics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/GTalkDiagnostics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MyConnectionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/GTalkDiagnostics;


# direct methods
.method private constructor <init>(Lcom/google/android/talk/GTalkDiagnostics;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/google/android/talk/GTalkDiagnostics$MyConnectionListener;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IConnectionStateListener$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/talk/GTalkDiagnostics;Lcom/google/android/talk/GTalkDiagnostics$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/talk/GTalkDiagnostics;
    .param p2, "x1"    # Lcom/google/android/talk/GTalkDiagnostics$1;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/google/android/talk/GTalkDiagnostics$MyConnectionListener;-><init>(Lcom/google/android/talk/GTalkDiagnostics;)V

    return-void
.end method


# virtual methods
.method public connectionStateChanged(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V
    .locals 3
    .param p1, "state"    # Lcom/google/android/gtalkservice/ConnectionState;
    .param p2, "error"    # Lcom/google/android/gtalkservice/ConnectionError;

    .prologue
    const-string v2, "GTalkDiag"

    .line 64
    const-string v0, "GTalkDiag"

    const/4 v0, 0x3

    invoke-static {v2, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    const-string v0, "GTalkDiag"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "connStateChanged: state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/GTalkDiagnostics$MyConnectionListener;->this$0:Lcom/google/android/talk/GTalkDiagnostics;

    invoke-static {v0}, Lcom/google/android/talk/GTalkDiagnostics;->access$100(Lcom/google/android/talk/GTalkDiagnostics;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/google/android/talk/GTalkDiagnostics$MyConnectionListener$1;

    invoke-direct {v1, p0}, Lcom/google/android/talk/GTalkDiagnostics$MyConnectionListener$1;-><init>(Lcom/google/android/talk/GTalkDiagnostics$MyConnectionListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 73
    return-void
.end method
