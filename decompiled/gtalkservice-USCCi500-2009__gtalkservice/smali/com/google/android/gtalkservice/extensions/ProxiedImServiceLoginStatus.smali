.class public abstract Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "ProxiedImServiceLoginStatus.java"


# static fields
.field public static final STATUS:Ljava/lang/String; = "status"

.field private static final STR_STATUS_AUTH_EXPIRED:Ljava/lang/String; = "auth-expired"

.field private static final STR_STATUS_NEED_PASSWORD:Ljava/lang/String; = "password"

.field private static final STR_STATUS_OFFLINE:Ljava/lang/String; = "offline"

.field private static final STR_STATUS_OFFLINE_OTHER:Ljava/lang/String; = "offline-other"

.field private static final STR_STATUS_OFFLINE_RATELIMIT:Ljava/lang/String; = "offline-ratelimit"

.field private static final STR_STATUS_ONLINE:Ljava/lang/String; = "online"


# instance fields
.field mStatus:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    return-void
.end method

.method private getStatusString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    const-string v0, "unknown"

    return-object v0
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 5

    .prologue
    const-string v4, "status"

    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;->getNameSpacePrefix()Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "nsPrefix":Ljava/lang/String;
    const-string v2, "<"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    const-string v2, "status"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    const-string v2, " xmlns:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;->getNameSpace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    const-string v2, "\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-direct {p0}, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;->getStatusString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    const-string v2, "</"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "status"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x3e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method protected getExtensionProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 2

    .prologue
    .line 79
    const-string v0, "GTalkService"

    const-string v1, "[ProxiedImServiceLoginStatus] the client should not be serializing this protobuf!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    invoke-super {p0}, Lorg/jivesoftware/smack/packet/IQ;->getExtensionProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;

    move-result-object v0

    return-object v0
.end method

.method public abstract getNameSpace()Ljava/lang/String;
.end method

.method public abstract getNameSpacePrefix()Ljava/lang/String;
.end method

.method public getStatus()I
    .locals 1

    .prologue
    .line 39
    iget v0, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;->mStatus:I

    return v0
.end method

.method public setStatus(I)V
    .locals 0
    .param p1, "status"    # I

    .prologue
    .line 43
    iput p1, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;->mStatus:I

    .line 44
    return-void
.end method

.method public setStatusString(Ljava/lang/String;)V
    .locals 1
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;->mStatus:I

    .line 49
    return-void
.end method
