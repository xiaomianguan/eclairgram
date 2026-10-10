.class final Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;
.super Ljava/lang/Object;
.source "SearchChatResultActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/SearchChatResultActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "GmailJsInterface"
.end annotation


# instance fields
.field private mLastAddressLine:Ljava/lang/String;

.field private mLastMessageId:Ljava/lang/String;

.field final synthetic this$0:Lcom/google/android/talk/SearchChatResultActivity;


# direct methods
.method constructor <init>(Lcom/google/android/talk/SearchChatResultActivity;)V
    .locals 0

    .prologue
    .line 377
    iput-object p1, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 378
    return-void
.end method


# virtual methods
.method public forward(Ljava/lang/String;)V
    .locals 2
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 389
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1, p1}, Lcom/google/android/talk/SearchChatResultActivity;->access$000(Lcom/google/android/talk/SearchChatResultActivity;ZLjava/lang/String;)V

    .line 390
    return-void
.end method

.method public getAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 408
    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->mLastMessageId:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 409
    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->mLastAddressLine:Ljava/lang/String;

    .line 416
    :goto_0
    return-object v4

    .line 411
    :cond_0
    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v4, p1}, Lcom/google/android/talk/SearchChatResultActivity;->access$400(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/String;)J

    move-result-wide v1

    .line 412
    .local v1, "id":J
    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v4}, Lcom/google/android/talk/SearchChatResultActivity;->access$600(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v5}, Lcom/google/android/talk/SearchChatResultActivity;->access$500(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v1, v2}, Landroid/provider/Gmail;->getMessageCursorForMessageId(Ljava/lang/String;J)Landroid/provider/Gmail$MessageCursor;

    move-result-object v0

    .line 413
    .local v0, "cursor":Landroid/provider/Gmail$MessageCursor;
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/provider/Gmail$MessageCursor;->moveTo(I)Z

    .line 414
    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v4, v0}, Lcom/google/android/talk/SearchChatResultActivity;->access$700(Lcom/google/android/talk/SearchChatResultActivity;Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;

    move-result-object v3

    .line 415
    .local v3, "result":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v4

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    move-object v4, v3

    .line 416
    goto :goto_0
.end method

.method public getCollapsedSnippet(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 459
    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v4, p1}, Lcom/google/android/talk/SearchChatResultActivity;->access$400(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/String;)J

    move-result-wide v1

    .line 462
    .local v1, "id":J
    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v4}, Lcom/google/android/talk/SearchChatResultActivity;->access$800(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/util/Map;

    move-result-object v4

    monitor-enter v4

    .line 463
    :try_start_0
    iget-object v5, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v5}, Lcom/google/android/talk/SearchChatResultActivity;->access$800(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/util/Map;

    move-result-object v5

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 466
    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v4}, Lcom/google/android/talk/SearchChatResultActivity;->access$600(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v5}, Lcom/google/android/talk/SearchChatResultActivity;->access$500(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v1, v2}, Landroid/provider/Gmail;->getMessageCursorForMessageId(Ljava/lang/String;J)Landroid/provider/Gmail$MessageCursor;

    move-result-object v0

    .line 467
    .local v0, "cursor":Landroid/provider/Gmail$MessageCursor;
    invoke-virtual {v0, v8}, Landroid/provider/Gmail$MessageCursor;->moveTo(I)Z

    .line 468
    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v4, v0}, Lcom/google/android/talk/SearchChatResultActivity;->access$1300(Lcom/google/android/talk/SearchChatResultActivity;Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;

    move-result-object v3

    .line 469
    .local v3, "result":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v4

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 470
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<div class=\"snippetDiv\">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v3}, Landroid/text/TextUtils;->htmlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</div>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 464
    .end local v0    # "cursor":Landroid/provider/Gmail$MessageCursor;
    .end local v3    # "result":Ljava/lang/String;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5
.end method

.method public getMessageBody(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 430
    iput-object p1, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->mLastMessageId:Ljava/lang/String;

    .line 432
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v0, p1}, Lcom/google/android/talk/SearchChatResultActivity;->access$400(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/String;)J

    move-result-wide v10

    .line 435
    .local v10, "id":J
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v0}, Lcom/google/android/talk/SearchChatResultActivity;->access$800(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/util/Map;

    move-result-object v0

    monitor-enter v0

    .line 436
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v2}, Lcom/google/android/talk/SearchChatResultActivity;->access$800(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/util/Map;

    move-result-object v2

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 439
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v0}, Lcom/google/android/talk/SearchChatResultActivity;->access$600(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v2}, Lcom/google/android/talk/SearchChatResultActivity;->access$500(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v10, v11}, Landroid/provider/Gmail;->getMessageCursorForMessageId(Ljava/lang/String;J)Landroid/provider/Gmail$MessageCursor;

    move-result-object v9

    .line 440
    .local v9, "cursor":Landroid/provider/Gmail$MessageCursor;
    invoke-virtual {v9, v7}, Landroid/provider/Gmail$MessageCursor;->moveTo(I)Z

    .line 442
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v0}, Lcom/google/android/talk/SearchChatResultActivity;->access$200(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail$MessageCursor;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v2}, Lcom/google/android/talk/SearchChatResultActivity;->access$200(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail$MessageCursor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->count()I

    move-result v2

    sub-int/2addr v2, v6

    invoke-virtual {v0, v2}, Landroid/provider/Gmail$MessageCursor;->moveTo(I)Z

    .line 443
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v0}, Lcom/google/android/talk/SearchChatResultActivity;->access$200(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail$MessageCursor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/provider/Gmail$MessageCursor;->getMessageId()J

    move-result-wide v2

    invoke-virtual {v9}, Landroid/provider/Gmail$MessageCursor;->getMessageId()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    move v8, v6

    .line 445
    .local v8, "isLast":Z
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v0, 0x4000

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 446
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-virtual {v9}, Landroid/provider/Gmail$MessageCursor;->getBody()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v3}, Lcom/google/android/talk/SearchChatResultActivity;->access$900(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;

    move-result-object v4

    iget-object v3, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v3}, Lcom/google/android/talk/SearchChatResultActivity;->access$1000(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;

    move-result-object v5

    iget-object v3, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v3}, Lcom/google/android/talk/SearchChatResultActivity;->access$1100(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9}, Landroid/provider/Gmail$MessageCursor;->getBodyEmbedsExternalResources()Z

    move-result v7

    move-object v3, p1

    invoke-static/range {v0 .. v8}, Lcom/google/android/talk/SearchChatResultActivity;->access$1200(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 450
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v0, v9}, Lcom/google/android/talk/SearchChatResultActivity;->access$700(Lcom/google/android/talk/SearchChatResultActivity;Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->mLastAddressLine:Ljava/lang/String;

    .line 451
    invoke-virtual {v9}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 452
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 437
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    .end local v8    # "isLast":Z
    .end local v9    # "cursor":Landroid/provider/Gmail$MessageCursor;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .restart local v9    # "cursor":Landroid/provider/Gmail$MessageCursor;
    :cond_0
    move v8, v7

    .line 443
    goto :goto_0
.end method

.method public getMessageHeaders(II)Ljava/lang/String;
    .locals 3
    .param p1, "first"    # I
    .param p2, "last"    # I

    .prologue
    .line 398
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 399
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v2}, Lcom/google/android/talk/SearchChatResultActivity;->access$200(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail$MessageCursor;

    move-result-object v2

    invoke-static {v1, v0, v2, p1, p2}, Lcom/google/android/talk/SearchChatResultActivity;->access$300(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/StringBuilder;Landroid/provider/Gmail$MessageCursor;II)V

    .line 400
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public reply(Ljava/lang/String;)V
    .locals 2
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 381
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1, p1}, Lcom/google/android/talk/SearchChatResultActivity;->access$000(Lcom/google/android/talk/SearchChatResultActivity;ZLjava/lang/String;)V

    .line 382
    return-void
.end method

.method public replyByChat(Ljava/lang/String;)V
    .locals 1
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 385
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v0, p1}, Lcom/google/android/talk/SearchChatResultActivity;->access$100(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/String;)V

    .line 386
    return-void
.end method
