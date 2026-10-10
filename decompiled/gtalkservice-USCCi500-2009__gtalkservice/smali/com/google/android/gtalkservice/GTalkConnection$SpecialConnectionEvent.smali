.class public Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;
.super Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
.source "GTalkConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/GTalkConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SpecialConnectionEvent"
.end annotation


# static fields
.field public static final CONNECTION_LOGIN_EVENT:I = 0x4

.field public static final CONNECTION_LOGOUT_EVENT:I = 0x5

.field public static final HEARTBEAT_TIMEOUT_EVENT:I = 0x1

.field public static final IM_LOGIN_EVENT:I = 0x2

.field public static final IM_LOGOUT_EVENT:I = 0x3


# instance fields
.field private mEventType:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "eventType"    # I

    .prologue
    .line 2587
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;-><init>()V

    .line 2588
    iput p1, p0, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;->mEventType:I

    .line 2589
    return-void
.end method


# virtual methods
.method dump(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 2592
    invoke-super {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;->dump(Ljava/io/PrintWriter;)V

    .line 2594
    iget v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$SpecialConnectionEvent;->mEventType:I

    packed-switch v0, :pswitch_data_0

    .line 2615
    :goto_0
    return-void

    .line 2596
    :pswitch_0
    const-string v0, "HEARTBEAT TIMEOUT"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 2600
    :pswitch_1
    const-string v0, "IM LOGIN"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 2604
    :pswitch_2
    const-string v0, "IM LOGOUT"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 2608
    :pswitch_3
    const-string v0, "LOGIN"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 2612
    :pswitch_4
    const-string v0, "LOGOUT"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 2594
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
