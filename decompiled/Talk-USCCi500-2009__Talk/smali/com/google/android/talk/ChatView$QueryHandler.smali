.class final Lcom/google/android/talk/ChatView$QueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "ChatView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "QueryHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatView;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ChatView;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 534
    iput-object p1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    .line 535
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 536
    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 5
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "c"    # Landroid/database/Cursor;

    .prologue
    .line 540
    sparse-switch p1, :sswitch_data_0

    .line 576
    :goto_0
    return-void

    .line 542
    :sswitch_0
    new-instance v0, Lcom/google/android/talk/ChatView$DeltaCursor;

    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    invoke-direct {v0, v1, p3}, Lcom/google/android/talk/ChatView$DeltaCursor;-><init>(Lcom/google/android/talk/ChatView;Landroid/database/Cursor;)V

    .line 544
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->getLogModeDebug()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 545
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const-string v2, "chat history onQueryComplete"

    invoke-static {v1, v2}, Lcom/google/android/talk/ChatView;->access$000(Lcom/google/android/talk/ChatView;Ljava/lang/String;)V

    .line 548
    :cond_0
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const-string v2, "nickname"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/talk/ChatView;->access$1402(Lcom/google/android/talk/ChatView;I)I

    .line 549
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const-string v2, "body"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/talk/ChatView;->access$1502(Lcom/google/android/talk/ChatView;I)I

    .line 550
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const-string v2, "date"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/talk/ChatView;->access$1602(Lcom/google/android/talk/ChatView;I)I

    .line 551
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const-string v2, "type"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/talk/ChatView;->access$1702(Lcom/google/android/talk/ChatView;I)I

    .line 552
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const-string v2, "show_ts"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/talk/ChatView;->access$1802(Lcom/google/android/talk/ChatView;I)I

    .line 553
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const-string v2, "err_code"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/talk/ChatView;->access$1902(Lcom/google/android/talk/ChatView;I)I

    .line 554
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const-string v2, "delta"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/google/android/talk/ChatView;->access$2002(Lcom/google/android/talk/ChatView;I)I

    .line 556
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v1}, Lcom/google/android/talk/ChatView;->access$2100(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ChatView$ChatAdapter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/talk/ChatView$ChatAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 558
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v1}, Lcom/google/android/talk/ChatView;->access$2200(Lcom/google/android/talk/ChatView;)V

    goto :goto_0

    .line 563
    .end local v0    # "cursor":Landroid/database/Cursor;
    :sswitch_1
    if-eqz p3, :cond_2

    invoke-interface {p3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 564
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const/4 v2, 0x0

    invoke-interface {p3, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/google/android/talk/ChatView;->access$1002(Lcom/google/android/talk/ChatView;J)J

    .line 568
    :goto_1
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v1}, Lcom/google/android/talk/ChatView;->access$2300(Lcom/google/android/talk/ChatView;)Lcom/google/android/talk/ChatScreen$ChatHost;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v2}, Lcom/google/android/talk/ChatView;->access$1100(Lcom/google/android/talk/ChatView;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v3}, Lcom/google/android/talk/ChatView;->access$1000(Lcom/google/android/talk/ChatView;)J

    move-result-wide v3

    invoke-interface {v1, v2, v3, v4}, Lcom/google/android/talk/ChatScreen$ChatHost;->cacheContactId(Ljava/lang/String;J)V

    .line 569
    if-eqz p3, :cond_1

    .line 570
    invoke-interface {p3}, Landroid/database/Cursor;->close()V

    .line 572
    :cond_1
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    invoke-static {v1}, Lcom/google/android/talk/ChatView;->access$900(Lcom/google/android/talk/ChatView;)V

    goto/16 :goto_0

    .line 566
    :cond_2
    iget-object v1, p0, Lcom/google/android/talk/ChatView$QueryHandler;->this$0:Lcom/google/android/talk/ChatView;

    const-wide/16 v2, -0x1

    invoke-static {v1, v2, v3}, Lcom/google/android/talk/ChatView;->access$1002(Lcom/google/android/talk/ChatView;J)J

    goto :goto_1

    .line 540
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0x14 -> :sswitch_1
    .end sparse-switch
.end method
