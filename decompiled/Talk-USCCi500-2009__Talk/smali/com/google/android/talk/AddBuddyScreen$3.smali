.class Lcom/google/android/talk/AddBuddyScreen$3;
.super Ljava/lang/Object;
.source "AddBuddyScreen.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/AddBuddyScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/AddBuddyScreen;


# direct methods
.method constructor <init>(Lcom/google/android/talk/AddBuddyScreen;)V
    .locals 0

    .prologue
    .line 192
    iput-object p1, p0, Lcom/google/android/talk/AddBuddyScreen$3;->this$0:Lcom/google/android/talk/AddBuddyScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keycode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 193
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 194
    .local v0, "id":I
    const/high16 v1, 0x7f0b0000

    if-ne v0, v1, :cond_0

    .line 195
    const/16 v1, 0x42

    if-ne p2, v1, :cond_0

    .line 196
    iget-object v1, p0, Lcom/google/android/talk/AddBuddyScreen$3;->this$0:Lcom/google/android/talk/AddBuddyScreen;

    invoke-virtual {v1}, Lcom/google/android/talk/AddBuddyScreen;->inviteBuddies()V

    .line 197
    const/4 v1, 0x1

    .line 200
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
