.class public Lcom/google/android/talk/util/SmileyMenuHelper;
.super Ljava/lang/Object;
.source "SmileyMenuHelper.java"


# static fields
.field private static final sIconIds:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 35
    const/16 v0, 0x15

    new-array v0, v0, [I

    const/4 v1, 0x0

    sget v2, Lcom/android/internal/widget/Smileys;->HAPPY:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x1

    sget v2, Lcom/android/internal/widget/Smileys;->SAD:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x2

    sget v2, Lcom/android/internal/widget/Smileys;->WINKING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x3

    sget v2, Lcom/android/internal/widget/Smileys;->TONGUE_STICKING_OUT:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x4

    sget v2, Lcom/android/internal/widget/Smileys;->SURPRISED:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x5

    sget v2, Lcom/android/internal/widget/Smileys;->KISSING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x6

    sget v2, Lcom/android/internal/widget/Smileys;->YELLING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x7

    sget v2, Lcom/android/internal/widget/Smileys;->COOL:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x8

    sget v2, Lcom/android/internal/widget/Smileys;->MONEY_MOUTH:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x9

    sget v2, Lcom/android/internal/widget/Smileys;->FOOT_IN_MOUTH:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xa

    sget v2, Lcom/android/internal/widget/Smileys;->EMBARRASSED:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xb

    sget v2, Lcom/android/internal/widget/Smileys;->ANGEL:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xc

    sget v2, Lcom/android/internal/widget/Smileys;->UNDECIDED:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xd

    sget v2, Lcom/android/internal/widget/Smileys;->CRYING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xe

    sget v2, Lcom/android/internal/widget/Smileys;->LIPS_ARE_SEALED:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xf

    sget v2, Lcom/android/internal/widget/Smileys;->LAUGHING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x10

    sget v2, Lcom/android/internal/widget/Smileys;->WTF:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x11

    const v2, 0x7f020016

    aput v2, v0, v1

    const/16 v1, 0x12

    const v2, 0x7f020014

    aput v2, v0, v1

    const/16 v1, 0x13

    const v2, 0x7f020015

    aput v2, v0, v1

    const/16 v1, 0x14

    const v2, 0x7f020013

    aput v2, v0, v1

    sput-object v0, Lcom/google/android/talk/util/SmileyMenuHelper;->sIconIds:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final makeSmileyAlert(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 60
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 61
    .local v0, "r":Landroid/content/res/Resources;
    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    .line 62
    .local v4, "names":[Ljava/lang/String;
    const v1, 0x7f070001

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    .line 63
    .local v5, "texts":[Ljava/lang/String;
    sget-object v0, Lcom/google/android/talk/util/SmileyMenuHelper;->sIconIds:[I

    .end local v0    # "r":Landroid/content/res/Resources;
    array-length v0, v0

    .line 64
    .local v0, "N":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .local v2, "entries":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;*>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    move v3, v1

    .end local v1    # "i":I
    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_0

    .line 67
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 69
    .local v1, "entry":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "icon"

    sget-object v7, Lcom/google/android/talk/util/SmileyMenuHelper;->sIconIds:[I

    aget v7, v7, v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    const-string v6, "name"

    aget-object v7, v4, v3

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v6, "text"

    aget-object v7, v5, v3

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    add-int/lit8 v1, v3, 0x1

    .end local v3    # "i":I
    .local v1, "i":I
    move v3, v1

    .end local v1    # "i":I
    .restart local v3    # "i":I
    goto :goto_0

    .line 76
    :cond_0
    new-instance v0, Landroid/widget/SimpleAdapter;

    .end local v0    # "N":I
    const v3, 0x7f030017

    const/4 v1, 0x3

    new-array v4, v1, [Ljava/lang/String;

    .end local v3    # "i":I
    .end local v4    # "names":[Ljava/lang/String;
    const/4 v1, 0x0

    const-string v5, "icon"

    .end local v5    # "texts":[Ljava/lang/String;
    aput-object v5, v4, v1

    const/4 v1, 0x1

    const-string v5, "name"

    aput-object v5, v4, v1

    const/4 v1, 0x2

    const-string v5, "text"

    aput-object v5, v4, v1

    const/4 v1, 0x3

    new-array v5, v1, [I

    fill-array-data v5, :array_0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 83
    .local v0, "a":Landroid/widget/SimpleAdapter;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 85
    .local v1, "b":Landroid/app/AlertDialog$Builder;
    const p0, 0x7f06003c

    invoke-virtual {v1, p0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 86
    .end local p0    # "context":Landroid/content/Context;
    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 87
    invoke-virtual {v1, v0, p1}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 89
    const p0, 0x7f060034

    new-instance p1, Lcom/google/android/talk/util/SmileyMenuHelper$1;

    .end local p1    # "listener":Landroid/content/DialogInterface$OnClickListener;
    invoke-direct {p1}, Lcom/google/android/talk/util/SmileyMenuHelper$1;-><init>()V

    invoke-virtual {v1, p0, p1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 95
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    return-object p0

    .line 76
    nop

    :array_0
    .array-data 4
        0x7f0b003c
        0x7f0b003d
        0x7f0b003e
    .end array-data
.end method
