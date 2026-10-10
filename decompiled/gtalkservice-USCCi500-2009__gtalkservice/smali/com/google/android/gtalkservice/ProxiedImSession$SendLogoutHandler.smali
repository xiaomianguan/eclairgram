.class Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;
.super Ljava/lang/Object;
.source "ProxiedImSession.java"

# interfaces
.implements Lcom/google/android/gtalkservice/IQPacketHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/ProxiedImSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SendLogoutHandler"
.end annotation


# instance fields
.field private final mLogoutPacket:Lorg/jivesoftware/smack/packet/IQ;

.field final synthetic this$0:Lcom/google/android/gtalkservice/ProxiedImSession;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/ProxiedImSession;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 279
    iput-object p1, p0, Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;->this$0:Lcom/google/android/gtalkservice/ProxiedImSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 280
    const/4 v0, 0x0

    invoke-virtual {p1, v1, v1, v0}, Lcom/google/android/gtalkservice/ProxiedImSession;->createLoginPacket(Ljava/lang/String;Ljava/lang/String;Z)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;->mLogoutPacket:Lorg/jivesoftware/smack/packet/IQ;

    .line 281
    return-void
.end method


# virtual methods
.method public handlePacket(Lorg/jivesoftware/smack/packet/IQ;)V
    .locals 0
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/IQ;

    .prologue
    .line 297
    return-void
.end method

.method send()V
    .locals 3

    .prologue
    .line 284
    iget-object v0, p0, Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;->this$0:Lcom/google/android/gtalkservice/ProxiedImSession;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/ProxiedImSession;->getHostConnectionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/ProxiedImSession$SendLogoutHandler;->mLogoutPacket:Lorg/jivesoftware/smack/packet/IQ;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V

    .line 286
    return-void
.end method
