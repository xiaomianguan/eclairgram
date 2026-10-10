.class final Lcom/google/android/talk/SearchChatResultActivity$ConversationContentObserver;
.super Landroid/database/ContentObserver;
.source "SearchChatResultActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/SearchChatResultActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ConversationContentObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/SearchChatResultActivity;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/SearchChatResultActivity;)V
    .locals 1

    .prologue
    .line 502
    iput-object p1, p0, Lcom/google/android/talk/SearchChatResultActivity$ConversationContentObserver;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    .line 503
    invoke-static {p1}, Lcom/google/android/talk/SearchChatResultActivity;->access$1400(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/os/Handler;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 504
    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .locals 1

    .prologue
    .line 508
    const/4 v0, 0x0

    return v0
.end method

.method public onChange(Z)V
    .locals 5
    .param p1, "selfChange"    # Z

    .prologue
    .line 513
    if-nez p1, :cond_1

    .line 514
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity$ConversationContentObserver;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v2}, Lcom/google/android/talk/SearchChatResultActivity;->access$200(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail$MessageCursor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 515
    .local v0, "c":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    move-result v1

    .line 516
    .local v1, "valid":Z
    if-eqz v1, :cond_2

    .line 519
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity$ConversationContentObserver;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v2}, Lcom/google/android/talk/SearchChatResultActivity;->access$1500(Lcom/google/android/talk/SearchChatResultActivity;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 520
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity$ConversationContentObserver;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v2}, Lcom/google/android/talk/SearchChatResultActivity;->access$1600(Lcom/google/android/talk/SearchChatResultActivity;)V

    .line 526
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity$ConversationContentObserver;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v2}, Lcom/google/android/talk/SearchChatResultActivity;->access$1700(Lcom/google/android/talk/SearchChatResultActivity;)Lcom/google/android/talk/ContactInfoQuery;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/talk/ContactInfoQuery;->requeryForContactInfo()V

    .line 528
    .end local v0    # "c":Landroid/database/Cursor;
    .end local v1    # "valid":Z
    :cond_1
    return-void

    .line 523
    .restart local v0    # "c":Landroid/database/Cursor;
    .restart local v1    # "valid":Z
    :cond_2
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Cursor could not be requeried "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " selfChange:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
