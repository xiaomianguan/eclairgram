.class public Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "PostAuthBatchQuery.java"


# static fields
.field public static final NAMESPACE:Ljava/lang/String; = "google:mobile:batchquery"

.field public static final NODE_NAME:Ljava/lang/String; = "query"


# instance fields
.field private mAvatarHash:Ljava/lang/String;

.field private mDeviceIdle:Z

.field private mOnline:Z

.field private mOtrEtag:Ljava/lang/String;

.field private mRosterEtag:Ljava/lang/String;

.field private mSharedStatusVersion:I

.field private mShowMobileIndicator:Z

.field private mVCardQueryStanzaId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 42
    return-void
.end method


# virtual methods
.method public getAvatarHash()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mAvatarHash:Ljava/lang/String;

    return-object v0
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 5

    .prologue
    const/16 v4, 0x22

    .line 110
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->isOnline()Z

    move-result v1

    .line 112
    .local v1, "isOnline":Z
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 113
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/16 v2, 0x3c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "query"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " xmlns=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "google:mobile:batchquery"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 115
    const-string v2, " presence="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz v1, :cond_7

    const-string v3, "\"available\""

    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 117
    if-eqz v1, :cond_6

    .line 118
    iget-boolean v2, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mDeviceIdle:Z

    if-eqz v2, :cond_0

    .line 119
    const-string v2, " device_idle=\"true\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 122
    :cond_0
    iget-boolean v2, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mShowMobileIndicator:Z

    if-eqz v2, :cond_1

    .line 123
    const-string v2, " mobile_indicator=\"true\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 126
    :cond_1
    iget v2, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mSharedStatusVersion:I

    if-eqz v2, :cond_2

    .line 127
    const-string v2, " shared_status_version=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mSharedStatusVersion:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    :cond_2
    iget-object v2, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mRosterEtag:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 131
    const-string v2, " roster_etag=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mRosterEtag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 134
    :cond_3
    iget-object v2, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mOtrEtag:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 135
    const-string v2, " otr_etag=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mOtrEtag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 138
    :cond_4
    iget-object v2, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mAvatarHash:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 139
    const-string v2, " avatar_hash=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mAvatarHash:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 142
    :cond_5
    iget-object v2, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mVCardQueryStanzaId:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 143
    const-string v2, " vcard_query_stanza_id=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mVCardQueryStanzaId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 147
    :cond_6
    const-string v2, "/>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 115
    :cond_7
    const-string v3, "\"unavailable\""

    goto/16 :goto_0
.end method

.method protected getExtensionProtoBuf()Lcom/google/common/io/protocol/ProtoBuf;
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 153
    new-instance v1, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v3, Lcom/google/android/gtalkservice/proto/GtalkCoreMessageTypes;->EXTENSION:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v1, v3}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 154
    .local v1, "extension":Lcom/google/common/io/protocol/ProtoBuf;
    const/16 v3, 0xb

    invoke-virtual {v1, v4, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 157
    new-instance v0, Lcom/google/common/io/protocol/ProtoBuf;

    sget-object v3, Lcom/google/android/gtalkservice/proto/GtalkExtensionsMessageTypes;->POST_AUTH_BATCH_QUERY:Lcom/google/common/io/protocol/ProtoBufType;

    invoke-direct {v0, v3}, Lcom/google/common/io/protocol/ProtoBuf;-><init>(Lcom/google/common/io/protocol/ProtoBufType;)V

    .line 158
    .local v0, "batchQuery":Lcom/google/common/io/protocol/ProtoBuf;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->isOnline()Z

    move-result v2

    .line 160
    .local v2, "isOnline":Z
    invoke-virtual {v0, v4, v2}, Lcom/google/common/io/protocol/ProtoBuf;->setBool(IZ)V

    .line 163
    if-eqz v2, :cond_6

    .line 164
    iget-boolean v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mDeviceIdle:Z

    if-eqz v3, :cond_0

    .line 165
    iget-boolean v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mDeviceIdle:Z

    invoke-virtual {v0, v5, v3}, Lcom/google/common/io/protocol/ProtoBuf;->setBool(IZ)V

    .line 170
    :cond_0
    iget-boolean v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mShowMobileIndicator:Z

    if-eqz v3, :cond_1

    .line 171
    const/4 v3, 0x3

    iget-boolean v4, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mShowMobileIndicator:Z

    invoke-virtual {v0, v3, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setBool(IZ)V

    .line 176
    :cond_1
    iget v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mSharedStatusVersion:I

    if-eqz v3, :cond_2

    .line 177
    const/4 v3, 0x4

    iget v4, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mSharedStatusVersion:I

    invoke-virtual {v0, v3, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setInt(II)V

    .line 182
    :cond_2
    iget-object v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mRosterEtag:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 183
    const/4 v3, 0x5

    iget-object v4, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mRosterEtag:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 188
    :cond_3
    iget-object v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mOtrEtag:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 189
    const/4 v3, 0x6

    iget-object v4, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mOtrEtag:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 194
    :cond_4
    iget-object v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mAvatarHash:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 195
    const/4 v3, 0x7

    iget-object v4, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mAvatarHash:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 200
    :cond_5
    iget-object v3, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mVCardQueryStanzaId:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 201
    const/16 v3, 0x8

    iget-object v4, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mVCardQueryStanzaId:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/google/common/io/protocol/ProtoBuf;->setString(ILjava/lang/String;)V

    .line 208
    :cond_6
    invoke-virtual {v1, v5, v0}, Lcom/google/common/io/protocol/ProtoBuf;->setProtoBuf(ILcom/google/common/io/protocol/ProtoBuf;)V

    .line 209
    return-object v1
.end method

.method public getOtrEtag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mOtrEtag:Ljava/lang/String;

    return-object v0
.end method

.method public getRosterEtag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mRosterEtag:Ljava/lang/String;

    return-object v0
.end method

.method public getSharedStatusVersion()I
    .locals 1

    .prologue
    .line 69
    iget v0, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mSharedStatusVersion:I

    return v0
.end method

.method public getShowMobileIndicator()Z
    .locals 1

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mShowMobileIndicator:Z

    return v0
.end method

.method public getVCardQueryStanzaId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mVCardQueryStanzaId:Ljava/lang/String;

    return-object v0
.end method

.method public isDeviceIdle()Z
    .locals 1

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mDeviceIdle:Z

    return v0
.end method

.method public isOnline()Z
    .locals 1

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mOnline:Z

    return v0
.end method

.method public setAvatarHash(Ljava/lang/String;)V
    .locals 0
    .param p1, "hash"    # Ljava/lang/String;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mAvatarHash:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public setDeviceIdle(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 57
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mDeviceIdle:Z

    .line 58
    return-void
.end method

.method public setIsOnline(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mOnline:Z

    .line 50
    return-void
.end method

.method public setOtrEtag(Ljava/lang/String;)V
    .locals 0
    .param p1, "etag"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mOtrEtag:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public setRosterEtag(Ljava/lang/String;)V
    .locals 0
    .param p1, "etag"    # Ljava/lang/String;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mRosterEtag:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setSharedStatusVersion(I)V
    .locals 0
    .param p1, "version"    # I

    .prologue
    .line 73
    iput p1, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mSharedStatusVersion:I

    .line 74
    return-void
.end method

.method public setShowMobileIndicator(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 65
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mShowMobileIndicator:Z

    .line 66
    return-void
.end method

.method public setVCardQUeryStanzaId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/google/android/gtalkservice/extensions/PostAuthBatchQuery;->mVCardQueryStanzaId:Ljava/lang/String;

    .line 106
    return-void
.end method
