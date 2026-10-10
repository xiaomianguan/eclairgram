.class Lcom/google/android/talk/TalkApp$2;
.super Ljava/lang/Object;
.source "TalkApp.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/TalkApp;->asyncPruneOldChatsAndMessages(Lcom/google/android/gtalkservice/IImSession;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/TalkApp;

.field final synthetic val$imSession:Lcom/google/android/gtalkservice/IImSession;


# direct methods
.method constructor <init>(Lcom/google/android/talk/TalkApp;Lcom/google/android/gtalkservice/IImSession;)V
    .locals 0

    .prologue
    .line 598
    iput-object p1, p0, Lcom/google/android/talk/TalkApp$2;->this$0:Lcom/google/android/talk/TalkApp;

    iput-object p2, p0, Lcom/google/android/talk/TalkApp$2;->val$imSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 600
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$2;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-virtual {v0}, Lcom/google/android/talk/TalkApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/talk/TalkApp$2;->this$0:Lcom/google/android/talk/TalkApp;

    invoke-static {v1}, Lcom/google/android/talk/TalkApp;->access$600(Lcom/google/android/talk/TalkApp;)Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/talk/DatabaseUtils;->pruneOldMessageHistory(Landroid/content/ContentResolver;Ljava/util/Map;)V

    .line 602
    iget-object v0, p0, Lcom/google/android/talk/TalkApp$2;->this$0:Lcom/google/android/talk/TalkApp;

    iget-object v1, p0, Lcom/google/android/talk/TalkApp$2;->val$imSession:Lcom/google/android/gtalkservice/IImSession;

    invoke-static {v0, v1}, Lcom/google/android/talk/TalkApp;->access$700(Lcom/google/android/talk/TalkApp;Lcom/google/android/gtalkservice/IImSession;)V

    .line 603
    return-void
.end method
