.class public Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "StatusBarNotifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/service/StatusBarNotifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "OnDeletedReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/service/StatusBarNotifier;)V
    .locals 0

    .prologue
    .line 408
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;->this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 410
    const-string v1, "notification_id"

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 411
    .local v0, "notificationId":I
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v1, :cond_0

    .line 412
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;->this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "##### NotificationDeletedReceiver.onReceive: remove notification for id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->access$200(Lcom/google/android/gtalkservice/service/StatusBarNotifier;Ljava/lang/String;)V

    .line 415
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$OnDeletedReceiver;->this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    invoke-static {v1, v0}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->access$400(Lcom/google/android/gtalkservice/service/StatusBarNotifier;I)V

    .line 416
    return-void
.end method
