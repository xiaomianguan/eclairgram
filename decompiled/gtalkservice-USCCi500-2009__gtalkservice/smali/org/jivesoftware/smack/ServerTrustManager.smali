.class Lorg/jivesoftware/smack/ServerTrustManager;
.super Ljava/lang/Object;
.source "ServerTrustManager.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# instance fields
.field private configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

.field private server:Ljava/lang/String;

.field private trustStore:Ljava/security/KeyStore;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/ConnectionConfiguration;)V
    .locals 4
    .param p1, "server"    # Ljava/lang/String;
    .param p2, "configuration"    # Lorg/jivesoftware/smack/ConnectionConfiguration;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p2, p0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    .line 50
    iput-object p1, p0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    .line 53
    :try_start_0
    invoke-virtual {p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getTruststoreType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    .line 54
    iget-object v1, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getTruststorePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getTruststorePassword()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 60
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setVerifyRootCAEnabled(Z)V

    goto :goto_0
.end method

.method public static getPeerIdentity(Ljava/security/cert/X509Certificate;)Ljava/lang/String;
    .locals 3
    .param p0, "x509Certificate"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 174
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v1

    .line 176
    .local v1, "principalSubject":Ljava/security/Principal;
    invoke-interface {v1}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v0

    .line 177
    .local v0, "name":Ljava/lang/String;
    const-string v2, "CN="

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 179
    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 181
    :cond_0
    return-object v0
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # [Ljava/security/cert/X509Certificate;
    .param p2, "arg1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 70
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 16
    .param p1, "x509Certificates"    # [Ljava/security/cert/X509Certificate;
    .param p2, "arg1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 75
    move-object/from16 v0, p1

    array-length v0, v0

    move v5, v0

    .line 77
    .local v5, "nSize":I
    const/4 v13, 0x0

    aget-object v13, p1, v13

    invoke-static {v13}, Lorg/jivesoftware/smack/ServerTrustManager;->getPeerIdentity(Ljava/security/cert/X509Certificate;)Ljava/lang/String;

    move-result-object v6

    .line 79
    .local v6, "peerIdentity":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object v13, v0

    invoke-virtual {v13}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isVerifyChainEnabled()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 83
    const/4 v8, 0x0

    .line 84
    .local v8, "principalLast":Ljava/security/Principal;
    const/4 v13, 0x1

    sub-int v4, v5, v13

    .local v4, "i":I
    :goto_0
    if-ltz v4, :cond_2

    .line 85
    aget-object v12, p1, v4

    .line 86
    .local v12, "x509certificate":Ljava/security/cert/X509Certificate;
    invoke-virtual {v12}, Ljava/security/cert/X509Certificate;->getIssuerDN()Ljava/security/Principal;

    move-result-object v7

    .line 87
    .local v7, "principalIssuer":Ljava/security/Principal;
    invoke-virtual {v12}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v9

    .line 88
    .local v9, "principalSubject":Ljava/security/Principal;
    if-eqz v8, :cond_0

    .line 89
    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 91
    add-int/lit8 v13, v4, 0x1

    :try_start_0
    aget-object v13, p1, v13

    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v10

    .line 93
    .local v10, "publickey":Ljava/security/PublicKey;
    aget-object v13, p1, v4

    invoke-virtual {v13, v10}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;)V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .end local v10    # "publickey":Ljava/security/PublicKey;
    :cond_0
    move-object v8, v9

    .line 84
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 95
    :catch_0
    move-exception v13

    move-object v3, v13

    .line 96
    .local v3, "generalsecurityexception":Ljava/security/GeneralSecurityException;
    new-instance v13, Ljava/security/cert/CertificateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "signature verification failed of "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 101
    .end local v3    # "generalsecurityexception":Ljava/security/GeneralSecurityException;
    :cond_1
    new-instance v13, Ljava/security/cert/CertificateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "subject/issuer verification failed of "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 109
    .end local v4    # "i":I
    .end local v7    # "principalIssuer":Ljava/security/Principal;
    .end local v8    # "principalLast":Ljava/security/Principal;
    .end local v9    # "principalSubject":Ljava/security/Principal;
    .end local v12    # "x509certificate":Ljava/security/cert/X509Certificate;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object v13, v0

    invoke-virtual {v13}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isVerifyRootCAEnabled()Z

    move-result v13

    if-eqz v13, :cond_5

    .line 112
    const/4 v11, 0x0

    .line 114
    .local v11, "trusted":Z
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    move-object v13, v0

    const/4 v14, 0x1

    sub-int v14, v5, v14

    aget-object v14, p1, v14

    invoke-virtual {v13, v14}, Ljava/security/KeyStore;->getCertificateAlias(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_4

    const/4 v13, 0x1

    move v11, v13

    .line 115
    :goto_1
    if-nez v11, :cond_3

    const/4 v13, 0x1

    if-ne v5, v13, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object v13, v0

    invoke-virtual {v13}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSelfSignedCertificateEnabled()Z

    move-result v13

    if-eqz v13, :cond_3

    .line 117
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Accepting self-signed certificate of remote server: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/security/KeyStoreException; {:try_start_1 .. :try_end_1} :catch_1

    .line 119
    const/4 v11, 0x1

    .line 125
    :cond_3
    :goto_2
    if-nez v11, :cond_5

    .line 126
    new-instance v13, Ljava/security/cert/CertificateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "root certificate not trusted of "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 114
    :cond_4
    const/4 v13, 0x0

    move v11, v13

    goto :goto_1

    .line 122
    :catch_1
    move-exception v13

    move-object v2, v13

    .line 123
    .local v2, "e":Ljava/security/KeyStoreException;
    invoke-virtual {v2}, Ljava/security/KeyStoreException;->printStackTrace()V

    goto :goto_2

    .line 130
    .end local v2    # "e":Ljava/security/KeyStoreException;
    .end local v11    # "trusted":Z
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object v13, v0

    invoke-virtual {v13}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isNotMatchingDomainCheckEnabled()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 134
    const-string v13, "*."

    invoke-virtual {v6, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 136
    const/4 v13, 0x2

    invoke-virtual {v6, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 138
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    move-object v13, v0

    invoke-virtual {v13, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_7

    .line 139
    new-instance v13, Ljava/security/cert/CertificateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "target verification failed of "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 142
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    move-object v13, v0

    invoke-virtual {v13, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_7

    .line 143
    new-instance v13, Ljava/security/cert/CertificateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "target verification failed of "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 147
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object v13, v0

    invoke-virtual {v13}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isExpiredCertificatesCheckEnabled()Z

    move-result v13

    if-eqz v13, :cond_8

    .line 150
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 151
    .local v1, "date":Ljava/util/Date;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_3
    if-ge v4, v5, :cond_8

    .line 153
    :try_start_2
    aget-object v13, p1, v4

    invoke-virtual {v13, v1}, Ljava/security/cert/X509Certificate;->checkValidity(Ljava/util/Date;)V
    :try_end_2
    .catch Ljava/security/GeneralSecurityException; {:try_start_2 .. :try_end_2} :catch_2

    .line 151
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 155
    :catch_2
    move-exception v13

    move-object v3, v13

    .line 156
    .restart local v3    # "generalsecurityexception":Ljava/security/GeneralSecurityException;
    new-instance v13, Ljava/security/cert/CertificateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "invalid date of "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    move-object v15, v0

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 161
    .end local v1    # "date":Ljava/util/Date;
    .end local v3    # "generalsecurityexception":Ljava/security/GeneralSecurityException;
    .end local v4    # "i":I
    :cond_8
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/security/cert/X509Certificate;

    return-object v0
.end method
