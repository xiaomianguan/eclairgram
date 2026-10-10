.class public Lcom/google/android/gtalkservice/extensions/DataMessageExtension;
.super Ljava/lang/Object;
.source "DataMessageExtension.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# static fields
.field static final APP_DATA_ELEM:Ljava/lang/String; = "app-data"

.field static final APP_DATA_KEY:Ljava/lang/String; = "key"

.field static final APP_DATA_VALUE:Ljava/lang/String; = "value"

.field static final CATEGORY_ATTR:Ljava/lang/String; = "category"

.field public static final ELEMENT:Ljava/lang/String; = "data"

.field public static final NAMESPACE_URI:Ljava/lang/String; = "google:mobile:data"

.field static final TOKEN_ATTR:Ljava/lang/String; = "token"


# instance fields
.field private final mMessage:Lorg/jivesoftware/smack/packet/DataMessage;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Intent;)V
    .locals 1
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "broadcastIntent"    # Landroid/content/Intent;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, 0x0

    invoke-static {v0, p1, p2}, Lorg/jivesoftware/smack/packet/DataMessage;->create(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)Lorg/jivesoftware/smack/packet/DataMessage;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/extensions/DataMessageExtension;->mMessage:Lorg/jivesoftware/smack/packet/DataMessage;

    .line 49
    return-void
.end method


# virtual methods
.method public getDataMessage()Lorg/jivesoftware/smack/packet/DataMessage;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/DataMessageExtension;->mMessage:Lorg/jivesoftware/smack/packet/DataMessage;

    return-object v0
.end method

.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    const-string v0, "data"

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    const-string v0, "google:mobile:data"

    return-object v0
.end method

.method public toProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 2

    .prologue
    .line 68
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "should never be called"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/DataMessageExtension;->mMessage:Lorg/jivesoftware/smack/packet/DataMessage;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/DataMessage;->getExtensionsXML()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
