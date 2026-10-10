.class Lcom/google/android/talk/ChatView$DeltaCursor;
.super Ljava/lang/Object;
.source "ChatView.java"

# interfaces
.implements Landroid/database/Cursor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/talk/ChatView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeltaCursor"
.end annotation


# static fields
.field static final DELTA_COLUMN_NAME:Ljava/lang/String; = "delta"


# instance fields
.field private mColumnNames:[Ljava/lang/String;

.field private mCursor:Landroid/database/Cursor;

.field private mDateColumn:I

.field private mDeltaColumn:I

.field final synthetic this$0:Lcom/google/android/talk/ChatView;


# direct methods
.method constructor <init>(Lcom/google/android/talk/ChatView;Landroid/database/Cursor;)V
    .locals 6
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v3, -0x1

    .line 1872
    iput-object p1, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->this$0:Lcom/google/android/talk/ChatView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1869
    iput v3, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDateColumn:I

    .line 1870
    iput v3, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    .line 1873
    iput-object p2, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    .line 1875
    invoke-interface {p2}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    .line 1876
    .local v0, "columnNames":[Ljava/lang/String;
    array-length v2, v0

    .line 1878
    .local v2, "len":I
    add-int/lit8 v3, v2, 0x1

    new-array v3, v3, [Ljava/lang/String;

    iput-object v3, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mColumnNames:[Ljava/lang/String;

    .line 1880
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 1881
    iget-object v3, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mColumnNames:[Ljava/lang/String;

    aget-object v4, v0, v1

    aput-object v4, v3, v1

    .line 1882
    iget-object v3, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mColumnNames:[Ljava/lang/String;

    aget-object v3, v3, v1

    const-string v4, "date"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1883
    iput v1, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDateColumn:I

    .line 1880
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1887
    :cond_1
    iput v2, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    .line 1888
    iget-object v3, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mColumnNames:[Ljava/lang/String;

    iget v4, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    const-string v5, "delta"

    aput-object v5, v3, v4

    .line 1892
    return-void
.end method

.method private checkPosition()V
    .locals 3

    .prologue
    .line 2112
    iget-object v2, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getPosition()I

    move-result v1

    .line 2113
    .local v1, "pos":I
    iget-object v2, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 2115
    .local v0, "count":I
    const/4 v2, -0x1

    if-eq v2, v1, :cond_0

    if-ne v0, v1, :cond_1

    .line 2116
    :cond_0
    new-instance v2, Landroid/database/CursorIndexOutOfBoundsException;

    invoke-direct {v2, v1, v0}, Landroid/database/CursorIndexOutOfBoundsException;-><init>(II)V

    throw v2

    .line 2118
    :cond_1
    return-void
.end method

.method private getDeltaValue()J
    .locals 7

    .prologue
    .line 2222
    iget-object v5, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v5}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    .line 2227
    .local v0, "pos":I
    invoke-virtual {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->getCount()I

    move-result v5

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    if-ne v0, v5, :cond_0

    .line 2228
    iget-object v5, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    iget v6, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDateColumn:I

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 2229
    .local v1, "t1":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 2237
    .local v3, "t2":J
    :goto_0
    sub-long v5, v3, v1

    return-wide v5

    .line 2231
    .end local v1    # "t1":J
    .end local v3    # "t2":J
    :cond_0
    iget-object v5, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    add-int/lit8 v6, v0, 0x1

    invoke-interface {v5, v6}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 2232
    iget-object v5, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    iget v6, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDateColumn:I

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 2233
    .restart local v3    # "t2":J
    iget-object v5, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v5, v0}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 2234
    iget-object v5, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    iget v6, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDateColumn:I

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .restart local v1    # "t1":J
    goto :goto_0
.end method


# virtual methods
.method public abortUpdates()V
    .locals 1

    .prologue
    .line 2056
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->abortUpdates()V

    .line 2057
    return-void
.end method

.method public close()V
    .locals 1

    .prologue
    .line 2068
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 2069
    return-void
.end method

.method public commitUpdates()Z
    .locals 1

    .prologue
    .line 2047
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->commitUpdates()Z

    move-result v0

    return v0
.end method

.method public commitUpdates(Ljava/util/Map;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+",
            "Ljava/lang/Long;",
            "+",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)Z"
        }
    .end annotation

    .prologue
    .line 2052
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/Long;+Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->commitUpdates(Ljava/util/Map;)Z

    move-result v0

    return v0
.end method

.method public copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V
    .locals 7
    .param p1, "columnIndex"    # I
    .param p2, "buffer"    # Landroid/database/CharArrayBuffer;

    .prologue
    const/4 v6, 0x0

    .line 2142
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->checkPosition()V

    .line 2144
    iget v5, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v5, :cond_2

    .line 2145
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->getDeltaValue()J

    move-result-wide v3

    .line 2146
    .local v3, "value":J
    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    .line 2147
    .local v2, "strValue":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 2148
    .local v1, "len":I
    iget-object v0, p2, Landroid/database/CharArrayBuffer;->data:[C

    .line 2149
    .local v0, "data":[C
    if-eqz v0, :cond_0

    array-length v5, v0

    if-ge v5, v1, :cond_1

    .line 2150
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    iput-object v5, p2, Landroid/database/CharArrayBuffer;->data:[C

    .line 2154
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    iput v5, p2, Landroid/database/CharArrayBuffer;->sizeCopied:I

    .line 2158
    .end local v0    # "data":[C
    .end local v1    # "len":I
    .end local v2    # "strValue":Ljava/lang/String;
    .end local v3    # "value":J
    :goto_1
    return-void

    .line 2152
    .restart local v0    # "data":[C
    .restart local v1    # "len":I
    .restart local v2    # "strValue":Ljava/lang/String;
    .restart local v3    # "value":J
    :cond_1
    invoke-virtual {v2, v6, v1, v0, v6}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_0

    .line 2156
    .end local v0    # "data":[C
    .end local v1    # "len":I
    .end local v2    # "strValue":Ljava/lang/String;
    .end local v3    # "value":J
    :cond_2
    iget-object v5, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v5, p1, p2}, Landroid/database/Cursor;->copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V

    goto :goto_1
.end method

.method public deactivate()V
    .locals 1

    .prologue
    .line 2060
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 2061
    return-void
.end method

.method public deleteRow()Z
    .locals 1

    .prologue
    .line 1943
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->deleteRow()Z

    move-result v0

    return v0
.end method

.method public getBlob(I)[B
    .locals 1
    .param p1, "column"    # I

    .prologue
    .line 2121
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->checkPosition()V

    .line 2123
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2124
    const/4 v0, 0x0

    .line 2127
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    goto :goto_0
.end method

.method public getColumnCount()I
    .locals 1

    .prologue
    .line 1971
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getColumnCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getColumnIndex(Ljava/lang/String;)I
    .locals 1
    .param p1, "columnName"    # Ljava/lang/String;

    .prologue
    .line 1947
    const-string v0, "delta"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1948
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    .line 1951
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public getColumnIndexOrThrow(Ljava/lang/String;)I
    .locals 1
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 1955
    const-string v0, "delta"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1956
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    .line 1959
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 1
    .param p1, "columnIndex"    # I

    .prologue
    .line 1963
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 1964
    const-string v0, "delta"

    .line 1967
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 2108
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mColumnNames:[Ljava/lang/String;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 1895
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    return v0
.end method

.method public getDouble(I)D
    .locals 2
    .param p1, "column"    # I

    .prologue
    .line 2202
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->checkPosition()V

    .line 2204
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2205
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->getDeltaValue()J

    move-result-wide v0

    long-to-double v0, v0

    .line 2208
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v0

    goto :goto_0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 2100
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public getFloat(I)F
    .locals 2
    .param p1, "column"    # I

    .prologue
    .line 2192
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->checkPosition()V

    .line 2194
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2195
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->getDeltaValue()J

    move-result-wide v0

    long-to-float v0, v0

    .line 2198
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    goto :goto_0
.end method

.method public getInt(I)I
    .locals 2
    .param p1, "column"    # I

    .prologue
    .line 2171
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->checkPosition()V

    .line 2173
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2174
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->getDeltaValue()J

    move-result-wide v0

    long-to-int v0, v0

    .line 2177
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    goto :goto_0
.end method

.method public getLong(I)J
    .locals 2
    .param p1, "column"    # I

    .prologue
    .line 2182
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->checkPosition()V

    .line 2184
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2185
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->getDeltaValue()J

    move-result-wide v0

    .line 2188
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    goto :goto_0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 1899
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    return v0
.end method

.method public getShort(I)S
    .locals 2
    .param p1, "column"    # I

    .prologue
    .line 2161
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->checkPosition()V

    .line 2163
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2164
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->getDeltaValue()J

    move-result-wide v0

    long-to-int v0, v0

    int-to-short v0, v0

    .line 2167
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getShort(I)S

    move-result v0

    goto :goto_0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 3
    .param p1, "column"    # I

    .prologue
    .line 2131
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->checkPosition()V

    .line 2133
    iget v2, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v2, :cond_0

    .line 2134
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->getDeltaValue()J

    move-result-wide v0

    .line 2135
    .local v0, "value":J
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    .line 2138
    .end local v0    # "value":J
    :goto_0
    return-object v2

    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public getWantsAllOnMoveCalls()Z
    .locals 1

    .prologue
    .line 2096
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getWantsAllOnMoveCalls()Z

    move-result v0

    return v0
.end method

.method public hasUpdates()Z
    .locals 1

    .prologue
    .line 1979
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->hasUpdates()Z

    move-result v0

    return v0
.end method

.method public isAfterLast()Z
    .locals 1

    .prologue
    .line 1939
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    return v0
.end method

.method public isBeforeFirst()Z
    .locals 1

    .prologue
    .line 1935
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isBeforeFirst()Z

    move-result v0

    return v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 2072
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    return v0
.end method

.method public isFirst()Z
    .locals 1

    .prologue
    .line 1927
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isFirst()Z

    move-result v0

    return v0
.end method

.method public isLast()Z
    .locals 1

    .prologue
    .line 1931
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isLast()Z

    move-result v0

    return v0
.end method

.method public isNull(I)Z
    .locals 1
    .param p1, "column"    # I

    .prologue
    .line 2212
    invoke-direct {p0}, Lcom/google/android/talk/ChatView$DeltaCursor;->checkPosition()V

    .line 2214
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2215
    const/4 v0, 0x0

    .line 2218
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    goto :goto_0
.end method

.method public move(I)Z
    .locals 1
    .param p1, "offset"    # I

    .prologue
    .line 1903
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->move(I)Z

    move-result v0

    return v0
.end method

.method public moveToFirst()Z
    .locals 1

    .prologue
    .line 1911
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    return v0
.end method

.method public moveToLast()Z
    .locals 1

    .prologue
    .line 1915
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToLast()Z

    move-result v0

    return v0
.end method

.method public moveToNext()Z
    .locals 1

    .prologue
    .line 1919
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    return v0
.end method

.method public moveToPosition(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1907
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    return v0
.end method

.method public moveToPrevious()Z
    .locals 1

    .prologue
    .line 1923
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToPrevious()Z

    move-result v0

    return v0
.end method

.method public registerContentObserver(Landroid/database/ContentObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/ContentObserver;

    .prologue
    .line 2076
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 2077
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 2084
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 2085
    return-void
.end method

.method public requery()Z
    .locals 1

    .prologue
    .line 2064
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    move-result v0

    return v0
.end method

.method public respond(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 2104
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->respond(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .locals 1
    .param p1, "cr"    # Landroid/content/ContentResolver;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 2092
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 2093
    return-void
.end method

.method public supportsUpdates()Z
    .locals 1

    .prologue
    .line 1975
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->supportsUpdates()Z

    move-result v0

    return v0
.end method

.method public unregisterContentObserver(Landroid/database/ContentObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/ContentObserver;

    .prologue
    .line 2080
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 2081
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 2088
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 2089
    return-void
.end method

.method public updateBlob(I[B)Z
    .locals 1
    .param p1, "columnIndex"    # I
    .param p2, "value"    # [B

    .prologue
    .line 1983
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 1984
    const/4 v0, 0x0

    .line 1987
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2}, Landroid/database/Cursor;->updateBlob(I[B)Z

    move-result v0

    goto :goto_0
.end method

.method public updateDouble(ID)Z
    .locals 1
    .param p1, "columnIndex"    # I
    .param p2, "value"    # D

    .prologue
    .line 2031
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2032
    const/4 v0, 0x0

    .line 2035
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2, p3}, Landroid/database/Cursor;->updateDouble(ID)Z

    move-result v0

    goto :goto_0
.end method

.method public updateFloat(IF)Z
    .locals 1
    .param p1, "columnIndex"    # I
    .param p2, "value"    # F

    .prologue
    .line 2023
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2024
    const/4 v0, 0x0

    .line 2027
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2}, Landroid/database/Cursor;->updateFloat(IF)Z

    move-result v0

    goto :goto_0
.end method

.method public updateInt(II)Z
    .locals 1
    .param p1, "columnIndex"    # I
    .param p2, "value"    # I

    .prologue
    .line 2007
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2008
    const/4 v0, 0x0

    .line 2011
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2}, Landroid/database/Cursor;->updateInt(II)Z

    move-result v0

    goto :goto_0
.end method

.method public updateLong(IJ)Z
    .locals 1
    .param p1, "columnIndex"    # I
    .param p2, "value"    # J

    .prologue
    .line 2015
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2016
    const/4 v0, 0x0

    .line 2019
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2, p3}, Landroid/database/Cursor;->updateLong(IJ)Z

    move-result v0

    goto :goto_0
.end method

.method public updateShort(IS)Z
    .locals 1
    .param p1, "columnIndex"    # I
    .param p2, "value"    # S

    .prologue
    .line 1999
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2000
    const/4 v0, 0x0

    .line 2003
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2}, Landroid/database/Cursor;->updateShort(IS)Z

    move-result v0

    goto :goto_0
.end method

.method public updateString(ILjava/lang/String;)Z
    .locals 1
    .param p1, "columnIndex"    # I
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 1991
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 1992
    const/4 v0, 0x0

    .line 1995
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1, p2}, Landroid/database/Cursor;->updateString(ILjava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public updateToNull(I)Z
    .locals 1
    .param p1, "columnIndex"    # I

    .prologue
    .line 2039
    iget v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mDeltaColumn:I

    if-ne p1, v0, :cond_0

    .line 2040
    const/4 v0, 0x0

    .line 2043
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/ChatView$DeltaCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->updateToNull(I)Z

    move-result v0

    goto :goto_0
.end method
