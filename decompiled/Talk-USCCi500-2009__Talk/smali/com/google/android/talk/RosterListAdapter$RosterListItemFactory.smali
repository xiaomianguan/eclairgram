.class Lcom/google/android/talk/RosterListAdapter$RosterListItemFactory;
.super Ljava/lang/Object;
.source "RosterListAdapter.java"

# interfaces
.implements Landroid/view/LayoutInflater$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/RosterListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RosterListItemFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/RosterListAdapter;


# direct methods
.method private constructor <init>(Lcom/google/android/talk/RosterListAdapter;)V
    .locals 0

    .prologue
    .line 209
    iput-object p1, p0, Lcom/google/android/talk/RosterListAdapter$RosterListItemFactory;->this$0:Lcom/google/android/talk/RosterListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/talk/RosterListAdapter;Lcom/google/android/talk/RosterListAdapter$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/talk/RosterListAdapter;
    .param p2, "x1"    # Lcom/google/android/talk/RosterListAdapter$1;

    .prologue
    .line 209
    invoke-direct {p0, p1}, Lcom/google/android/talk/RosterListAdapter$RosterListItemFactory;-><init>(Lcom/google/android/talk/RosterListAdapter;)V

    return-void
.end method


# virtual methods
.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 211
    if-eqz p1, :cond_0

    const-class v0, Lcom/google/android/talk/RosterListItem;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    new-instance v0, Lcom/google/android/talk/RosterListItem;

    iget-object v1, p0, Lcom/google/android/talk/RosterListAdapter$RosterListItemFactory;->this$0:Lcom/google/android/talk/RosterListAdapter;

    invoke-static {v1}, Lcom/google/android/talk/RosterListAdapter;->access$100(Lcom/google/android/talk/RosterListAdapter;)Lcom/google/android/talk/TalkApp;

    move-result-object v1

    invoke-direct {v0, p2, v1}, Lcom/google/android/talk/RosterListItem;-><init>(Landroid/content/Context;Lcom/google/android/talk/TalkApp;)V

    .line 214
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
