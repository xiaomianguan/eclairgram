.class Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;
.super Ljava/lang/Object;
.source "GTalkConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/GTalkConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClearWakeLockTimer"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/GTalkConnection;


# direct methods
.method private constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 0

    .prologue
    .line 332
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;Lcom/google/android/gtalkservice/GTalkConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p2, "x1"    # Lcom/google/android/gtalkservice/GTalkConnection$1;

    .prologue
    .line 332
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 334
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    const-string v1, "##### clear wakelock timer fired #####"

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->access$200(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V

    .line 335
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->releaseAsyncWakeLock()V

    .line 336
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/google/android/gtalkservice/LogTag;->logEvent(I)V

    .line 337
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$ClearWakeLockTimer;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-static {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->access$1008(Lcom/google/android/gtalkservice/GTalkConnection;)I

    .line 338
    return-void
.end method
