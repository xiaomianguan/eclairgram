.class Lcom/google/android/talk/ChatScreen$2$1;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/ChatScreen$ChatRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen$2;->invalidateImSession()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/talk/ChatScreen$2;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatScreen$2;)V
    .locals 0

    .prologue
    .line 205
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$2$1;->this$1:Lcom/google/android/talk/ChatScreen$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/google/android/talk/ChatView;)Z
    .locals 2
    .param p1, "cv"    # Lcom/google/android/talk/ChatView;

    .prologue
    const/4 v1, 0x1

    .line 206
    if-eqz p1, :cond_0

    .line 207
    invoke-virtual {p1, v1}, Lcom/google/android/talk/ChatView;->initSession(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 208
    const-string v0, "talk"

    const-string v1, "invalidateImSessions failed. Finish!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$2$1;->this$1:Lcom/google/android/talk/ChatScreen$2;

    iget-object v0, v0, Lcom/google/android/talk/ChatScreen$2;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ActivityUtils;->showLandingPage(Landroid/app/Activity;)V

    .line 210
    const/4 v0, 0x0

    .line 213
    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method
