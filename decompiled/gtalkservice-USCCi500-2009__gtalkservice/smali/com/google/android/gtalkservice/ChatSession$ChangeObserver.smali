.class Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;
.super Landroid/database/ContentObserver;
.source "ChatSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/ChatSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChangeObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/ChatSession;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/ChatSession;Landroid/os/Handler;)V
    .locals 0
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    .line 105
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 106
    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .locals 1

    .prologue
    .line 110
    const/4 v0, 0x1

    return v0
.end method

.method public onChange(Z)V
    .locals 2
    .param p1, "selfChange"    # Z

    .prologue
    .line 115
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ChatSession;->isOffTheRecord()Z

    move-result v0

    .line 117
    .local v0, "oldOffTheRecord":Z
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    invoke-static {v1}, Lcom/google/android/gtalkservice/ChatSession;->access$000(Lcom/google/android/gtalkservice/ChatSession;)V

    .line 119
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ChatSession;->isOffTheRecord()Z

    move-result v1

    if-eq v0, v1, :cond_0

    .line 120
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ChatSession;->addOffTheRecordStatusChange()V

    .line 122
    :cond_0
    return-void
.end method
