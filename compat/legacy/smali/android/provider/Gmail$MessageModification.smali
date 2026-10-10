.class public Landroid/provider/Gmail$MessageModification;
.super Ljava/lang/Object;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessageModification"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 2131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static joinedAttachmentsString(Ljava/util/List;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/provider/Gmail$Attachment;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 2237
    .local p0, "attachments":Ljava/util/List;, "Ljava/util/List<Landroid/provider/Gmail$Attachment;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 2238
    .local v1, "attachmentsSb":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/provider/Gmail$Attachment;

    .line 2239
    .local v0, "attachment":Landroid/provider/Gmail$Attachment;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_20

    .line 2240
    const-string v3, "\n"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2242
    :cond_20
    invoke-virtual {v0}, Landroid/provider/Gmail$Attachment;->toJoinedString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 2244
    .end local v0    # "attachment":Landroid/provider/Gmail$Attachment;
    :cond_28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static putAttachments(Landroid/content/ContentValues;Ljava/util/List;)V
    .registers 4
    .param p0, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentValues;",
            "Ljava/util/List",
            "<",
            "Landroid/provider/Gmail$Attachment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2190
    .local p1, "attachments":Ljava/util/List;, "Ljava/util/List<Landroid/provider/Gmail$Attachment;>;"
    const-string v0, "joinedAttachmentInfos"

    invoke-static {p1}, Landroid/provider/Gmail$MessageModification;->joinedAttachmentsString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2192
    return-void
.end method

.method public static putBccAddresses(Landroid/content/ContentValues;[Ljava/lang/String;)V
    .registers 4
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "bccAddresses"    # [Ljava/lang/String;

    .prologue
    .line 2170
    const-string v0, "bccAddresses"

    const-string v1, "\n"

    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2171
    return-void
.end method

.method public static putBody(Landroid/content/ContentValues;Ljava/lang/String;)V
    .registers 3
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 2180
    const-string v0, "body"

    invoke-virtual {p0, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2181
    return-void
.end method

.method public static putCcAddresses(Landroid/content/ContentValues;[Ljava/lang/String;)V
    .registers 4
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "ccAddresses"    # [Ljava/lang/String;

    .prologue
    .line 2160
    const-string v0, "ccAddresses"

    const-string v1, "\n"

    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2161
    return-void
.end method

.method public static putSubject(Landroid/content/ContentValues;Ljava/lang/String;)V
    .registers 3
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 2140
    const-string v0, "subject"

    invoke-virtual {p0, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2141
    return-void
.end method

.method public static putToAddresses(Landroid/content/ContentValues;[Ljava/lang/String;)V
    .registers 4
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "toAddresses"    # [Ljava/lang/String;

    .prologue
    .line 2150
    const-string v0, "toAddresses"

    const-string v1, "\n"

    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2151
    return-void
.end method

.method public static sendOrSaveExistingMessage(Landroid/content/ContentResolver;Ljava/lang/String;JLandroid/content/ContentValues;Z)V
    .registers 10
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "messageId"    # J
    .param p4, "updateValues"    # Landroid/content/ContentValues;
    .param p5, "save"    # Z

    .prologue
    const/4 v3, 0x0

    .line 2226
    const-string v1, "save"

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 2227
    const-string v1, "refMessageId"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2228
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "content://gmail-ls/messages/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 2230
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {p0, v0, p4, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2231
    return-void
.end method

.method public static sendOrSaveNewMessage(Landroid/content/ContentResolver;Ljava/lang/String;Landroid/content/ContentValues;JZ)J
    .registers 10
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "refMessageId"    # J
    .param p5, "save"    # Z

    .prologue
    .line 2207
    const-string v2, "save"

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 2208
    const-string v2, "refMessageId"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2209
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "content://gmail-ls/messages/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 2210
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {p0, v1, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    .line 2211
    .local v0, "result":Landroid/net/Uri;
    invoke-static {v0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    return-wide v2
.end method
