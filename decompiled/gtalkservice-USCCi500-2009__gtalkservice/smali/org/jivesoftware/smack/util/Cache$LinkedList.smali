.class Lorg/jivesoftware/smack/util/Cache$LinkedList;
.super Ljava/lang/Object;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LinkedList"
.end annotation


# instance fields
.field private head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 458
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 453
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    const-string v1, "head"

    invoke-direct {v0, v1, v2, v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;-><init>(Ljava/lang/Object;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 459
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v2, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v2, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 460
    return-void
.end method


# virtual methods
.method public addFirst(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .locals 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 509
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-direct {v0, p1, v1, v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;-><init>(Ljava/lang/Object;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)V

    .line 510
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 511
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 512
    return-object v0
.end method

.method public addFirst(Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .locals 1
    .param p1, "node"    # Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .prologue
    .line 494
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v0, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, p1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 495
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, p1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 496
    iget-object v0, p1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object p1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 497
    iget-object v0, p1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object p1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 498
    return-object p1
.end method

.method public addLast(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .locals 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 523
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-direct {v0, p1, v1, v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;-><init>(Ljava/lang/Object;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)V

    .line 524
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 525
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 526
    return-object v0
.end method

.method public clear()V
    .locals 4

    .prologue
    .line 534
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v0

    .line 535
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    :goto_0
    if-eqz v0, :cond_0

    .line 536
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 537
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v0

    goto :goto_0

    .line 541
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v3, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v3, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 542
    return-void
.end method

.method public getFirst()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .locals 2

    .prologue
    .line 468
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 469
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    if-ne v0, v1, :cond_0

    .line 470
    const/4 v1, 0x0

    .line 472
    :goto_0
    return-object v1

    :cond_0
    move-object v1, v0

    goto :goto_0
.end method

.method public getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .locals 2

    .prologue
    .line 481
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 482
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    if-ne v0, v1, :cond_0

    .line 483
    const/4 v1, 0x0

    .line 485
    :goto_0
    return-object v1

    :cond_0
    move-object v1, v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 551
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 552
    .local v1, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 553
    .local v0, "buf":Ljava/lang/StringBuffer;
    :goto_0
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    if-eq v1, v2, :cond_0

    .line 554
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 555
    iget-object v1, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    goto :goto_0

    .line 557
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
