.class Lcom/google/android/talk/ChatScreen$2;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/ChatScreen$ChatHost;


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
    .line 226
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cacheContactId(Ljava/lang/String;J)V
    .locals 2
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "id"    # J

    .prologue
    .line 223
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$700(Lcom/google/android/talk/ChatScreen;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    return-void
.end method

.method public getCachedContactId(Ljava/lang/String;)J
    .locals 3
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 227
    const-wide/16 v0, -0x1

    .line 228
    .local v0, "id":J
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v2}, Lcom/google/android/talk/ChatScreen;->access$700(Lcom/google/android/talk/ChatScreen;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 229
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v2}, Lcom/google/android/talk/ChatScreen;->access$700(Lcom/google/android/talk/ChatScreen;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "this":Lcom/google/android/talk/ChatScreen$2;
    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 231
    :cond_0
    return-wide v0
.end method

.method public getColorMaker()Lcom/google/android/talk/util/ChatColorMaker;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$200(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/util/ChatColorMaker;

    move-result-object v0

    return-object v0
.end method

.method public invalidateImSession()V
    .locals 2

    .prologue
    .line 199
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->access$300()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 200
    const-string v0, "invalidateImSession"

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$400(Ljava/lang/String;)V

    .line 203
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    new-instance v1, Lcom/google/android/talk/ChatScreen$2$1;

    invoke-direct {v1, p0}, Lcom/google/android/talk/ChatScreen$2$1;-><init>(Lcom/google/android/talk/ChatScreen$2;)V

    invoke-static {v0, v1}, Lcom/google/android/talk/ChatScreen;->access$500(Lcom/google/android/talk/ChatScreen;Lcom/google/android/talk/ChatScreen$ChatRunnable;)V

    .line 216
    return-void
.end method

.method public pickChat(Ljava/lang/String;J)V
    .locals 1
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "account"    # J

    .prologue
    .line 219
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0, p1, p2, p3}, Lcom/google/android/talk/ChatScreen;->access$600(Lcom/google/android/talk/ChatScreen;Ljava/lang/String;J)V

    .line 220
    return-void
.end method

.method public update(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 192
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$000(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 193
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-ne p1, v0, :cond_0

    .line 194
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-virtual {v1, v0}, Lcom/google/android/talk/ChatScreen;->updateTitle(Landroid/view/View;)V

    .line 196
    :cond_0
    return-void
.end method
