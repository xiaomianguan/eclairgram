.class Lcom/google/android/talk/RosterListActivity$2;
.super Ljava/lang/Object;
.source "RosterListActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/RosterListActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/RosterListActivity;


# direct methods
.method constructor <init>(Lcom/google/android/talk/RosterListActivity;)V
    .locals 0

    .prologue
    .line 86
    iput-object p1, p0, Lcom/google/android/talk/RosterListActivity$2;->this$0:Lcom/google/android/talk/RosterListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7
    .param p1, "parent"    # Landroid/widget/AdapterView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 87
    iget-object v1, p0, Lcom/google/android/talk/RosterListActivity$2;->this$0:Lcom/google/android/talk/RosterListActivity;

    move-object v0, p1

    check-cast v0, Landroid/widget/ListView;

    move-object v2, v0

    move-object v3, p2

    move v4, p3

    move-wide v5, p4

    invoke-virtual/range {v1 .. v6}, Lcom/google/android/talk/RosterListActivity;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V

    .line 88
    return-void
.end method
