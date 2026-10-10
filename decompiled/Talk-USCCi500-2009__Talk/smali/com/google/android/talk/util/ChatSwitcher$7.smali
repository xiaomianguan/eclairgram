.class Lcom/google/android/talk/util/ChatSwitcher$7;
.super Ljava/lang/Object;
.source "ChatSwitcher.java"

# interfaces
.implements Lcom/google/android/talk/util/ChatSwitcher$OnQueryCompleteRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/util/ChatSwitcher;->rotateChat(ILjava/lang/String;JJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/util/ChatSwitcher;

.field final synthetic val$accountId:J

.field final synthetic val$contact:Ljava/lang/String;

.field final synthetic val$direction:I

.field final synthetic val$providerId:J


# direct methods
.method constructor <init>(Lcom/google/android/talk/util/ChatSwitcher;ILjava/lang/String;JJ)V
    .locals 0

    .prologue
    .line 774
    iput-object p1, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iput p2, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->val$direction:I

    iput-object p3, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->val$contact:Ljava/lang/String;

    iput-wide p4, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->val$accountId:J

    iput-wide p6, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->val$providerId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Landroid/database/Cursor;)V
    .locals 8
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    .line 775
    iget-object v0, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->this$0:Lcom/google/android/talk/util/ChatSwitcher;

    iget v2, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->val$direction:I

    iget-object v3, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->val$contact:Ljava/lang/String;

    iget-wide v4, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->val$accountId:J

    iget-wide v6, p0, Lcom/google/android/talk/util/ChatSwitcher$7;->val$providerId:J

    move-object v1, p1

    invoke-static/range {v0 .. v7}, Lcom/google/android/talk/util/ChatSwitcher;->access$1000(Lcom/google/android/talk/util/ChatSwitcher;Landroid/database/Cursor;ILjava/lang/String;JJ)V

    .line 776
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 777
    return-void
.end method
