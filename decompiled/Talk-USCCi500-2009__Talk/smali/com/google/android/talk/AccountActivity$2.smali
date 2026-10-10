.class Lcom/google/android/talk/AccountActivity$2;
.super Ljava/lang/Object;
.source "AccountActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/AccountActivity;->registerForServiceStateChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/AccountActivity;

.field final synthetic val$app:Lcom/google/android/talk/TalkApp;


# direct methods
.method constructor <init>(Lcom/google/android/talk/AccountActivity;Lcom/google/android/talk/TalkApp;)V
    .locals 0

    .prologue
    .line 105
    iput-object p1, p0, Lcom/google/android/talk/AccountActivity$2;->this$0:Lcom/google/android/talk/AccountActivity;

    iput-object p2, p0, Lcom/google/android/talk/AccountActivity$2;->val$app:Lcom/google/android/talk/TalkApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 106
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$2;->this$0:Lcom/google/android/talk/AccountActivity;

    iget-object v1, p0, Lcom/google/android/talk/AccountActivity$2;->val$app:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v1}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/AccountActivity;->access$202(Lcom/google/android/talk/AccountActivity;Lcom/google/android/gtalkservice/IGTalkService;)Lcom/google/android/gtalkservice/IGTalkService;

    .line 107
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$2;->this$0:Lcom/google/android/talk/AccountActivity;

    invoke-static {v0}, Lcom/google/android/talk/AccountActivity;->access$200(Lcom/google/android/talk/AccountActivity;)Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 108
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$2;->this$0:Lcom/google/android/talk/AccountActivity;

    invoke-static {v0}, Lcom/google/android/talk/AccountActivity;->access$300(Lcom/google/android/talk/AccountActivity;)I

    move-result v0

    if-lt v0, v2, :cond_0

    .line 109
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$2;->this$0:Lcom/google/android/talk/AccountActivity;

    const-string v1, "registerForServiceStateChanged: service connected..."

    invoke-static {v0, v1}, Lcom/google/android/talk/AccountActivity;->access$000(Lcom/google/android/talk/AccountActivity;Ljava/lang/String;)V

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$2;->this$0:Lcom/google/android/talk/AccountActivity;

    invoke-static {v0}, Lcom/google/android/talk/AccountActivity;->access$400(Lcom/google/android/talk/AccountActivity;)V

    .line 117
    :cond_1
    :goto_0
    return-void

    .line 113
    :cond_2
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$2;->this$0:Lcom/google/android/talk/AccountActivity;

    invoke-static {v0}, Lcom/google/android/talk/AccountActivity;->access$300(Lcom/google/android/talk/AccountActivity;)I

    move-result v0

    if-lt v0, v2, :cond_1

    .line 114
    iget-object v0, p0, Lcom/google/android/talk/AccountActivity$2;->this$0:Lcom/google/android/talk/AccountActivity;

    const-string v1, "registerForServiceStateChanged: service disconnected"

    invoke-static {v0, v1}, Lcom/google/android/talk/AccountActivity;->access$000(Lcom/google/android/talk/AccountActivity;Ljava/lang/String;)V

    goto :goto_0
.end method
