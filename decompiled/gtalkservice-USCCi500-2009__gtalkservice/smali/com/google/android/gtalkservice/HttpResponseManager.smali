.class public Lcom/google/android/gtalkservice/HttpResponseManager;
.super Ljava/lang/Object;
.source "HttpResponseManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# instance fields
.field private pending:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gtalkservice/IHttpRequestCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/HttpResponseManager;->pending:Ljava/util/HashMap;

    .line 49
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 84
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[HttpRespMgr] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    return-void
.end method


# virtual methods
.method public addPending(Ljava/lang/String;Lcom/google/android/gtalkservice/IHttpRequestCallback;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "cb"    # Lcom/google/android/gtalkservice/IHttpRequestCallback;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/google/android/gtalkservice/HttpResponseManager;->pending:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    return-void
.end method

.method public init(Landroid/content/Context;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "connContext"    # Lcom/google/android/gtalkservice/GTalkConnectionContext;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 52
    return-void
.end method

.method initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 56
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v1, Lorg/jivesoftware/smack/packet/HttpResponse;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 57
    .local v0, "httpResponseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-virtual {p1, p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 58
    return-void
.end method

.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 7
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 65
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/HttpResponse;

    move-object v3, v0

    .line 66
    .local v3, "resp":Lorg/jivesoftware/smack/packet/HttpResponse;
    sget-boolean v5, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v5, :cond_0

    .line 67
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "received packet "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/HttpResponse;->toXML()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gtalkservice/HttpResponseManager;->log(Ljava/lang/String;)V

    .line 70
    :cond_0
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/HttpResponse;->getPacketID()Ljava/lang/String;

    move-result-object v4

    .line 71
    .local v4, "tag":Ljava/lang/String;
    iget-object v5, p0, Lcom/google/android/gtalkservice/HttpResponseManager;->pending:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/IHttpRequestCallback;

    .line 72
    .local v1, "cb":Lcom/google/android/gtalkservice/IHttpRequestCallback;
    if-nez v1, :cond_1

    .line 73
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no callback for tag ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gtalkservice/HttpResponseManager;->log(Ljava/lang/String;)V

    .line 81
    :goto_0
    return-void

    .line 76
    :cond_1
    :try_start_0
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/HttpResponse;->getData()[B

    move-result-object v5

    invoke-interface {v1, v5}, Lcom/google/android/gtalkservice/IHttpRequestCallback;->requestComplete([B)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 77
    :catch_0
    move-exception v5

    move-object v2, v5

    .line 78
    .local v2, "e":Landroid/os/RemoteException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "remote exception for tag ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gtalkservice/HttpResponseManager;->log(Ljava/lang/String;)V

    goto :goto_0
.end method
