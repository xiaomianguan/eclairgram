.class Lcom/google/android/gtalkservice/ChatSession$6;
.super Ljava/lang/Object;
.source "ChatSession.java"

# interfaces
.implements Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/ChatSession;->notifyConversionToGroupChat(Ljava/lang/String;Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable",
        "<",
        "Lcom/google/android/gtalkservice/IChatListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/ChatSession;

.field final synthetic val$groupId:J

.field final synthetic val$oldJid:Ljava/lang/String;

.field final synthetic val$room:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .prologue
    .line 1395
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatSession$6;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    iput-object p2, p0, Lcom/google/android/gtalkservice/ChatSession$6;->val$oldJid:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gtalkservice/ChatSession$6;->val$room:Ljava/lang/String;

    iput-wide p4, p0, Lcom/google/android/gtalkservice/ChatSession$6;->val$groupId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/google/android/gtalkservice/IChatListener;)Z
    .locals 6
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 1396
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession$6;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession$6;->val$oldJid:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession$6;->val$room:Ljava/lang/String;

    iget-wide v4, p0, Lcom/google/android/gtalkservice/ChatSession$6;->val$groupId:J

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lcom/google/android/gtalkservice/ChatSession;->access$700(Lcom/google/android/gtalkservice/ChatSession;Lcom/google/android/gtalkservice/IChatListener;Ljava/lang/String;Ljava/lang/String;J)V

    .line 1397
    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 1395
    check-cast p1, Lcom/google/android/gtalkservice/IChatListener;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/ChatSession$6;->call(Lcom/google/android/gtalkservice/IChatListener;)Z

    move-result v0

    return v0
.end method
