.class Lcom/google/android/talk/SigningInActivity$3;
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
    .line 519
    iput-object p1, p0, Lcom/google/android/talk/SigningInActivity$3;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 520
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.SYNC_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 521
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 522
    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 523
    iget-object v1, p0, Lcom/google/android/talk/SigningInActivity$3;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-virtual {v1, v0}, Lcom/google/android/talk/SigningInActivity;->startActivity(Landroid/content/Intent;)V

    .line 524
    return-void
.end method
