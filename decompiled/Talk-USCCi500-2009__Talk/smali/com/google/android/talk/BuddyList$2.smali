.class Lcom/google/android/talk/BuddyList$2;
.super Landroid/content/BroadcastReceiver;
.source "BuddyList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyList;)V
    .locals 0

    .prologue
    .line 224
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$2;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 225
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 227
    .local v0, "a":Ljava/lang/String;
    const-string v4, "android.intent.action.GTALK_AVATAR_CHANGED"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 228
    const-string v4, "from"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 230
    .local v3, "contact":Ljava/lang/String;
    const-string v4, "accountId"

    const-wide/16 v5, 0x0

    invoke-virtual {p2, v4, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    .line 233
    .local v1, "accountId":J
    if-eqz v3, :cond_1

    iget-object v4, p0, Lcom/google/android/talk/BuddyList$2;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v4, v4, Lcom/google/android/talk/BuddyList;->mAccountInfo:Lcom/google/android/talk/TalkApp$AccountInfo;

    iget-object v4, v4, Lcom/google/android/talk/TalkApp$AccountInfo;->mUsername:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/google/android/talk/BuddyList$2;->this$0:Lcom/google/android/talk/BuddyList;

    iget-wide v4, v4, Lcom/google/android/talk/BuddyList;->mAccountId:J

    cmp-long v4, v1, v4

    if-nez v4, :cond_1

    .line 235
    iget-object v4, p0, Lcom/google/android/talk/BuddyList$2;->this$0:Lcom/google/android/talk/BuddyList;

    iget v4, v4, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v5, 0x1

    if-lt v4, v5, :cond_0

    .line 236
    iget-object v4, p0, Lcom/google/android/talk/BuddyList$2;->this$0:Lcom/google/android/talk/BuddyList;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "received intent "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", update own avatar"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 238
    :cond_0
    iget-object v4, p0, Lcom/google/android/talk/BuddyList$2;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v4}, Lcom/google/android/talk/BuddyList;->access$300(Lcom/google/android/talk/BuddyList;)V

    .line 241
    .end local v1    # "accountId":J
    .end local v3    # "contact":Ljava/lang/String;
    :cond_1
    return-void
.end method
