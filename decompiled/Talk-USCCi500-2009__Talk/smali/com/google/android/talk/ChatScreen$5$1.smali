.class Lcom/google/android/talk/ChatScreen$5$1;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen$5;->onComplete(Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/talk/ChatScreen$5;

.field final synthetic val$cursor:Landroid/database/Cursor;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen$5;Landroid/database/Cursor;)V
    .locals 0

    .prologue
    .line 528
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$5$1;->this$1:Lcom/google/android/talk/ChatScreen$5;

    iput-object p2, p0, Lcom/google/android/talk/ChatScreen$5$1;->val$cursor:Landroid/database/Cursor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 529
    invoke-static {}, Lcom/google/android/talk/ChatScreen;->access$300()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 530
    const-string v0, "wait for service task: onQueryCompleteRunnable"

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$400(Ljava/lang/String;)V

    .line 532
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$5$1;->this$1:Lcom/google/android/talk/ChatScreen$5;

    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$5$1;->val$cursor:Landroid/database/Cursor;

    invoke-virtual {v0, v1}, Lcom/google/android/talk/ChatScreen$5;->onComplete(Landroid/database/Cursor;)V

    .line 533
    return-void
.end method
