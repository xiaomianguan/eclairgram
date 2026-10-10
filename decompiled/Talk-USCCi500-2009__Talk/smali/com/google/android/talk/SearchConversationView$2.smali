.class Lcom/google/android/talk/SearchConversationView$2;
.super Ljava/lang/Object;
.source "SearchConversationView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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
    .line 209
    iput-object p1, p0, Lcom/google/android/talk/SearchConversationView$2;->this$0:Lcom/google/android/talk/SearchConversationView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 210
    iget-object v0, p0, Lcom/google/android/talk/SearchConversationView$2;->this$0:Lcom/google/android/talk/SearchConversationView;

    invoke-virtual {v0}, Lcom/google/android/talk/SearchConversationView;->finish()V

    .line 211
    return-void
.end method
