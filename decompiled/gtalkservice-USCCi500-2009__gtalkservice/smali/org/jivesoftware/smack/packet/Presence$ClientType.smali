.class public Lorg/jivesoftware/smack/packet/Presence$ClientType;
.super Ljava/lang/Object;
.source "Presence.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/packet/Presence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ClientType"
.end annotation


# static fields
.field public static final ANDROID:Lorg/jivesoftware/smack/packet/Presence$ClientType;

.field public static final MOBILE:Lorg/jivesoftware/smack/packet/Presence$ClientType;

.field private static final STR_ANDROID:Ljava/lang/String; = "android"

.field private static final STR_MOBILE:Ljava/lang/String; = "mobile"


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 538
    new-instance v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;

    const-string v1, "android"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Presence$ClientType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->ANDROID:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    .line 539
    new-instance v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;

    const-string v1, "mobile"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Presence$ClientType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->MOBILE:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 543
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 544
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->value:Ljava/lang/String;

    .line 545
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence$ClientType;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 556
    if-nez p0, :cond_0

    move-object v0, v1

    .line 567
    :goto_0
    return-object v0

    .line 560
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 561
    const-string v0, "android"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 562
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->ANDROID:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    goto :goto_0

    .line 564
    :cond_1
    const-string v0, "mobile"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 565
    sget-object v0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->MOBILE:Lorg/jivesoftware/smack/packet/Presence$ClientType;

    goto :goto_0

    :cond_2
    move-object v0, v1

    .line 567
    goto :goto_0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 548
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Presence$ClientType;->value:Ljava/lang/String;

    return-object v0
.end method
