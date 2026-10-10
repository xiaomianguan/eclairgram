.class Lcom/google/android/talk/SearchChatResultActivity$2;
.super Ljava/lang/Object;
.source "SearchChatResultActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/SearchChatResultActivity;->showRetryAlert()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/SearchChatResultActivity;


# direct methods
.method constructor <init>(Lcom/google/android/talk/SearchChatResultActivity;)V
    .locals 0

    .prologue
    .line 598
    iput-object p1, p0, Lcom/google/android/talk/SearchChatResultActivity$2;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 600
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity$2;->this$0:Lcom/google/android/talk/SearchChatResultActivity;

    invoke-static {v0}, Lcom/google/android/talk/SearchChatResultActivity;->access$200(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail$MessageCursor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/provider/Gmail$MessageCursor;->retry()V

    .line 601
    return-void
.end method
