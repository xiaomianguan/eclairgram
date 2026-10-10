.class Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;
.super Ljava/lang/Object;
.source "GTalkConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/GTalkConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectionLifeCycle"
.end annotation


# instance fields
.field mConnectionEvents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;",
            ">;"
        }
    .end annotation
.end field

.field mConnectionUptime:J

.field final synthetic this$0:Lcom/google/android/gtalkservice/GTalkConnection;


# direct methods
.method private constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 1

    .prologue
    .line 2425
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2426
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->mConnectionEvents:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;Lcom/google/android/gtalkservice/GTalkConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p2, "x1"    # Lcom/google/android/gtalkservice/GTalkConnection$1;

    .prologue
    .line 2425
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;)V

    return-void
.end method


# virtual methods
.method appendConnectionEvent(Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;)V
    .locals 1
    .param p1, "e"    # Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;

    .prologue
    .line 2430
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->mConnectionEvents:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2431
    return-void
.end method

.method dump(Ljava/io/PrintWriter;)V
    .locals 9
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    const-wide/16 v7, 0x3e8

    const-wide/16 v5, 0x0

    .line 2434
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->mConnectionEvents:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;

    .line 2435
    .local v0, "e":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
    const-string v3, "["

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2436
    invoke-virtual {v0, p1}, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;->dump(Ljava/io/PrintWriter;)V

    .line 2437
    const-string v3, "] "

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    .line 2440
    .end local v0    # "e":Lcom/google/android/gtalkservice/GTalkConnection$ConnectionEvent;
    :cond_0
    const-string v3, ""

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2442
    const/4 v2, 0x0

    .line 2444
    .local v2, "updateTimeStr":Ljava/lang/String;
    iget-wide v3, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->mConnectionUptime:J

    cmp-long v3, v3, v5

    if-lez v3, :cond_3

    .line 2445
    iget-wide v3, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->mConnectionUptime:J

    div-long/2addr v3, v7

    invoke-static {v3, v4}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v2

    .line 2451
    :cond_1
    :goto_1
    if-eqz v2, :cond_2

    .line 2452
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "connection uptime: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2454
    :cond_2
    return-void

    .line 2446
    :cond_3
    iget-object v3, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-static {v3}, Lcom/google/android/gtalkservice/GTalkConnection;->access$1200(Lcom/google/android/gtalkservice/GTalkConnection;)J

    move-result-wide v3

    cmp-long v3, v3, v5

    if-lez v3, :cond_1

    .line 2447
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-object v5, p0, Lcom/google/android/gtalkservice/GTalkConnection$ConnectionLifeCycle;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-static {v5}, Lcom/google/android/gtalkservice/GTalkConnection;->access$1200(Lcom/google/android/gtalkservice/GTalkConnection;)J

    move-result-wide v5

    sub-long/2addr v3, v5

    div-long/2addr v3, v7

    invoke-static {v3, v4}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method
