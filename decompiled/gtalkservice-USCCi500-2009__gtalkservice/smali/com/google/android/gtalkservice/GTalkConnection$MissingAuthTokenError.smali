.class Lcom/google/android/gtalkservice/GTalkConnection$MissingAuthTokenError;
.super Lorg/jivesoftware/smack/packet/XMPPError;
.source "GTalkConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/GTalkConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MissingAuthTokenError"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/GTalkConnection;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;I)V
    .locals 0
    .param p2, "code"    # I

    .prologue
    .line 248
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection$MissingAuthTokenError;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 249
    invoke-direct {p0, p2}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(I)V

    .line 250
    return-void
.end method

.method public constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;ILjava/lang/String;)V
    .locals 0
    .param p2, "code"    # I
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 252
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection$MissingAuthTokenError;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 253
    invoke-direct {p0, p2, p3}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(ILjava/lang/String;)V

    .line 254
    return-void
.end method
