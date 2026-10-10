.class Lorg/jivesoftware/smack/PacketReader$3;
.super Ljava/lang/Thread;
.source "PacketReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/PacketReader;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/PacketReader;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/PacketReader;)V
    .locals 0

    .prologue
    .line 149
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketReader$3;->this$0:Lorg/jivesoftware/smack/PacketReader;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 151
    const/16 v1, 0xa

    :try_start_0
    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 152
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader$3;->this$0:Lorg/jivesoftware/smack/PacketReader;

    invoke-static {v1}, Lorg/jivesoftware/smack/PacketReader;->access$200(Lorg/jivesoftware/smack/PacketReader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 157
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Smack/Packet"

    const-string v2, "[PacketReader] listenerThread: caught exception"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketReader$3;->this$0:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_0
.end method
