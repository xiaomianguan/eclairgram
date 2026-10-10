.class Lcom/google/android/talk/BuddyList$1;
.super Ljava/lang/Object;
.source "BuddyList.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyList;)V
    .locals 0

    .prologue
    .line 207
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$1;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 208
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$1;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->access$000(Lcom/google/android/talk/BuddyList;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 218
    :goto_0
    return-void

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$1;->this$0:Lcom/google/android/talk/BuddyList;

    iget v0, v0, Lcom/google/android/talk/BuddyList;->mLogLevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 213
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$1;->this$0:Lcom/google/android/talk/BuddyList;

    const-string v1, "cancel edit for custom status text"

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$100(Lcom/google/android/talk/BuddyList;Ljava/lang/String;)V

    .line 217
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$1;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-static {v0}, Lcom/google/android/talk/BuddyList;->access$200(Lcom/google/android/talk/BuddyList;)V

    goto :goto_0
.end method
