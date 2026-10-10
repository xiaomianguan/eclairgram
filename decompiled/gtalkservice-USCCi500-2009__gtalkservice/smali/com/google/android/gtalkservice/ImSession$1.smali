.class Lcom/google/android/gtalkservice/ImSession$1;
.super Ljava/lang/Object;
.source "ImSession.java"

# interfaces
.implements Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/ImSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable",
        "<",
        "Lcom/google/android/gtalkservice/IConnectionStateListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/ImSession;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/ImSession;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/google/android/gtalkservice/ImSession$1;->this$0:Lcom/google/android/gtalkservice/ImSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/google/android/gtalkservice/IConnectionStateListener;)Z
    .locals 1
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IConnectionStateListener;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/google/android/gtalkservice/ImSession$1;->this$0:Lcom/google/android/gtalkservice/ImSession;

    invoke-static {v0, p1}, Lcom/google/android/gtalkservice/ImSession;->access$000(Lcom/google/android/gtalkservice/ImSession;Lcom/google/android/gtalkservice/IConnectionStateListener;)V

    .line 63
    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 61
    check-cast p1, Lcom/google/android/gtalkservice/IConnectionStateListener;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/ImSession$1;->call(Lcom/google/android/gtalkservice/IConnectionStateListener;)Z

    move-result v0

    return v0
.end method
