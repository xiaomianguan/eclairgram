.class Lcom/google/android/talk/SearchConversationView$1;
.super Ljava/lang/Object;
.source "SearchConversationView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/SearchConversationView;->showRetryAlert()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/SearchConversationView;


# direct methods
.method constructor <init>(Lcom/google/android/talk/SearchConversationView;)V
    .locals 0

    .prologue
    .line 202
    iput-object p1, p0, Lcom/google/android/talk/SearchConversationView$1;->this$0:Lcom/google/android/talk/SearchConversationView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 204
    iget-object v0, p0, Lcom/google/android/talk/SearchConversationView$1;->this$0:Lcom/google/android/talk/SearchConversationView;

    invoke-static {v0}, Lcom/google/android/talk/SearchConversationView;->access$100(Lcom/google/android/talk/SearchConversationView;)Landroid/provider/Gmail$MessageCursor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/provider/Gmail$MessageCursor;->retry()V

    .line 205
    return-void
.end method
