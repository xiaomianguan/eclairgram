.class Lcom/google/android/talk/ChatView$5;
.super Ljava/lang/Object;
.source "ChatView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatView;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatView;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatView;)V
    .locals 0

    .prologue
    .line 1791
    iput-object p1, p0, Lcom/google/android/talk/ChatView$5;->this$0:Lcom/google/android/talk/ChatView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1792
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1793
    return-void
.end method
