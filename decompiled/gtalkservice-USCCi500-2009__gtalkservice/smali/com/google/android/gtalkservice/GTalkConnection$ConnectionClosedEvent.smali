.class Lcom/google/android/gtalkservice/GTalkConnection$ConnectionClosedEvent;
.super Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
.source "GTalkConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/GTalkConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConnectionClosedEvent"
.end annotation


# instance fields
.field private mError:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .param p1, "error"    # I

    .prologue
    .line 2567
    invoke-direct {p0}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;-><init>()V

    .line 2568
    iput p1, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionClosedEvent;->mError:I

    .line 2569
    return-void
.end method


# virtual methods
.method dump(Ljava/io/PrintWriter;)V
    .locals 2
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 2572
    invoke-super {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;->dump(Ljava/io/PrintWriter;)V

    .line 2573
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CONN_CLOSED, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionClosedEvent;->mError:I

    invoke-static {v1}, Lcom/google/android/gtalkservice/ConnectionError;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2574
    return-void
.end method
