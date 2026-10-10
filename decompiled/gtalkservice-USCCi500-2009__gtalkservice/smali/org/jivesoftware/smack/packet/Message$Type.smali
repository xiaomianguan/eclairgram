.class public Lorg/jivesoftware/smack/packet/Message$Type;
.super Ljava/lang/Object;
.source "Message.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/packet/Message;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Type"
.end annotation


# static fields
.field public static final CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

.field public static final ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

.field public static final GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

.field public static final HEADLINE:Lorg/jivesoftware/smack/packet/Message$Type;

.field public static final NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 489
    new-instance v0, Lorg/jivesoftware/smack/packet/Message$Type;

    const-string v1, "normal"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Message$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 494
    new-instance v0, Lorg/jivesoftware/smack/packet/Message$Type;

    const-string v1, "chat"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Message$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 499
    new-instance v0, Lorg/jivesoftware/smack/packet/Message$Type;

    const-string v1, "groupchat"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Message$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 504
    new-instance v0, Lorg/jivesoftware/smack/packet/Message$Type;

    const-string v1, "headline"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Message$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->HEADLINE:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 509
    new-instance v0, Lorg/jivesoftware/smack/packet/Message$Type;

    const-string v1, "error"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Message$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 541
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 542
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Message$Type;->value:Ljava/lang/String;

    .line 543
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Type;
    .locals 1
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    .line 518
    if-nez p0, :cond_0

    .line 519
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 535
    :goto_0
    return-object v0

    .line 521
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 522
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message$Type;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 523
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    goto :goto_0

    .line 525
    :cond_1
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message$Type;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 526
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    goto :goto_0

    .line 528
    :cond_2
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->HEADLINE:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message$Type;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 529
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->HEADLINE:Lorg/jivesoftware/smack/packet/Message$Type;

    goto :goto_0

    .line 531
    :cond_3
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message$Type;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 532
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->ERROR:Lorg/jivesoftware/smack/packet/Message$Type;

    goto :goto_0

    .line 535
    :cond_4
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->NORMAL:Lorg/jivesoftware/smack/packet/Message$Type;

    goto :goto_0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 546
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message$Type;->value:Ljava/lang/String;

    return-object v0
.end method
