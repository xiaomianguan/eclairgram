.class final Lcom/google/android/talk/SigningInActivity$MyConnectionListener;
.super Lcom/google/android/gtalkservice/IConnectionStateListener$Stub;
.source "SigningInActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/SigningInActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MyConnectionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/SigningInActivity;


# direct methods
.method private constructor <init>(Lcom/google/android/talk/SigningInActivity;)V
    .locals 0

    .prologue
    .line 113
    iput-object p1, p0, Lcom/google/android/talk/SigningInActivity$MyConnectionListener;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/IConnectionStateListener$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/talk/SigningInActivity;Lcom/google/android/talk/SigningInActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/talk/SigningInActivity;
    .param p2, "x1"    # Lcom/google/android/talk/SigningInActivity$1;

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lcom/google/android/talk/SigningInActivity$MyConnectionListener;-><init>(Lcom/google/android/talk/SigningInActivity;)V

    return-void
.end method


# virtual methods
.method public connectionStateChanged(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V
    .locals 1
    .param p1, "state"    # Lcom/google/android/gtalkservice/ConnectionState;
    .param p2, "error"    # Lcom/google/android/gtalkservice/ConnectionError;

    .prologue
    .line 115
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity$MyConnectionListener;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/talk/SigningInActivity;->handleConnectionEvent(Lcom/google/android/gtalkservice/ConnectionState;Lcom/google/android/gtalkservice/ConnectionError;)V

    .line 116
    return-void
.end method
