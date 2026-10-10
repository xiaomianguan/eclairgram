.class public interface abstract Lcom/google/android/gtalkservice/proto/ProtoBufStreamParser;
.super Ljava/lang/Object;
.source "ProtoBufStreamParser.java"


# virtual methods
.method public abstract parse(Ljava/nio/ByteBuffer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract reset()V
.end method
