.class Landroid/provider/Gmail$CommaStringSplitter;
.super Landroid/text/TextUtils$SimpleStringSplitter;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CommaStringSplitter"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 283
    const/16 v0, 0x2c

    invoke-direct {p0, v0}, Landroid/text/TextUtils$SimpleStringSplitter;-><init>(C)V

    .line 284
    return-void
.end method


# virtual methods
.method public setString(Ljava/lang/String;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 289
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/text/TextUtils$SimpleStringSplitter;->setString(Ljava/lang/String;)V

    .line 290
    return-void
.end method
