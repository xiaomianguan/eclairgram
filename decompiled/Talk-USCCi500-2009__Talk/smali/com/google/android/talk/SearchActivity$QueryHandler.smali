.class final Lcom/google/android/talk/SearchActivity$QueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "SearchActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/SearchActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "QueryHandler"
.end annotation


# instance fields
.field private mAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

.field final synthetic this$0:Lcom/google/android/talk/SearchActivity;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/SearchActivity;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 308
    iput-object p1, p0, Lcom/google/android/talk/SearchActivity$QueryHandler;->this$0:Lcom/google/android/talk/SearchActivity;

    .line 309
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 310
    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 4
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    const-string v3, "talk"

    .line 318
    const-string v1, "talk"

    const-string v1, "onQueryComplete"

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    iget-object v1, p0, Lcom/google/android/talk/SearchActivity$QueryHandler;->this$0:Lcom/google/android/talk/SearchActivity;

    invoke-static {v1}, Lcom/google/android/talk/SearchActivity;->access$100(Lcom/google/android/talk/SearchActivity;)Landroid/provider/Gmail;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/SearchActivity$QueryHandler;->this$0:Lcom/google/android/talk/SearchActivity;

    invoke-static {v2}, Lcom/google/android/talk/SearchActivity;->access$000(Lcom/google/android/talk/SearchActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p3}, Landroid/provider/Gmail;->getConversationCursorForCursor(Ljava/lang/String;Landroid/database/Cursor;)Landroid/provider/Gmail$ConversationCursor;

    move-result-object v0

    .line 322
    .local v0, "conversationCursor":Landroid/provider/Gmail$ConversationCursor;
    iget-object v1, p0, Lcom/google/android/talk/SearchActivity$QueryHandler;->mAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    invoke-virtual {v1, v0}, Lcom/google/android/talk/SearchHeaderCursorAdapter;->changeCursor(Landroid/provider/Gmail$ConversationCursor;)V

    .line 324
    const-string v1, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onQueryComplete conversationCursor count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->count()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " status: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->getStatus()Landroid/provider/Gmail$CursorStatus;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    invoke-virtual {v0}, Landroid/provider/Gmail$ConversationCursor;->getStatus()Landroid/provider/Gmail$CursorStatus;

    move-result-object v1

    sget-object v2, Landroid/provider/Gmail$CursorStatus;->LOADED:Landroid/provider/Gmail$CursorStatus;

    if-ne v1, v2, :cond_0

    .line 328
    iget-object v1, p0, Lcom/google/android/talk/SearchActivity$QueryHandler;->this$0:Lcom/google/android/talk/SearchActivity;

    invoke-virtual {v1}, Lcom/google/android/talk/SearchActivity;->onContentChanged()V

    .line 330
    :cond_0
    return-void
.end method

.method public setAdapter(Lcom/google/android/talk/SearchHeaderCursorAdapter;)V
    .locals 0
    .param p1, "adapter"    # Lcom/google/android/talk/SearchHeaderCursorAdapter;

    .prologue
    .line 313
    iput-object p1, p0, Lcom/google/android/talk/SearchActivity$QueryHandler;->mAdapter:Lcom/google/android/talk/SearchHeaderCursorAdapter;

    .line 314
    return-void
.end method
