.class public final Landroid/provider/Gmail$MessageCursor;
.super Landroid/provider/Gmail$MailCursor;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Gmail;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MessageCursor"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mBccIndex:I

.field private mBodyEmbedsExternalResourcesIndex:I

.field private mBodyIndex:I

.field private mCcIndex:I

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mConversationIdIndex:I

.field private mDateReceivedMsIndex:I

.field private mDateSentMsIndex:I

.field private mErrorIndex:I

.field private mFromIndex:I

.field private mIdIndex:I

.field mInReplyToLocalMessageId:J

.field private mJoinedAttachmentInfosIndex:I

.field private mLabelIdsIndex:I

.field private mLabelIdsSplitter:Landroid/text/TextUtils$StringSplitter;

.field private mLabelMap:Landroid/provider/Gmail$LabelMap;

.field private mListInfoIndex:I

.field private mPersonalLevelIndex:I

.field mPreserveAttachments:Z

.field private mReplyToIndex:I

.field private mSnippetIndex:I

.field private mSubjectIndex:I

.field private mToIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1824
    const-class v0, Landroid/provider/Gmail;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Landroid/provider/Gmail$MessageCursor;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected constructor <init>(Landroid/content/ContentResolver;Ljava/lang/String;JZ)V
    .registers 7
    .param p1, "cr"    # Landroid/content/ContentResolver;
    .param p2, "account"    # Ljava/lang/String;
    .param p3, "inReplyToMessageId"    # J
    .param p5, "preserveAttachments"    # Z

    .prologue
    .line 1899
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Landroid/provider/Gmail$MailCursor;-><init>(Ljava/lang/String;Landroid/database/Cursor;)V

    .line 1856
    invoke-static {}, Landroid/provider/Gmail;->newMessageLabelIdsSplitter()Landroid/text/TextUtils$StringSplitter;

    move-result-object v0

    iput-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mLabelIdsSplitter:Landroid/text/TextUtils$StringSplitter;

    .line 1900
    iput-object p1, p0, Landroid/provider/Gmail$MessageCursor;->mContentResolver:Landroid/content/ContentResolver;

    .line 1901
    iput-wide p3, p0, Landroid/provider/Gmail$MessageCursor;->mInReplyToLocalMessageId:J

    .line 1902
    iput-boolean p5, p0, Landroid/provider/Gmail$MessageCursor;->mPreserveAttachments:Z

    .line 1903
    return-void
.end method

.method public constructor <init>(Landroid/provider/Gmail;Landroid/content/ContentResolver;Ljava/lang/String;Landroid/database/Cursor;)V
    .registers 7
    .param p1, "gmail"    # Landroid/provider/Gmail;
    .param p2, "cr"    # Landroid/content/ContentResolver;
    .param p3, "account"    # Ljava/lang/String;
    .param p4, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1859
    invoke-direct {p0, p3, p4}, Landroid/provider/Gmail$MailCursor;-><init>(Ljava/lang/String;Landroid/database/Cursor;)V

    .line 1856
    invoke-static {}, Landroid/provider/Gmail;->newMessageLabelIdsSplitter()Landroid/text/TextUtils$StringSplitter;

    move-result-object v0

    iput-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mLabelIdsSplitter:Landroid/text/TextUtils$StringSplitter;

    .line 1860
    invoke-virtual {p1, p3}, Landroid/provider/Gmail;->getLabelMap(Ljava/lang/String;)Landroid/provider/Gmail$LabelMap;

    move-result-object v0

    iput-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mLabelMap:Landroid/provider/Gmail$LabelMap;

    .line 1861
    if-nez p4, :cond_19

    .line 1862
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "null cursor passed to MessageCursor()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1866
    :cond_19
    iput-object p2, p0, Landroid/provider/Gmail$MessageCursor;->mContentResolver:Landroid/content/ContentResolver;

    .line 1868
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "_id"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mIdIndex:I

    .line 1869
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "conversation"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mConversationIdIndex:I

    .line 1871
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "subject"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mSubjectIndex:I

    .line 1872
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "snippet"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mSnippetIndex:I

    .line 1873
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "fromAddress"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mFromIndex:I

    .line 1874
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "toAddresses"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mToIndex:I

    .line 1875
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "ccAddresses"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mCcIndex:I

    .line 1876
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "bccAddresses"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mBccIndex:I

    .line 1877
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "replyToAddresses"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mReplyToIndex:I

    .line 1878
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "dateSentMs"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mDateSentMsIndex:I

    .line 1880
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "dateReceivedMs"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mDateReceivedMsIndex:I

    .line 1882
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "listInfo"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mListInfoIndex:I

    .line 1883
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "personalLevel"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mPersonalLevelIndex:I

    .line 1885
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "body"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mBodyIndex:I

    .line 1886
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "bodyEmbedsExternalResources"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mBodyEmbedsExternalResourcesIndex:I

    .line 1888
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "labelIds"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mLabelIdsIndex:I

    .line 1889
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "joinedAttachmentInfos"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mJoinedAttachmentInfosIndex:I

    .line 1891
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    const-string v1, "error"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Landroid/provider/Gmail$MessageCursor;->mErrorIndex:I

    .line 1893
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/provider/Gmail$MessageCursor;->mInReplyToLocalMessageId:J

    .line 1894
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/provider/Gmail$MessageCursor;->mPreserveAttachments:Z

    .line 1895
    return-void
.end method

.method private getAddresses(Ljava/lang/String;I)[Ljava/lang/String;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 1981
    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->getUpdateValues()Landroid/content/ContentValues;

    move-result-object v1

    .line 1983
    .local v1, "updated":Landroid/content/ContentValues;
    invoke-virtual {v1, p1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 1984
    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->getUpdateValues()Landroid/content/ContentValues;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1989
    .local v0, "addresses":Ljava/lang/String;
    :goto_14
    sget-object v2, Landroid/provider/Gmail;->EMAIL_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1986
    .end local v0    # "addresses":Ljava/lang/String;
    :cond_1b
    invoke-virtual {p0, p2}, Landroid/provider/Gmail$MessageCursor;->getStringInColumn(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "addresses":Ljava/lang/String;
    goto :goto_14
.end method


# virtual methods
.method public addOrRemoveLabel(Ljava/lang/String;Z)V
    .registers 11
    .param p1, "label"    # Ljava/lang/String;
    .param p2, "add"    # Z

    .prologue
    .line 2096
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Landroid/provider/Gmail$MessageCursor;->mAccount:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->getConversationId()J

    move-result-wide v2

    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->getMessageId()J

    move-result-wide v4

    move-object v6, p1

    move v7, p2

    invoke-static/range {v0 .. v7}, Landroid/provider/Gmail;->addOrRemoveLabelOnMessage(Landroid/content/ContentResolver;Ljava/lang/String;JJLjava/lang/String;Z)V

    .line 2098
    return-void
.end method

.method public getAttachmentInfos()Ljava/util/ArrayList;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/provider/Gmail$Attachment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2101
    invoke-static {}, Lcom/google/android/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v2

    .line 2103
    .local v2, "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/provider/Gmail$Attachment;>;"
    iget-object v7, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v8, p0, Landroid/provider/Gmail$MessageCursor;->mJoinedAttachmentInfosIndex:I

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 2104
    .local v5, "joinedAttachmentInfos":Ljava/lang/String;
    if-eqz v5, :cond_24

    .line 2106
    sget-object v7, Landroid/provider/Gmail;->ATTACHMENT_INFO_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    invoke-static {v5, v7}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_16
    if-ge v3, v6, :cond_24

    aget-object v4, v0, v3

    .line 2108
    .local v4, "joinedAttachmentInfo":Ljava/lang/String;
    invoke-static {v4}, Landroid/provider/Gmail$Attachment;->parseJoinedString(Ljava/lang/String;)Landroid/provider/Gmail$Attachment;

    move-result-object v1

    .line 2109
    .local v1, "attachment":Landroid/provider/Gmail$Attachment;
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2106
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 2112
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "attachment":Landroid/provider/Gmail$Attachment;
    .end local v3    # "i$":I
    .end local v4    # "joinedAttachmentInfo":Ljava/lang/String;
    .end local v6    # "len$":I
    :cond_24
    return-object v2
.end method

.method public getBccAddresses()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 2013
    const-string v0, "bccAddresses"

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mBccIndex:I

    invoke-direct {p0, v0, v1}, Landroid/provider/Gmail$MessageCursor;->getAddresses(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2059
    iget v0, p0, Landroid/provider/Gmail$MessageCursor;->mBodyIndex:I

    invoke-virtual {p0, v0}, Landroid/provider/Gmail$MessageCursor;->getStringInColumn(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBodyEmbedsExternalResources()Z
    .registers 3

    .prologue
    .line 2068
    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->checkCursor()V

    .line 2069
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mBodyEmbedsExternalResourcesIndex:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public getCcAddresses()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 2005
    const-string v0, "ccAddresses"

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mCcIndex:I

    invoke-direct {p0, v0, v1}, Landroid/provider/Gmail$MessageCursor;->getAddresses(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConversationId()J
    .registers 3

    .prologue
    .line 1945
    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->checkCursor()V

    .line 1946
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mConversationIdIndex:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDateReceivedMs()J
    .registers 3

    .prologue
    .line 2031
    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->checkCursor()V

    .line 2032
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mDateReceivedMsIndex:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDateSentMs()J
    .registers 3

    .prologue
    .line 2026
    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->checkCursor()V

    .line 2027
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mDateSentMsIndex:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getErrorText()Ljava/lang/String;
    .registers 3

    .prologue
    .line 2122
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mErrorIndex:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExpanded()Z
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2050
    const/4 v0, 0x1

    return v0
.end method

.method public getFromAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1974
    iget v0, p0, Landroid/provider/Gmail$MessageCursor;->mFromIndex:I

    invoke-virtual {p0, v0}, Landroid/provider/Gmail$MessageCursor;->getStringInColumn(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLabelIds()Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2076
    iget-object v1, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v2, p0, Landroid/provider/Gmail$MessageCursor;->mLabelIdsIndex:I

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2077
    .local v0, "labelNames":Ljava/lang/String;
    iget-object v1, p0, Landroid/provider/Gmail$MessageCursor;->mLabelIdsSplitter:Landroid/text/TextUtils$StringSplitter;

    invoke-interface {v1, v0}, Landroid/text/TextUtils$StringSplitter;->setString(Ljava/lang/String;)V

    .line 2078
    iget-object v1, p0, Landroid/provider/Gmail$MessageCursor;->mLabelIdsSplitter:Landroid/text/TextUtils$StringSplitter;

    invoke-static {v1}, Landroid/provider/Gmail;->getLabelIdsFromLabelIdsString(Landroid/text/TextUtils$StringSplitter;)Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public getListInfo()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2036
    iget v0, p0, Landroid/provider/Gmail$MessageCursor;->mListInfoIndex:I

    invoke-virtual {p0, v0}, Landroid/provider/Gmail$MessageCursor;->getStringInColumn(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMessageId()J
    .registers 3

    .prologue
    .line 1933
    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->checkCursor()V

    .line 1934
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mIdIndex:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getPersonalLevel()Landroid/provider/Gmail$PersonalLevel;
    .registers 4

    .prologue
    .line 2040
    invoke-virtual {p0}, Landroid/provider/Gmail$MessageCursor;->checkCursor()V

    .line 2041
    iget-object v1, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v2, p0, Landroid/provider/Gmail$MessageCursor;->mPersonalLevelIndex:I

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 2042
    .local v0, "personalLevelInt":I
    invoke-static {v0}, Landroid/provider/Gmail$PersonalLevel;->fromInt(I)Landroid/provider/Gmail$PersonalLevel;

    move-result-object v1

    return-object v1
.end method

.method public getRawLabelIds()Ljava/lang/String;
    .registers 3

    .prologue
    .line 2085
    iget-object v0, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mLabelIdsIndex:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getReplyToAddress()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 2022
    iget v0, p0, Landroid/provider/Gmail$MessageCursor;->mReplyToIndex:I

    invoke-virtual {p0, v0}, Landroid/provider/Gmail$MessageCursor;->getStringInColumn(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroid/provider/Gmail;->EMAIL_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSnippet()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1965
    iget v0, p0, Landroid/provider/Gmail$MessageCursor;->mSnippetIndex:I

    invoke-virtual {p0, v0}, Landroid/provider/Gmail$MessageCursor;->getStringInColumn(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatus()Landroid/provider/Gmail$CursorStatus;
    .registers 4

    .prologue
    .line 1911
    iget-object v2, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 1912
    .local v0, "extras":Landroid/os/Bundle;
    const-string v2, "status"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1913
    .local v1, "stringStatus":Ljava/lang/String;
    invoke-static {v1}, Landroid/provider/Gmail$CursorStatus;->valueOf(Ljava/lang/String;)Landroid/provider/Gmail$CursorStatus;

    move-result-object v2

    return-object v2
.end method

.method public getSubject()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1955
    iget v0, p0, Landroid/provider/Gmail$MessageCursor;->mSubjectIndex:I

    invoke-virtual {p0, v0}, Landroid/provider/Gmail$MessageCursor;->getStringInColumn(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getToAddresses()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 1997
    const-string v0, "toAddresses"

    iget v1, p0, Landroid/provider/Gmail$MessageCursor;->mToIndex:I

    invoke-direct {p0, v0, v1}, Landroid/provider/Gmail$MessageCursor;->getAddresses(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onCursorPositionChanged()V
    .registers 1

    .prologue
    .line 1907
    invoke-super {p0}, Landroid/provider/Gmail$MailCursor;->onCursorPositionChanged()V

    .line 1908
    return-void
.end method

.method public retry()V
    .registers 6

    .prologue
    .line 1918
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1919
    .local v0, "input":Landroid/os/Bundle;
    const-string v3, "command"

    const-string v4, "retry"

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1920
    iget-object v3, p0, Landroid/provider/Gmail$MessageCursor;->mCursor:Landroid/database/Cursor;

    invoke-interface {v3, v0}, Landroid/database/Cursor;->respond(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 1921
    .local v1, "output":Landroid/os/Bundle;
    const-string v3, "commandResponse"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1922
    .local v2, "response":Ljava/lang/String;
    sget-boolean v3, Landroid/provider/Gmail$MessageCursor;->$assertionsDisabled:Z

    if-nez v3, :cond_2a

    const-string v3, "ok"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 1923
    :cond_2a
    return-void
.end method
