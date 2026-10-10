.class public Landroid/text/util/Rfc822Validator;
.super Ljava/lang/Object;
.source "Rfc822Validator.java"

# interfaces
.implements Landroid/widget/AutoCompleteTextView$Validator;


# static fields
.field private static final EMAIL_ADDRESS_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private mDomain:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 45
    const-string v0, "[^\\s@]+@[^\\s@]+\\.[a-zA-z][a-zA-Z][a-zA-Z]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/text/util/Rfc822Validator;->EMAIL_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Landroid/text/util/Rfc822Validator;->mDomain:Ljava/lang/String;

    .line 56
    return-void
.end method

.method private removeIllegalCharacters(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 74
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 76
    .local v2, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    if-ge v1, v2, :cond_4f

    .line 77
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 86
    .local v0, "c":C
    const/16 v4, 0x20

    if-le v0, v4, :cond_18

    const/16 v4, 0x7e

    if-le v0, v4, :cond_1b

    .line 76
    :cond_18
    :goto_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 90
    :cond_1b
    const/16 v4, 0x28

    if-eq v0, v4, :cond_18

    const/16 v4, 0x29

    if-eq v0, v4, :cond_18

    const/16 v4, 0x3c

    if-eq v0, v4, :cond_18

    const/16 v4, 0x3e

    if-eq v0, v4, :cond_18

    const/16 v4, 0x40

    if-eq v0, v4, :cond_18

    const/16 v4, 0x2c

    if-eq v0, v4, :cond_18

    const/16 v4, 0x3b

    if-eq v0, v4, :cond_18

    const/16 v4, 0x3a

    if-eq v0, v4, :cond_18

    const/16 v4, 0x5c

    if-eq v0, v4, :cond_18

    const/16 v4, 0x22

    if-eq v0, v4, :cond_18

    const/16 v4, 0x5b

    if-eq v0, v4, :cond_18

    const/16 v4, 0x5d

    if-eq v0, v4, :cond_18

    .line 96
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_18

    .line 98
    .end local v0    # "c":C
    :cond_4f
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public fixText(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 13
    .param p1, "cs"    # Ljava/lang/CharSequence;

    .prologue
    const-string v10, "@"

    .line 106
    invoke-static {p1}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v7

    if-nez v7, :cond_b

    const-string v7, ""

    .line 130
    :goto_a
    return-object v7

    .line 108
    :cond_b
    invoke-static {p1}, Landroid/text/util/Rfc822Tokenizer;->tokenize(Ljava/lang/CharSequence;)[Landroid/text/util/Rfc822Token;

    move-result-object v6

    .line 109
    .local v6, "tokens":[Landroid/text/util/Rfc822Token;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .local v4, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_15
    array-length v7, v6

    if-ge v2, v7, :cond_98

    .line 112
    aget-object v7, v6, v2

    invoke-virtual {v7}, Landroid/text/util/Rfc822Token;->getAddress()Ljava/lang/String;

    move-result-object v5

    .line 113
    .local v5, "text":Ljava/lang/String;
    const/16 v7, 0x40

    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 114
    .local v3, "index":I
    if-gez v3, :cond_5e

    .line 116
    aget-object v7, v6, v2

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v5}, Landroid/text/util/Rfc822Validator;->removeIllegalCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "@"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Landroid/text/util/Rfc822Validator;->mDomain:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/text/util/Rfc822Token;->setAddress(Ljava/lang/String;)V

    .line 124
    :goto_48
    aget-object v7, v6, v2

    invoke-virtual {v7}, Landroid/text/util/Rfc822Token;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    add-int/lit8 v7, v2, 0x1

    array-length v8, v6

    if-ge v7, v8, :cond_5b

    .line 126
    const-string v7, ", "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_5b
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 119
    :cond_5e
    const/4 v7, 0x0

    invoke-virtual {v5, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Landroid/text/util/Rfc822Validator;->removeIllegalCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 120
    .local v1, "fix":Ljava/lang/String;
    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Landroid/text/util/Rfc822Validator;->removeIllegalCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "domain":Ljava/lang/String;
    aget-object v7, v6, v2

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "@"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_95

    move-object v9, v0

    :goto_89
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/text/util/Rfc822Token;->setAddress(Ljava/lang/String;)V

    goto :goto_48

    :cond_95
    iget-object v9, p0, Landroid/text/util/Rfc822Validator;->mDomain:Ljava/lang/String;

    goto :goto_89

    .end local v0    # "domain":Ljava/lang/String;
    .end local v1    # "fix":Ljava/lang/String;
    .end local v3    # "index":I
    .end local v5    # "text":Ljava/lang/String;
    :cond_98
    move-object v7, v4

    .line 130
    goto/16 :goto_a
.end method

.method public isValid(Ljava/lang/CharSequence;)Z
    .registers 7
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 62
    invoke-static {p1}, Landroid/text/util/Rfc822Tokenizer;->tokenize(Ljava/lang/CharSequence;)[Landroid/text/util/Rfc822Token;

    move-result-object v0

    .line 64
    .local v0, "tokens":[Landroid/text/util/Rfc822Token;
    array-length v1, v0

    if-ne v1, v4, :cond_1d

    sget-object v1, Landroid/text/util/Rfc822Validator;->EMAIL_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

    aget-object v2, v0, v3

    invoke-virtual {v2}, Landroid/text/util/Rfc822Token;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_1d

    move v1, v4

    :goto_1c
    return v1

    :cond_1d
    move v1, v3

    goto :goto_1c
.end method
