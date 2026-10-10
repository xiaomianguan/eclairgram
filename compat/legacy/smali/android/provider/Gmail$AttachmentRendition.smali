.class public final enum Landroid/provider/Gmail$AttachmentRendition;
.super Ljava/lang/Enum;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AttachmentRendition"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/provider/Gmail$AttachmentRendition;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/provider/Gmail$AttachmentRendition;

.field public static final enum BEST:Landroid/provider/Gmail$AttachmentRendition;

.field public static final enum SIMPLE:Landroid/provider/Gmail$AttachmentRendition;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1657
    new-instance v0, Landroid/provider/Gmail$AttachmentRendition;

    const-string v1, "BEST"

    invoke-direct {v0, v1, v2}, Landroid/provider/Gmail$AttachmentRendition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/provider/Gmail$AttachmentRendition;->BEST:Landroid/provider/Gmail$AttachmentRendition;

    .line 1662
    new-instance v0, Landroid/provider/Gmail$AttachmentRendition;

    const-string v1, "SIMPLE"

    invoke-direct {v0, v1, v3}, Landroid/provider/Gmail$AttachmentRendition;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/provider/Gmail$AttachmentRendition;->SIMPLE:Landroid/provider/Gmail$AttachmentRendition;

    .line 1652
    const/4 v0, 0x2

    new-array v0, v0, [Landroid/provider/Gmail$AttachmentRendition;

    sget-object v1, Landroid/provider/Gmail$AttachmentRendition;->BEST:Landroid/provider/Gmail$AttachmentRendition;

    aput-object v1, v0, v2

    sget-object v1, Landroid/provider/Gmail$AttachmentRendition;->SIMPLE:Landroid/provider/Gmail$AttachmentRendition;

    aput-object v1, v0, v3

    sput-object v0, Landroid/provider/Gmail$AttachmentRendition;->$VALUES:[Landroid/provider/Gmail$AttachmentRendition;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 1652
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/provider/Gmail$AttachmentRendition;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1652
    const-class v0, Landroid/provider/Gmail$AttachmentRendition;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .end local p0    # "name":Ljava/lang/String;
    check-cast p0, Landroid/provider/Gmail$AttachmentRendition;

    return-object p0
.end method

.method public static final values()[Landroid/provider/Gmail$AttachmentRendition;
    .registers 1

    .prologue
    .line 1652
    sget-object v0, Landroid/provider/Gmail$AttachmentRendition;->$VALUES:[Landroid/provider/Gmail$AttachmentRendition;

    invoke-virtual {v0}, [Landroid/provider/Gmail$AttachmentRendition;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/provider/Gmail$AttachmentRendition;

    return-object v0
.end method
