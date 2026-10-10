.class Lcom/google/android/talk/ChatScreen$7;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 616
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$7;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 617
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 619
    .local v0, "id":I
    const v1, 0x7f0b000d

    if-ne v0, v1, :cond_0

    .line 620
    iget-object v1, p0, Lcom/google/android/talk/ChatScreen$7;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v1}, Lcom/google/android/talk/ChatScreen;->access$2500(Lcom/google/android/talk/ChatScreen;)V

    .line 622
    :cond_0
    return-void
.end method
