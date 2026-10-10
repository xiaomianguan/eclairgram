.class final Lcom/google/android/talk/BuddyList$ConnectionStateListener;
.super Lcom/google/android/gtalkservice/IConnectionStateListener$Stub;
.source "BuddyList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ConnectionStateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/BuddyList;)V
    .locals 0

    .prologue
    .line 339
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$ConnectionStateListener;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IConnectionStateListener$Stub;-><init>()V

    .line 340
    return-void
.end method


# virtual methods
.method public connectionStateChanged(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V
    .locals 3
    .param p1, "state"    # Lcom/google/android/gtalkservice/ConnectionState;
    .param p2, "error"    # Lcom/google/android/gtalkservice/ConnectionError;

    .prologue
    .line 343
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/ConnectionState;->getState()I

    move-result v0

    .line 345
    .local v0, "connState":I
    packed-switch v0, :pswitch_data_0

    .line 356
    iget-object v1, p0, Lcom/google/android/talk/BuddyList$ConnectionStateListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v1, v1, Lcom/google/android/talk/BuddyList;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/talk/BuddyList$ConnectionStateListener$2;

    invoke-direct {v2, p0}, Lcom/google/android/talk/BuddyList$ConnectionStateListener$2;-><init>(Lcom/google/android/talk/BuddyList$ConnectionStateListener;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 363
    :goto_0
    return-void

    .line 348
    :pswitch_0
    iget-object v1, p0, Lcom/google/android/talk/BuddyList$ConnectionStateListener;->this$0:Lcom/google/android/talk/BuddyList;

    iget-object v1, v1, Lcom/google/android/talk/BuddyList;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/talk/BuddyList$ConnectionStateListener$1;

    invoke-direct {v2, p0}, Lcom/google/android/talk/BuddyList$ConnectionStateListener$1;-><init>(Lcom/google/android/talk/BuddyList$ConnectionStateListener;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 345
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
