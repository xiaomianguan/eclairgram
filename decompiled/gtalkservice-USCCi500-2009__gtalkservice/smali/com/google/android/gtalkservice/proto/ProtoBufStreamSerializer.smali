.class public interface abstract Lcom/google/android/gtalkservice/proto/ProtoBufStreamSerializer;
.super Ljava/lang/Object;
.source "ProtoBufStreamSerializer.java"


# virtual methods
.method public abstract serialize(Lcom/google/common/io/protocol/ProtoBuf;Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract serialize(Lcom/google/common/io/protocol/ProtoBuf;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
