.class final Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "ContactInfoQuery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ContactInfoQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ContactInfoQueryHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ContactInfoQuery;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/ContactInfoQuery;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    .line 106
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 107
    return-void
.end method


# virtual methods
.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 8
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "c"    # Landroid/database/Cursor;

    .prologue
    const/4 v7, 0x1

    .line 111
    if-nez p3, :cond_1

    .line 144
    :cond_0
    :goto_0
    return-void

    .line 114
    :cond_1
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-virtual {v4}, Lcom/google/android/talk/ContactInfoQuery;->cleanupContactInfoCursor()V

    .line 116
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4, p3}, Lcom/google/android/talk/ContactInfoQuery;->access$002(Lcom/google/android/talk/ContactInfoQuery;Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 117
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$100(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/ContentObserver;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 118
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$000(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/Cursor;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v5}, Lcom/google/android/talk/ContactInfoQuery;->access$100(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/ContentObserver;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 120
    :cond_2
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4, v7}, Lcom/google/android/talk/ContactInfoQuery;->access$202(Lcom/google/android/talk/ContactInfoQuery;Z)Z

    .line 122
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$300(Lcom/google/android/talk/ContactInfoQuery;)I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_3

    .line 123
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onQueryComplete: cursor.getCount(): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/google/android/talk/ContactInfoQuery;->access$400(Lcom/google/android/talk/ContactInfoQuery;Ljava/lang/String;)V

    .line 125
    :cond_3
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$500(Lcom/google/android/talk/ContactInfoQuery;)Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;

    move-result-object v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$000(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/Cursor;

    move-result-object v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$000(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/Cursor;

    move-result-object v4

    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 128
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$000(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/Cursor;

    move-result-object v4

    const/4 v5, 0x3

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 129
    .local v3, "presenceStatus":I
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$000(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/Cursor;

    move-result-object v4

    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "nickName":Ljava/lang/String;
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$000(Lcom/google/android/talk/ContactInfoQuery;)Landroid/database/Cursor;

    move-result-object v4

    const/4 v5, 0x4

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 131
    .local v1, "customStatus":Ljava/lang/String;
    invoke-static {v2}, Lcom/google/android/talk/StringUtils;->parseAbbreviatedAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 133
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-virtual {v4}, Lcom/google/android/talk/ContactInfoQuery;->getAvatar()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 135
    .local v0, "avatar":Landroid/graphics/drawable/Drawable;
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$300(Lcom/google/android/talk/ContactInfoQuery;)I

    move-result v4

    if-lt v4, v7, :cond_4

    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onQueryComplete: nickName="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", presenceStatus="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/google/android/talk/ContactInfoQuery;->access$400(Lcom/google/android/talk/ContactInfoQuery;Ljava/lang/String;)V

    .line 138
    :cond_4
    iget-object v4, p0, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryHandler;->this$0:Lcom/google/android/talk/ContactInfoQuery;

    invoke-static {v4}, Lcom/google/android/talk/ContactInfoQuery;->access$500(Lcom/google/android/talk/ContactInfoQuery;)Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;

    move-result-object v4

    invoke-interface {v4, v3, v1, v2, v0}, Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;->onContactInfoLoaded(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0
.end method
