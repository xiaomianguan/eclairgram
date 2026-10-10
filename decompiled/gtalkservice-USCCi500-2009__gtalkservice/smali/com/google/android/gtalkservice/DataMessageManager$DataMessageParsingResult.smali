.class Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;
.super Ljava/lang/Object;
.source "DataMessageManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/DataMessageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataMessageParsingResult"
.end annotation


# instance fields
.field public intent:Landroid/content/Intent;

.field public permission:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Intent;Ljava/lang/String;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "permission"    # Ljava/lang/String;

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    iput-object p1, p0, Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;->intent:Landroid/content/Intent;

    .line 129
    iput-object p2, p0, Lcom/google/android/gtalkservice/DataMessageManager$DataMessageParsingResult;->permission:Ljava/lang/String;

    .line 130
    return-void
.end method
