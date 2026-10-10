.class Lcom/google/android/talk/BuddyList$RosterListener$1;
.super Ljava/lang/Object;
.source "BuddyList.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/BuddyList$RosterListener;->rosterChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/talk/BuddyList$RosterListener;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyList$RosterListener;)V
    .locals 0

    .prologue
    .line 288
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$RosterListener$1;->this$1:Lcom/google/android/talk/BuddyList$RosterListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 289
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$RosterListener$1;->this$1:Lcom/google/android/talk/BuddyList$RosterListener;

    iget-object v0, v0, Lcom/google/android/talk/BuddyList$RosterListener;->this$0:Lcom/google/android/talk/BuddyList;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$400(Lcom/google/android/talk/BuddyList;Z)V

    .line 290
    return-void
.end method
