.class Lcom/google/android/talk/ChatScreen$15;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/ChatScreen$ChatRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->onDestroy()V
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
    .line 932
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$15;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/google/android/talk/ChatView;)Z
    .locals 2
    .param p1, "cv"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 933
    invoke-virtual {p1}, Lcom/google/android/talk/ChatView;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 934
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 935
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 937
    :cond_0
    const/4 v1, 0x1

    return v1
.end method
