.class Lcom/google/android/talk/SearchActivity$2;
.super Ljava/lang/Object;
.source "SearchActivity.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/SearchActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/SearchActivity;


# direct methods
.method constructor <init>(Lcom/google/android/talk/SearchActivity;)V
    .locals 0

    .prologue
    .line 262
    iput-object p1, p0, Lcom/google/android/talk/SearchActivity$2;->this$0:Lcom/google/android/talk/SearchActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/google/android/talk/SearchActivity$2;->this$0:Lcom/google/android/talk/SearchActivity;

    invoke-virtual {v0}, Lcom/google/android/talk/SearchActivity;->onSearchRequested()Z

    .line 265
    const/4 v0, 0x1

    return v0
.end method
