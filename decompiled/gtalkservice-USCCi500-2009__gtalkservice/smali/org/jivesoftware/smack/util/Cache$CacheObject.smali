.class Lorg/jivesoftware/smack/util/Cache$CacheObject;
.super Ljava/lang/Object;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CacheObject"
.end annotation


# instance fields
.field public ageListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

.field public lastAccessedListNode:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

.field public object:Ljava/lang/Object;

.field public readCount:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 416
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 409
    const/4 v0, 0x0

    iput v0, p0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->readCount:I

    .line 417
    iput-object p1, p0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;

    .line 418
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 421
    if-ne p0, p1, :cond_0

    move v2, v5

    .line 434
    :goto_0
    return v2

    .line 424
    :cond_0
    instance-of v2, p1, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    if-nez v2, :cond_1

    move v2, v4

    .line 425
    goto :goto_0

    .line 428
    :cond_1
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    move-object v1, v0

    .line 430
    .local v1, "cacheObject":Lorg/jivesoftware/smack/util/Cache$CacheObject;
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;

    iget-object v3, v1, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    move v2, v4

    .line 431
    goto :goto_0

    :cond_2
    move v2, v5

    .line 434
    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 438
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method
