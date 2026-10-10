.class Lcom/google/android/talk/BuddyList$ConnectionStateListener$1;
.super Ljava/lang/Object;
.source "BuddyList.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/BuddyList$ConnectionStateListener;->connectionStateChanged(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/talk/BuddyList$ConnectionStateListener;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyList$ConnectionStateListener;)V
    .locals 0

    .prologue
    .line 349
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$ConnectionStateListener$1;->this$1:Lcom/google/android/talk/BuddyList$ConnectionStateListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 350
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ConnectionStateListener$1;->this$1:Lcom/google/android/talk/BuddyList$ConnectionStateListener;

    iget-object v0, v0, Lcom/google/android/talk/BuddyList$ConnectionStateListener;->this$0:Lcom/google/android/talk/BuddyList;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/talk/BuddyList;->access$600(Lcom/google/android/talk/BuddyList;Z)V

    .line 351
    return-void
.end method
