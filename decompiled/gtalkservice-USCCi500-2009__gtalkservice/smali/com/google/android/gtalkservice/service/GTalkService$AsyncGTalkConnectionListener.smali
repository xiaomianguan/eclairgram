.class Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;
.super Ljava/lang/Object;
.source "GTalkService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/service/GTalkService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AsyncGTalkConnectionListener"
.end annotation


# instance fields
.field connectionListener:Lcom/google/android/gtalkservice/IGTalkConnectionListener;

.field final synthetic this$0:Lcom/google/android/gtalkservice/service/GTalkService;

.field username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/service/GTalkService;Ljava/lang/String;Lcom/google/android/gtalkservice/IGTalkConnectionListener;)V
    .locals 0
    .param p2, "username"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/google/android/gtalkservice/IGTalkConnectionListener;

    .prologue
    .line 181
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;->this$0:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 182
    iput-object p2, p0, Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;->username:Ljava/lang/String;

    .line 183
    iput-object p3, p0, Lcom/google/android/gtalkservice/service/GTalkService$AsyncGTalkConnectionListener;->connectionListener:Lcom/google/android/gtalkservice/IGTalkConnectionListener;

    .line 184
    return-void
.end method
