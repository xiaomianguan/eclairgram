.class Lcom/google/android/talk/BuddyInfo$4;
.super Ljava/lang/Object;
.source "BuddyInfo.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/talk/BuddyInfo;->registerForServiceStateChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/talk/BuddyInfo;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyInfo;)V
    .locals 0

    .prologue
    .line 237
    iput-object p1, p0, Lcom/google/android/talk/BuddyInfo$4;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/google/android/talk/BuddyInfo$4;->this$0:Lcom/google/android/talk/BuddyInfo;

    invoke-static {v0}, Lcom/google/android/talk/BuddyInfo;->access$400(Lcom/google/android/talk/BuddyInfo;)V

    .line 239
    return-void
.end method
