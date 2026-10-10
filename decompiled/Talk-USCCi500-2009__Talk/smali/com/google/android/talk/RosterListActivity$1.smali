.class Lcom/google/android/talk/RosterListActivity$1;
.super Ljava/lang/Object;
.source "RosterListActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/RosterListActivity;->registerForServiceStateChanged()V
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
    .line 67
    iput-object p1, p0, Lcom/google/android/talk/RosterListActivity$1;->this$0:Lcom/google/android/talk/RosterListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/google/android/talk/RosterListActivity$1;->this$0:Lcom/google/android/talk/RosterListActivity;

    invoke-virtual {v0}, Lcom/google/android/talk/RosterListActivity;->serviceStateChanged()V

    .line 69
    return-void
.end method
