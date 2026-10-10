.class Lcom/google/android/talk/BlockedList$1;
.super Ljava/lang/Object;
.source "BlockedList.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/BlockedList;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BlockedList;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BlockedList;)V
    .locals 0

    .prologue
    .line 152
    iput-object p1, p0, Lcom/google/android/talk/BlockedList$1;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 154
    :try_start_0
    iget-object v2, p0, Lcom/google/android/talk/BlockedList$1;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v2}, Lcom/google/android/talk/BlockedList;->access$600(Lcom/google/android/talk/BlockedList;)Lcom/google/android/talk/TalkApp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/talk/TalkApp;->getGTalkService()Lcom/google/android/gtalkservice/IGTalkService;

    move-result-object v0

    .line 155
    .local v0, "service":Lcom/google/android/gtalkservice/IGTalkService;
    iget-object v2, p0, Lcom/google/android/talk/BlockedList$1;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v2}, Lcom/google/android/talk/BlockedList;->access$300(Lcom/google/android/talk/BlockedList;)J

    move-result-wide v2

    invoke-interface {v0, v2, v3}, Lcom/google/android/gtalkservice/IGTalkService;->getImSessionForAccountId(J)Lcom/google/android/gtalkservice/IImSession;

    move-result-object v1

    .line 157
    .local v1, "session":Lcom/google/android/gtalkservice/IImSession;
    iget-object v2, p0, Lcom/google/android/talk/BlockedList$1;->this$0:Lcom/google/android/talk/BlockedList;

    invoke-static {v2}, Lcom/google/android/talk/BlockedList;->access$700(Lcom/google/android/talk/BlockedList;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/android/gtalkservice/IImSession;->clearContactFlags(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .end local v0    # "service":Lcom/google/android/gtalkservice/IGTalkService;
    .end local v1    # "session":Lcom/google/android/gtalkservice/IImSession;
    :goto_0
    return-void

    .line 158
    :catch_0
    move-exception v2

    goto :goto_0
.end method
