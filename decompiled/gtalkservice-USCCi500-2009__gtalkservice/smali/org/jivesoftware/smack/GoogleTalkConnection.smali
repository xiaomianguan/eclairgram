.class public Lorg/jivesoftware/smack/GoogleTalkConnection;
.super Lorg/jivesoftware/smack/XMPPConnection;
.source "GoogleTalkConnection.java"


# direct methods
.method public constructor <init>()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 36
    const-string v0, "talk.google.com"

    const/16 v1, 0x1466

    const-string v2, "gmail.com"

    invoke-direct {p0, v0, v1, v2}, Lorg/jivesoftware/smack/XMPPConnection;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 37
    return-void
.end method
