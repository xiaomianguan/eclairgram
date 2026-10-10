.class Lcom/google/android/talk/BlockedList$2;
.super Ljava/lang/Object;
.source "BlockedList.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/BlockedList;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BlockedList;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BlockedList;)V
    .locals 0

    .prologue
    .line 146
    iput-object p1, p0, Lcom/google/android/talk/BlockedList$2;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 147
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 148
    return-void
.end method
