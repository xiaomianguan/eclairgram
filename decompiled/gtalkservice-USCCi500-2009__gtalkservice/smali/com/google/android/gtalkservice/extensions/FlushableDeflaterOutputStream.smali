.class public Lcom/google/android/gtalkservice/extensions/FlushableDeflaterOutputStream;
.super Ljava/util/zip/DeflaterOutputStream;
.source "FlushableDeflaterOutputStream.java"


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 34
    new-instance v0, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;-><init>(IZ)V

    invoke-direct {p0, p1, v0}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)V

    .line 35
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 38
    iget-object v1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflaterOutputStream;->def:Ljava/util/zip/Deflater;

    check-cast v1, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;

    iget-object v2, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflaterOutputStream;->buf:[B

    iget-object v3, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflaterOutputStream;->buf:[B

    array-length v3, v3

    const/4 v4, 0x2

    invoke-virtual {v1, v2, v5, v3, v4}, Lcom/google/android/gtalkservice/extensions/FlushableDeflater;->deflate([BIII)I

    move-result v0

    .line 40
    .local v0, "cnt":I
    if-lez v0, :cond_0

    .line 41
    iget-object v1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflaterOutputStream;->out:Ljava/io/OutputStream;

    iget-object v2, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflaterOutputStream;->buf:[B

    invoke-virtual {v1, v2, v5, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 43
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/extensions/FlushableDeflaterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 44
    return-void
.end method
