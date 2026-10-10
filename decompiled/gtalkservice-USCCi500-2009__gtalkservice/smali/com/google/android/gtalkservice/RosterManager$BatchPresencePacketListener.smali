.class Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;
.super Ljava/lang/Object;
.source "RosterManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/RosterManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BatchPresencePacketListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/RosterManager;


# direct methods
.method private constructor <init>(Lcom/google/android/gtalkservice/RosterManager;)V
    .locals 0

    .prologue
    .line 353
    iput-object p1, p0, Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gtalkservice/RosterManager;Lcom/google/android/gtalkservice/RosterManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/gtalkservice/RosterManager;
    .param p2, "x1"    # Lcom/google/android/gtalkservice/RosterManager$1;

    .prologue
    .line 353
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;-><init>(Lcom/google/android/gtalkservice/RosterManager;)V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 9
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 358
    iget-object v7, p0, Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    invoke-static {v7}, Lcom/google/android/gtalkservice/RosterManager;->access$500(Lcom/google/android/gtalkservice/RosterManager;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 359
    iget-object v7, p0, Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    invoke-static {v7}, Lcom/google/android/gtalkservice/RosterManager;->access$600(Lcom/google/android/gtalkservice/RosterManager;)Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;

    move-result-object v4

    .line 360
    .local v4, "conn":Lcom/google/android/gtalkservice/GTalkConnection;
    invoke-static {v4}, Lcom/google/android/gtalkservice/ImAccountInfo;->getAccountId(Lcom/google/android/gtalkservice/GTalkConnection;)J

    move-result-wide v1

    .line 361
    .local v1, "accountId":J
    invoke-virtual {v4}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v6

    .line 363
    .local v6, "username":Ljava/lang/String;
    iget-object v7, p0, Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    invoke-static {v7}, Lcom/google/android/gtalkservice/RosterManager;->access$700(Lcom/google/android/gtalkservice/RosterManager;)Landroid/content/ContentResolver;

    move-result-object v7

    invoke-static {v7, v1, v2, v6}, Lcom/google/android/gtalkservice/RosterListenerImpl;->clearStoredPresence(Landroid/content/ContentResolver;JLjava/lang/String;)V

    .line 364
    iget-object v7, p0, Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    const/4 v8, 0x0

    invoke-static {v7, v8}, Lcom/google/android/gtalkservice/RosterManager;->access$502(Lcom/google/android/gtalkservice/RosterManager;Z)Z

    .line 367
    .end local v1    # "accountId":J
    .end local v4    # "conn":Lcom/google/android/gtalkservice/GTalkConnection;
    .end local v6    # "username":Ljava/lang/String;
    :cond_0
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/BatchPresence;

    move-object v3, v0

    .line 368
    .local v3, "batchPresence":Lorg/jivesoftware/smack/packet/BatchPresence;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/BatchPresence;->getPresenceStanzaList()Ljava/util/ArrayList;

    move-result-object v5

    .line 369
    .local v5, "updates":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smack/packet/Presence;>;"
    iget-object v7, p0, Lcom/google/android/gtalkservice/RosterManager$BatchPresencePacketListener;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    invoke-static {v7}, Lcom/google/android/gtalkservice/RosterManager;->access$800(Lcom/google/android/gtalkservice/RosterManager;)Lcom/google/android/gtalkservice/RosterListenerImpl;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/google/android/gtalkservice/RosterListenerImpl;->presenceChanged(Ljava/util/Collection;)V

    .line 370
    return-void
.end method
