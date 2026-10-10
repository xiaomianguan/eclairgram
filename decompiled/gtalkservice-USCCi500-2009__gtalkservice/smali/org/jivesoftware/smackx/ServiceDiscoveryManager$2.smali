.class Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;
.super Ljava/lang/Object;
.source "ServiceDiscoveryManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed(I)V
    .locals 2
    .param p1, "connectionId"    # I

    .prologue
    .line 144
    invoke-static {}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$100()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-static {v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$000(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    return-void
.end method

.method public connectionClosedOnError(ILjava/lang/Exception;)V
    .locals 2
    .param p1, "connectionId"    # I
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 149
    invoke-static {}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$100()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-static {v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$000(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    return-void
.end method
