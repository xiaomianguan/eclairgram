.class Lcom/google/android/talk/ChatScreen$1;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/util/ChatSwitcher$SwitcherRunnable;


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
    .line 166
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$1;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public switchTo(Ljava/lang/String;JLandroid/content/Intent;I)Z
    .locals 5
    .param p1, "contact"    # Ljava/lang/String;
    .param p2, "account"    # J
    .param p4, "intent"    # Landroid/content/Intent;
    .param p5, "position"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 167
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$1;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$000(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/ChatView;

    move-result-object v0

    .line 168
    .local v0, "cv":Lcom/google/android/talk/ChatView;
    if-nez v0, :cond_0

    move v1, v3

    .line 182
    :goto_0
    return v1

    .line 172
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->getAccountId()J

    move-result-wide v1

    cmp-long v1, v1, p2

    if-eqz v1, :cond_1

    move v1, v3

    .line 173
    goto :goto_0

    .line 176
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/talk/ChatView;->getContact()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v4

    .line 177
    goto :goto_0

    .line 180
    :cond_2
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$1;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$100(Lcom/google/android/talk/ChatScreen;)Lcom/google/android/talk/PageViewGroup;

    move-result-object v1

    invoke-virtual {v1, p5}, Lcom/google/android/talk/PageViewGroup;->setSelection(I)V

    move v1, v4

    .line 182
    goto :goto_0
.end method
