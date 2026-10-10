.class public Lorg/jivesoftware/smack/util/Base64$InputStream;
.super Ljava/io/FilterInputStream;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InputStream"
.end annotation


# instance fields
.field private breakLines:Z

.field private buffer:[B

.field private bufferLength:I

.field private encode:Z

.field private lineLength:I

.field private numSigBytes:I

.field private position:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 1049
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V

    .line 1050
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "options"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1077
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1078
    and-int/lit8 v0, p2, 0x8

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    move v0, v3

    :goto_0
    iput-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->breakLines:Z

    .line 1079
    and-int/lit8 v0, p2, 0x1

    if-ne v0, v3, :cond_1

    move v0, v3

    :goto_1
    iput-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->encode:Z

    .line 1080
    iget-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->encode:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x4

    :goto_2
    iput v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->bufferLength:I

    .line 1081
    iget v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->bufferLength:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->buffer:[B

    .line 1082
    const/4 v0, -0x1

    iput v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    .line 1083
    iput v2, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    .line 1084
    return-void

    :cond_0
    move v0, v2

    .line 1078
    goto :goto_0

    :cond_1
    move v0, v2

    .line 1079
    goto :goto_1

    .line 1080
    :cond_2
    const/4 v0, 0x3

    goto :goto_2
.end method


# virtual methods
.method public read()I
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    const/4 v10, 0x4

    const/4 v9, -0x1

    const/4 v8, 0x0

    .line 1095
    iget v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    if-gez v6, :cond_2

    .line 1096
    iget-boolean v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->encode:Z

    if-eqz v6, :cond_4

    .line 1097
    new-array v1, v7, [B

    .line 1098
    .local v1, "b3":[B
    const/4 v5, 0x0

    .line 1099
    .local v5, "numBinaryBytes":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v7, :cond_1

    .line 1101
    :try_start_0
    iget-object v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 1104
    .local v0, "b":I
    if-ltz v0, :cond_0

    .line 1105
    int-to-byte v6, v0

    aput-byte v6, v1, v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1106
    add-int/lit8 v5, v5, 0x1

    .line 1099
    .end local v0    # "b":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1110
    :catch_0
    move-exception v6

    move-object v3, v6

    .line 1112
    .local v3, "e":Ljava/io/IOException;
    if-nez v4, :cond_0

    .line 1113
    throw v3

    .line 1119
    .end local v3    # "e":Ljava/io/IOException;
    :cond_1
    if-lez v5, :cond_3

    .line 1120
    iget-object v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->buffer:[B

    invoke-static {v1, v8, v5, v6, v8}, Lorg/jivesoftware/smack/util/Base64;->access$000([BII[BI)[B

    .line 1121
    iput v8, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    .line 1122
    iput v10, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->numSigBytes:I

    .line 1165
    .end local v1    # "b3":[B
    .end local v4    # "i":I
    .end local v5    # "numBinaryBytes":I
    :cond_2
    :goto_1
    iget v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    if-ltz v6, :cond_e

    .line 1167
    iget v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    iget v7, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->numSigBytes:I

    if-lt v6, v7, :cond_b

    move v6, v9

    .line 1186
    :goto_2
    return v6

    .restart local v1    # "b3":[B
    .restart local v4    # "i":I
    .restart local v5    # "numBinaryBytes":I
    :cond_3
    move v6, v9

    .line 1125
    goto :goto_2

    .line 1131
    .end local v1    # "b3":[B
    .end local v4    # "i":I
    .end local v5    # "numBinaryBytes":I
    :cond_4
    new-array v2, v10, [B

    .line 1133
    .local v2, "b4":[B
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_3
    if-ge v4, v10, :cond_7

    .line 1137
    :cond_5
    iget-object v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 1139
    .restart local v0    # "b":I
    if-ltz v0, :cond_6

    invoke-static {}, Lorg/jivesoftware/smack/util/Base64;->access$100()[B

    move-result-object v6

    and-int/lit8 v7, v0, 0x7f

    aget-byte v6, v6, v7

    const/4 v7, -0x5

    if-le v6, v7, :cond_5

    .line 1141
    :cond_6
    if-gez v0, :cond_8

    .line 1148
    .end local v0    # "b":I
    :cond_7
    if-ne v4, v10, :cond_9

    .line 1149
    iget-object v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->buffer:[B

    invoke-static {v2, v8, v6, v8}, Lorg/jivesoftware/smack/util/Base64;->access$200([BI[BI)I

    move-result v6

    iput v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->numSigBytes:I

    .line 1150
    iput v8, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    goto :goto_1

    .line 1145
    .restart local v0    # "b":I
    :cond_8
    int-to-byte v6, v0

    aput-byte v6, v2, v4

    .line 1133
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 1152
    .end local v0    # "b":I
    :cond_9
    if-nez v4, :cond_a

    move v6, v9

    .line 1153
    goto :goto_2

    .line 1157
    :cond_a
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Improperly padded Base64 input."

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1171
    .end local v2    # "b4":[B
    .end local v4    # "i":I
    :cond_b
    iget-boolean v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->encode:Z

    if-eqz v6, :cond_c

    iget-boolean v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->breakLines:Z

    if-eqz v6, :cond_c

    iget v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    const/16 v7, 0x4c

    if-lt v6, v7, :cond_c

    .line 1172
    iput v8, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    .line 1173
    const/16 v6, 0xa

    goto :goto_2

    .line 1176
    :cond_c
    iget v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    .line 1180
    iget-object v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->buffer:[B

    iget v7, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    aget-byte v0, v6, v7

    .line 1182
    .restart local v0    # "b":I
    iget v6, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    iget v7, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->bufferLength:I

    if-lt v6, v7, :cond_d

    .line 1183
    iput v9, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    .line 1186
    :cond_d
    and-int/lit16 v6, v0, 0xff

    goto :goto_2

    .line 1194
    .end local v0    # "b":I
    :cond_e
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Error in Base64 code reading stream."

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public read([BII)I
    .locals 4
    .param p1, "dest"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1217
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p3, :cond_1

    .line 1218
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->read()I

    move-result v0

    .line 1223
    .local v0, "b":I
    if-ltz v0, :cond_0

    .line 1224
    add-int v2, p2, v1

    int-to-byte v3, v0

    aput-byte v3, p1, v2

    .line 1217
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1225
    :cond_0
    if-nez v1, :cond_1

    .line 1226
    const/4 v2, -0x1

    .line 1231
    .end local v0    # "b":I
    :goto_1
    return v2

    :cond_1
    move v2, v1

    goto :goto_1
.end method
