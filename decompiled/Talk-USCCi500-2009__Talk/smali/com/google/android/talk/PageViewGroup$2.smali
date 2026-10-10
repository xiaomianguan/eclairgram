.class Lcom/google/android/talk/PageViewGroup$2;
.super Ljava/lang/Object;
.source "PageViewGroup.java"

# interfaces
.implements Lcom/google/android/talk/PageViewGroup$IMakeView;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/PageViewGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/PageViewGroup;


# direct methods
.method constructor <init>(Lcom/google/android/talk/PageViewGroup;)V
    .locals 0

    .prologue
    .line 139
    iput-object p1, p0, Lcom/google/android/talk/PageViewGroup$2;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public makeView()Landroid/view/View;
    .locals 2

    .prologue
    .line 140
    new-instance v0, Landroid/view/View;

    iget-object v1, p0, Lcom/google/android/talk/PageViewGroup$2;->this$0:Lcom/google/android/talk/PageViewGroup;

    invoke-static {v1}, Lcom/google/android/talk/PageViewGroup;->access$100(Lcom/google/android/talk/PageViewGroup;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 141
    .local v0, "v":Landroid/view/View;
    return-object v0
.end method
