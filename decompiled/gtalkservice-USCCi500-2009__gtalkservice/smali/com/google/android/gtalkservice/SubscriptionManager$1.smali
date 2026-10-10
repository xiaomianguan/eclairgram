.class Lcom/google/android/gtalkservice/SubscriptionManager$1;
.super Ljava/lang/Object;
.source "SubscriptionManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/SubscriptionManager;->initConnection(Lorg/jivesoftware/smack/XMPPConnection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/SubscriptionManager;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/SubscriptionManager;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/google/android/gtalkservice/SubscriptionManager$1;->this$0:Lcom/google/android/gtalkservice/SubscriptionManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 72
    instance-of v4, p1, Lorg/jivesoftware/smack/packet/Presence;

    if-eqz v4, :cond_1

    .line 73
    iget-object v4, p0, Lcom/google/android/gtalkservice/SubscriptionManager$1;->this$0:Lcom/google/android/gtalkservice/SubscriptionManager;

    check-cast p1, Lorg/jivesoftware/smack/packet/Presence;

    .end local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    invoke-static {v4, p1}, Lcom/google/android/gtalkservice/SubscriptionManager;->access$000(Lcom/google/android/gtalkservice/SubscriptionManager;Lorg/jivesoftware/smack/packet/Presence;)V

    .line 80
    :cond_0
    return-void

    .line 74
    .restart local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :cond_1
    instance-of v4, p1, Lorg/jivesoftware/smack/packet/BatchPresence;

    if-eqz v4, :cond_0

    .line 75
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/BatchPresence;

    move-object v1, v0

    .line 76
    .local v1, "batchPresence":Lorg/jivesoftware/smack/packet/BatchPresence;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/BatchPresence;->getPresenceStanzaList()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/Presence;

    .line 77
    .local v3, "presence":Lorg/jivesoftware/smack/packet/Presence;
    iget-object v4, p0, Lcom/google/android/gtalkservice/SubscriptionManager$1;->this$0:Lcom/google/android/gtalkservice/SubscriptionManager;

    invoke-static {v4, v3}, Lcom/google/android/gtalkservice/SubscriptionManager;->access$000(Lcom/google/android/gtalkservice/SubscriptionManager;Lorg/jivesoftware/smack/packet/Presence;)V

    goto :goto_0
.end method
