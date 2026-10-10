.class public abstract Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatusProvider;
.super Ljava/lang/Object;
.source "ProxiedImServiceLoginStatusProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract createLoginStatus(Ljava/lang/String;)Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;
.end method

.method public abstract getProtoBufType()Lcom/google/common/io/protocol/ProtoBufType;
.end method

.method public abstract getTag()I
.end method

.method public abstract parseIQ(Lcom/google/common/io/protocol/ProtoBuf;)Lorg/jivesoftware/smack/packet/IQ;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 2
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 33
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 34
    .local v0, "event":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 35
    const/4 v1, 0x0

    .line 42
    :goto_0
    return-object v1

    .line 37
    :cond_1
    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 42
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatusProvider;->createLoginStatus(Ljava/lang/String;)Lcom/google/android/gtalkservice/extensions/ProxiedImServiceLoginStatus;

    move-result-object v1

    goto :goto_0
.end method
