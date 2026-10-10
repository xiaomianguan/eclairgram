.class public abstract Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "ProxiedImServiceLogin.java"


# static fields
.field public static final BIND:Ljava/lang/String; = "bind"

.field public static final LOGIN:Ljava/lang/String; = "enable"

.field public static final PASSWORD:Ljava/lang/String; = "password"

.field public static final SCREEN_NAME:Ljava/lang/String; = "screenname"


# instance fields
.field private mIsLogin:Z

.field private mPassword:Ljava/lang/String;

.field private mUsername:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 47
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 48
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 8

    .prologue
    const/16 v4, 0x3c

    const/16 v3, 0x3e

    const-string v7, "enable"

    const-string v6, "bind"

    const-string v5, "</"

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "bind"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    const-string v1, " xmlns"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->getNameSpace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "screenname"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->mUsername:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    const-string v1, "</"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "screenname"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "password"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->mPassword:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    const-string v1, "</"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "password"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "enable"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    iget-boolean v1, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->mIsLogin:Z

    if-eqz v1, :cond_0

    const-string v1, "true"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    const-string v1, "</"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "enable"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    const-string v1, "</"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "bind"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 105
    :cond_0
    const-string v1, "false"

    goto :goto_0
.end method

.method protected getExtensionProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 4

    .prologue
    .line 115
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->getChildElementXML()Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "xml":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 117
    const/4 v2, 0x0

    .line 123
    :goto_0
    return-object v2

    .line 119
    :cond_0
    new-instance v0, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v2, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->EXTENSION:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v0, v2}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 120
    .local v0, "extension":Lcom/google/common/io/protocol/ProtoBuf;
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 122
    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    move-object v2, v0

    .line 123
    goto :goto_0
.end method

.method public getIsLogin()Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->mIsLogin:Z

    return v0
.end method

.method public abstract getNameSpace()Ljava/lang/String;
.end method

.method public abstract getNameSpacePrefix()Ljava/lang/String;
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->mPassword:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->mUsername:Ljava/lang/String;

    return-object v0
.end method

.method public setIsLogin(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 78
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->mIsLogin:Z

    .line 79
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->mPassword:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 0
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLogin;->mUsername:Ljava/lang/String;

    .line 56
    return-void
.end method
