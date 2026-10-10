.class public Lorg/jivesoftware/smack/sasl/SASLAnonymous;
.super Lorg/jivesoftware/smack/sasl/SASLMechanism;
.source "SASLAnonymous.java"


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/SASLAuthentication;)V
    .locals 0
    .param p1, "saslAuthentication"    # Lorg/jivesoftware/smack/SASLAuthentication;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/sasl/SASLMechanism;-><init>(Lorg/jivesoftware/smack/SASLAuthentication;)V

    .line 36
    return-void
.end method


# virtual methods
.method protected getAuthenticationText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;

    .prologue
    .line 44
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getChallengeResponse([B)Ljava/lang/String;
    .locals 1
    .param p1, "bytes"    # [B

    .prologue
    .line 50
    const-string v0, "anything"

    return-object v0
.end method

.method protected getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    const-string v0, "ANONYMOUS"

    return-object v0
.end method
