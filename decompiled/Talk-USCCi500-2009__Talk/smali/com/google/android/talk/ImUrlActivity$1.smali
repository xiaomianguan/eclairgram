.class Lcom/google/android/talk/ImUrlActivity$1;
.super Ljava/lang/Object;
.source "ImUrlActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ImUrlActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ImUrlActivity;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ImUrlActivity;)V
    .locals 0

    .prologue
    .line 75
    iput-object p1, p0, Lcom/google/android/talk/ImUrlActivity$1;->this$0:Lcom/google/android/talk/ImUrlActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/google/android/talk/ImUrlActivity$1;->this$0:Lcom/google/android/talk/ImUrlActivity;

    invoke-static {v0}, Lcom/google/android/talk/ImUrlActivity;->access$000(Lcom/google/android/talk/ImUrlActivity;)V

    .line 77
    return-void
.end method
