.class Lcom/google/android/talk/GroupChatApproval$1;
.super Ljava/lang/Object;
.source "GroupChatApproval.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/GroupChatApproval;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/GroupChatApproval;


# direct methods
.method constructor <init>(Lcom/google/android/talk/GroupChatApproval;)V
    .locals 0

    .prologue
    .line 138
    iput-object p1, p0, Lcom/google/android/talk/GroupChatApproval$1;->this$0:Lcom/google/android/talk/GroupChatApproval;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 139
    iget-object v0, p0, Lcom/google/android/talk/GroupChatApproval$1;->this$0:Lcom/google/android/talk/GroupChatApproval;

    invoke-virtual {v0}, Lcom/google/android/talk/GroupChatApproval;->acceptGroupChat()V

    .line 140
    return-void
.end method
