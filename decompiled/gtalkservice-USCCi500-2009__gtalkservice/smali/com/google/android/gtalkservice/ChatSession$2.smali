.class Lcom/google/android/gtalkservice/ChatSession$2;
.super Ljava/lang/Object;
.source "ChatSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/ChatSession;->convertToGroupChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/ChatSession;

.field final synthetic val$oldBareJid:Ljava/lang/String;

.field final synthetic val$room:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1178
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatSession$2;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    iput-object p2, p0, Lcom/google/android/gtalkservice/ChatSession$2;->val$oldBareJid:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gtalkservice/ChatSession$2;->val$room:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 1179
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession$2;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession$2;->val$oldBareJid:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession$2;->val$room:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession$2;->this$0:Lcom/google/android/gtalkservice/ChatSession;

    invoke-static {v3}, Lcom/google/android/gtalkservice/ChatSession;->access$400(Lcom/google/android/gtalkservice/ChatSession;)J

    move-result-wide v3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/gtalkservice/ChatSession;->access$500(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;Ljava/lang/String;J)V

    .line 1180
    return-void
.end method
