.class Lcom/google/android/talk/ChatScreen$14;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/ChatScreen$ChatRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->onRestart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/ChatScreen;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen;)V
    .locals 0

    .prologue
    .line 843
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$14;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/google/android/talk/ChatView;)Z
    .locals 1
    .param p1, "cv"    # Lcom/google/android/talk/ChatView;

    .prologue
    .line 844
    invoke-virtual {p1}, Lcom/google/android/talk/ChatView;->onRestart()V

    .line 845
    const/4 v0, 0x1

    return v0
.end method
