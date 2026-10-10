.class Lcom/google/android/talk/ChatScreen$13;
.super Ljava/lang/Object;
.source "ChatScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/ChatScreen;->registerForServiceStateChanged()V
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
    .line 806
    iput-object p1, p0, Lcom/google/android/talk/ChatScreen$13;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 807
    iget-object v0, p0, Lcom/google/android/talk/ChatScreen$13;->this$0:Lcom/google/android/talk/ChatScreen;

    invoke-virtual {v0}, Lcom/google/android/talk/ChatScreen;->serviceStateChanged()V

    .line 808
    return-void
.end method
