.class Lcom/google/android/talk/SigningInActivity$2;
.super Ljava/lang/Object;
.source "SigningInActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/SigningInActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/SigningInActivity;


# direct methods
.method constructor <init>(Lcom/google/android/talk/SigningInActivity;)V
    .locals 0

    .prologue
    .line 528
    iput-object p1, p0, Lcom/google/android/talk/SigningInActivity$2;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 529
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity$2;->this$0:Lcom/google/android/talk/SigningInActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SigningInActivity;->setResult(I)V

    .line 530
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity$2;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-virtual {v0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    .line 531
    return-void
.end method
