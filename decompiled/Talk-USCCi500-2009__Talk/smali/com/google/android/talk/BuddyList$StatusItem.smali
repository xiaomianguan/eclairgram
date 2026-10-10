.class Lcom/google/android/talk/BuddyList$StatusItem;
.super Ljava/lang/Object;
.source "BuddyList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/BuddyList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StatusItem"
.end annotation


# instance fields
.field mSpannableString:Landroid/text/SpannableString;

.field mStatusResourceId:I

.field final synthetic this$0:Lcom/google/android/talk/BuddyList;


# direct methods
.method constructor <init>(Lcom/google/android/talk/BuddyList;Landroid/text/SpannableString;I)V
    .locals 0
    .param p2, "spannableString"    # Landroid/text/SpannableString;
    .param p3, "statusResourceId"    # I

    .prologue
    .line 1840
    iput-object p1, p0, Lcom/google/android/talk/BuddyList$StatusItem;->this$0:Lcom/google/android/talk/BuddyList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1841
    iput-object p2, p0, Lcom/google/android/talk/BuddyList$StatusItem;->mSpannableString:Landroid/text/SpannableString;

    .line 1842
    iput p3, p0, Lcom/google/android/talk/BuddyList$StatusItem;->mStatusResourceId:I

    .line 1843
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1846
    iget-object v0, p0, Lcom/google/android/talk/BuddyList$StatusItem;->mSpannableString:Landroid/text/SpannableString;

    invoke-virtual {v0}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
