.class Lcom/google/android/talk/BuddyList$ClearStatusList;
.super Ljava/lang/Object;
.source "BuddyList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClearStatusList"
.end annotation


# instance fields
.field mText:Ljava/lang/CharSequence;

.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method public constructor <init>(Lcom/google/android/talk/BuddyList;Ljava/lang/CharSequence;)V
    .locals 0
    .param p2, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 1860
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$ClearStatusList;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1861
    iput-object p2, p0, Lcom/google/android/talk/BuddyList$ClearStatusList;->mText:Ljava/lang/CharSequence;

    .line 1862
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1866
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$ClearStatusList;->mText:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
