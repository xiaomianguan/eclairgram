.class public interface abstract Lcom/google/android/gtalkservice/proto/ProtoBufStreamConfiguration;
.super Ljava/lang/Object;
.source "ProtoBufStreamConfiguration.java"


# static fields
.field public static final UNKNOWN_TAG:B = -0x1t


# virtual methods
.method public abstract getProtoBuf(B)Lcom/google/common/io/protocol/ProtoBufType;
.end method

.method public abstract getTag(Lcom/google/common/io/protocol/ProtoBufType;)B
.end method

.method public abstract isKnownProtoBuf(Lcom/google/common/io/protocol/ProtoBufType;)Z
.end method

.method public abstract isKnownTag(B)Z
.end method
