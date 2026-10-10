.class Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;
.super Landroid/widget/CursorAdapter;
.source "SearchConversationView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/SearchConversationView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SearchMessageAdapter"
.end annotation


# instance fields
.field private mMessageCursor:Landroid/provider/Gmail$MessageCursor;

.field final synthetic this$0:Lcom/google/android/talk/SearchConversationView;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/SearchConversationView;Landroid/app/Activity;Landroid/provider/Gmail$MessageCursor;)V
    .locals 2
    .param p2, "context"    # Landroid/app/Activity;
    .param p3, "cursor"    # Landroid/provider/Gmail$MessageCursor;

    .prologue
    .line 228
    iput-object p1, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->this$0:Lcom/google/android/talk/SearchConversationView;

    .line 229
    invoke-virtual {p3}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p2, v0, v1}, Landroid/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 230
    iput-object p3, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    .line 231
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    const-string v3, "talk"

    .line 257
    const v1, 0x7f0b002d

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 259
    .local v0, "messageView":Landroid/widget/TextView;
    const-string v1, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SearchMessageAdapter.bindView getBody: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->getBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    const-string v1, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SearchMessageAdapter.bindView getSnippet: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->getSnippet()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    const-string v1, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SearchMessageAdapter.bindView getFromAddress: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->getFromAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    const-string v1, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SearchMessageAdapter.bindView getSubject: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->getSubject()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    iget-object v1, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v1}, Landroid/provider/Gmail$MessageCursor;->getBody()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 264
    return-void
.end method

.method public final changeCursor(Landroid/provider/Gmail$MessageCursor;)V
    .locals 3
    .param p1, "cursor"    # Landroid/provider/Gmail$MessageCursor;

    .prologue
    .line 234
    iput-object p1, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    .line 235
    iget-object v0, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    if-eqz v0, :cond_0

    .line 236
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SearchMessageAdapter.changeCursor count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->count()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    iget-object v0, p0, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v0}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 241
    :goto_0
    return-void

    .line 239
    :cond_0
    const/4 v0, 0x0

    check-cast v0, Landroid/database/Cursor;

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchConversationView$SearchMessageAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const-string v6, "talk"

    .line 245
    const-string v4, "talk"

    const-string v4, "SearchMessageAdapter.newView"

    invoke-static {v6, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 247
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v4, 0x7f03000f

    const/4 v5, 0x0

    invoke-virtual {v0, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 249
    .local v1, "view":Landroid/view/View;
    const v4, 0x7f0b002d

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 250
    .local v2, "view1":Landroid/view/View;
    const v4, 0x7f0b002e

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 251
    .local v3, "view2":Landroid/view/View;
    const-string v4, "talk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SearchMessageAdapter.newView view1: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " view2: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    return-object v1
.end method
