.class public final Landroid/provider/Gmail$Attachment;
.super Ljava/lang/Object;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Attachment"
.end annotation


# instance fields
.field public contentType:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public origin:Landroid/provider/Gmail$AttachmentOrigin;

.field public originExtras:Ljava/lang/String;

.field public partId:Ljava/lang/String;

.field public simpleContentType:Ljava/lang/String;

.field public size:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1714
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseJoinedString(Ljava/lang/String;)Landroid/provider/Gmail$Attachment;
    .registers 6
    .param p0, "joinedString"    # Ljava/lang/String;

    .prologue
    .line 1746
    const-string v4, "\\|"

    invoke-static {p0, v4}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1747
    .local v1, "fragments":[Ljava/lang/String;
    const/4 v2, 0x0

    .line 1748
    .local v2, "i":I
    new-instance v0, Landroid/provider/Gmail$Attachment;

    invoke-direct {v0}, Landroid/provider/Gmail$Attachment;-><init>()V

    .line 1749
    .local v0, "attachment":Landroid/provider/Gmail$Attachment;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    aget-object v4, v1, v2

    iput-object v4, v0, Landroid/provider/Gmail$Attachment;->partId:Ljava/lang/String;

    .line 1750
    iget-object v4, v0, Landroid/provider/Gmail$Attachment;->partId:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 1751
    const/4 v4, 0x0

    iput-object v4, v0, Landroid/provider/Gmail$Attachment;->partId:Ljava/lang/String;

    .line 1753
    :cond_1d
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    aget-object v4, v1, v3

    iput-object v4, v0, Landroid/provider/Gmail$Attachment;->name:Ljava/lang/String;

    .line 1754
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    aget-object v4, v1, v2

    iput-object v4, v0, Landroid/provider/Gmail$Attachment;->contentType:Ljava/lang/String;

    .line 1755
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    aget-object v4, v1, v3

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v0, Landroid/provider/Gmail$Attachment;->size:I

    .line 1756
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    aget-object v4, v1, v2

    iput-object v4, v0, Landroid/provider/Gmail$Attachment;->simpleContentType:Ljava/lang/String;

    .line 1757
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    aget-object v4, v1, v3

    invoke-static {v4}, Landroid/provider/Gmail$AttachmentOrigin;->valueOf(Ljava/lang/String;)Landroid/provider/Gmail$AttachmentOrigin;

    move-result-object v4

    iput-object v4, v0, Landroid/provider/Gmail$Attachment;->origin:Landroid/provider/Gmail$AttachmentOrigin;

    .line 1758
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    aget-object v4, v1, v2

    iput-object v4, v0, Landroid/provider/Gmail$Attachment;->originExtras:Ljava/lang/String;

    .line 1759
    return-object v0
.end method


# virtual methods
.method public toJoinedString()Ljava/lang/String;
    .registers 7

    .prologue
    const-string v5, "|"

    const-string v4, ""

    .line 1738
    const-string v0, "|"

    const/4 v0, 0x7

    new-array v0, v0, [Ljava/io/Serializable;

    const/4 v1, 0x0

    iget-object v2, p0, Landroid/provider/Gmail$Attachment;->partId:Ljava/lang/String;

    if-nez v2, :cond_4a

    const-string v2, ""

    move-object v2, v4

    :goto_11
    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Landroid/provider/Gmail$Attachment;->name:Ljava/lang/String;

    const-string v3, "|"

    const-string v3, ""

    invoke-virtual {v2, v5, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Landroid/provider/Gmail$Attachment;->contentType:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget v2, p0, Landroid/provider/Gmail$Attachment;->size:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    iget-object v2, p0, Landroid/provider/Gmail$Attachment;->simpleContentType:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Landroid/provider/Gmail$Attachment;->origin:Landroid/provider/Gmail$AttachmentOrigin;

    invoke-virtual {v2}, Landroid/provider/Gmail$AttachmentOrigin;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    iget-object v2, p0, Landroid/provider/Gmail$Attachment;->originExtras:Ljava/lang/String;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/collect/Lists;->newArrayList([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v5, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_4a
    iget-object v2, p0, Landroid/provider/Gmail$Attachment;->partId:Ljava/lang/String;

    goto :goto_11
.end method
