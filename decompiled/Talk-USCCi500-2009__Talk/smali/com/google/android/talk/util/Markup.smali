.class public Lcom/google/android/talk/util/Markup;
.super Ljava/lang/Object;
.source "Markup.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mSmileyResources:[I

.field private mSmileyText:[Ljava/lang/String;

.field private mSmileys:Lcom/google/android/talk/util/IntTrie;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/16 v0, 0x1d

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, ":-)"

    aput-object v1, v0, v3

    const-string v1, ":)"

    aput-object v1, v0, v4

    const-string v1, ":-("

    aput-object v1, v0, v5

    const-string v1, ";-)"

    aput-object v1, v0, v6

    const-string v1, ";)"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, ":-P"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "=-O"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, ":-O"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, ":-*"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, ">:o"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, ":O"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "8-)"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "B-)"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, ":-$"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, ":-!"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, ":-["

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "O:-)"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, ":-\\"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, ":\'("

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, ":-X"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, ":-D"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "o_O"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "O_o"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "O.o"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "o.O"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, ":-/"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "x-("

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, ":-|"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "<3"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/google/android/talk/util/Markup;->mSmileyText:[Ljava/lang/String;

    .line 65
    const/16 v0, 0x1d

    new-array v0, v0, [I

    sget v1, Lcom/android/internal/widget/Smileys;->HAPPY:I

    invoke-static {v1}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v1

    aput v1, v0, v3

    sget v1, Lcom/android/internal/widget/Smileys;->HAPPY:I

    invoke-static {v1}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v1

    aput v1, v0, v4

    sget v1, Lcom/android/internal/widget/Smileys;->SAD:I

    invoke-static {v1}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v1

    aput v1, v0, v5

    sget v1, Lcom/android/internal/widget/Smileys;->WINKING:I

    invoke-static {v1}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v1

    aput v1, v0, v6

    sget v1, Lcom/android/internal/widget/Smileys;->WINKING:I

    invoke-static {v1}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v1

    aput v1, v0, v7

    const/4 v1, 0x5

    sget v2, Lcom/android/internal/widget/Smileys;->TONGUE_STICKING_OUT:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x6

    sget v2, Lcom/android/internal/widget/Smileys;->SURPRISED:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x7

    sget v2, Lcom/android/internal/widget/Smileys;->SURPRISED:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x8

    sget v2, Lcom/android/internal/widget/Smileys;->KISSING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x9

    sget v2, Lcom/android/internal/widget/Smileys;->YELLING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xa

    sget v2, Lcom/android/internal/widget/Smileys;->YELLING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xb

    sget v2, Lcom/android/internal/widget/Smileys;->COOL:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xc

    sget v2, Lcom/android/internal/widget/Smileys;->COOL:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xd

    sget v2, Lcom/android/internal/widget/Smileys;->MONEY_MOUTH:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xe

    sget v2, Lcom/android/internal/widget/Smileys;->FOOT_IN_MOUTH:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xf

    sget v2, Lcom/android/internal/widget/Smileys;->EMBARRASSED:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x10

    sget v2, Lcom/android/internal/widget/Smileys;->ANGEL:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x11

    sget v2, Lcom/android/internal/widget/Smileys;->UNDECIDED:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x12

    sget v2, Lcom/android/internal/widget/Smileys;->CRYING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x13

    sget v2, Lcom/android/internal/widget/Smileys;->LIPS_ARE_SEALED:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x14

    sget v2, Lcom/android/internal/widget/Smileys;->LAUGHING:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x15

    sget v2, Lcom/android/internal/widget/Smileys;->WTF:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x16

    sget v2, Lcom/android/internal/widget/Smileys;->WTF:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x17

    sget v2, Lcom/android/internal/widget/Smileys;->WTF:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x18

    sget v2, Lcom/android/internal/widget/Smileys;->WTF:I

    invoke-static {v2}, Lcom/android/internal/widget/Smileys;->getSmileyResource(I)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x19

    const v2, 0x7f020016

    aput v2, v0, v1

    const/16 v1, 0x1a

    const v2, 0x7f020014

    aput v2, v0, v1

    const/16 v1, 0x1b

    const v2, 0x7f020015

    aput v2, v0, v1

    const/16 v1, 0x1c

    const v2, 0x7f020013

    aput v2, v0, v1

    iput-object v0, p0, Lcom/google/android/talk/util/Markup;->mSmileyResources:[I

    .line 98
    iput-object p1, p0, Lcom/google/android/talk/util/Markup;->mContext:Landroid/content/Context;

    .line 100
    new-instance v0, Lcom/google/android/talk/util/IntTrie;

    iget-object v1, p0, Lcom/google/android/talk/util/Markup;->mSmileyText:[Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/talk/util/Markup;->mSmileyResources:[I

    invoke-direct {v0, v1, v2}, Lcom/google/android/talk/util/IntTrie;-><init>([Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/google/android/talk/util/Markup;->mSmileys:Lcom/google/android/talk/util/IntTrie;

    .line 101
    return-void
.end method


# virtual methods
.method public final applyEmoticons(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 12
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 118
    const/4 v7, 0x0

    .line 119
    .local v7, "offset":I
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    .line 120
    .local v5, "len":I
    const/4 v8, 0x0

    .line 122
    .local v8, "result":Landroid/text/SpannableString;
    :goto_0
    if-ge v7, v5, :cond_7

    .line 123
    move v2, v7

    .line 124
    .local v2, "index":I
    iget-object v9, p0, Lcom/google/android/talk/util/Markup;->mSmileys:Lcom/google/android/talk/util/IntTrie;

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "index":I
    .local v3, "index":I
    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    invoke-virtual {v9, v10}, Lcom/google/android/talk/util/IntTrie;->getNode(C)Lcom/google/android/talk/util/IntTrie$Node;

    move-result-object v6

    .line 125
    .local v6, "n":Lcom/google/android/talk/util/IntTrie$Node;
    const/4 v1, 0x0

    .line 126
    .local v1, "candidate":I
    const/4 v4, -0x1

    .line 129
    .local v4, "lastMatchEnd":I
    :goto_1
    if-eqz v6, :cond_1

    .line 131
    iget v9, v6, Lcom/google/android/talk/util/IntTrie$Node;->mValue:I

    if-eqz v9, :cond_0

    .line 132
    iget v1, v6, Lcom/google/android/talk/util/IntTrie$Node;->mValue:I

    .line 133
    move v4, v3

    .line 138
    :cond_0
    if-lt v3, v5, :cond_4

    .line 146
    :cond_1
    if-eqz v1, :cond_3

    .line 148
    if-nez v8, :cond_2

    .line 149
    instance-of v9, p1, Landroid/text/SpannableString;

    if-eqz v9, :cond_5

    .line 150
    move-object v0, p1

    check-cast v0, Landroid/text/SpannableString;

    move-object v8, v0

    .line 157
    :cond_2
    :goto_2
    new-instance v9, Landroid/text/style/ImageSpan;

    iget-object v10, p0, Lcom/google/android/talk/util/Markup;->mContext:Landroid/content/Context;

    const/4 v11, 0x1

    invoke-direct {v9, v10, v1, v11}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;II)V

    const/16 v10, 0x21

    invoke-virtual {v8, v9, v7, v4, v10}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 160
    const/4 v1, 0x0

    .line 165
    :cond_3
    const/4 v9, -0x1

    if-eq v4, v9, :cond_6

    .line 166
    move v7, v4

    .line 167
    const/4 v4, -0x1

    goto :goto_0

    .line 142
    :cond_4
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "index":I
    .restart local v2    # "index":I
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-virtual {v6, v9}, Lcom/google/android/talk/util/IntTrie$Node;->getNode(C)Lcom/google/android/talk/util/IntTrie$Node;

    move-result-object v6

    move v3, v2

    .end local v2    # "index":I
    .restart local v3    # "index":I
    goto :goto_1

    .line 152
    :cond_5
    new-instance v8, Landroid/text/SpannableString;

    .end local v8    # "result":Landroid/text/SpannableString;
    invoke-direct {v8, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 153
    .restart local v8    # "result":Landroid/text/SpannableString;
    move-object p1, v8

    goto :goto_2

    .line 169
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 174
    .end local v1    # "candidate":I
    .end local v3    # "index":I
    .end local v4    # "lastMatchEnd":I
    .end local v6    # "n":Lcom/google/android/talk/util/IntTrie$Node;
    :cond_7
    if-nez v8, :cond_8

    move-object v9, p1

    .line 178
    :goto_3
    return-object v9

    :cond_8
    move-object v9, v8

    goto :goto_3
.end method

.method public final markup(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 106
    instance-of v2, p1, Landroid/text/SpannableString;

    if-eqz v2, :cond_0

    .line 107
    move-object v0, p1

    check-cast v0, Landroid/text/SpannableString;

    move-object v1, v0

    .line 112
    .local v1, "result":Landroid/text/SpannableString;
    :goto_0
    invoke-virtual {p0, v1}, Lcom/google/android/talk/util/Markup;->applyEmoticons(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 114
    return-object v1

    .line 109
    .end local v1    # "result":Landroid/text/SpannableString;
    :cond_0
    new-instance v1, Landroid/text/SpannableString;

    invoke-direct {v1, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .restart local v1    # "result":Landroid/text/SpannableString;
    goto :goto_0
.end method
