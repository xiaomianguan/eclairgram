.class Lcom/google/android/gtalkservice/RosterManager$2;
.super Ljava/lang/Object;
.source "RosterManager.java"

# interfaces
.implements Lcom/google/android/gtalkservice/IQPacketHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/RosterManager;->removeContact(JLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/RosterManager;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/RosterManager;)V
    .locals 0

    .prologue
    .line 248
    iput-object p1, p0, Lcom/google/android/gtalkservice/RosterManager$2;->this$0:Lcom/google/android/gtalkservice/RosterManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handlePacket(Lorg/jivesoftware/smack/packet/IQ;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/IQ;

    .prologue
    .line 250
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v0

    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v0, v1, :cond_0

    .line 252
    const-string v0, "GTalkService"

    const-string v1, "removeContact failed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    :cond_0
    return-void
.end method
