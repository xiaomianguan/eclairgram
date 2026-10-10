.class public final enum Landroid/provider/Gmail$PersonalLevel;
.super Ljava/lang/Enum;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PersonalLevel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/provider/Gmail$PersonalLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/provider/Gmail$PersonalLevel;

.field public static final enum NOT_TO_ME:Landroid/provider/Gmail$PersonalLevel;

.field public static final enum ONLY_TO_ME:Landroid/provider/Gmail$PersonalLevel;

.field public static final enum TO_ME_AND_OTHERS:Landroid/provider/Gmail$PersonalLevel;


# instance fields
.field private mLevel:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1623
    new-instance v0, Landroid/provider/Gmail$PersonalLevel;

    const-string v1, "NOT_TO_ME"

    invoke-direct {v0, v1, v2, v2}, Landroid/provider/Gmail$PersonalLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Landroid/provider/Gmail$PersonalLevel;->NOT_TO_ME:Landroid/provider/Gmail$PersonalLevel;

    .line 1624
    new-instance v0, Landroid/provider/Gmail$PersonalLevel;

    const-string v1, "TO_ME_AND_OTHERS"

    invoke-direct {v0, v1, v3, v3}, Landroid/provider/Gmail$PersonalLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Landroid/provider/Gmail$PersonalLevel;->TO_ME_AND_OTHERS:Landroid/provider/Gmail$PersonalLevel;

    .line 1625
    new-instance v0, Landroid/provider/Gmail$PersonalLevel;

    const-string v1, "ONLY_TO_ME"

    invoke-direct {v0, v1, v4, v4}, Landroid/provider/Gmail$PersonalLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Landroid/provider/Gmail$PersonalLevel;->ONLY_TO_ME:Landroid/provider/Gmail$PersonalLevel;

    .line 1622
    const/4 v0, 0x3

    new-array v0, v0, [Landroid/provider/Gmail$PersonalLevel;

    sget-object v1, Landroid/provider/Gmail$PersonalLevel;->NOT_TO_ME:Landroid/provider/Gmail$PersonalLevel;

    aput-object v1, v0, v2

    sget-object v1, Landroid/provider/Gmail$PersonalLevel;->TO_ME_AND_OTHERS:Landroid/provider/Gmail$PersonalLevel;

    aput-object v1, v0, v3

    sget-object v1, Landroid/provider/Gmail$PersonalLevel;->ONLY_TO_ME:Landroid/provider/Gmail$PersonalLevel;

    aput-object v1, v0, v4

    sput-object v0, Landroid/provider/Gmail$PersonalLevel;->$VALUES:[Landroid/provider/Gmail$PersonalLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "level"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 1629
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 1630
    iput p3, p0, Landroid/provider/Gmail$PersonalLevel;->mLevel:I

    .line 1631
    return-void
.end method

.method public static fromInt(I)Landroid/provider/Gmail$PersonalLevel;
    .registers 4
    .param p0, "level"    # I

    .prologue
    .line 1638
    packed-switch p0, :pswitch_data_26

    .line 1643
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a personal level"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1639
    :pswitch_1c
    sget-object v0, Landroid/provider/Gmail$PersonalLevel;->NOT_TO_ME:Landroid/provider/Gmail$PersonalLevel;

    .line 1641
    :goto_1e
    return-object v0

    .line 1640
    :pswitch_1f
    sget-object v0, Landroid/provider/Gmail$PersonalLevel;->TO_ME_AND_OTHERS:Landroid/provider/Gmail$PersonalLevel;

    goto :goto_1e

    .line 1641
    :pswitch_22
    sget-object v0, Landroid/provider/Gmail$PersonalLevel;->ONLY_TO_ME:Landroid/provider/Gmail$PersonalLevel;

    goto :goto_1e

    .line 1638
    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/provider/Gmail$PersonalLevel;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1622
    const-class v0, Landroid/provider/Gmail$PersonalLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .end local p0    # "name":Ljava/lang/String;
    check-cast p0, Landroid/provider/Gmail$PersonalLevel;

    return-object p0
.end method

.method public static final values()[Landroid/provider/Gmail$PersonalLevel;
    .registers 1

    .prologue
    .line 1622
    sget-object v0, Landroid/provider/Gmail$PersonalLevel;->$VALUES:[Landroid/provider/Gmail$PersonalLevel;

    invoke-virtual {v0}, [Landroid/provider/Gmail$PersonalLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/provider/Gmail$PersonalLevel;

    return-object v0
.end method


# virtual methods
.method public toInt()I
    .registers 2

    .prologue
    .line 1634
    iget v0, p0, Landroid/provider/Gmail$PersonalLevel;->mLevel:I

    return v0
.end method
