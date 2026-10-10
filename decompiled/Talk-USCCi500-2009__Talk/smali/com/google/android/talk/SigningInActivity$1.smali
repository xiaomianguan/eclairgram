.class Lcom/google/android/talk/SigningInActivity$1;
.super Ljava/lang/Object;
.source "SigningInActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/SigningInActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/SigningInActivity;


# direct methods
.method constructor <init>(Lcom/google/android/talk/SigningInActivity;)V
    .locals 0

    .prologue
    .line 162
    iput-object p1, p0, Lcom/google/android/talk/SigningInActivity$1;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity$1;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-static {v0}, Lcom/google/android/talk/SigningInActivity;->access$100(Lcom/google/android/talk/SigningInActivity;)Lcom/google/android/talk/TalkApp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity$1;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-static {v0}, Lcom/google/android/talk/SigningInActivity;->access$200(Lcom/google/android/talk/SigningInActivity;)V

    .line 171
    :goto_0
    return-void

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity$1;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-static {v0}, Lcom/google/android/talk/SigningInActivity;->access$300(Lcom/google/android/talk/SigningInActivity;)I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 167
    const-string v0, "service disconnected, finish"

    invoke-static {v0}, Lcom/google/android/talk/SigningInActivity;->log(Ljava/lang/String;)V

    .line 169
    :cond_1
    iget-object v0, p0, Lcom/google/android/talk/SigningInActivity$1;->this$0:Lcom/google/android/talk/SigningInActivity;

    invoke-virtual {v0}, Lcom/google/android/talk/SigningInActivity;->finish()V

    goto :goto_0
.end method
