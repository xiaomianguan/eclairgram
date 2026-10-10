.class public Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;
.super Lcom/google/android/gtalkservice/proto/ProtoBufStreamConfigurationImpl;
.source "MobileProtoBufStreamConfiguration.java"


# static fields
.field public static final BATCH_PRESENCE:B = 0x9t

.field public static final CLOSE_TAG:B = 0x4t

.field public static final DATA_MESSAGE:B = 0x8t

.field public static final HEARTBEAT_ACK_TAG:B = 0x1t

.field public static final HEARTBEAT_PING_TAG:B = 0x0t

.field public static final HTTP_REQUEST:B = 0xbt

.field public static final HTTP_RESPONSE:B = 0xct

.field public static final IQ_TAG:B = 0x7t

.field public static final LOGIN_REQUEST_TAG:B = 0x2t

.field public static final LOGIN_RESPONSE_TAG:B = 0x3t

.field public static final MESSAGE_TAG:B = 0x5t

.field public static final PRESENCE_TAG:B = 0x6t

.field public static final STREAM_ERROR:B = 0xat


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamConfigurationImpl;-><init>()V

    .line 77
    const/4 v0, 0x0

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_PING:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 78
    const/4 v0, 0x1

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_ACK:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 79
    const/4 v0, 0x2

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->LOGIN_REQUEST:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 80
    const/4 v0, 0x3

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->LOGIN_RESPONSE:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 81
    const/4 v0, 0x4

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->CLOSE:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 82
    const/4 v0, 0x5

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->MESSAGE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 83
    const/4 v0, 0x6

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->PRESENCE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 84
    const/4 v0, 0x7

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->IQ_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 85
    const/16 v0, 0x8

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->DATA_MESSAGE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 86
    const/16 v0, 0x9

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->BATCH_PRESENCE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 87
    const/16 v0, 0xa

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->STREAM_ERROR_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 88
    const/16 v0, 0xb

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HTTP_REQUEST:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 89
    const/16 v0, 0xc

    sget-object v1, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HTTP_RESPONSE:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;->addProtoBuf(BLcom/google/common/io/protocol/ProtoBufType;)V

    .line 90
    return-void
.end method
