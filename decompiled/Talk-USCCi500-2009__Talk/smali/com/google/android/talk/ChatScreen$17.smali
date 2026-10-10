.class Lcom/google/android/talk/ChatScreen$17;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Lcom/google/android/talk/ChatScreen$ChatRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->serviceStateChanged()V
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
    .line 1280
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$17;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/google/android/talk/ChatView;)Z
    .locals 3
    .param p1, "cv"    # Lcom/google/android/talk/ChatView;

    .prologue
    const/4 v2, 0x0

    .line 1281
    if-eqz p1, :cond_0

    .line 1282
    invoke-virtual {p1, v2}, Lcom/google/android/talk/ChatView;->initSession(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1283
    const-string v0, "talk"

    const-string v1, "initSession failed. Finish!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1284
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$17;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-static {v0}, Lcom/google/android/talk/ActivityUtils;->showLandingPage(Landroid/app/Activity;)V

    move v0, v2

    .line 1288
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
