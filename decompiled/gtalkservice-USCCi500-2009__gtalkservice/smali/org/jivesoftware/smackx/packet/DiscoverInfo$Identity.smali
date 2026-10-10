.class public Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
.super Ljava/lang/Object;
.source "DiscoverInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/packet/DiscoverInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Identity"
.end annotation


# instance fields
.field private category:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    .line 180
    iput-object p2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    .line 181
    return-void
.end method


# virtual methods
.method public getCategory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    return-object v0
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 219
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    .line 220
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 4

    .prologue
    const-string v3, "\""

    .line 223
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 224
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v1, "<identity category=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 225
    const-string v1, " name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 226
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 227
    const-string v1, " type=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 229
    :cond_0
    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 230
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
