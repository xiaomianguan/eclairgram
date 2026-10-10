.class Lcom/google/android/talk/BuddyList$RosterListener;
.super Lcom/google/android/gtalkservice/IRosterListener$Stub;
.source "BuddyList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RosterListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyList;)V
    .locals 0

    .prologue
    .line 283
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IRosterListener$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public presenceChanged(Ljava/lang/String;)V
    .locals 4
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 295
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RosterListener.presenceChanged"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p1, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/talk/BuddyList;->requeryCursor(Z)V

    .line 298
    return-void

    .line 295
    :cond_1
    const-string v2, ""

    goto :goto_0
.end method

.method public rosterChanged()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 285
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    if-lt v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "RosterListener.rosterChanged"

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 286
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-virtual {v0, v2}, Lcom/google/android/talk/BuddyList;->requeryCursor(Z)V

    .line 287
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/talk/BuddyList$RosterListener$1;

    invoke-direct {v1, p0}, Lcom/google/android/talk/BuddyList$RosterListener$1;-><init>(Lcom/google/android/talk/BuddyList$RosterListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 292
    return-void
.end method

.method public selfPresenceChanged()V
    .locals 2

    .prologue
    .line 301
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "RosterListener.selfPresenceChanged"

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 303
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v0, v0, Lcom/google/android/talk/BuddyList;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/talk/BuddyList$RosterListener$2;

    invoke-direct {v1, p0}, Lcom/google/android/talk/BuddyList$RosterListener$2;-><init>(Lcom/google/android/talk/BuddyList$RosterListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 308
    return-void
.end method
