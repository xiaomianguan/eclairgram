.class Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;
.super Ljava/lang/Object;
.source "PacketWriter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/PacketWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "KeepAliveTask"
.end annotation


# instance fields
.field private delay:I

.field final synthetic this$0:Lorg/jivesoftware/smack/PacketWriter;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/PacketWriter;I)V
    .locals 0
    .param p2, "delay"    # I

    .prologue
    .line 718
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 719
    iput p2, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->delay:I

    .line 720
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 726
    const-wide/16 v0, 0x3a98

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 731
    :goto_0
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    invoke-static {v0}, Lorg/jivesoftware/smack/PacketWriter;->access$300(Lorg/jivesoftware/smack/PacketWriter;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 732
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    iget v1, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->delay:I

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/PacketWriter;->maybeSendHeartbeat(I)V

    .line 735
    :try_start_1
    iget v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->delay:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 737
    :catch_0
    move-exception v0

    goto :goto_0

    .line 728
    :catch_1
    move-exception v0

    goto :goto_0

    .line 741
    :cond_0
    return-void
.end method
