.class Lcom/google/android/talk/util/ChatSwitcher$6;
.super Ljava/lang/Object;
.source "ChatSwitcher.java"

# interfaces
.implements Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/util/ChatSwitcher;->handleShortcut(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/util/ChatSwitcher;

.field final synthetic val$key:I


# direct methods
.method constructor <init>(Lcom/google/android/talk/util/ChatSwitcher;I)V
    .locals 0

    .prologue
    .line 713
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher$6;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iput p2, p0, Lcom/google/android/talk/util/ChatSwitcher$6;->val$key:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    .line 714
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$6;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iget v1, p0, Lcom/google/android/talk/util/ChatSwitcher$6;->val$key:I

    invoke-static {v0, p1, v1}, Lcom/google/android/talk/util/ChatSwitcher;->access$900(Lcom/google/android/talk/util/ChatSwitcher;Landroid/database/Cursor;I)V

    .line 715
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 716
    return-void
.end method
