.class Lcom/google/android/talk/BuddyInfo$2;
.super Ljava/lang/Object;
.source "BuddyInfo.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/BuddyInfo;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyInfo;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyInfo;)V
    .locals 0

    .prologue
    .line 221
    iput-object p1, p0, Lcom/google/android/talk/BuddyInfo$2;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo$2;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-static {v0}, Lcom/google/android/talk/BuddyInfo;->access$300(Lcom/google/android/talk/BuddyInfo;)V

    .line 223
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo$2;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-virtual {v0}, Lcom/google/android/talk/BuddyInfo;->finish()V

    .line 224
    return-void
.end method
