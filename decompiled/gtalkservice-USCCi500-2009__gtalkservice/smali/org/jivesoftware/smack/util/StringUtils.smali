.class public Lorg/jivesoftware/smack/util/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field private static final AMP_ENCODE:[C

.field private static final GT_ENCODE:[C

.field private static final LT_ENCODE:[C

.field private static final QUOTE_ENCODE:[C

.field private static digest:Landroid/security/MessageDigest;

.field private static numbersAndLetters:[C

.field private static randGen:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-string v0, "&quot;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->QUOTE_ENCODE:[C

    .line 35
    const-string v0, "&amp;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->AMP_ENCODE:[C

    .line 36
    const-string v0, "&lt;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->LT_ENCODE:[C

    .line 37
    const-string v0, "&gt;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->GT_ENCODE:[C

    .line 223
    const/4 v0, 0x0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->digest:Landroid/security/MessageDigest;

    .line 346
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->randGen:Ljava/util/Random;

    .line 354
    const-string v0, "0123456789abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->numbersAndLetters:[C

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 382
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 384
    return-void
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .locals 1
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 338
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 287
    const/4 v0, 0x0

    .line 289
    .local v0, "bytes":[B
    :try_start_0
    const-string v2, "ISO-8859-1"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 294
    :goto_0
    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([B)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 291
    :catch_0
    move-exception v2

    move-object v1, v2

    .line 292
    .local v1, "uee":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static encodeBase64([B)Ljava/lang/String;
    .locals 1
    .param p0, "data"    # [B

    .prologue
    .line 304
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([BZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64([BIIZ)Ljava/lang/String;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "lineBreaks"    # Z

    .prologue
    .line 328
    if-eqz p3, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {p0, p1, p2, v0}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public static encodeBase64([BZ)Ljava/lang/String;
    .locals 2
    .param p0, "data"    # [B
    .param p1, "lineBreaks"    # Z

    .prologue
    .line 315
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([BIIZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeHex([B)Ljava/lang/String;
    .locals 4
    .param p0, "bytes"    # [B

    .prologue
    const/16 v3, 0x10

    .line 268
    new-instance v0, Ljava/lang/StringBuffer;

    array-length v2, p0

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 270
    .local v0, "hex":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 271
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    if-ge v2, v3, :cond_0

    .line 272
    const-string v2, "0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 274
    :cond_0
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    invoke-static {v2, v3}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 270
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 277
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static escapeForXML(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x3e

    .line 160
    if-nez p0, :cond_0

    .line 161
    const/4 v6, 0x0

    .line 217
    :goto_0
    return-object v6

    .line 164
    :cond_0
    const/4 v1, 0x0

    .line 165
    .local v1, "i":I
    const/4 v3, 0x0

    .line 166
    .local v3, "last":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 167
    .local v2, "input":[C
    array-length v4, v2

    .line 168
    .local v4, "len":I
    new-instance v5, Ljava/lang/StringBuffer;

    int-to-double v6, v4

    const-wide v8, 0x3ff4cccccccccccdL    # 1.3

    mul-double/2addr v6, v8

    double-to-int v6, v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 169
    .local v5, "out":Ljava/lang/StringBuffer;
    :goto_1
    if-ge v1, v4, :cond_b

    .line 170
    aget-char v0, v2, v1

    .line 171
    .local v0, "ch":C
    if-le v0, v10, :cond_2

    .line 169
    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 173
    :cond_2
    const/16 v6, 0x3c

    if-ne v0, v6, :cond_4

    .line 174
    if-le v1, v3, :cond_3

    .line 175
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 177
    :cond_3
    add-int/lit8 v3, v1, 0x1

    .line 178
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->LT_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 180
    :cond_4
    if-ne v0, v10, :cond_6

    .line 181
    if-le v1, v3, :cond_5

    .line 182
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 184
    :cond_5
    add-int/lit8 v3, v1, 0x1

    .line 185
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->GT_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 188
    :cond_6
    const/16 v6, 0x26

    if-ne v0, v6, :cond_9

    .line 189
    if-le v1, v3, :cond_7

    .line 190
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 193
    :cond_7
    add-int/lit8 v6, v1, 0x5

    if-le v4, v6, :cond_8

    add-int/lit8 v6, v1, 0x1

    aget-char v6, v2, v6

    const/16 v7, 0x23

    if-ne v6, v7, :cond_8

    add-int/lit8 v6, v1, 0x2

    aget-char v6, v2, v6

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_8

    add-int/lit8 v6, v1, 0x3

    aget-char v6, v2, v6

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_8

    add-int/lit8 v6, v1, 0x4

    aget-char v6, v2, v6

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_8

    add-int/lit8 v6, v1, 0x5

    aget-char v6, v2, v6

    const/16 v7, 0x3b

    if-eq v6, v7, :cond_1

    .line 199
    :cond_8
    add-int/lit8 v3, v1, 0x1

    .line 200
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->AMP_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 203
    :cond_9
    const/16 v6, 0x22

    if-ne v0, v6, :cond_1

    .line 204
    if-le v1, v3, :cond_a

    .line 205
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 207
    :cond_a
    add-int/lit8 v3, v1, 0x1

    .line 208
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->QUOTE_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 211
    .end local v0    # "ch":C
    :cond_b
    if-nez v3, :cond_c

    move-object v6, p0

    .line 212
    goto/16 :goto_0

    .line 214
    :cond_c
    if-le v1, v3, :cond_d

    .line 215
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 217
    :cond_d
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_0
.end method

.method public static declared-synchronized hash(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 242
    const-class v2, Lorg/jivesoftware/smack/util/StringUtils;

    monitor-enter v2

    :try_start_0
    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->digest:Landroid/security/MessageDigest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_0

    .line 244
    :try_start_1
    const-string v3, "SHA-1"

    invoke-static {v3}, Landroid/security/MessageDigest;->getInstance(Ljava/lang/String;)Landroid/security/MessageDigest;

    move-result-object v3

    sput-object v3, Lorg/jivesoftware/smack/util/StringUtils;->digest:Landroid/security/MessageDigest;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 253
    :cond_0
    :goto_0
    :try_start_2
    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->digest:Landroid/security/MessageDigest;

    const-string v4, "UTF-8"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/security/MessageDigest;->update([B)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 258
    :goto_1
    :try_start_3
    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->digest:Landroid/security/MessageDigest;

    invoke-virtual {v3}, Landroid/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smack/util/StringUtils;->encodeHex([B)Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v3

    monitor-exit v2

    return-object v3

    .line 246
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 247
    .local v1, "nsae":Ljava/security/NoSuchAlgorithmException;
    :try_start_4
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v4, "Failed to load the SHA-1 MessageDigest. Jive will be unable to function normally."

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 242
    .end local v1    # "nsae":Ljava/security/NoSuchAlgorithmException;
    :catchall_0
    move-exception v3

    monitor-exit v2

    throw v3

    .line 255
    :catch_1
    move-exception v3

    move-object v0, v3

    .line 256
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_5
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v3, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1
.end method

.method public static parseAbbrevAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "address"    # Ljava/lang/String;

    .prologue
    .line 140
    if-nez p0, :cond_0

    .line 141
    const/4 v1, 0x0

    .line 148
    :goto_0
    return-object v1

    .line 143
    :cond_0
    const/16 v1, 0x40

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 144
    .local v0, "index":I
    if-gez v0, :cond_1

    move-object v1, p0

    .line 145
    goto :goto_0

    .line 148
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static parseBareAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 116
    if-nez p0, :cond_0

    .line 117
    const/4 v1, 0x0

    .line 127
    :goto_0
    return-object v1

    .line 119
    :cond_0
    const/16 v1, 0x2f

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 120
    .local v0, "slashIndex":I
    if-gez v0, :cond_1

    move-object v1, p0

    .line 121
    goto :goto_0

    .line 123
    :cond_1
    if-nez v0, :cond_2

    .line 124
    const-string v1, ""

    goto :goto_0

    .line 127
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static parseName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 48
    if-nez p0, :cond_0

    .line 49
    const/4 v1, 0x0

    .line 56
    :goto_0
    return-object v1

    .line 51
    :cond_0
    const-string v1, "@"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 52
    .local v0, "atIndex":I
    if-gtz v0, :cond_1

    .line 53
    const-string v1, ""

    goto :goto_0

    .line 56
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static parseResource(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 95
    if-nez p0, :cond_0

    .line 96
    const/4 v1, 0x0

    .line 103
    :goto_0
    return-object v1

    .line 98
    :cond_0
    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 99
    .local v0, "slashIndex":I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v1, v2, :cond_1

    if-gez v0, :cond_2

    .line 100
    :cond_1
    const-string v1, ""

    goto :goto_0

    .line 103
    :cond_2
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static parseServer(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 69
    if-nez p0, :cond_0

    .line 70
    const/4 v2, 0x0

    .line 82
    :goto_0
    return-object v2

    .line 72
    :cond_0
    const-string v2, "@"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 74
    .local v0, "atIndex":I
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v2, v3, :cond_1

    .line 75
    const-string v2, ""

    goto :goto_0

    .line 77
    :cond_1
    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 78
    .local v1, "slashIndex":I
    if-lez v1, :cond_2

    .line 79
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 82
    :cond_2
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static randomString(I)Ljava/lang/String;
    .locals 5
    .param p0, "length"    # I

    .prologue
    .line 371
    const/4 v2, 0x1

    if-ge p0, v2, :cond_0

    .line 372
    const/4 v2, 0x0

    .line 379
    :goto_0
    return-object v2

    .line 375
    :cond_0
    new-array v1, p0, [C

    .line 376
    .local v1, "randBuffer":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 377
    sget-object v2, Lorg/jivesoftware/smack/util/StringUtils;->numbersAndLetters:[C

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->randGen:Ljava/util/Random;

    const/16 v4, 0x47

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    aget-char v2, v2, v3

    aput-char v2, v1, v0

    .line 376
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 379
    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    goto :goto_0
.end method
