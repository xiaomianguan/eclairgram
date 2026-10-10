.class Lcom/google/android/talk/ChatScreen$5;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatScreen;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen;)V
    .locals 0

    .prologue
    .line 515
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$5;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Landroid/database/Cursor;)V
    .locals 8
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 519
    if-nez p1, :cond_0

    .line 550
    :goto_0
    return-void

    .line 525
    :cond_0
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen$5;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v5}, Lcom/google/android/talk/ChatScreen;->access$2200(Lcom/google/android/talk/ChatScreen;)Ljava/util/List;

    move-result-object v5

    monitor-enter v5

    .line 526
    :try_start_0
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen$5;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v6}, Lcom/google/android/talk/ChatScreen;->access$2300(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v6

    if-nez v6, :cond_1

    .line 527
    iget-object v6, p0, Lcom/google/android/talk/ChatScreen$5;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v6}, Lcom/google/android/talk/ChatScreen;->access$2200(Lcom/google/android/talk/ChatScreen;)Ljava/util/List;

    move-result-object v6

    new-instance v7, Lcom/google/android/talk/ChatScreen$5$1;

    invoke-direct {v7, p0, p1}, Lcom/google/android/talk/ChatScreen$5$1;-><init>(Lcom/google/android/talk/ChatScreen$5;Landroid/database/Cursor;)V

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 535
    monitor-exit v5

    goto :goto_0

    .line 537
    :catchall_0
    move-exception v6

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    :cond_1
    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 539
    new-instance v0, Lcom/google/android/talk/ChatScreen$GalleryAdapter;

    iget-object v5, p0, Lcom/google/android/talk/ChatScreen$5;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {v0, v5, p1}, Lcom/google/android/talk/ChatScreen$GalleryAdapter;-><init>(Lcom/google/android/talk/ChatScreen;Landroid/database/Cursor;)V

    .line 540
    .local v0, "a":Lcom/google/android/talk/ChatScreen$GalleryAdapter;
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen$5;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v5}, Lcom/google/android/talk/ChatScreen;->access$100(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/PageViewGroup;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/google/android/talk/PageViewGroup;->setAdapter(Lcom/google/android/talk/PageViewGroup$Adapter;)V

    .line 542
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen$5;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-virtual {v5}, Lcom/google/android/talk/ChatScreen;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 543
    .local v1, "intent":Landroid/content/Intent;
    const-string v5, "accountId"

    const-wide/16 v6, 0x0

    invoke-virtual {v1, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 545
    .local v2, "targetAccountId":J
    const-string v5, "from"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/talk/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 549
    .local v4, "targetContact":Ljava/lang/String;
    iget-object v5, p0, Lcom/google/android/talk/ChatScreen$5;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v5, p1, v4, v2, v3}, Lcom/google/android/talk/ChatScreen;->access$2400(Lcom/google/android/talk/ChatScreen;Landroid/database/Cursor;Ljava/lang/String;J)V

    goto :goto_0
.end method
