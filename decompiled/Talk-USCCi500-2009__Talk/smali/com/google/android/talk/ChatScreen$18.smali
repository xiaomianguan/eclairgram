.class Lcom/google/android/talk/ChatScreen$18;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
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
    .line 1385
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$18;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1386
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$18;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-virtual {v2}, Lcom/google/android/talk/ChatScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070001

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 1387
    .local v0, "t":[Ljava/lang/String;
    aget-object v1, v0, p2

    .line 1388
    .local v1, "text":Ljava/lang/String;
    iget-object v2, p0, Lcom/google/android/talk/ChatScreen$18;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v2}, Lcom/google/android/talk/ChatScreen;->access$1100(Lcom/google/android/talk/ChatScreen;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/talk/ChatScreen$18;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v3}, Lcom/google/android/talk/ChatScreen;->access$1100(Lcom/google/android/talk/ChatScreen;)Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v3

    invoke-interface {v2, v3, v1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 1389
    return-void
.end method
