.class Lorg/jivesoftware/smack/PacketReader;
.super Ljava/lang/Object;
.source "PacketReader.java"

# interfaces
.implements Lcom/google/android/gtalkservice/proto/ProtoBufEventHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/PacketReader$6;,
        Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Smack/Packet"

.field private static final _debug_roster_packet:Z

.field private static final _debug_server_keep_alive:Z


# instance fields
.field protected collectors:Ljava/util/List;

.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private connectionID:Ljava/lang/String;

.field private connectionIDLock:Ljava/lang/Object;

.field protected connectionListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/ConnectionListener;",
            ">;"
        }
    .end annotation
.end field

.field private done:Z

.field private lastActive:J

.field private listenerThread:Ljava/lang/Thread;

.field private listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private notifiedConnectionError:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private parser:Lorg/xmlpull/v1/XmlPullParser;

.field private protoParser:Lcom/google/android/gtalkservice/proto/ProtoBufStreamParser;

.field private readerThread:Ljava/lang/Thread;


# direct methods
.method protected constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-boolean v1, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    .line 102
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->notifiedConnectionError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    .line 113
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    .line 114
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connectionIDLock:Ljava/lang/Object;

    .line 120
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 122
    iget-boolean v0, p1, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    if-eqz v0, :cond_0

    .line 123
    new-instance v0, Lorg/jivesoftware/smack/PacketReader$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketReader$1;-><init>(Lorg/jivesoftware/smack/PacketReader;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    .line 145
    :goto_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    const-string v1, "Smack Packet Reader"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 148
    new-instance v0, Lorg/jivesoftware/smack/PacketReader$3;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketReader$3;-><init>(Lorg/jivesoftware/smack/PacketReader;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    .line 162
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    const-string v1, "Smack Packet Handler"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 163
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 165
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->resetParser()V

    .line 166
    return-void

    .line 134
    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/PacketReader$2;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketReader$2;-><init>(Lorg/jivesoftware/smack/PacketReader;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    goto :goto_0
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/PacketReader;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketReader;

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->parsePacketsFromProtoBufs()V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smack/PacketReader;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketReader;

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->parsePackets()V

    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smack/PacketReader;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketReader;

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->processListeners()V

    return-void
.end method

.method private handleUnsupportedIqPacket(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;J)Lorg/jivesoftware/smack/packet/IQ;
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "to"    # Ljava/lang/String;
    .param p3, "from"    # Ljava/lang/String;
    .param p4, "type"    # Lorg/jivesoftware/smack/packet/IQ$Type;
    .param p5, "rmqId"    # J

    .prologue
    .line 1185
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-eq v1, p4, :cond_0

    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v1, p4, :cond_2

    .line 1189
    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/PacketReader$4;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketReader$4;-><init>(Lorg/jivesoftware/smack/PacketReader;)V

    .line 1194
    .local v0, "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 1195
    invoke-virtual {v0, p5, p6}, Lorg/jivesoftware/smack/packet/IQ;->setRmqId(J)V

    .line 1196
    invoke-virtual {v0, p3}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 1197
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 1198
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1199
    new-instance v1, Lorg/jivesoftware/smack/packet/XMPPError;

    const/16 v2, 0x1f5

    const-string v3, "feature-not-implemented"

    invoke-direct {v1, v2, v3}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 1201
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/XMPPConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 1203
    const-string v1, "Smack/Packet"

    const/4 v2, 0x3

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1204
    const-string v1, "handleUnsupportedIqPacket: respond with feature-not-implemented"

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/PacketReader;->log(Ljava/lang/String;)V

    .line 1207
    :cond_1
    const/4 v1, 0x0

    .line 1218
    :goto_0
    return-object v1

    .line 1211
    .end local v0    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    :cond_2
    new-instance v0, Lorg/jivesoftware/smack/PacketReader$5;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketReader$5;-><init>(Lorg/jivesoftware/smack/PacketReader;)V

    .restart local v0    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    move-object v1, v0

    .line 1218
    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1848
    const-string v0, "Smack/Packet"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[PacketReader] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1849
    return-void
.end method

.method private logPacket(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1852
    const-string v0, "Smack/Packet"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[READ] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1853
    return-void
.end method

.method private newXmlParser()Lorg/xmlpull/v1/XmlPullParser;
    .locals 4

    .prologue
    .line 387
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    .line 390
    .local v0, "parser":Lorg/xmlpull/v1/XmlPullParser;
    :try_start_0
    const-string v2, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 391
    sget-object v2, Landroid/util/Xml;->FEATURE_RELAXED:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 396
    :goto_0
    return-object v0

    .line 392
    :catch_0
    move-exception v2

    move-object v1, v2

    .line 393
    .local v1, "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0
.end method

.method private parseAuthentication(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Authentication;
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1222
    new-instance v0, Lorg/jivesoftware/smack/packet/Authentication;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/Authentication;-><init>()V

    .line 1223
    .local v0, "authentication":Lorg/jivesoftware/smack/packet/Authentication;
    const/4 v1, 0x0

    .line 1224
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_5

    .line 1225
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 1226
    .local v2, "eventType":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_4

    .line 1227
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "username"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1228
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setUsername(Ljava/lang/String;)V

    goto :goto_0

    .line 1230
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "password"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1231
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setPassword(Ljava/lang/String;)V

    goto :goto_0

    .line 1233
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "digest"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1234
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setDigest(Ljava/lang/String;)V

    goto :goto_0

    .line 1236
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "resource"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1237
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setResource(Ljava/lang/String;)V

    goto :goto_0

    .line 1240
    :cond_4
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 1241
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "query"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1242
    const/4 v1, 0x1

    goto :goto_0

    .line 1246
    .end local v2    # "eventType":I
    :cond_5
    return-object v0
.end method

.method private parseCompressionMethods(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    .line 1066
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1067
    .local v4, "methods":Ljava/util/List;
    const/4 v0, 0x0

    .line 1068
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_3

    .line 1069
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 1071
    .local v2, "eventType":I
    const/4 v5, 0x2

    if-ne v2, v5, :cond_2

    .line 1072
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1073
    .local v1, "elementName":Ljava/lang/String;
    const-string v5, "method"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1074
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    .line 1076
    .local v3, "method":Ljava/lang/String;
    const-string v5, "Smack/Packet"

    invoke-static {v5, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1077
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "parse compression method - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 1081
    :cond_1
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1084
    .end local v1    # "elementName":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/String;
    :cond_2
    if-ne v2, v7, :cond_0

    .line 1085
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "compression"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1086
    const/4 v0, 0x1

    goto :goto_0

    .line 1090
    .end local v2    # "eventType":I
    :cond_3
    return-object v4
.end method

.method private parseFeatures(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 7
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x3

    .line 968
    const/4 v3, 0x0

    .line 969
    .local v3, "startTLSReceived":Z
    const/4 v0, 0x0

    .line 970
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_b

    .line 971
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 972
    .local v1, "eventType":I
    const-string v4, "Smack/Packet"

    invoke-static {v4, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    .line 974
    .local v2, "printLog":Z
    const/4 v4, 0x2

    if-ne v1, v4, :cond_a

    .line 975
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "starttls"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 976
    const/4 v3, 0x1

    .line 977
    if-eqz v2, :cond_1

    .line 978
    const-string v4, "parse feature - startTLS received"

    invoke-direct {p0, v4}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 981
    :cond_1
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->startTLSReceived()V

    goto :goto_0

    .line 983
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "mechanisms"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 984
    if-eqz v2, :cond_3

    .line 985
    const-string v4, "parse feature - mechanism"

    invoke-direct {p0, v4}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 991
    :cond_3
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v4

    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketReader;->parseMechanisms(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/SASLAuthentication;->setAvailableSASLMethods(Ljava/util/Collection;)V

    goto :goto_0

    .line 994
    :cond_4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "bind"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 995
    if-eqz v2, :cond_5

    .line 996
    const-string v4, "parse feature - bind"

    invoke-direct {p0, v4}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 1000
    :cond_5
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/SASLAuthentication;->bindingRequired()V

    goto :goto_0

    .line 1002
    :cond_6
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "session"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1003
    if-eqz v2, :cond_7

    .line 1004
    const-string v4, "parse feature - session"

    invoke-direct {p0, v4}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 1008
    :cond_7
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/SASLAuthentication;->sessionsSupported()V

    goto/16 :goto_0

    .line 1010
    :cond_8
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "compression"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1011
    if-eqz v2, :cond_9

    .line 1012
    const-string v4, "parse feature - compression"

    invoke-direct {p0, v4}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 1016
    :cond_9
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketReader;->parseCompressionMethods(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/XMPPConnection;->setAvailableCompressionMethods(Ljava/util/Collection;)V

    goto/16 :goto_0

    .line 1019
    :cond_a
    if-ne v1, v6, :cond_0

    .line 1020
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "features"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1021
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 1025
    .end local v1    # "eventType":I
    .end local v2    # "printLog":Z
    :cond_b
    if-nez v3, :cond_c

    .line 1026
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->releaseConnectionIDLock()V

    .line 1028
    :cond_c
    return-void
.end method

.method private parseHttpResponse(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/HttpResponse;
    .locals 8
    .param p1, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x6

    const/4 v6, 0x5

    const/4 v5, 0x4

    const/4 v3, 0x3

    const/4 v4, 0x2

    .line 1322
    new-instance v1, Lorg/jivesoftware/smack/packet/HttpResponse;

    invoke-direct {v1}, Lorg/jivesoftware/smack/packet/HttpResponse;-><init>()V

    .line 1323
    .local v1, "response":Lorg/jivesoftware/smack/packet/HttpResponse;
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1324
    .local v0, "id":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/HttpResponse;->setPacketID(Ljava/lang/String;)V

    .line 1326
    invoke-virtual {p1, v3}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1327
    invoke-virtual {p1, v3}, Lcom/google/common/io/protocol/ProtoBuf;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/jivesoftware/smack/packet/HttpResponse;->setRmqId(J)V

    .line 1331
    :cond_0
    invoke-virtual {p1, v5}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1332
    invoke-virtual {p1, v5}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/HttpResponse;->setRmq2Id(Ljava/lang/String;)V

    .line 1336
    :cond_1
    invoke-virtual {p1, v7}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1338
    invoke-virtual {p1, v7}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/HttpResponse;->setLastStreamId(I)V

    .line 1343
    :cond_2
    invoke-virtual {p1, v6}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1344
    invoke-virtual {p1, v6}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/HttpResponse;->setStreamId(I)V

    .line 1348
    :cond_3
    invoke-virtual {p1, v4}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1349
    invoke-virtual {p1, v4}, Lcom/google/common/io/protocol/ProtoBuf;->getBytes(I)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/HttpResponse;->setData([B)V

    .line 1353
    :cond_4
    return-object v1
.end method

.method private parseIQ(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 34
    .param p1, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1632
    const/16 v20, 0x0

    .line 1634
    .local v20, "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    const/4 v3, 0x3

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x3

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v4, v3

    .line 1636
    .local v4, "id":Ljava/lang/String;
    :goto_0
    const/4 v3, 0x1

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, 0x1

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getLong(I)J

    move-result-wide v32

    move-wide/from16 v8, v32

    .line 1640
    .local v8, "rmqId":J
    :goto_1
    const/16 v3, 0x8

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v3

    if-eqz v3, :cond_4

    const/16 v3, 0x8

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v26, v3

    .line 1642
    .local v26, "persistentId":Ljava/lang/String;
    :goto_2
    const/16 v3, 0xa

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v3

    if-eqz v3, :cond_5

    const/16 v3, 0xa

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v3

    move/from16 v23, v3

    .line 1644
    .local v23, "lastStreamId":I
    :goto_3
    const/16 v3, 0x9

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v3

    if-eqz v3, :cond_6

    const/16 v3, 0x9

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v3

    move/from16 v30, v3

    .line 1647
    .local v30, "streamId":I
    :goto_4
    const/4 v3, 0x4

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v3

    if-eqz v3, :cond_7

    const/4 v3, 0x4

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v6, v3

    .line 1648
    .local v6, "from":Ljava/lang/String;
    :goto_5
    const/4 v3, 0x5

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v3, 0x5

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v5, v3

    .line 1649
    .local v5, "to":Ljava/lang/String;
    :goto_6
    const/4 v3, 0x2

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v22

    .line 1652
    .local v22, "iqType":I
    packed-switch v22, :pswitch_data_0

    .line 1664
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    .line 1668
    .local v7, "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    :goto_7
    const/4 v3, 0x7

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1669
    const/4 v3, 0x7

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(I)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v18

    .line 1670
    .local v18, "extension":Lcom/google/common/io/protocol/ProtoBuf;
    const/4 v3, 0x1

    move-object/from16 v0, v18

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v16

    .line 1671
    .local v16, "extId":I
    const-string v3, "ProtoBuf"

    const/4 v10, 0x3

    invoke-static {v3, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1672
    const-string v3, "ProtoBuf"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Handling extension of type: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object v0, v10

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v3, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1674
    :cond_0
    packed-switch v16, :pswitch_data_1

    .line 1723
    invoke-static/range {v16 .. v16}, Lorg/jivesoftware/smack/provider/ProviderManager;->getIQProvider(I)Ljava/lang/Object;

    move-result-object v25

    .line 1725
    .local v25, "o":Ljava/lang/Object;
    if-eqz v25, :cond_d

    .line 1728
    move-object/from16 v0, v25

    instance-of v0, v0, Lorg/jivesoftware/smack/provider/IQProvider;

    move v3, v0

    if-eqz v3, :cond_b

    .line 1729
    move-object/from16 v0, v25

    check-cast v0, Lorg/jivesoftware/smack/provider/IQProvider;

    move-object/from16 v27, v0

    .line 1738
    .local v27, "provider":Lorg/jivesoftware/smack/provider/IQProvider;
    :goto_8
    invoke-interface/range {v27 .. v27}, Lorg/jivesoftware/smack/provider/IQProvider;->getProtoBufType()Lcom/google/common/io/protocol/ProtoBufType;

    move-result-object v17

    .line 1739
    .local v17, "extType":Lcom/google/common/io/protocol/ProtoBufType;
    new-instance v19, Lcom/google/common/io/protocol/ProtoBuf;

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 1740
    .local v19, "iqExt":Lcom/google/common/io/protocol/ProtoBuf;
    const/4 v3, 0x2

    move-object/from16 v0, v18

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getBytes(I)[B

    move-result-object v3

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->parse([B)Lcom/google/common/io/protocol/ProtoBuf;

    .line 1741
    move-object/from16 v0, v27

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lorg/jivesoftware/smack/provider/IQProvider;->parseIQ(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v20

    .line 1748
    .end local v16    # "extId":I
    .end local v17    # "extType":Lcom/google/common/io/protocol/ProtoBufType;
    .end local v18    # "extension":Lcom/google/common/io/protocol/ProtoBuf;
    .end local v19    # "iqExt":Lcom/google/common/io/protocol/ProtoBuf;
    .end local v25    # "o":Ljava/lang/Object;
    .end local v27    # "provider":Lorg/jivesoftware/smack/provider/IQProvider;
    :cond_1
    :goto_9
    if-nez v20, :cond_e

    move-object/from16 v3, p0

    .line 1749
    invoke-direct/range {v3 .. v9}, Lorg/jivesoftware/smack/PacketReader;->handleUnsupportedIqPacket(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;J)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v20

    .line 1750
    if-nez v20, :cond_e

    .line 1751
    const/4 v3, 0x0

    .line 1777
    :goto_a
    return-object v3

    .line 1634
    .end local v4    # "id":Ljava/lang/String;
    .end local v5    # "to":Ljava/lang/String;
    .end local v6    # "from":Ljava/lang/String;
    .end local v7    # "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    .end local v8    # "rmqId":J
    .end local v22    # "iqType":I
    .end local v23    # "lastStreamId":I
    .end local v26    # "persistentId":Ljava/lang/String;
    .end local v30    # "streamId":I
    :cond_2
    const-string v3, "ID_NOT_AVAILABLE"

    move-object v4, v3

    goto/16 :goto_0

    .line 1636
    .restart local v4    # "id":Ljava/lang/String;
    :cond_3
    const-wide/16 v32, -0x1

    move-wide/from16 v8, v32

    goto/16 :goto_1

    .line 1640
    .restart local v8    # "rmqId":J
    :cond_4
    const/4 v3, 0x0

    move-object/from16 v26, v3

    goto/16 :goto_2

    .line 1642
    .restart local v26    # "persistentId":Ljava/lang/String;
    :cond_5
    const/4 v3, -0x1

    move/from16 v23, v3

    goto/16 :goto_3

    .line 1644
    .restart local v23    # "lastStreamId":I
    :cond_6
    const/4 v3, -0x1

    move/from16 v30, v3

    goto/16 :goto_4

    .line 1647
    .restart local v30    # "streamId":I
    :cond_7
    const/4 v3, 0x0

    move-object v6, v3

    goto/16 :goto_5

    .line 1648
    .restart local v6    # "from":Ljava/lang/String;
    :cond_8
    const/4 v3, 0x0

    move-object v5, v3

    goto/16 :goto_6

    .line 1654
    .restart local v5    # "to":Ljava/lang/String;
    .restart local v22    # "iqType":I
    :pswitch_0
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    .line 1655
    .restart local v7    # "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    goto/16 :goto_7

    .line 1657
    .end local v7    # "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    :pswitch_1
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    .line 1658
    .restart local v7    # "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    goto/16 :goto_7

    .line 1660
    .end local v7    # "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    :pswitch_2
    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    .line 1661
    .restart local v7    # "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    goto/16 :goto_7

    .line 1677
    .restart local v16    # "extId":I
    .restart local v18    # "extension":Lcom/google/common/io/protocol/ProtoBuf;
    :pswitch_3
    const/4 v3, 0x2

    move-object/from16 v0, v18

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getBytes(I)[B

    move-result-object v31

    .line 1680
    .local v31, "xmlBytes":[B
    new-instance v10, Ljava/io/ByteArrayInputStream;

    move-object v0, v10

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1681
    .local v10, "bais":Ljava/io/ByteArrayInputStream;
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/PacketReader;->newXmlParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v21

    .line 1682
    .local v21, "iqParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v3, "UTF-8"

    move-object/from16 v0, v21

    move-object v1, v10

    move-object v2, v3

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 1685
    :cond_9
    :goto_b
    invoke-interface/range {v21 .. v21}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v15

    .local v15, "event":I
    const/4 v3, 0x1

    if-eq v15, v3, :cond_1

    .line 1686
    packed-switch v15, :pswitch_data_2

    goto :goto_b

    .line 1688
    :pswitch_4
    invoke-interface/range {v21 .. v21}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    .line 1689
    .local v12, "elementName":Ljava/lang/String;
    invoke-interface/range {v21 .. v21}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v24

    .line 1696
    .local v24, "namespace":Ljava/lang/String;
    move-object v0, v12

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getIQProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v27

    .line 1698
    .local v27, "provider":Ljava/lang/Object;
    if-eqz v27, :cond_9

    .line 1699
    move-object/from16 v0, v27

    instance-of v0, v0, Lorg/jivesoftware/smack/provider/IQProvider;

    move v3, v0

    if-eqz v3, :cond_a

    .line 1700
    check-cast v27, Lorg/jivesoftware/smack/provider/IQProvider;

    .end local v27    # "provider":Ljava/lang/Object;
    move-object/from16 v0, v27

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Lorg/jivesoftware/smack/provider/IQProvider;->parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v20

    goto :goto_b

    .line 1702
    .restart local v27    # "provider":Ljava/lang/Object;
    :cond_a
    move-object/from16 v0, v27

    instance-of v0, v0, Ljava/lang/Class;

    move v3, v0

    if-eqz v3, :cond_9

    .line 1703
    check-cast v27, Ljava/lang/Class;

    .end local v27    # "provider":Ljava/lang/Object;
    move-object v0, v12

    move-object/from16 v1, v27

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v20

    .end local v20    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    check-cast v20, Lorg/jivesoftware/smack/packet/IQ;

    .restart local v20    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    goto :goto_b

    .line 1712
    .end local v10    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v12    # "elementName":Ljava/lang/String;
    .end local v15    # "event":I
    .end local v21    # "iqParser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v24    # "namespace":Ljava/lang/String;
    .end local v31    # "xmlBytes":[B
    :pswitch_5
    const/4 v3, 0x2

    move-object/from16 v0, v18

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getBytes(I)[B

    move-result-object v29

    .line 1713
    .local v29, "rosterBytes":[B
    new-instance v28, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v3, Lcom/google/android/gtalkservice/proto/GtalkExtensionsMessageTypes;->ROSTER_QUERY:Lcom/google/common/io/protocol/ProtoBufType;

    move-object/from16 v0, v28

    move-object v1, v3

    invoke-direct {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 1714
    .local v28, "roster":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual/range {v28 .. v29}, Lcom/google/common/io/protocol/ProtoBuf;->parse([B)Lcom/google/common/io/protocol/ProtoBuf;

    .line 1715
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->parseRoster(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/RosterPacket;

    move-result-object v20

    .line 1716
    goto/16 :goto_9

    .line 1730
    .end local v28    # "roster":Lcom/google/common/io/protocol/ProtoBuf;
    .end local v29    # "rosterBytes":[B
    .restart local v25    # "o":Ljava/lang/Object;
    :cond_b
    move-object/from16 v0, v25

    instance-of v0, v0, Ljava/lang/Class;

    move v3, v0

    if-eqz v3, :cond_c

    .line 1732
    move-object/from16 v0, v25

    check-cast v0, Ljava/lang/Class;

    move-object v11, v0

    .line 1733
    .local v11, "clazz":Ljava/lang/Class;
    invoke-virtual {v11}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/jivesoftware/smack/provider/IQProvider;

    .line 1734
    .local v27, "provider":Lorg/jivesoftware/smack/provider/IQProvider;
    goto/16 :goto_8

    .line 1735
    .end local v11    # "clazz":Ljava/lang/Class;
    .end local v27    # "provider":Lorg/jivesoftware/smack/provider/IQProvider;
    :cond_c
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    .end local v4    # "id":Ljava/lang/String;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected IQProvider class: "

    .end local v5    # "to":Ljava/lang/String;
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1742
    .restart local v4    # "id":Ljava/lang/String;
    .restart local v5    # "to":Ljava/lang/String;
    :cond_d
    const-string v3, "Smack/Packet"

    const/4 v10, 0x3

    invoke-static {v3, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1743
    const-string v3, "Smack/Packet"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "parseIQ: cannot find IQProvider for extId="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object v0, v10

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v3, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_9

    .line 1756
    .end local v16    # "extId":I
    .end local v18    # "extension":Lcom/google/common/io/protocol/ProtoBuf;
    .end local v25    # "o":Ljava/lang/Object;
    :cond_e
    const/4 v13, 0x0

    .line 1758
    .local v13, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v7, v3, :cond_f

    .line 1759
    const/4 v3, 0x6

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 1760
    const/4 v3, 0x6

    move-object/from16 v0, p1

    move v1, v3

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(I)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v14

    .line 1762
    .local v14, "errorProtobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-static {v14}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v13

    .line 1767
    .end local v14    # "errorProtobuf":Lcom/google/common/io/protocol/ProtoBuf;
    :cond_f
    move-object/from16 v0, v20

    move-object v1, v4

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 1768
    move-object/from16 v0, v20

    move-wide v1, v8

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/packet/IQ;->setRmqId(J)V

    .line 1769
    move-object/from16 v0, v20

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setRmq2Id(Ljava/lang/String;)V

    .line 1770
    move-object/from16 v0, v20

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setLastStreamId(I)V

    .line 1771
    move-object/from16 v0, v20

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setStreamId(I)V

    .line 1772
    move-object/from16 v0, v20

    move-object v1, v5

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 1773
    move-object/from16 v0, v20

    move-object v1, v6

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 1774
    move-object/from16 v0, v20

    move-object v1, v7

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1775
    move-object/from16 v0, v20

    move-object v1, v13

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    move-object/from16 v3, v20

    .line 1777
    goto/16 :goto_a

    .line 1652
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 1674
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_5
    .end packed-switch

    .line 1686
    :pswitch_data_2
    .packed-switch 0x2
        :pswitch_4
    .end packed-switch
.end method

.method private parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 19
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1101
    const/4 v14, 0x0

    .line 1103
    .local v14, "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    const-string v3, ""

    const-string v4, "stanza-id"

    move-object/from16 v0, p1

    move-object v1, v3

    move-object v2, v4

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseRmqIdFromString(Ljava/lang/String;)J

    move-result-wide v17

    .line 1105
    .local v17, "rmqId":J
    const-string v3, ""

    const-string v4, "id"

    move-object/from16 v0, p1

    move-object v1, v3

    move-object v2, v4

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1106
    .local v4, "id":Ljava/lang/String;
    const-string v3, ""

    const-string v5, "to"

    move-object/from16 v0, p1

    move-object v1, v3

    move-object v2, v5

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1107
    .local v5, "to":Ljava/lang/String;
    const-string v3, ""

    const-string v6, "from"

    move-object/from16 v0, p1

    move-object v1, v3

    move-object v2, v6

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1108
    .local v6, "from":Ljava/lang/String;
    const-string v3, ""

    const-string v7, "type"

    move-object/from16 v0, p1

    move-object v1, v3

    move-object v2, v7

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smack/packet/IQ$Type;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v7

    .line 1109
    .local v7, "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    const/4 v12, 0x0

    .line 1111
    .local v12, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    const/4 v10, 0x0

    .line 1112
    .local v10, "done":Z
    :cond_0
    :goto_0
    if-nez v10, :cond_8

    .line 1113
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v13

    .line 1115
    .local v13, "eventType":I
    const/4 v3, 0x2

    if-ne v13, v3, :cond_7

    .line 1116
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 1117
    .local v11, "elementName":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v15

    .line 1118
    .local v15, "namespace":Ljava/lang/String;
    const-string v3, "error"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1119
    invoke-static/range {p1 .. p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v12

    goto :goto_0

    .line 1121
    :cond_1
    const-string v3, "query"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "jabber:iq:auth"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1122
    invoke-direct/range {p0 .. p1}, Lorg/jivesoftware/smack/PacketReader;->parseAuthentication(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Authentication;

    move-result-object v14

    goto :goto_0

    .line 1124
    :cond_2
    const-string v3, "query"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "jabber:iq:roster"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1125
    invoke-direct/range {p0 .. p1}, Lorg/jivesoftware/smack/PacketReader;->parseRoster(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/RosterPacket;

    move-result-object v14

    goto :goto_0

    .line 1127
    :cond_3
    const-string v3, "query"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "jabber:iq:register"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1128
    invoke-direct/range {p0 .. p1}, Lorg/jivesoftware/smack/PacketReader;->parseRegistration(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Registration;

    move-result-object v14

    goto :goto_0

    .line 1130
    :cond_4
    const-string v3, "bind"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v3, "urn:ietf:params:xml:ns:xmpp-bind"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1132
    invoke-direct/range {p0 .. p1}, Lorg/jivesoftware/smack/PacketReader;->parseResourceBinding(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Bind;

    move-result-object v14

    goto :goto_0

    .line 1143
    :cond_5
    invoke-static {v11, v15}, Lorg/jivesoftware/smack/provider/ProviderManager;->getIQProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    .line 1144
    .local v16, "provider":Ljava/lang/Object;
    if-eqz v16, :cond_0

    .line 1145
    move-object/from16 v0, v16

    instance-of v0, v0, Lorg/jivesoftware/smack/provider/IQProvider;

    move v3, v0

    if-eqz v3, :cond_6

    .line 1146
    check-cast v16, Lorg/jivesoftware/smack/provider/IQProvider;

    .end local v16    # "provider":Ljava/lang/Object;
    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lorg/jivesoftware/smack/provider/IQProvider;->parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v14

    goto/16 :goto_0

    .line 1148
    .restart local v16    # "provider":Ljava/lang/Object;
    :cond_6
    move-object/from16 v0, v16

    instance-of v0, v0, Ljava/lang/Class;

    move v3, v0

    if-eqz v3, :cond_0

    .line 1149
    check-cast v16, Ljava/lang/Class;

    .end local v16    # "provider":Ljava/lang/Object;
    move-object v0, v11

    move-object/from16 v1, v16

    move-object/from16 v2, p1

    invoke-static {v0, v1, v2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    check-cast v14, Lorg/jivesoftware/smack/packet/IQ;

    .restart local v14    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    goto/16 :goto_0

    .line 1155
    .end local v11    # "elementName":Ljava/lang/String;
    .end local v15    # "namespace":Ljava/lang/String;
    :cond_7
    const/4 v3, 0x3

    if-ne v13, v3, :cond_0

    .line 1156
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v8, "iq"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1157
    const/4 v10, 0x1

    goto/16 :goto_0

    .line 1162
    .end local v13    # "eventType":I
    :cond_8
    if-nez v14, :cond_9

    .line 1163
    const-wide/16 v8, -0x1

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lorg/jivesoftware/smack/PacketReader;->handleUnsupportedIqPacket(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;J)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v14

    .line 1164
    if-nez v14, :cond_9

    .line 1165
    const/4 v3, 0x0

    .line 1177
    :goto_1
    return-object v3

    .line 1170
    :cond_9
    move-object v0, v14

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/packet/IQ;->setRmqId(J)V

    .line 1171
    invoke-virtual {v14, v4}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 1172
    invoke-virtual {v14, v5}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 1173
    invoke-virtual {v14, v6}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 1174
    invoke-virtual {v14, v7}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 1175
    invoke-virtual {v14, v12}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    move-object v3, v14

    .line 1177
    goto :goto_1
.end method

.method private parseLoginResponse(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/LoginResponse;
    .locals 21
    .param p1, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1250
    new-instance v13, Lorg/jivesoftware/smack/packet/LoginResponse;

    invoke-direct {v13}, Lorg/jivesoftware/smack/packet/LoginResponse;-><init>()V

    .line 1251
    .local v13, "response":Lorg/jivesoftware/smack/packet/LoginResponse;
    const/16 v19, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1252
    .local v8, "id":Ljava/lang/String;
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 1254
    .local v15, "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v13, v8}, Lorg/jivesoftware/smack/packet/LoginResponse;->setPacketID(Ljava/lang/String;)V

    .line 1255
    const/16 v19, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v19

    if-eqz v19, :cond_9

    .line 1256
    const/16 v19, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object v0, v13

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/LoginResponse;->setJid(Ljava/lang/String;)V

    .line 1259
    const/16 v19, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 1261
    const/16 v19, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(I)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v5

    .line 1263
    .local v5, "configProtoBuf":Lcom/google/common/io/protocol/ProtoBuf;
    const/16 v17, 0x0

    .line 1264
    .local v17, "uploadStat":Ljava/lang/Boolean;
    const/16 v19, 0x1

    move-object v0, v5

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 1265
    const/16 v19, 0x1

    move-object v0, v5

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v17

    .line 1267
    :cond_0
    const/4 v11, 0x0

    .line 1268
    .local v11, "ip":Ljava/lang/String;
    const/16 v19, 0x2

    move-object v0, v5

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 1269
    const/16 v19, 0x2

    move-object v0, v5

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 1271
    :cond_1
    const-wide/16 v9, 0x0

    .line 1272
    .local v9, "interval":J
    const/16 v19, 0x3

    move-object v0, v5

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 1273
    const/16 v19, 0x3

    move-object v0, v5

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getLong(I)J

    move-result-wide v9

    .line 1275
    :cond_2
    new-instance v19, Lorg/jivesoftware/smack/packet/HeartbeatConfig;

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    move-wide v2, v9

    move-object v4, v11

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smack/packet/HeartbeatConfig;-><init>(Ljava/lang/Boolean;JLjava/lang/String;)V

    move-object v0, v13

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/LoginResponse;->setHeartbeatConfig(Lorg/jivesoftware/smack/packet/HeartbeatConfig;)V

    .line 1280
    .end local v5    # "configProtoBuf":Lcom/google/common/io/protocol/ProtoBuf;
    .end local v9    # "interval":J
    .end local v11    # "ip":Ljava/lang/String;
    .end local v17    # "uploadStat":Ljava/lang/Boolean;
    :cond_3
    const/16 v19, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getCount(I)I

    move-result v16

    .line 1282
    .local v16, "settingsCount":I
    if-lez v16, :cond_5

    .line 1283
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    move v0, v7

    move/from16 v1, v16

    if-ge v0, v1, :cond_4

    .line 1284
    const/16 v19, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v19

    move v2, v7

    invoke-virtual {v0, v1, v2}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(II)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v14

    .line 1287
    .local v14, "settingProtoBuf":Lcom/google/common/io/protocol/ProtoBuf;
    const/16 v19, 0x1

    move-object v0, v14

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 1288
    .local v12, "key":Ljava/lang/String;
    const/16 v19, 0x2

    move-object v0, v14

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 1289
    .local v18, "value":Ljava/lang/String;
    move-object v0, v15

    move-object v1, v12

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1283
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1291
    .end local v12    # "key":Ljava/lang/String;
    .end local v14    # "settingProtoBuf":Lcom/google/common/io/protocol/ProtoBuf;
    .end local v18    # "value":Ljava/lang/String;
    :cond_4
    invoke-virtual {v13, v15}, Lorg/jivesoftware/smack/packet/LoginResponse;->setSettings(Ljava/util/Map;)V

    .line 1295
    .end local v7    # "i":I
    :cond_5
    const/16 v19, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 1297
    const/16 v19, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v19

    move-object v0, v13

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/LoginResponse;->setLastStreamId(I)V

    .line 1303
    :cond_6
    const/16 v19, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 1305
    const/16 v19, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v19

    move-object v0, v13

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/LoginResponse;->setStreamId(I)V

    .line 1313
    .end local v16    # "settingsCount":I
    :cond_7
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/XMPPConnection;->getConnectionConfiguration()Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isCompressionEnabled()Z

    move-result v19

    if-eqz v19, :cond_8

    .line 1316
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lorg/jivesoftware/smack/XMPPConnection;->startStreamCompression(Z)V

    .line 1318
    :cond_8
    return-object v13

    .line 1308
    :cond_9
    const/16 v19, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 1309
    const/16 v19, 0x3

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(I)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v6

    .line 1311
    .local v6, "errorProtobuf":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-static {v6}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v19

    move-object v0, v13

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/LoginResponse;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    goto :goto_1
.end method

.method private parseMechanisms(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    .line 1038
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1039
    .local v3, "mechanisms":Ljava/util/List;
    const/4 v0, 0x0

    .line 1040
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_3

    .line 1041
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 1043
    .local v2, "eventType":I
    const/4 v5, 0x2

    if-ne v2, v5, :cond_2

    .line 1044
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1045
    .local v1, "elementName":Ljava/lang/String;
    const-string v5, "mechanism"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1046
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    .line 1048
    .local v4, "nextMechanism":Ljava/lang/String;
    const-string v5, "Smack/Packet"

    invoke-static {v5, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1049
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "parse mechanisum - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 1052
    :cond_1
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1055
    .end local v1    # "elementName":Ljava/lang/String;
    .end local v4    # "nextMechanism":Ljava/lang/String;
    :cond_2
    if-ne v2, v7, :cond_0

    .line 1056
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "mechanisms"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1057
    const/4 v0, 0x1

    goto :goto_0

    .line 1061
    .end local v2    # "eventType":I
    :cond_3
    return-object v3
.end method

.method private parsePackets()V
    .locals 19

    .prologue
    .line 644
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v7

    .line 646
    .local v7, "eventType":I
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->acquireWakeLock()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 650
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v15

    move-wide v0, v15

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jivesoftware/smack/PacketReader;->lastActive:J

    .line 651
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->markPacketReception()V

    .line 654
    const-string v15, "Smack/Packet"

    const/16 v16, 0x3

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v13

    .line 656
    .local v13, "printLog":Z
    const/4 v15, 0x2

    if-ne v7, v15, :cond_1d

    .line 657
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "message"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 658
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-static {v15}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseMessage(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v12

    .line 659
    .local v12, "packet":Lorg/jivesoftware/smack/packet/Packet;
    move-object/from16 v0, p0

    move-object v1, v12

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 827
    .end local v12    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :cond_1
    :goto_0
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V

    .line 830
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    .line 832
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    move v15, v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    if-nez v15, :cond_2

    const/4 v15, 0x1

    if-ne v7, v15, :cond_0

    .line 841
    .end local v7    # "eventType":I
    .end local v13    # "printLog":Z
    :cond_2
    :goto_1
    return-void

    .line 661
    .restart local v7    # "eventType":I
    .restart local v13    # "printLog":Z
    :cond_3
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "iq"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 662
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v12

    .line 663
    .restart local v12    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    move-object/from16 v0, p0

    move-object v1, v12

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 827
    .end local v12    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    .end local v13    # "printLog":Z
    :catchall_0
    move-exception v15

    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V

    throw v15
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 834
    .end local v7    # "eventType":I
    :catch_0
    move-exception v15

    move-object v5, v15

    .line 835
    .local v5, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    move v15, v0

    if-nez v15, :cond_2

    .line 837
    const-string v15, "Smack/Packet"

    const-string v16, "PacketReader.parsePackets: caught "

    move-object v0, v15

    move-object/from16 v1, v16

    move-object v2, v5

    invoke-static {v0, v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 838
    move-object/from16 v0, p0

    move-object v1, v5

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_1

    .line 665
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v7    # "eventType":I
    .restart local v13    # "printLog":Z
    :cond_4
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "presence"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 666
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-static {v15}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePresence(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Presence;

    move-result-object v12

    .line 667
    .restart local v12    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    move-object/from16 v0, p0

    move-object v1, v12

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto/16 :goto_0

    .line 671
    .end local v12    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "stream"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_c

    .line 673
    if-eqz v13, :cond_6

    .line 674
    const-string v15, "got stream open"

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 678
    :cond_6
    const-string v15, "jabber:client"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-interface/range {v16 .. v17}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 680
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v4

    .line 681
    .local v4, "count":I
    const/4 v8, 0x0

    .line 682
    .local v8, "gotConnectionId":Z
    const/4 v9, 0x0

    .line 684
    .local v9, "gotFrom":Z
    const/4 v10, 0x0

    .line 685
    .local v10, "i":I
    :goto_2
    if-ge v10, v4, :cond_1

    if-eqz v8, :cond_7

    if-nez v9, :cond_1

    .line 687
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v3

    .line 689
    .local v3, "attrName":Ljava/lang/String;
    const-string v15, "id"

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_a

    .line 691
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v15

    move-object v0, v15

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    .line 692
    const-string v15, "1.0"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object/from16 v16, v0

    const-string v17, ""

    const-string v18, "version"

    invoke-interface/range {v16 .. v18}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_8

    .line 697
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/PacketReader;->releaseConnectionIDLock()V

    .line 699
    :cond_8
    const/4 v8, 0x1

    .line 686
    :cond_9
    :goto_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 701
    :cond_a
    const-string v15, "from"

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_9

    .line 703
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    move v1, v10

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    move-object v1, v15

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    .line 705
    if-eqz v13, :cond_b

    .line 706
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "set servicename received from server: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->serviceName:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 710
    :cond_b
    const/4 v9, 0x1

    goto :goto_3

    .line 715
    .end local v3    # "attrName":Ljava/lang/String;
    .end local v4    # "count":I
    .end local v8    # "gotConnectionId":Z
    .end local v9    # "gotFrom":Z
    .end local v10    # "i":I
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "error"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_e

    .line 716
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->parseStreamError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/StreamError;

    move-result-object v6

    .line 718
    .local v6, "error":Lorg/jivesoftware/smack/packet/StreamError;
    if-eqz v13, :cond_d

    .line 719
    invoke-virtual {v6}, Lorg/jivesoftware/smack/packet/StreamError;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 723
    :cond_d
    new-instance v15, Lorg/jivesoftware/smack/XMPPException;

    invoke-direct {v15, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/StreamError;)V

    throw v15

    .line 725
    .end local v6    # "error":Lorg/jivesoftware/smack/packet/StreamError;
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "features"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_f

    .line 726
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->parseFeatures(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 728
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "proceed"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_11

    .line 729
    if-eqz v13, :cond_10

    .line 730
    const-string v15, "got proceed TLS, reset parser"

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 734
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->proceedTLSReceived()V

    .line 737
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/PacketReader;->resetParser()V

    goto/16 :goto_0

    .line 739
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "failure"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_17

    .line 740
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    const/16 v16, 0x0

    invoke-interface/range {v15 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 741
    .local v11, "namespace":Ljava/lang/String;
    const-string v15, "urn:ietf:params:xml:ns:xmpp-tls"

    invoke-virtual {v15, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_13

    .line 742
    if-eqz v13, :cond_12

    .line 743
    const-string v15, "TLS negotiation has failed"

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 746
    :cond_12
    new-instance v15, Ljava/lang/Exception;

    const-string v16, "TLS negotiation has failed"

    invoke-direct/range {v15 .. v16}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v15

    .line 748
    :cond_13
    const-string v15, "http://jabber.org/protocol/compress"

    invoke-virtual {v15, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_15

    .line 749
    if-eqz v13, :cond_14

    .line 750
    const-string v15, "compression denied"

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 756
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->streamCompressionDenied()V

    goto/16 :goto_0

    .line 759
    :cond_15
    if-eqz v13, :cond_16

    .line 760
    const-string v15, "SASL auth failed"

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 765
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v15

    invoke-virtual {v15}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticationFailed()V

    goto/16 :goto_0

    .line 768
    .end local v11    # "namespace":Ljava/lang/String;
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "challenge"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_19

    .line 769
    if-eqz v13, :cond_18

    .line 770
    const-string v15, "SASL auth challenge received"

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 774
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lorg/jivesoftware/smack/SASLAuthentication;->challengeReceived(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 776
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "success"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1b

    .line 777
    if-eqz v13, :cond_1a

    .line 778
    const-string v15, "SASL authenticated, open stream, reset parser"

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 783
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    iget-object v15, v15, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v15}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 787
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/PacketReader;->resetParser()V

    .line 791
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v15

    invoke-virtual {v15}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticated()V

    goto/16 :goto_0

    .line 793
    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "compressed"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 794
    if-eqz v13, :cond_1c

    .line 795
    const-string v15, "start stream compression, reset parser"

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 800
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->startStreamCompression()V

    .line 803
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/PacketReader;->resetParser()V

    goto/16 :goto_0

    .line 805
    :cond_1d
    const/4 v15, 0x3

    if-ne v7, v15, :cond_1f

    .line 806
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "stream"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 807
    if-eqz v13, :cond_1e

    .line 808
    const-string v15, "got stream end tag, closing connection"

    move-object/from16 v0, p0

    move-object v1, v15

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 811
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    move-object v15, v0

    invoke-virtual {v15}, Lorg/jivesoftware/smack/XMPPConnection;->close()V

    goto/16 :goto_0

    .line 813
    :cond_1f
    const/4 v15, 0x4

    if-ne v7, v15, :cond_1

    .line 814
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    move-object v15, v0

    invoke-interface {v15}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v14

    .line 815
    .local v14, "text":Ljava/lang/String;
    if-eqz v14, :cond_1

    .line 819
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v15

    const/16 v16, 0x1

    move v0, v15

    move/from16 v1, v16

    if-ne v0, v1, :cond_1

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Ljava/lang/String;->charAt(I)C
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v15

    const/16 v16, 0x20

    move v0, v15

    move/from16 v1, v16

    if-ne v0, v1, :cond_1

    goto/16 :goto_0
.end method

.method private parsePacketsFromProtoBufs()V
    .locals 13

    .prologue
    const/4 v11, 0x3

    const-string v7, "Required version not supported by server."

    const-string v12, "PacketReader.parsePacketsFromProtoBufs: caught "

    const-string v10, "Smack/Packet"

    .line 559
    const/16 v7, 0x2000

    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 560
    .local v0, "buf":Ljava/nio/ByteBuffer;
    const/4 v3, -0x1

    .line 561
    .local v3, "numBytesRead":I
    const/4 v5, 0x0

    .line 562
    .local v5, "readVersion":Z
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v1, v7, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/InputStream;

    .line 564
    .local v1, "in":Ljava/io/InputStream;
    :goto_0
    :try_start_0
    iget-boolean v7, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v7, :cond_0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v9

    invoke-virtual {v1, v7, v8, v9}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    const/4 v7, -0x1

    if-eq v3, v7, :cond_0

    .line 567
    iget-boolean v7, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-eqz v7, :cond_1

    .line 637
    :cond_0
    :goto_1
    return-void

    .line 571
    :cond_1
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/XMPPConnection;->acquireWakeLock()V
    :try_end_0
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 574
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    iput-wide v7, p0, Lorg/jivesoftware/smack/PacketReader;->lastActive:J

    .line 575
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/XMPPConnection;->markPacketReception()V

    .line 576
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 577
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 578
    if-nez v5, :cond_7

    .line 579
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    if-gtz v7, :cond_2

    .line 580
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 620
    :try_start_2
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V
    :try_end_2
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 623
    :catch_0
    move-exception v7

    move-object v4, v7

    .line 624
    .local v4, "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    iget-boolean v7, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v7, :cond_0

    .line 625
    const-string v7, "Smack/Packet"

    const-string v7, "PacketReader.parsePacketsFromProtoBufs: caught "

    invoke-static {v10, v12, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 626
    invoke-virtual {p0, v4}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_1

    .line 583
    .end local v4    # "pbse":Lcom/google/android/gtalkservice/proto/ProtoBufStreamException;
    :cond_2
    :try_start_3
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v6

    .line 587
    .local v6, "version":B
    const/4 v7, 0x4

    if-ne v6, v7, :cond_6

    .line 588
    const/4 v5, 0x1

    .line 589
    const-string v7, "Smack/Packet"

    const/4 v8, 0x3

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 590
    const-string v7, "Smack/Packet"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Server is using version "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    :cond_3
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    .line 593
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->releaseConnectionIDLock()V

    .line 604
    :cond_4
    :goto_2
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    if-gtz v7, :cond_7

    .line 605
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 620
    :try_start_4
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V
    :try_end_4
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    .line 628
    .end local v6    # "version":B
    :catch_1
    move-exception v7

    move-object v2, v7

    .line 629
    .local v2, "ioe":Ljava/io/IOException;
    iget-boolean v7, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v7, :cond_0

    .line 631
    const-string v7, "Smack/Packet"

    invoke-static {v10, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 632
    const-string v7, "Smack/Packet"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "PacketReader.parsePacketsFromProtoBufs: caught "

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v10, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 634
    :cond_5
    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto/16 :goto_1

    .line 595
    .end local v2    # "ioe":Ljava/io/IOException;
    .restart local v6    # "version":B
    :cond_6
    :try_start_5
    const-string v7, "Smack/Packet"

    const-string v8, "Required version not supported by server."

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 598
    iget-boolean v7, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v7, :cond_4

    .line 599
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Required version not supported by server."

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v7}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 620
    .end local v6    # "version":B
    :catchall_0
    move-exception v7

    :try_start_6
    iget-object v8, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v8}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V

    throw v7
    :try_end_6
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    .line 609
    :cond_7
    :try_start_7
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->protoParser:Lcom/google/android/gtalkservice/proto/ProtoBufStreamParser;

    invoke-interface {v7, v0}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamParser;->parse(Ljava/nio/ByteBuffer;)V

    .line 610
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 614
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v7, v7, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/InputStream;

    if-eq v1, v7, :cond_8

    const-string v7, "Smack/Packet"

    const/4 v8, 0x3

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 616
    const-string v7, "Smack/Packet"

    const-string v8, "Switching input stream"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 618
    :cond_8
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v1, v7, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/InputStream;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 620
    :try_start_8
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V
    :try_end_8
    .catch Lcom/google/android/gtalkservice/proto/ProtoBufStreamException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1

    goto/16 :goto_0
.end method

.method private parseRegistration(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Registration;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1563
    new-instance v4, Lorg/jivesoftware/smack/packet/Registration;

    invoke-direct {v4}, Lorg/jivesoftware/smack/packet/Registration;-><init>()V

    .line 1564
    .local v4, "registration":Lorg/jivesoftware/smack/packet/Registration;
    const/4 v2, 0x0

    .line 1565
    .local v2, "fields":Ljava/util/Map;
    const/4 v0, 0x0

    .line 1566
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_6

    .line 1567
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 1568
    .local v1, "eventType":I
    const/4 v6, 0x2

    if-ne v1, v6, :cond_5

    .line 1571
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v6

    const-string v7, "jabber:iq:register"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1572
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 1573
    .local v3, "name":Ljava/lang/String;
    const-string v5, ""

    .line 1574
    .local v5, "value":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 1575
    new-instance v2, Ljava/util/HashMap;

    .end local v2    # "fields":Ljava/util/Map;
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1578
    .restart local v2    # "fields":Ljava/util/Map;
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    const/4 v7, 0x4

    if-ne v6, v7, :cond_2

    .line 1579
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v5

    .line 1582
    :cond_2
    const-string v6, "instructions"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 1583
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1586
    :cond_3
    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/packet/Registration;->setInstructions(Ljava/lang/String;)V

    goto :goto_0

    .line 1591
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/jivesoftware/smack/packet/Registration;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto :goto_0

    .line 1598
    :cond_5
    const/4 v6, 0x3

    if-ne v1, v6, :cond_0

    .line 1599
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "query"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1600
    const/4 v0, 0x1

    goto :goto_0

    .line 1604
    .end local v1    # "eventType":I
    :cond_6
    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/packet/Registration;->setAttributes(Ljava/util/Map;)V

    .line 1605
    return-object v4
.end method

.method private parseResourceBinding(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Bind;
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 1610
    new-instance v0, Lorg/jivesoftware/smack/packet/Bind;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/Bind;-><init>()V

    .line 1611
    .local v0, "bind":Lorg/jivesoftware/smack/packet/Bind;
    const/4 v1, 0x0

    .line 1612
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_3

    .line 1613
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 1614
    .local v2, "eventType":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    .line 1615
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "resource"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1616
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Bind;->setResource(Ljava/lang/String;)V

    goto :goto_0

    .line 1618
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "jid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1619
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Bind;->setJid(Ljava/lang/String;)V

    goto :goto_0

    .line 1621
    :cond_2
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 1622
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "bind"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1623
    const/4 v1, 0x1

    goto :goto_0

    .line 1628
    .end local v2    # "eventType":I
    :cond_3
    return-object v0
.end method

.method private parseRoster(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/RosterPacket;
    .locals 10
    .param p1, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1466
    new-instance v7, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v7}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 1467
    .local v7, "roster":Lorg/jivesoftware/smack/packet/RosterPacket;
    const/4 v2, 0x0

    .line 1469
    .local v2, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    const/4 v9, 0x1

    invoke-virtual {p1, v9}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 1470
    const/4 v9, 0x1

    invoke-virtual {p1, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smack/packet/RosterPacket;->setEtag(Ljava/lang/String;)V

    .line 1480
    :cond_0
    const/4 v9, 0x3

    invoke-virtual {p1, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getCount(I)I

    move-result v6

    .line 1482
    .local v6, "numItems":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v6, :cond_6

    .line 1483
    const/4 v9, 0x3

    invoke-virtual {p1, v9, v1}, Lcom/google/common/io/protocol/ProtoBuf;->getProtoBuf(II)Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v3

    .line 1484
    .local v3, "itemPB":Lcom/google/common/io/protocol/ProtoBuf;
    const/4 v9, 0x1

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1485
    .local v4, "jid":Ljava/lang/String;
    const/4 v9, 0x2

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 1488
    .local v5, "name":Ljava/lang/String;
    new-instance v2, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .end local v2    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-direct {v2, v4, v5}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1490
    .restart local v2    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    const/4 v9, 0x3

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 1491
    const/4 v9, 0x3

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v8

    .line 1493
    .local v8, "subscriptionType":I
    packed-switch v8, :pswitch_data_0

    .line 1515
    .end local v8    # "subscriptionType":I
    :cond_1
    :goto_1
    const/4 v9, 0x4

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1516
    const/4 v9, 0x4

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v0

    .line 1518
    .local v0, "askType":I
    packed-switch v0, :pswitch_data_1

    .line 1527
    .end local v0    # "askType":I
    :cond_2
    :goto_2
    const/16 v9, 0x8

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 1528
    const/16 v9, 0x8

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v9

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetRejected(Z)V

    .line 1531
    :cond_3
    const/4 v9, 0x7

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 1532
    const/4 v9, 0x7

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getInt(I)I

    move-result v9

    packed-switch v9, :pswitch_data_2

    .line 1543
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->DEFAULT:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    .line 1550
    :goto_3
    const/4 v9, 0x6

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1551
    const/4 v9, 0x6

    invoke-virtual {v3, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v9

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setQuickContact(Z)V

    .line 1556
    :cond_4
    invoke-virtual {v7, v2}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 1482
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1471
    .end local v1    # "i":I
    .end local v3    # "itemPB":Lcom/google/common/io/protocol/ProtoBuf;
    .end local v4    # "jid":Ljava/lang/String;
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "numItems":I
    :cond_5
    const/4 v9, 0x2

    invoke-virtual {p1, v9}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1473
    const/4 v9, 0x2

    invoke-virtual {p1, v9}, Lcom/google/common/io/protocol/ProtoBuf;->getBool(I)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1474
    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smack/packet/RosterPacket;->setNotModified(Ljava/lang/Boolean;)V

    .line 1559
    :cond_6
    return-object v7

    .line 1495
    .restart local v1    # "i":I
    .restart local v3    # "itemPB":Lcom/google/common/io/protocol/ProtoBuf;
    .restart local v4    # "jid":Ljava/lang/String;
    .restart local v5    # "name":Ljava/lang/String;
    .restart local v6    # "numItems":I
    .restart local v8    # "subscriptionType":I
    :pswitch_0
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->BOTH:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    goto :goto_1

    .line 1498
    :pswitch_1
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->FROM:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    goto :goto_1

    .line 1501
    :pswitch_2
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->TO:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    goto :goto_1

    .line 1504
    :pswitch_3
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->NONE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    goto :goto_1

    .line 1507
    :pswitch_4
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->REMOVE:Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    goto :goto_1

    .line 1520
    .end local v8    # "subscriptionType":I
    .restart local v0    # "askType":I
    :pswitch_5
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->SUBSCRIPTION_PENDING:Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemStatus(Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;)V

    goto :goto_2

    .line 1534
    .end local v0    # "askType":I
    :pswitch_6
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->BLOCKED:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    goto :goto_3

    .line 1537
    :pswitch_7
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->HIDDEN:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    goto :goto_3

    .line 1540
    :pswitch_8
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->PINNED:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    goto :goto_3

    .line 1547
    :cond_7
    sget-object v9, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->DEFAULT:Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    invoke-virtual {v2, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetStatus(Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;)V

    goto :goto_3

    .line 1493
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_4
    .end packed-switch

    .line 1518
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
    .end packed-switch

    .line 1532
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method private parseRoster(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/RosterPacket;
    .locals 21
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1357
    new-instance v14, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v14}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 1358
    .local v14, "roster":Lorg/jivesoftware/smack/packet/RosterPacket;
    const/4 v4, 0x0

    .line 1359
    .local v4, "done":Z
    const/4 v10, 0x0

    .line 1361
    .local v10, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    :cond_0
    :goto_0
    if-nez v4, :cond_8

    .line 1362
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v5

    .line 1363
    .local v5, "eventType":I
    const/16 v19, 0x2

    move v0, v5

    move/from16 v1, v19

    if-ne v0, v1, :cond_6

    .line 1364
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "item"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 1365
    const-string v19, ""

    const-string v20, "jid"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1366
    .local v11, "jid":Ljava/lang/String;
    const-string v19, ""

    const-string v20, "name"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1368
    .local v13, "name":Ljava/lang/String;
    new-instance v10, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .end local v10    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-direct {v10, v11, v13}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1386
    .restart local v10    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    const-string v19, ""

    const-string v20, "ask"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1387
    .local v3, "ask":Ljava/lang/String;
    invoke-static {v3}, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v15

    .line 1389
    .local v15, "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    invoke-virtual {v10, v15}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemStatus(Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;)V

    .line 1391
    const-string v19, ""

    const-string v20, "subscription"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 1393
    .local v16, "subscription":Ljava/lang/String;
    invoke-static/range {v16 .. v16}, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v18

    .line 1395
    .local v18, "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    move-object v0, v10

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    .line 1397
    invoke-static {}, Lorg/jivesoftware/smack/GoogleExtensions;->getSupportExtendedContactAttribute()Z

    move-result v19

    if-eqz v19, :cond_4

    .line 1398
    const/4 v12, 0x0

    .line 1402
    .local v12, "mc":I
    const-string v19, "google:roster"

    const-string v20, "mc"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1404
    .local v6, "gr_mc":Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 1407
    :try_start_0
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v12

    .line 1413
    :cond_1
    :goto_1
    const-string v19, "google:roster"

    const-string v20, "t"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1415
    .local v8, "gr_t":Ljava/lang/String;
    if-eqz v8, :cond_2

    .line 1417
    invoke-virtual {v10, v8}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetStatusString(Ljava/lang/String;)V

    .line 1420
    :cond_2
    const-string v19, "google:roster"

    const-string v20, "rejected"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1422
    .local v7, "gr_rejected":Ljava/lang/String;
    if-eqz v7, :cond_3

    const-string v19, "true"

    move-object v0, v7

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 1424
    const/16 v19, 0x1

    move-object v0, v10

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionSetRejected(Z)V

    .line 1430
    :cond_3
    const/4 v9, 0x0

    .line 1432
    .local v9, "isQuickContact":Z
    invoke-virtual {v10}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->gExtensionGetStatus()Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;

    move-result-object v17

    .line 1433
    .local v17, "t":Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;
    sget-object v19, Lorg/jivesoftware/smack/PacketReader$6;->$SwitchMap$org$jivesoftware$smack$packet$RosterPacket$Item$G_STATUS:[I

    invoke-virtual/range {v17 .. v17}, Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;->ordinal()I

    move-result v20

    aget v19, v19, v20

    packed-switch v19, :pswitch_data_0

    .line 1446
    :goto_2
    invoke-virtual {v10, v9}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setQuickContact(Z)V

    .line 1449
    .end local v3    # "ask":Ljava/lang/String;
    .end local v6    # "gr_mc":Ljava/lang/String;
    .end local v7    # "gr_rejected":Ljava/lang/String;
    .end local v8    # "gr_t":Ljava/lang/String;
    .end local v9    # "isQuickContact":Z
    .end local v11    # "jid":Ljava/lang/String;
    .end local v12    # "mc":I
    .end local v13    # "name":Ljava/lang/String;
    .end local v15    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v16    # "subscription":Ljava/lang/String;
    .end local v17    # "t":Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;
    .end local v18    # "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    :cond_4
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "group"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_0

    if-eqz v10, :cond_0

    .line 1450
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v19

    move-object v0, v10

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->addGroupName(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1435
    .restart local v3    # "ask":Ljava/lang/String;
    .restart local v6    # "gr_mc":Ljava/lang/String;
    .restart local v7    # "gr_rejected":Ljava/lang/String;
    .restart local v8    # "gr_t":Ljava/lang/String;
    .restart local v9    # "isQuickContact":Z
    .restart local v11    # "jid":Ljava/lang/String;
    .restart local v12    # "mc":I
    .restart local v13    # "name":Ljava/lang/String;
    .restart local v15    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .restart local v16    # "subscription":Ljava/lang/String;
    .restart local v17    # "t":Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;
    .restart local v18    # "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    :pswitch_0
    const/4 v9, 0x1

    .line 1436
    goto :goto_2

    .line 1440
    :pswitch_1
    const/16 v19, 0x5

    move v0, v12

    move/from16 v1, v19

    if-lt v0, v1, :cond_5

    const/16 v19, 0x1

    move/from16 v9, v19

    .line 1441
    :goto_3
    goto :goto_2

    .line 1440
    :cond_5
    const/16 v19, 0x0

    move/from16 v9, v19

    goto :goto_3

    .line 1453
    .end local v3    # "ask":Ljava/lang/String;
    .end local v6    # "gr_mc":Ljava/lang/String;
    .end local v7    # "gr_rejected":Ljava/lang/String;
    .end local v8    # "gr_t":Ljava/lang/String;
    .end local v9    # "isQuickContact":Z
    .end local v11    # "jid":Ljava/lang/String;
    .end local v12    # "mc":I
    .end local v13    # "name":Ljava/lang/String;
    .end local v15    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v16    # "subscription":Ljava/lang/String;
    .end local v17    # "t":Lorg/jivesoftware/smack/packet/RosterPacket$Item$G_STATUS;
    .end local v18    # "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    :cond_6
    const/16 v19, 0x3

    move v0, v5

    move/from16 v1, v19

    if-ne v0, v1, :cond_0

    .line 1454
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "item"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 1455
    invoke-virtual {v14, v10}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 1457
    :cond_7
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "query"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 1458
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 1409
    .restart local v3    # "ask":Ljava/lang/String;
    .restart local v6    # "gr_mc":Ljava/lang/String;
    .restart local v11    # "jid":Ljava/lang/String;
    .restart local v12    # "mc":I
    .restart local v13    # "name":Ljava/lang/String;
    .restart local v15    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .restart local v16    # "subscription":Ljava/lang/String;
    .restart local v18    # "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    :catch_0
    move-exception v19

    goto/16 :goto_1

    .line 1462
    .end local v3    # "ask":Ljava/lang/String;
    .end local v5    # "eventType":I
    .end local v6    # "gr_mc":Ljava/lang/String;
    .end local v11    # "jid":Ljava/lang/String;
    .end local v12    # "mc":I
    .end local v13    # "name":Ljava/lang/String;
    .end local v15    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v16    # "subscription":Ljava/lang/String;
    .end local v18    # "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    :cond_8
    return-object v14

    .line 1433
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private parseStreamError(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/StreamError;
    .locals 4
    .param p1, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 949
    const/4 v0, 0x0

    .line 950
    .local v0, "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    invoke-virtual {p1, v2}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 951
    new-instance v0, Lorg/jivesoftware/smack/packet/StreamError;

    .end local v0    # "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    invoke-virtual {p1, v2}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/StreamError;-><init>(Ljava/lang/String;)V

    .line 953
    .restart local v0    # "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    invoke-virtual {p1, v3}, Lcom/google/common/io/protocol/ProtoBuf;->has(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 954
    invoke-virtual {p1, v3}, Lcom/google/common/io/protocol/ProtoBuf;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/StreamError;->setText(Ljava/lang/String;)V

    .line 958
    :cond_0
    if-eqz v0, :cond_1

    .line 959
    const-string v1, "Smack/Packet"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[PacketReader] got stream error "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/StreamError;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 963
    :cond_1
    return-object v0
.end method

.method private parseStreamError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/StreamError;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const-string v7, ">"

    const-string v6, "Smack/Packet"

    .line 908
    const/4 v3, 0x0

    .line 909
    .local v3, "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    const/4 v0, 0x0

    .line 911
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 912
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 913
    .local v1, "eventType":I
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 915
    .local v2, "name":Ljava/lang/String;
    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 917
    :pswitch_0
    const-string v4, "Smack/Packet"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "    <"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ">"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 918
    const-string v4, "text"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 919
    new-instance v3, Lorg/jivesoftware/smack/packet/StreamError;

    .end local v3    # "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    invoke-direct {v3, v2}, Lorg/jivesoftware/smack/packet/StreamError;-><init>(Ljava/lang/String;)V

    .restart local v3    # "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    goto :goto_0

    .line 924
    :pswitch_1
    const-string v4, "error"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 925
    const-string v4, "Smack/Packet"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "</"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ">"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    const/4 v0, 0x1

    goto :goto_0

    .line 928
    :cond_1
    const-string v4, "Smack/Packet"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "    </"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ">"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 933
    :pswitch_2
    if-eqz v3, :cond_0

    .line 934
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/packet/StreamError;->setText(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 940
    .end local v1    # "eventType":I
    .end local v2    # "name":Ljava/lang/String;
    :cond_2
    if-eqz v3, :cond_3

    .line 941
    const-string v4, "Smack/Packet"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[PacketReader] got stream error "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/StreamError;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 945
    :cond_3
    return-object v3

    .line 915
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private processListeners()V
    .locals 6

    .prologue
    .line 422
    :cond_0
    :goto_0
    iget-boolean v4, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v4, :cond_3

    .line 423
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->acquireWakeLock()V

    .line 425
    const/4 v1, 0x0

    .line 428
    .local v1, "processedPacket":Z
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 429
    :try_start_1
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v2

    .line 430
    .local v2, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v2, :cond_2

    .line 431
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;

    .line 432
    .local v3, "wrapper":Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
    if-eqz v3, :cond_1

    .line 438
    invoke-virtual {v3}, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->notifyListener()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 439
    const/4 v1, 0x1

    .line 430
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 443
    .end local v3    # "wrapper":Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
    :cond_2
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 445
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V

    .line 448
    if-nez v1, :cond_0

    .line 451
    :try_start_2
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    monitor-enter v4
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 452
    :try_start_3
    iget-object v5, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V

    .line 453
    monitor-exit v4

    goto :goto_0

    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v5
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    .line 455
    :catch_0
    move-exception v4

    goto :goto_0

    .line 443
    .end local v0    # "i":I
    .end local v2    # "size":I
    :catchall_1
    move-exception v5

    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    throw v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 445
    :catchall_2
    move-exception v4

    iget-object v5, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V

    throw v4

    .line 460
    .end local v1    # "processedPacket":Z
    :cond_3
    return-void
.end method

.method private processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 6
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    const/4 v4, 0x3

    .line 866
    if-nez p1, :cond_0

    .line 904
    :goto_0
    return-void

    .line 872
    :cond_0
    const-string v3, "Smack/Packet"

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 873
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->toLogString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    .line 882
    :cond_1
    :goto_1
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    monitor-enter v3

    .line 883
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int v1, v4, v5

    .local v1, "i":I
    :goto_2
    if-ltz v1, :cond_4

    .line 884
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_2

    .line 885
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 883
    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 874
    .end local v1    # "i":I
    :cond_3
    const-string v3, "Sync"

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 876
    instance-of v3, p1, Lorg/jivesoftware/smack/packet/DataMessage;

    if-eqz v3, :cond_1

    .line 877
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->toLogString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/jivesoftware/smack/PacketReader;->logPacket(Ljava/lang/String;)V

    goto :goto_1

    .line 888
    .restart local v1    # "i":I
    :cond_4
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 891
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 892
    .local v2, "size":I
    const/4 v1, 0x0

    :goto_3
    if-ge v1, v2, :cond_6

    .line 893
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->collectors:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/PacketCollector;

    .line 894
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    if-eqz v0, :cond_5

    .line 896
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketCollector;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 892
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 888
    .end local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .end local v1    # "i":I
    .end local v2    # "size":I
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 901
    .restart local v1    # "i":I
    .restart local v2    # "size":I
    :cond_6
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    monitor-enter v3

    .line 902
    :try_start_3
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 903
    monitor-exit v3

    goto :goto_0

    :catchall_1
    move-exception v4

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v4
.end method

.method private releaseConnectionIDLock()V
    .locals 2

    .prologue
    .line 853
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connectionIDLock:Ljava/lang/Object;

    monitor-enter v0

    .line 854
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connectionIDLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 855
    monitor-exit v0

    .line 856
    return-void

    .line 855
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private resetParser()V
    .locals 4

    .prologue
    .line 405
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-boolean v1, v1, Lorg/jivesoftware/smack/XMPPConnection;->useProtoBuf:Z

    if-eqz v1, :cond_0

    .line 406
    new-instance v1, Lcom/google/android/gtalkservice/proto/ProtoBufStreamParserImpl;

    new-instance v2, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;

    invoke-direct {v2}, Lcom/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration;-><init>()V

    invoke-direct {v1, v2, p0}, Lcom/google/android/gtalkservice/proto/ProtoBufStreamParserImpl;-><init>(Lcom/google/android/gtalkservice/proto/ProtoBufStreamConfiguration;Lcom/google/android/gtalkservice/proto/ProtoBufEventHandler;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->protoParser:Lcom/google/android/gtalkservice/proto/ProtoBufStreamParser;

    .line 416
    :goto_0
    return-void

    .line 410
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->newXmlParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    .line 411
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v2, v2, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/InputStream;

    const-string v3, "UTF-8"

    invoke-interface {v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 412
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 413
    .local v0, "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V
    .locals 2
    .param p1, "connectionListener"    # Lorg/jivesoftware/smack/ConnectionListener;

    .prologue
    .line 274
    if-nez p1, :cond_0

    .line 283
    :goto_0
    return-void

    .line 278
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    monitor-enter v0

    .line 279
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 280
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 282
    :cond_1
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)Z
    .locals 5
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 188
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    monitor-enter v2

    .line 189
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;

    .line 190
    .local v1, "wrapper":Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
    invoke-static {v1}, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->access$300(Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;)Lorg/jivesoftware/smack/PacketListener;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {v1}, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->access$400(Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v3

    iget-object v3, v3, Lorg/jivesoftware/smack/PacketCollector;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 192
    const-string v3, "Smack/Packet"

    const/4 v4, 0x2

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 193
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "addPacketListener: duplicate listener "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " and filter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", bail"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/jivesoftware/smack/PacketReader;->log(Ljava/lang/String;)V

    .line 196
    :cond_1
    const/4 v3, 0x0

    monitor-exit v2

    move v2, v3

    .line 201
    .end local v1    # "wrapper":Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
    :goto_0
    return v2

    .line 200
    :cond_2
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    new-instance v4, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;

    invoke-direct {v4, p0, p1, p2}, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;-><init>(Lorg/jivesoftware/smack/PacketReader;Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    const/4 v3, 0x1

    monitor-exit v2

    move v2, v3

    goto :goto_0

    .line 202
    .end local v0    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;
    .locals 1
    .param p1, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 176
    new-instance v0, Lorg/jivesoftware/smack/PacketCollector;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smack/PacketCollector;-><init>(Lorg/jivesoftware/smack/PacketReader;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    return-object v0
.end method

.method dump(Ljava/io/PrintWriter;)V
    .locals 6
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1834
    const-string v3, "Packet listeners:"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1835
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    monitor-enter v3

    .line 1836
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    .line 1837
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 1838
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;

    .line 1839
    .local v2, "wrapper":Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->access$300(Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;)Lorg/jivesoftware/smack/PacketListener;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1840
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->access$400(Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketCollector;->getPacketFilter()Lorg/jivesoftware/smack/filter/PacketFilter;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", qsize="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->access$400(Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v5

    iget-object v5, v5, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1842
    const-string v4, ""

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1837
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1844
    .end local v2    # "wrapper":Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
    :cond_0
    monitor-exit v3

    .line 1845
    return-void

    .line 1844
    .end local v0    # "i":I
    .end local v1    # "size":I
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public getLastActive()J
    .locals 2

    .prologue
    .line 1784
    iget-wide v0, p0, Lorg/jivesoftware/smack/PacketReader;->lastActive:J

    return-wide v0
.end method

.method public handleProtoBuf(Lcom/google/common/io/protocol/ProtoBuf;J)V
    .locals 11
    .param p1, "protobuf"    # Lcom/google/common/io/protocol/ProtoBuf;
    .param p2, "size"    # J

    .prologue
    const/4 v9, 0x1

    const-string v10, "Smack/Packet"

    .line 468
    iget-boolean v7, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-eqz v7, :cond_1

    .line 552
    :cond_0
    :goto_0
    return-void

    .line 471
    :cond_1
    const/4 v2, 0x0

    .line 472
    .local v2, "packet":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {p1}, Lcom/google/common/io/protocol/ProtoBuf;->getType()Lcom/google/common/io/protocol/ProtoBufType;

    move-result-object v6

    .line 475
    .local v6, "type":Lcom/google/common/io/protocol/ProtoBufType;
    :try_start_0
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_PING:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_7

    .line 476
    const-string v7, "Smack/Packet"

    const/4 v8, 0x3

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 477
    const-string v7, "Received HeartbeatPing from server."

    invoke-direct {p0, v7}, Lorg/jivesoftware/smack/PacketReader;->log(Ljava/lang/String;)V

    .line 482
    :cond_2
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/XMPPConnection;->getRmq2Manager()Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 483
    new-instance v3, Lorg/jivesoftware/smack/packet/HeartbeatPing;

    invoke-direct {v3}, Lorg/jivesoftware/smack/packet/HeartbeatPing;-><init>()V

    .end local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    .local v3, "packet":Lorg/jivesoftware/smack/packet/Packet;
    move-object v2, v3

    .line 486
    .end local v3    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    .restart local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :cond_3
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v7, v7, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/PacketWriter;->sendHeartbeatAck()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 525
    :cond_4
    :goto_1
    if-eqz v2, :cond_13

    .line 534
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/XMPPConnection;->getRmq2Manager()Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    move-result-object v4

    .line 535
    .local v4, "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    if-eqz v4, :cond_5

    .line 536
    invoke-virtual {v4, v2}, Lcom/google/android/gtalkservice/rmq/Rmq2Manager;->processS2dMessage(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 539
    :cond_5
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/XMPPConnection;->getRmqManager()Lcom/google/android/gtalkservice/rmq/RmqManager;

    move-result-object v5

    .line 540
    .local v5, "rmqMgr":Lcom/google/android/gtalkservice/rmq/RmqManager;
    if-eqz v5, :cond_6

    .line 541
    invoke-virtual {v5, v2}, Lcom/google/android/gtalkservice/rmq/RmqManager;->processS2dMessage(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 544
    :cond_6
    invoke-direct {p0, v2}, Lorg/jivesoftware/smack/PacketReader;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 545
    invoke-static {v2, p2, p3, v9}, Lcom/google/android/gtalkservice/usagegauge/UsageGauge;->update(Lorg/jivesoftware/smack/packet/Packet;JZ)V

    goto :goto_0

    .line 487
    .end local v4    # "rmq2Mgr":Lcom/google/android/gtalkservice/rmq/Rmq2Manager;
    .end local v5    # "rmqMgr":Lcom/google/android/gtalkservice/rmq/RmqManager;
    :cond_7
    :try_start_1
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_ACK:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_9

    .line 488
    const-string v7, "Smack/Packet"

    const/4 v8, 0x3

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 489
    const-string v7, "Received HeartbeatAck from server."

    invoke-direct {p0, v7}, Lorg/jivesoftware/smack/PacketReader;->log(Ljava/lang/String;)V

    .line 493
    :cond_8
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/XMPPConnection;->getRmq2Manager()Lcom/google/android/gtalkservice/rmq/Rmq2Manager;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 494
    new-instance v3, Lorg/jivesoftware/smack/packet/HeartbeatAck;

    invoke-direct {v3}, Lorg/jivesoftware/smack/packet/HeartbeatAck;-><init>()V

    .end local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    .restart local v3    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    move-object v2, v3

    .end local v3    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    .restart local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    goto :goto_1

    .line 496
    :cond_9
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->LOGIN_RESPONSE:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_a

    .line 497
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketReader;->parseLoginResponse(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/LoginResponse;

    move-result-object v2

    goto :goto_1

    .line 498
    :cond_a
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HTTP_RESPONSE:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_b

    .line 499
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketReader;->parseHttpResponse(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/HttpResponse;

    move-result-object v2

    goto :goto_1

    .line 500
    :cond_b
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->MESSAGE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_c

    .line 501
    invoke-static {p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseMessage(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    goto :goto_1

    .line 502
    :cond_c
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->PRESENCE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_d

    .line 503
    invoke-static {p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePresence(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    goto :goto_1

    .line 504
    :cond_d
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->BATCH_PRESENCE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_e

    .line 505
    invoke-static {p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseBatchPresence(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    goto :goto_1

    .line 506
    :cond_e
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->IQ_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_f

    .line 507
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketReader;->parseIQ(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v2

    goto :goto_1

    .line 508
    :cond_f
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->DATA_MESSAGE_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_10

    .line 509
    invoke-static {p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseDataMessage(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/DataMessage;

    move-result-object v2

    goto :goto_1

    .line 510
    :cond_10
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->CLOSE:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_12

    .line 511
    const-string v7, "Smack/Packet"

    const/4 v8, 0x3

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 512
    const-string v7, "Received Close from server."

    invoke-direct {p0, v7}, Lorg/jivesoftware/smack/PacketReader;->log(Ljava/lang/String;)V

    .line 514
    :cond_11
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 520
    :catch_0
    move-exception v7

    move-object v0, v7

    .line 521
    .local v0, "e":Ljava/lang/Exception;
    const-string v7, "Smack/Packet"

    const-string v7, "handleProtoBuf: caught "

    invoke-static {v10, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 522
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto/16 :goto_1

    .line 515
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_12
    :try_start_2
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->STREAM_ERROR_STANZA:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_4

    .line 516
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    .line 517
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketReader;->parseStreamError(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/StreamError;

    move-result-object v1

    .line 518
    .local v1, "error":Lorg/jivesoftware/smack/packet/StreamError;
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-direct {v7, v1}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/StreamError;)V

    throw v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 547
    .end local v1    # "error":Lorg/jivesoftware/smack/packet/StreamError;
    :cond_13
    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_PING:Lcom/google/common/io/protocol/ProtoBufType;

    if-eq v6, v7, :cond_14

    sget-object v7, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->HEARTBEAT_ACK:Lcom/google/common/io/protocol/ProtoBufType;

    if-ne v6, v7, :cond_0

    .line 549
    :cond_14
    invoke-static {p2, p3, v9}, Lcom/google/android/gtalkservice/usagegauge/UsageGauge;->updateHeartbeat(JZ)V

    goto/16 :goto_0
.end method

.method notifyConnectionError(Ljava/lang/Exception;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    const/4 v3, 0x1

    const-string v2, "Smack/Packet"

    .line 331
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->notifiedConnectionError:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 381
    :goto_0
    return-void

    .line 340
    :cond_0
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/XMPPConnection;->acquireWakeLock()V

    .line 343
    :try_start_0
    instance-of v2, p1, Ljava/io/IOException;

    if-eqz v2, :cond_1

    .line 347
    const-string v2, "Smack/Packet"

    const-string v3, "notify conn break (IOEx), close connection"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    .line 354
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/XMPPConnection;->close(Z)V

    .line 355
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketReader;->releaseConnectionIDLock()V

    .line 358
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 368
    :try_start_1
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/ConnectionListener;

    .line 369
    .local v1, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPConnection;->getLocalConnectionId()I

    move-result v3

    invoke-interface {v1, v3, p1}, Lorg/jivesoftware/smack/ConnectionListener;->connectionClosedOnError(ILjava/lang/Exception;)V

    goto :goto_2

    .line 372
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 379
    :catchall_1
    move-exception v2

    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V

    throw v2

    .line 350
    :cond_1
    :try_start_3
    const-string v2, "Smack/Packet"

    const-string v3, "notify conn error. close connection!"

    invoke-static {v2, v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    .line 372
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_2
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 375
    :try_start_5
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    monitor-enter v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 376
    :try_start_6
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Object;->notify()V

    .line 377
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 379
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/XMPPConnection;->releaseWakeLock()V

    goto :goto_0

    .line 377
    :catchall_2
    move-exception v3

    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    throw v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1
.end method

.method removeConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V
    .locals 2
    .param p1, "connectionListener"    # Lorg/jivesoftware/smack/ConnectionListener;

    .prologue
    .line 287
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    monitor-enter v0

    .line 288
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 289
    monitor-exit v0

    .line 290
    return-void

    .line 289
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V
    .locals 5
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 211
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    monitor-enter v3

    .line 212
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    .line 213
    .local v1, "size":I
    const/4 v4, 0x1

    sub-int v0, v1, v4

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 214
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;

    .line 215
    .local v2, "wrapper":Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
    invoke-static {v2}, Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;->access$300(Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;)Lorg/jivesoftware/smack/PacketListener;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 216
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketReader;->listeners:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 213
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 219
    .end local v2    # "wrapper":Lorg/jivesoftware/smack/PacketReader$ListenerWrapper;
    :cond_1
    monitor-exit v3

    .line 220
    return-void

    .line 219
    .end local v0    # "i":I
    .end local v1    # "size":I
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public shutdown(Z)V
    .locals 4
    .param p1, "notifyConnectionClosed"    # Z

    .prologue
    .line 297
    iget-boolean v2, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v2, :cond_1

    if-eqz p1, :cond_1

    .line 298
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    monitor-enter v2

    .line 310
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->connectionListeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/ConnectionListener;

    .line 311
    .local v1, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/XMPPConnection;->getLocalConnectionId()I

    move-result v3

    invoke-interface {v1, v3}, Lorg/jivesoftware/smack/ConnectionListener;->connectionClosed(I)V

    goto :goto_0

    .line 314
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 316
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    .line 319
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    monitor-enter v2

    .line 320
    :try_start_2
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Object;->notify()V

    .line 321
    monitor-exit v2

    .line 322
    return-void

    .line 321
    :catchall_1
    move-exception v3

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v3
.end method

.method public startup()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 231
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->readerThread:Ljava/lang/Thread;

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 232
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->listenerThread:Ljava/lang/Thread;

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 237
    :try_start_0
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connectionIDLock:Ljava/lang/Object;

    monitor-enter v6
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    :try_start_1
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    if-nez v7, :cond_0

    .line 243
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v7

    int-to-long v4, v7

    .line 245
    .local v4, "waitTime":J
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 246
    .local v2, "start":J
    :goto_0
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    if-nez v7, :cond_0

    iget-boolean v7, p0, Lorg/jivesoftware/smack/PacketReader;->done:Z

    if-nez v7, :cond_0

    .line 247
    const-wide/16 v7, 0x0

    cmp-long v7, v4, v7

    if-gtz v7, :cond_1

    .line 258
    .end local v2    # "start":J
    .end local v4    # "waitTime":J
    :cond_0
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 263
    :goto_1
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    if-nez v6, :cond_2

    .line 264
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string v7, "Connection failed. No response from server."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 251
    .restart local v2    # "start":J
    .restart local v4    # "waitTime":J
    :cond_1
    :try_start_2
    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connectionIDLock:Ljava/lang/Object;

    const-wide/16 v8, 0x3

    mul-long/2addr v8, v4

    invoke-virtual {v7, v8, v9}, Ljava/lang/Object;->wait(J)V

    .line 253
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 254
    .local v0, "now":J
    sub-long v7, v0, v2

    sub-long/2addr v4, v7

    .line 255
    move-wide v2, v0

    .line 256
    goto :goto_0

    .line 258
    .end local v0    # "now":J
    .end local v2    # "start":J
    .end local v4    # "waitTime":J
    :catchall_0
    move-exception v7

    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v7
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 260
    :catch_0
    move-exception v6

    goto :goto_1

    .line 267
    :cond_2
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketReader;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v7, p0, Lorg/jivesoftware/smack/PacketReader;->connectionID:Ljava/lang/String;

    iput-object v7, v6, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 269
    return-void
.end method
