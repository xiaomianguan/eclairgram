.class Lcom/google/android/talk/ChatScreen$8;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->onCreate(Landroid/os/Bundle;)V
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
    .line 626
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$8;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 627
    if-eqz p3, :cond_0

    .line 628
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 629
    const/4 v0, 0x0

    .line 634
    :goto_0
    return v0

    .line 633
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$8;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ChatScreen;->access$2500(Lcom/google/android/talk/ChatScreen;)V

    .line 634
    const/4 v0, 0x1

    goto :goto_0
.end method
