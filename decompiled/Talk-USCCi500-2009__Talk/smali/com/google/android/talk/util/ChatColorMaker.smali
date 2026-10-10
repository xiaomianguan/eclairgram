.class public Lcom/google/android/talk/util/ChatColorMaker;
.super Ljava/lang/Object;
.source "ChatColorMaker.java"


# static fields
.field public static final DARKER_BACKGROUND:I = 0x2

.field public static final FULL_INTENSITY:I = 0x0

.field private static final LINK_HUE_DELTA:F = 0.15f

.field public static final PARTIAL_INTENSITY:I = 0x1


# instance fields
.field private mBaseOffset:I

.field private mColors:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[I>;"
        }
    .end annotation
.end field

.field private mLinkHue:F

.field private mTempHSV:[F


# direct methods
.method public constructor <init>(II)V
    .locals 3
    .param p1, "seed"    # I
    .param p2, "linkColor"    # I

    .prologue
    const/4 v1, 0x3

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    .line 38
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mColors:Ljava/util/HashMap;

    .line 42
    iget-object v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    invoke-static {p2, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 43
    iget-object v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mLinkHue:F

    .line 45
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    rem-int/lit16 v0, v0, 0x168

    iput v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mBaseOffset:I

    .line 46
    iget-object v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    const/4 v1, 0x2

    const/high16 v2, 0x3f800000    # 1.0f

    aput v2, v0, v1

    .line 47
    return-void
.end method

.method private nextHue(I)F
    .locals 3
    .param p1, "offset"    # I

    .prologue
    .line 86
    :goto_0
    mul-int/lit8 v1, p1, 0x53

    rem-int/lit16 v1, v1, 0x168

    int-to-float v0, v1

    .line 90
    .local v0, "hue":F
    iget v1, p0, Lcom/google/android/talk/util/ChatColorMaker;->mLinkHue:F

    sub-float v1, v0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v2, 0x3e19999a    # 0.15f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 91
    return v0

    .line 94
    :cond_0
    iget v1, p0, Lcom/google/android/talk/util/ChatColorMaker;->mBaseOffset:I

    add-int/lit8 v1, v1, 0x1

    rem-int/lit16 v1, v1, 0x168

    iput v1, p0, Lcom/google/android/talk/util/ChatColorMaker;->mBaseOffset:I

    .line 95
    iget v1, p0, Lcom/google/android/talk/util/ChatColorMaker;->mBaseOffset:I

    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mColors:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    add-int p1, v1, v2

    .line 96
    goto :goto_0
.end method


# virtual methods
.method public final freeze(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 100
    const-string v0, "colormaker:base"

    iget v1, p0, Lcom/google/android/talk/util/ChatColorMaker;->mBaseOffset:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 101
    const-string v0, "colormaker:colors"

    iget-object v1, p0, Lcom/google/android/talk/util/ChatColorMaker;->mColors:Ljava/util/HashMap;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 102
    const-string v0, "colormaker:linkhue"

    iget v1, p0, Lcom/google/android/talk/util/ChatColorMaker;->mLinkHue:F

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 103
    return-void
.end method

.method public final get(Ljava/lang/String;I)I
    .locals 7
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "colorType"    # I

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 50
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mColors:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 52
    .local v0, "color":[I
    if-nez v0, :cond_0

    .line 53
    const/4 v2, 0x3

    new-array v0, v2, [I

    .line 54
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mColors:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v1

    .line 56
    .local v1, "offset":I
    iget v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mBaseOffset:I

    add-int/2addr v1, v2

    .line 60
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    invoke-direct {p0, v1}, Lcom/google/android/talk/util/ChatColorMaker;->nextHue(I)F

    move-result v3

    aput v3, v2, v5

    .line 61
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    const v3, 0x3e99999a    # 0.3f

    aput v3, v2, v4

    .line 63
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    invoke-static {v2}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v2

    aput v2, v0, v5

    .line 65
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    const v3, 0x3f7851ec    # 0.97f

    aput v3, v2, v6

    .line 66
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    invoke-static {v2}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v2

    aput v2, v0, v6

    .line 68
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    const v3, 0x3e19999a    # 0.15f

    aput v3, v2, v4

    .line 70
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mTempHSV:[F

    invoke-static {v2}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v2

    aput v2, v0, v4

    .line 72
    iget-object v2, p0, Lcom/google/android/talk/util/ChatColorMaker;->mColors:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .end local v1    # "offset":I
    :cond_0
    if-nez p2, :cond_1

    .line 76
    aget v2, v0, v5

    .line 80
    :goto_0
    return v2

    .line 77
    :cond_1
    if-ne p2, v4, :cond_2

    .line 78
    aget v2, v0, v4

    goto :goto_0

    .line 80
    :cond_2
    aget v2, v0, v6

    goto :goto_0
.end method

.method public final thaw(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 106
    const-string v0, "colormaker:base"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mBaseOffset:I

    .line 107
    const-string v0, "colormaker:colors"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    iput-object v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mColors:Ljava/util/HashMap;

    .line 108
    const-string v0, "colormaker:linkhue"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/google/android/talk/util/ChatColorMaker;->mLinkHue:F

    .line 109
    return-void
.end method
