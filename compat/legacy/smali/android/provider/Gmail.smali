.class public final Landroid/provider/Gmail;
.super Ljava/lang/Object;
.source "Gmail.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/provider/Gmail$1;,
        Landroid/provider/Gmail$ConversationCursor;,
        Landroid/provider/Gmail$MessageModification;,
        Landroid/provider/Gmail$MessageCursor;,
        Landroid/provider/Gmail$CursorStatus;,
        Landroid/provider/Gmail$Attachment;,
        Landroid/provider/Gmail$AttachmentOrigin;,
        Landroid/provider/Gmail$AttachmentColumns;,
        Landroid/provider/Gmail$AttachmentRendition;,
        Landroid/provider/Gmail$PersonalLevel;,
        Landroid/provider/Gmail$LabelMap;,
        Landroid/provider/Gmail$LabelCursor;,
        Landroid/provider/Gmail$MailCursorObserver;,
        Landroid/provider/Gmail$MailCursor;,
        Landroid/provider/Gmail$Settings;,
        Landroid/provider/Gmail$BecomeActiveNetworkCursor;,
        Landroid/provider/Gmail$SelectionArguments;,
        Landroid/provider/Gmail$SettingsColumns;,
        Landroid/provider/Gmail$LabelColumns;,
        Landroid/provider/Gmail$MessageColumns;,
        Landroid/provider/Gmail$ConversationColumns;,
        Landroid/provider/Gmail$CommaStringSplitter;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final ATTACHMENT_INFO_SEPARATOR:Ljava/lang/String; = "\n"

.field public static final ATTACHMENT_INFO_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

.field public static final AUTHORITY:Ljava/lang/String; = "gmail-ls"

.field private static final AUTHORITY_PLUS_CONVERSATIONS:Ljava/lang/String; = "content://gmail-ls/conversations/"

.field private static final AUTHORITY_PLUS_LABELS:Ljava/lang/String; = "content://gmail-ls/labels/"

.field private static final AUTHORITY_PLUS_MESSAGES:Ljava/lang/String; = "content://gmail-ls/messages/"

.field private static final AUTHORITY_PLUS_SETTINGS:Ljava/lang/String; = "content://gmail-ls/settings/"

.field public static final BASE_URI:Landroid/net/Uri;

.field public static final COMMAND_ACTIVATE:Ljava/lang/String; = "activate"

.field public static final COMMAND_RESPONSE_OK:Ljava/lang/String; = "ok"

.field public static final COMMAND_RESPONSE_UNKNOWN:Ljava/lang/String; = "unknownCommand"

.field public static final COMMAND_RETRY:Ljava/lang/String; = "retry"

.field public static final COMMAND_SET_VISIBLE:Ljava/lang/String; = "setVisible"

.field private static final COMMA_SEPARATOR:C = ','

.field public static final COMMA_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

.field private static final CONVERSATIONS_URI:Landroid/net/Uri;

.field private static CONVERSATION_PROJECTION:[Ljava/lang/String; = null

.field private static final DEBUG:Z = false

.field public static final EMAIL_SEPARATOR:Ljava/lang/String; = "\n"

.field public static final EMAIL_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

.field public static final EXTRA_STATUS:Ljava/lang/String; = "status"

.field public static final GMAIL_AUTH_SERVICE:Ljava/lang/String; = "mail"

.field public static final INSERT_PARAM_ATTACHMENT_ORIGIN:Ljava/lang/String; = "origin"

.field public static final INSERT_PARAM_ATTACHMENT_ORIGIN_EXTRAS:Ljava/lang/String; = "originExtras"

.field private static final LABELS_URI:Landroid/net/Uri;

.field public static final LABEL_ALL:Ljava/lang/String; = "^all"

.field public static final LABEL_CACHED:Ljava/lang/String; = "^^cached"

.field public static final LABEL_CHAT:Ljava/lang/String; = "^b"

.field public static final LABEL_DRAFT:Ljava/lang/String; = "^r"

.field public static final LABEL_IGNORED:Ljava/lang/String; = "^g"

.field public static final LABEL_INBOX:Ljava/lang/String; = "^i"

.field public static final LABEL_OUTBOX:Ljava/lang/String; = "^^out"

.field private static LABEL_PROJECTION:[Ljava/lang/String; = null

.field public static final LABEL_SENT:Ljava/lang/String; = "^f"

.field public static final LABEL_SPAM:Ljava/lang/String; = "^s"

.field public static final LABEL_STARRED:Ljava/lang/String; = "^t"

.field public static final LABEL_TRASH:Ljava/lang/String; = "^k"

.field public static final LABEL_UNREAD:Ljava/lang/String; = "^u"

.field public static final LABEL_VOICEMAIL:Ljava/lang/String; = "^vm"

.field public static final LABEL_VOICEMAIL_INBOX:Ljava/lang/String; = "^^vmi"

.field private static MESSAGE_PROJECTION:[Ljava/lang/String; = null

.field private static final NAME_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

.field public static final PROVIDER_CHANGED_EXTRA_ACCOUNT:Ljava/lang/String; = "account"

.field public static final PROVIDER_CHANGED_EXTRA_COUNT:Ljava/lang/String; = "count"

.field public static final PROVIDER_CHANGED_EXTRA_GET_ATTENTION:Ljava/lang/String; = "getAttention"

.field public static final PROVIDER_CHANGED_EXTRA_TAG_LABEL:Ljava/lang/String; = "tagLabel"

.field public static final RESPOND_INPUT_COMMAND:Ljava/lang/String; = "command"

.field public static final RESPOND_OUTPUT_COMMAND_RESPONSE:Ljava/lang/String; = "commandResponse"

.field public static final SENDER_LIST_SEPARATOR:Ljava/lang/Character;

.field public static final SENDER_LIST_TOKEN_ELIDED:Ljava/lang/String; = "e"

.field public static final SENDER_LIST_TOKEN_LITERAL:Ljava/lang/String; = "l"

.field public static final SENDER_LIST_TOKEN_NUM_DRAFTS:Ljava/lang/String; = "d"

.field public static final SENDER_LIST_TOKEN_NUM_MESSAGES:Ljava/lang/String; = "n"

.field public static final SENDER_LIST_TOKEN_SENDING:Ljava/lang/String; = "s"

.field public static final SENDER_LIST_TOKEN_SEND_FAILED:Ljava/lang/String; = "f"

.field private static SETTINGS_PROJECTION:[Ljava/lang/String; = null

.field private static final SETTINGS_URI:Landroid/net/Uri;

.field public static final SET_VISIBLE_PARAM_VISIBLE:Ljava/lang/String; = "visible"

.field private static final SPACE_SEPARATOR:C = ' '

.field public static final SPACE_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String; = "Gmail"

.field private static final UNNAMED_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

.field private static final USER_SETTABLE_BUILTIN_LABELS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sPriorityToLength:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static sSenderFragments:[Ljava/lang/String;

.field public static final sSenderListSplitter:Landroid/text/TextUtils$SimpleStringSplitter;


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mLabelMaps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Landroid/provider/Gmail$LabelMap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 62
    const-class v0, Landroid/provider/Gmail;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_17d

    move v0, v4

    :goto_e
    sput-boolean v0, Landroid/provider/Gmail;->$assertionsDisabled:Z

    .line 96
    const-string v0, "content://gmail-ls"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->BASE_URI:Landroid/net/Uri;

    .line 98
    const-string v0, "content://gmail-ls/labels/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->LABELS_URI:Landroid/net/Uri;

    .line 100
    const-string v0, "content://gmail-ls/conversations/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->CONVERSATIONS_URI:Landroid/net/Uri;

    .line 102
    const-string v0, "content://gmail-ls/settings/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->SETTINGS_URI:Landroid/net/Uri;

    .line 107
    const-string v0, "\n"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->EMAIL_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    .line 113
    const-string v0, " "

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->SPACE_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    .line 127
    const-string v0, ","

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->COMMA_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    .line 131
    const-string v0, "\n"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->ATTACHMENT_INFO_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    .line 134
    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->SENDER_LIST_SEPARATOR:Ljava/lang/Character;

    .line 157
    const-string v0, "\"(.*)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->NAME_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

    .line 158
    const-string v0, "([^<]+)@"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->UNNAMED_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

    .line 160
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->sPriorityToLength:Ljava/util/Map;

    .line 161
    new-instance v0, Landroid/text/TextUtils$SimpleStringSplitter;

    sget-object v1, Landroid/provider/Gmail;->SENDER_LIST_SEPARATOR:Ljava/lang/Character;

    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v1

    invoke-direct {v0, v1}, Landroid/text/TextUtils$SimpleStringSplitter;-><init>(C)V

    sput-object v0, Landroid/provider/Gmail;->sSenderListSplitter:Landroid/text/TextUtils$SimpleStringSplitter;

    .line 163
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Landroid/provider/Gmail;->sSenderFragments:[Ljava/lang/String;

    .line 213
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "^i"

    aput-object v1, v0, v3

    const-string v1, "^u"

    aput-object v1, v0, v4

    const-string v1, "^k"

    aput-object v1, v0, v5

    const-string v1, "^s"

    aput-object v1, v0, v6

    const-string v1, "^t"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "^g"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/collect/Sets;->newHashSet([Ljava/lang/Object;)Ljava/util/HashSet;

    move-result-object v0

    sput-object v0, Landroid/provider/Gmail;->USER_SETTABLE_BUILTIN_LABELS:Ljava/util/Set;

    .line 396
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "subject"

    aput-object v1, v0, v4

    const-string v1, "snippet"

    aput-object v1, v0, v5

    const-string v1, "fromAddress"

    aput-object v1, v0, v6

    const-string v1, "date"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "personalLevel"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "labelIds"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "numMessages"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "maxMessageId"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "hasAttachments"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "hasMessagesWithErrors"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "forceAllUnread"

    aput-object v2, v0, v1

    sput-object v0, Landroid/provider/Gmail;->CONVERSATION_PROJECTION:[Ljava/lang/String;

    .line 409
    const/16 v0, 0x13

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "messageId"

    aput-object v1, v0, v4

    const-string v1, "conversation"

    aput-object v1, v0, v5

    const-string v1, "subject"

    aput-object v1, v0, v6

    const-string v1, "snippet"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "fromAddress"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "toAddresses"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "ccAddresses"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "bccAddresses"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "replyToAddresses"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "dateSentMs"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "dateReceivedMs"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "listInfo"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "personalLevel"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "body"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "bodyEmbedsExternalResources"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "labelIds"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "joinedAttachmentInfos"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "error"

    aput-object v2, v0, v1

    sput-object v0, Landroid/provider/Gmail;->MESSAGE_PROJECTION:[Ljava/lang/String;

    .line 429
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "canonicalName"

    aput-object v1, v0, v4

    const-string v1, "name"

    aput-object v1, v0, v5

    const-string v1, "numConversations"

    aput-object v1, v0, v6

    const-string v1, "numUnreadConversations"

    aput-object v1, v0, v7

    sput-object v0, Landroid/provider/Gmail;->LABEL_PROJECTION:[Ljava/lang/String;

    .line 435
    new-array v0, v7, [Ljava/lang/String;

    const-string v1, "labelsIncluded"

    aput-object v1, v0, v3

    const-string v1, "labelsPartial"

    aput-object v1, v0, v4

    const-string v1, "conversationAgeDays"

    aput-object v1, v0, v5

    const-string v1, "maxAttachmentSize"

    aput-object v1, v0, v6

    sput-object v0, Landroid/provider/Gmail;->SETTINGS_PROJECTION:[Ljava/lang/String;

    return-void

    :cond_17d
    move v0, v3

    .line 62
    goto/16 :goto_e
.end method

.method public constructor <init>(Landroid/content/ContentResolver;)V
    .registers 3
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;

    .prologue
    .line 444
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1611
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Landroid/provider/Gmail;->mLabelMaps:Ljava/util/Map;

    .line 445
    iput-object p1, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    .line 446
    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-static {p0}, Landroid/provider/Gmail;->toNonnullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200()Landroid/net/Uri;
    .registers 1

    .prologue
    .line 62
    sget-object v0, Landroid/provider/Gmail;->LABELS_URI:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$300()[Ljava/lang/String;
    .registers 1

    .prologue
    .line 62
    sget-object v0, Landroid/provider/Gmail;->LABEL_PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method public static addOrRemoveLabelOnMessage(Landroid/content/ContentResolver;Ljava/lang/String;JJLjava/lang/String;Z)V
    .registers 8
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "conversationId"    # J
    .param p4, "messageId"    # J
    .param p6, "label"    # Ljava/lang/String;
    .param p7, "add"    # Z

    .prologue
    .line 669
    if-eqz p7, :cond_37

    .line 670
    new-instance p2, Ljava/lang/StringBuilder;

    .end local p2    # "conversationId":J
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "content://gmail-ls/messages/"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .end local p1    # "account":Ljava/lang/String;
    const-string p2, "/"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "/labels"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 672
    .local p1, "uri":Landroid/net/Uri;
    new-instance p2, Landroid/content/ContentValues;

    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    .line 673
    .local p2, "values":Landroid/content/ContentValues;
    const-string p3, "canonicalName"

    invoke-virtual {p2, p3, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 674
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 687
    .end local p2    # "values":Landroid/content/ContentValues;
    .end local p6    # "label":Ljava/lang/String;
    :goto_36
    return-void

    .line 678
    .local p1, "account":Ljava/lang/String;
    .local p2, "conversationId":J
    .restart local p6    # "label":Ljava/lang/String;
    :cond_37
    :try_start_37
    const-string p2, "utf-8"

    .end local p2    # "conversationId":J
    invoke-static {p6, p2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_3c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_37 .. :try_end_3c} :catch_6e

    move-result-object p2

    .line 682
    .local p2, "encodedLabel":Ljava/lang/String;
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p6, "content://gmail-ls/messages/"

    .end local p6    # "label":Ljava/lang/String;
    invoke-virtual {p3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .end local p1    # "account":Ljava/lang/String;
    const-string p3, "/"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, "/labels/"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 685
    .local p1, "uri":Landroid/net/Uri;
    const/4 p2, 0x0

    const/4 p3, 0x0

    invoke-virtual {p0, p1, p2, p3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_36

    .line 679
    .end local p2    # "encodedLabel":Ljava/lang/String;
    .local p1, "account":Ljava/lang/String;
    .restart local p6    # "label":Ljava/lang/String;
    :catch_6e
    move-exception p0

    .line 680
    .local p0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance p1, Ljava/lang/RuntimeException;

    .end local p1    # "account":Ljava/lang/String;
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static getAttachmentDownloadUri(Landroid/net/Uri;)Landroid/net/Uri;
    .registers 4
    .param p0, "attachmentUri"    # Landroid/net/Uri;

    .prologue
    .line 1809
    const-string v0, "content"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 1810
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Uri\'s scheme must be \'content\': "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1812
    :cond_25
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "download"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static getAttachmentUri(Ljava/lang/String;JLandroid/provider/Gmail$Attachment;Landroid/provider/Gmail$AttachmentRendition;Z)Landroid/net/Uri;
    .registers 8
    .param p0, "account"    # Ljava/lang/String;
    .param p1, "messageId"    # J
    .param p3, "attachment"    # Landroid/provider/Gmail$Attachment;
    .param p4, "rendition"    # Landroid/provider/Gmail$AttachmentRendition;
    .param p5, "saveToSd"    # Z

    .prologue
    .line 1780
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1781
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "account is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1783
    :cond_e
    iget-object v0, p3, Landroid/provider/Gmail$Attachment;->origin:Landroid/provider/Gmail$AttachmentOrigin;

    sget-object v1, Landroid/provider/Gmail$AttachmentOrigin;->LOCAL_FILE:Landroid/provider/Gmail$AttachmentOrigin;

    if-ne v0, v1, :cond_1b

    .line 1784
    iget-object v0, p3, Landroid/provider/Gmail$Attachment;->originExtras:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 1786
    :goto_1a
    return-object v0

    :cond_1b
    const-string v0, "content://gmail-ls/messages/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "attachments"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object v1, p3, Landroid/provider/Gmail$Attachment;->partId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p4}, Landroid/provider/Gmail$AttachmentRendition;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-static {p5}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    goto :goto_1a
.end method

.method public static getCanonicalNamesFromLabelIdsString(Landroid/provider/Gmail$LabelMap;Landroid/text/TextUtils$StringSplitter;)Ljava/util/Set;
    .registers 10
    .param p0, "labelMap"    # Landroid/provider/Gmail$LabelMap;
    .param p1, "splitter"    # Landroid/text/TextUtils$StringSplitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/provider/Gmail$LabelMap;",
            "Landroid/text/TextUtils$StringSplitter;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 249
    invoke-static {}, Lcom/google/android/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v1

    .line 250
    .local v1, "canonicalNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-static {p1}, Landroid/provider/Gmail;->getLabelIdsFromLabelIdsString(Landroid/text/TextUtils$StringSplitter;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_43

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 251
    .local v3, "labelId":J
    invoke-virtual {p0, v3, v4}, Landroid/provider/Gmail$LabelMap;->getCanonicalName(J)Ljava/lang/String;

    move-result-object v0

    .line 254
    .local v0, "canonicalName":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2a

    .line 255
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 257
    :cond_2a
    const-string v5, "Gmail"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getCanonicalNamesFromLabelIdsString skipping label id: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 260
    .end local v0    # "canonicalName":Ljava/lang/String;
    .end local v3    # "labelId":J
    :cond_43
    return-object v1
.end method

.method public static getEmailFromAddressString(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "addressString"    # Ljava/lang/String;

    .prologue
    .line 194
    move-object v1, p0

    .line 195
    .local v1, "result":Ljava/lang/String;
    sget-object v2, Landroid/text/util/Regex;->EMAIL_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 196
    .local v0, "match":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 197
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 200
    :cond_19
    return-object v1
.end method

.method public static getLabelIdsFromLabelIdsString(Landroid/text/TextUtils$StringSplitter;)Ljava/util/Set;
    .registers 5
    .param p0, "splitter"    # Landroid/text/TextUtils$StringSplitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/TextUtils$StringSplitter;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 237
    invoke-static {}, Lcom/google/android/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v2

    .line 238
    .local v2, "labelIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-interface {p0}, Landroid/text/TextUtils$StringSplitter;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 239
    .local v1, "labelIdString":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 241
    .end local v1    # "labelIdString":Ljava/lang/String;
    :cond_1c
    return-object v2
.end method

.method public static getLabelIdsStringFromLabelIds(Ljava/util/Set;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p0, "labelIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    const/16 v4, 0x2c

    .line 297
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 298
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 299
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 300
    .local v1, "labelId":Ljava/lang/Long;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 301
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_e

    .line 303
    .end local v1    # "labelId":Ljava/lang/Long;
    :cond_21
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getNameFromAddressString(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "addressString"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 172
    sget-object v3, Landroid/provider/Gmail;->NAME_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 173
    .local v1, "namedAddressMatch":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_25

    .line 174
    invoke-virtual {v1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 175
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_19

    move-object v3, v0

    .line 185
    .end local v0    # "name":Ljava/lang/String;
    :goto_18
    return-object v3

    .line 176
    .restart local v0    # "name":Ljava/lang/String;
    :cond_19
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 180
    .end local v0    # "name":Ljava/lang/String;
    :cond_25
    sget-object v3, Landroid/provider/Gmail;->UNNAMED_ADDRESS_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 181
    .local v2, "unnamedAddressMatch":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_36

    .line 182
    invoke-virtual {v2, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_18

    :cond_36
    move-object v3, p0

    .line 185
    goto :goto_18
.end method

.method private static getSelectionArguments(Landroid/provider/Gmail$BecomeActiveNetworkCursor;)[Ljava/lang/String;
    .registers 4
    .param p0, "becomeActiveNetworkCursor"    # Landroid/provider/Gmail$BecomeActiveNetworkCursor;

    .prologue
    .line 501
    sget-object v0, Landroid/provider/Gmail$BecomeActiveNetworkCursor;->NO:Landroid/provider/Gmail$BecomeActiveNetworkCursor;

    if-ne v0, p0, :cond_d

    .line 502
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SELECTION_ARGUMENT_DO_NOT_BECOME_ACTIVE_NETWORK_CURSOR"

    aput-object v2, v0, v1

    .line 505
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public static getSenderSnippet(Ljava/lang/String;Landroid/text/SpannableStringBuilder;ILandroid/text/style/CharacterStyle;Landroid/text/style/CharacterStyle;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)V
    .registers 30
    .param p0, "instructions"    # Ljava/lang/String;
    .param p1, "sb"    # Landroid/text/SpannableStringBuilder;
    .param p2, "maxChars"    # I
    .param p3, "unreadStyle"    # Landroid/text/style/CharacterStyle;
    .param p4, "draftsStyle"    # Landroid/text/style/CharacterStyle;
    .param p5, "meString"    # Ljava/lang/CharSequence;
    .param p6, "draftString"    # Ljava/lang/CharSequence;
    .param p7, "draftPluralString"    # Ljava/lang/CharSequence;
    .param p8, "sendingString"    # Ljava/lang/CharSequence;
    .param p9, "sendFailedString"    # Ljava/lang/CharSequence;
    .param p10, "forceAllUnread"    # Z
    .param p11, "forceAllRead"    # Z

    .prologue
    .line 835
    sget-boolean v5, Landroid/provider/Gmail;->$assertionsDisabled:Z

    if-nez v5, :cond_e

    if-eqz p10, :cond_e

    if-eqz p11, :cond_e

    new-instance p0, Ljava/lang/AssertionError;

    .end local p0    # "instructions":Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 836
    .restart local p0    # "instructions":Ljava/lang/String;
    :cond_e
    if-nez p10, :cond_12

    if-eqz p11, :cond_69

    :cond_12
    const/16 p11, 0x1

    move/from16 v15, p11

    .line 837
    .end local p11    # "forceAllRead":Z
    .local v15, "unreadStatusIsForced":Z
    :goto_16
    move/from16 p11, p10

    .line 841
    .local p11, "forcedUnreadStatus":Z
    sget-object v12, Landroid/provider/Gmail;->sPriorityToLength:Ljava/util/Map;

    .line 842
    .local v12, "priorityToLength":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-interface {v12}, Ljava/util/Map;->clear()V

    .line 844
    const/high16 v6, -0x80000000

    .line 845
    .local v6, "maxFoundPriority":I
    const/4 v10, 0x0

    .line 846
    .local v10, "numMessages":I
    const/4 v7, 0x0

    .line 847
    .local v7, "numDrafts":I
    const-string p10, ""

    .line 848
    .local p10, "draftsFragment":Ljava/lang/CharSequence;
    const-string v13, ""

    .line 849
    .local v13, "sendingFragment":Ljava/lang/CharSequence;
    const-string v11, ""

    .line 851
    .local v11, "sendFailedFragment":Ljava/lang/CharSequence;
    sget-object v5, Landroid/provider/Gmail;->sSenderListSplitter:Landroid/text/TextUtils$SimpleStringSplitter;

    move-object v0, v5

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/text/TextUtils$SimpleStringSplitter;->setString(Ljava/lang/String;)V

    .line 852
    const/4 v8, 0x0

    .line 853
    .local v8, "numFragments":I
    sget-object v5, Landroid/provider/Gmail;->sSenderFragments:[Ljava/lang/String;

    .line 854
    .local v5, "fragments":[Ljava/lang/String;
    move-object v0, v5

    array-length v0, v0

    move/from16 p0, v0

    .local p0, "currentSize":I
    move v9, v8

    .line 855
    .end local v8    # "numFragments":I
    .local v9, "numFragments":I
    :goto_37
    sget-object v8, Landroid/provider/Gmail;->sSenderListSplitter:Landroid/text/TextUtils$SimpleStringSplitter;

    invoke-virtual {v8}, Landroid/text/TextUtils$SimpleStringSplitter;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6e

    .line 856
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "numFragments":I
    .restart local v8    # "numFragments":I
    sget-object v14, Landroid/provider/Gmail;->sSenderListSplitter:Landroid/text/TextUtils$SimpleStringSplitter;

    invoke-virtual {v14}, Landroid/text/TextUtils$SimpleStringSplitter;->next()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v5, v9

    .line 857
    move v0, v8

    move/from16 v1, p0

    if-ne v0, v1, :cond_3d1

    .line 858
    mul-int/lit8 v9, p0, 0x2

    new-array v9, v9, [Ljava/lang/String;

    sput-object v9, Landroid/provider/Gmail;->sSenderFragments:[Ljava/lang/String;

    .line 859
    const/4 v9, 0x0

    sget-object v14, Landroid/provider/Gmail;->sSenderFragments:[Ljava/lang/String;

    const/16 v16, 0x0

    move-object v0, v5

    move v1, v9

    move-object v2, v14

    move/from16 v3, v16

    move/from16 v4, p0

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 860
    mul-int/lit8 p0, p0, 0x2

    .line 861
    sget-object v5, Landroid/provider/Gmail;->sSenderFragments:[Ljava/lang/String;

    move v9, v8

    .end local v8    # "numFragments":I
    .restart local v9    # "numFragments":I
    goto :goto_37

    .line 836
    .end local v5    # "fragments":[Ljava/lang/String;
    .end local v6    # "maxFoundPriority":I
    .end local v7    # "numDrafts":I
    .end local v9    # "numFragments":I
    .end local v10    # "numMessages":I
    .end local v11    # "sendFailedFragment":Ljava/lang/CharSequence;
    .end local v12    # "priorityToLength":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v13    # "sendingFragment":Ljava/lang/CharSequence;
    .end local v15    # "unreadStatusIsForced":Z
    .local p0, "instructions":Ljava/lang/String;
    .local p10, "forceAllUnread":Z
    .local p11, "forceAllRead":Z
    :cond_69
    const/16 p11, 0x0

    move/from16 v15, p11

    goto :goto_16

    .line 865
    .restart local v5    # "fragments":[Ljava/lang/String;
    .restart local v6    # "maxFoundPriority":I
    .restart local v7    # "numDrafts":I
    .restart local v9    # "numFragments":I
    .restart local v10    # "numMessages":I
    .restart local v11    # "sendFailedFragment":Ljava/lang/CharSequence;
    .restart local v12    # "priorityToLength":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .restart local v13    # "sendingFragment":Ljava/lang/CharSequence;
    .restart local v15    # "unreadStatusIsForced":Z
    .local p0, "currentSize":I
    .local p10, "draftsFragment":Ljava/lang/CharSequence;
    .local p11, "forcedUnreadStatus":Z
    :cond_6e
    const/16 p0, 0x0

    .local p0, "i":I
    move-object v14, v13

    .end local v13    # "sendingFragment":Ljava/lang/CharSequence;
    .local v14, "sendingFragment":Ljava/lang/CharSequence;
    move v8, v7

    .end local v7    # "numDrafts":I
    .local v8, "numDrafts":I
    move-object v13, v11

    .end local v11    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local v13, "sendFailedFragment":Ljava/lang/CharSequence;
    move v7, v6

    .end local v6    # "maxFoundPriority":I
    .local v7, "maxFoundPriority":I
    move/from16 v17, p0

    .end local p0    # "i":I
    .local v17, "i":I
    move-object/from16 p0, p10

    .local p0, "draftsFragment":Ljava/lang/Object;
    move/from16 p10, v17

    .end local v17    # "i":I
    .end local p0    # "draftsFragment":Ljava/lang/Object;
    .local p10, "i":I
    :goto_7a
    move/from16 v0, p10

    move v1, v9

    if-ge v0, v1, :cond_199

    .line 866
    add-int/lit8 v6, p10, 0x1

    .end local p10    # "i":I
    .local v6, "i":I
    aget-object p10, v5, p10

    .line 867
    .local p10, "fragment0":Ljava/lang/String;
    const-string v11, ""

    move-object v0, v11

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9b

    move/from16 p10, v6

    .end local v6    # "i":I
    .local p10, "i":I
    move-object v11, v14

    .end local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .local v11, "sendingFragment":Ljava/lang/CharSequence;
    move v6, v7

    .end local v7    # "maxFoundPriority":I
    .local v6, "maxFoundPriority":I
    move v7, v8

    .end local v8    # "numDrafts":I
    .local v7, "numDrafts":I
    move v8, v10

    .end local v10    # "numMessages":I
    .local v8, "numMessages":I
    move-object v10, v13

    .end local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local v10, "sendFailedFragment":Ljava/lang/CharSequence;
    :goto_95
    move-object v13, v10

    .end local v10    # "sendFailedFragment":Ljava/lang/CharSequence;
    .restart local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    move-object v14, v11

    .end local v11    # "sendingFragment":Ljava/lang/CharSequence;
    .restart local v14    # "sendingFragment":Ljava/lang/CharSequence;
    move v10, v8

    .end local v8    # "numMessages":I
    .local v10, "numMessages":I
    move v8, v7

    .end local v7    # "numDrafts":I
    .local v8, "numDrafts":I
    move v7, v6

    .line 893
    .end local v6    # "maxFoundPriority":I
    .local v7, "maxFoundPriority":I
    goto :goto_7a

    .line 869
    .local v6, "i":I
    .local p10, "fragment0":Ljava/lang/String;
    :cond_9b
    const-string v11, "e"

    move-object v0, v11

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_ae

    move/from16 p10, v6

    .end local v6    # "i":I
    .local p10, "i":I
    move-object v11, v14

    .end local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .restart local v11    # "sendingFragment":Ljava/lang/CharSequence;
    move v6, v7

    .end local v7    # "maxFoundPriority":I
    .local v6, "maxFoundPriority":I
    move v7, v8

    .end local v8    # "numDrafts":I
    .local v7, "numDrafts":I
    move v8, v10

    .end local v10    # "numMessages":I
    .local v8, "numMessages":I
    move-object v10, v13

    .end local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local v10, "sendFailedFragment":Ljava/lang/CharSequence;
    goto :goto_95

    .line 871
    .end local v11    # "sendingFragment":Ljava/lang/CharSequence;
    .local v6, "i":I
    .local v7, "maxFoundPriority":I
    .local v8, "numDrafts":I
    .local v10, "numMessages":I
    .restart local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .restart local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .local p10, "fragment0":Ljava/lang/String;
    :cond_ae
    const-string v11, "n"

    move-object v0, v11

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_ce

    .line 872
    add-int/lit8 p10, v6, 0x1

    .end local v6    # "i":I
    .local p10, "i":I
    aget-object v6, v5, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .end local v10    # "numMessages":I
    .local v6, "numMessages":I
    move-object v10, v13

    .end local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local v10, "sendFailedFragment":Ljava/lang/CharSequence;
    move-object v11, v14

    .end local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .restart local v11    # "sendingFragment":Ljava/lang/CharSequence;
    move/from16 v17, v8

    .end local v8    # "numDrafts":I
    .local v17, "numDrafts":I
    move v8, v6

    .end local v6    # "numMessages":I
    .local v8, "numMessages":I
    move v6, v7

    .end local v7    # "maxFoundPriority":I
    .local v6, "maxFoundPriority":I
    move/from16 v7, v17

    .end local v17    # "numDrafts":I
    .local v7, "numDrafts":I
    goto :goto_95

    .line 873
    .end local v11    # "sendingFragment":Ljava/lang/CharSequence;
    .local v6, "i":I
    .local v7, "maxFoundPriority":I
    .local v8, "numDrafts":I
    .local v10, "numMessages":I
    .restart local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .restart local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .local p10, "fragment0":Ljava/lang/String;
    :cond_ce
    const-string v11, "d"

    move-object v0, v11

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_116

    .line 874
    add-int/lit8 p10, v6, 0x1

    .end local v6    # "i":I
    .local p10, "i":I
    aget-object p0, v5, v6

    .line 875
    .local p0, "numDraftsString":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 876
    .end local v8    # "numDrafts":I
    .local v6, "numDrafts":I
    const/4 v8, 0x1

    if-ne v6, v8, :cond_ef

    move-object/from16 p0, p6

    .local p0, "draftsFragment":Ljava/lang/CharSequence;
    :goto_e6
    move-object v11, v14

    .end local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .restart local v11    # "sendingFragment":Ljava/lang/CharSequence;
    move v8, v10

    .end local v10    # "numMessages":I
    .local v8, "numMessages":I
    move-object v10, v13

    .end local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local v10, "sendFailedFragment":Ljava/lang/CharSequence;
    move/from16 v17, v6

    .end local v6    # "numDrafts":I
    .restart local v17    # "numDrafts":I
    move v6, v7

    .end local v7    # "maxFoundPriority":I
    .local v6, "maxFoundPriority":I
    move/from16 v7, v17

    .line 878
    .end local v17    # "numDrafts":I
    .local v7, "numDrafts":I
    goto :goto_95

    .line 876
    .end local v8    # "numMessages":I
    .end local v11    # "sendingFragment":Ljava/lang/CharSequence;
    .local v6, "numDrafts":I
    .local v7, "maxFoundPriority":I
    .local v10, "numMessages":I
    .restart local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .restart local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .local p0, "numDraftsString":Ljava/lang/String;
    :cond_ef
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    move-object v0, v8

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, " ("

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object v0, v8

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .end local p0    # "numDraftsString":Ljava/lang/String;
    const-string v8, ")"

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_e6

    .line 878
    .local v6, "i":I
    .local v8, "numDrafts":I
    .local p10, "fragment0":Ljava/lang/String;
    :cond_116
    const-string v11, "l"

    move-object v0, v11

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_131

    .line 879
    add-int/lit8 p0, v6, 0x1

    .end local v6    # "i":I
    .local p0, "i":I
    aget-object p0, v5, v6

    .end local p0    # "i":I
    invoke-static/range {p0 .. p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p0

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1006
    .end local v7    # "maxFoundPriority":I
    .end local v8    # "numDrafts":I
    .end local v10    # "numMessages":I
    .end local v12    # "priorityToLength":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local p2    # "maxChars":I
    .end local p4    # "draftsStyle":Landroid/text/style/CharacterStyle;
    .end local p6    # "draftString":Ljava/lang/CharSequence;
    .end local p7    # "draftPluralString":Ljava/lang/CharSequence;
    .end local p8    # "sendingString":Ljava/lang/CharSequence;
    .end local p9    # "sendFailedString":Ljava/lang/CharSequence;
    .end local p10    # "fragment0":Ljava/lang/String;
    :cond_130
    :goto_130
    return-void

    .line 881
    .restart local v6    # "i":I
    .restart local v7    # "maxFoundPriority":I
    .restart local v8    # "numDrafts":I
    .restart local v10    # "numMessages":I
    .restart local v12    # "priorityToLength":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .restart local p2    # "maxChars":I
    .restart local p4    # "draftsStyle":Landroid/text/style/CharacterStyle;
    .restart local p6    # "draftString":Ljava/lang/CharSequence;
    .restart local p7    # "draftPluralString":Ljava/lang/CharSequence;
    .restart local p8    # "sendingString":Ljava/lang/CharSequence;
    .restart local p9    # "sendFailedString":Ljava/lang/CharSequence;
    .restart local p10    # "fragment0":Ljava/lang/String;
    :cond_131
    const-string v11, "s"

    move-object v0, v11

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_148

    .line 882
    move-object/from16 p10, p8

    .end local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .local p10, "sendingFragment":Ljava/lang/CharSequence;
    move-object/from16 v11, p10

    .end local p10    # "sendingFragment":Ljava/lang/CharSequence;
    .restart local v11    # "sendingFragment":Ljava/lang/CharSequence;
    move/from16 p10, v6

    .end local v6    # "i":I
    .local p10, "i":I
    move v6, v7

    .end local v7    # "maxFoundPriority":I
    .local v6, "maxFoundPriority":I
    move v7, v8

    .end local v8    # "numDrafts":I
    .local v7, "numDrafts":I
    move v8, v10

    .end local v10    # "numMessages":I
    .local v8, "numMessages":I
    move-object v10, v13

    .end local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local v10, "sendFailedFragment":Ljava/lang/CharSequence;
    goto/16 :goto_95

    .line 883
    .end local v11    # "sendingFragment":Ljava/lang/CharSequence;
    .local v6, "i":I
    .local v7, "maxFoundPriority":I
    .local v8, "numDrafts":I
    .local v10, "numMessages":I
    .restart local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .restart local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .local p10, "fragment0":Ljava/lang/String;
    :cond_148
    const-string v11, "f"

    move-object v0, v11

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p10

    .end local p10    # "fragment0":Ljava/lang/String;
    if-eqz p10, :cond_161

    .line 884
    move-object/from16 p10, p9

    .end local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local p10, "sendFailedFragment":Ljava/lang/CharSequence;
    move-object v11, v14

    .end local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .restart local v11    # "sendingFragment":Ljava/lang/CharSequence;
    move-object/from16 v17, p10

    .end local p10    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local v17, "sendFailedFragment":Ljava/lang/CharSequence;
    move/from16 p10, v6

    .end local v6    # "i":I
    .local p10, "i":I
    move v6, v7

    .end local v7    # "maxFoundPriority":I
    .local v6, "maxFoundPriority":I
    move v7, v8

    .end local v8    # "numDrafts":I
    .local v7, "numDrafts":I
    move v8, v10

    .end local v10    # "numMessages":I
    .local v8, "numMessages":I
    move-object/from16 v10, v17

    .end local v17    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local v10, "sendFailedFragment":Ljava/lang/CharSequence;
    goto/16 :goto_95

    .line 886
    .end local v11    # "sendingFragment":Ljava/lang/CharSequence;
    .end local p10    # "i":I
    .local v6, "i":I
    .local v7, "maxFoundPriority":I
    .local v8, "numDrafts":I
    .local v10, "numMessages":I
    .restart local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .restart local v14    # "sendingFragment":Ljava/lang/CharSequence;
    :cond_161
    add-int/lit8 p10, v6, 0x1

    .end local v6    # "i":I
    .restart local p10    # "i":I
    aget-object v11, v5, v6

    .line 887
    .local v11, "priorityString":Ljava/lang/String;
    add-int/lit8 v6, p10, 0x1

    .end local p10    # "i":I
    .restart local v6    # "i":I
    aget-object p10, v5, p10

    .line 888
    .local p10, "nameString":Ljava/lang/CharSequence;
    invoke-interface/range {p10 .. p10}, Ljava/lang/CharSequence;->length()I

    move-result v16

    if-nez v16, :cond_171

    move-object/from16 p10, p5

    .line 889
    :cond_171
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .line 890
    .local v11, "priority":I
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-interface/range {p10 .. p10}, Ljava/lang/CharSequence;->length()I

    move-result p10

    .end local p10    # "nameString":Ljava/lang/CharSequence;
    invoke-static/range {p10 .. p10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p10

    move-object v0, v12

    move-object/from16 v1, v16

    move-object/from16 v2, p10

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 891
    invoke-static {v7, v11}, Ljava/lang/Math;->max(II)I

    move-result p10

    .end local v7    # "maxFoundPriority":I
    .local p10, "maxFoundPriority":I
    move-object v11, v14

    .end local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .local v11, "sendingFragment":Ljava/lang/CharSequence;
    move v7, v8

    .end local v8    # "numDrafts":I
    .local v7, "numDrafts":I
    move v8, v10

    .end local v10    # "numMessages":I
    .local v8, "numMessages":I
    move-object v10, v13

    .end local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .local v10, "sendFailedFragment":Ljava/lang/CharSequence;
    move/from16 v17, v6

    .end local v6    # "i":I
    .local v17, "i":I
    move/from16 v6, p10

    .end local p10    # "maxFoundPriority":I
    .local v6, "maxFoundPriority":I
    move/from16 p10, v17

    .end local v17    # "i":I
    .local p10, "i":I
    goto/16 :goto_95

    .line 894
    .end local v6    # "maxFoundPriority":I
    .end local v11    # "sendingFragment":Ljava/lang/CharSequence;
    .local v7, "maxFoundPriority":I
    .local v8, "numDrafts":I
    .local v10, "numMessages":I
    .restart local v13    # "sendFailedFragment":Ljava/lang/CharSequence;
    .restart local v14    # "sendingFragment":Ljava/lang/CharSequence;
    :cond_199
    if-eqz v10, :cond_2ce

    new-instance p6, Ljava/lang/StringBuilder;

    .end local p6    # "draftString":Ljava/lang/CharSequence;
    invoke-direct/range {p6 .. p6}, Ljava/lang/StringBuilder;-><init>()V

    const-string p7, " ("

    .end local p7    # "draftPluralString":Ljava/lang/CharSequence;
    invoke-virtual/range {p6 .. p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    add-int p7, v10, v8

    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p7

    invoke-virtual/range {p6 .. p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    const-string p7, ")"

    invoke-virtual/range {p6 .. p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p6

    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p6

    move-object/from16 p10, p6

    .line 898
    .local p10, "numMessagesFragment":Ljava/lang/String;
    :goto_1bc
    const/16 p6, 0x0

    .line 899
    .local p6, "fixedFragment":Landroid/text/SpannableStringBuilder;
    const/16 p7, 0x0

    .line 900
    .local p7, "fixedFragmentLength":I
    invoke-interface/range {p0 .. p0}, Ljava/lang/CharSequence;->length()I

    move-result p8

    .end local p8    # "sendingString":Ljava/lang/CharSequence;
    if-eqz p8, :cond_1ef

    .line 901
    if-nez p6, :cond_1cd

    .line 902
    new-instance p6, Landroid/text/SpannableStringBuilder;

    .end local p6    # "fixedFragment":Landroid/text/SpannableStringBuilder;
    invoke-direct/range {p6 .. p6}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 904
    .restart local p6    # "fixedFragment":Landroid/text/SpannableStringBuilder;
    :cond_1cd
    move-object/from16 v0, p6

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 905
    if-eqz p4, :cond_1ef

    .line 906
    invoke-static/range {p4 .. p4}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object p0

    const/16 p4, 0x0

    invoke-virtual/range {p6 .. p6}, Landroid/text/SpannableStringBuilder;->length()I

    .end local p4    # "draftsStyle":Landroid/text/style/CharacterStyle;
    move-result p8

    const/16 p9, 0x21

    move-object/from16 v0, p6

    move-object/from16 v1, p0

    move/from16 v2, p4

    move/from16 v3, p8

    move/from16 v4, p9

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .end local p9    # "sendFailedString":Ljava/lang/CharSequence;
    :cond_1ef
    move-object/from16 p0, p6

    .line 911
    .end local p6    # "fixedFragment":Landroid/text/SpannableStringBuilder;
    .local p0, "fixedFragment":Landroid/text/SpannableStringBuilder;
    invoke-interface {v14}, Ljava/lang/CharSequence;->length()I

    move-result p4

    if-eqz p4, :cond_213

    .line 912
    if-nez p0, :cond_1fe

    .line 913
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .end local p0    # "fixedFragment":Landroid/text/SpannableStringBuilder;
    invoke-direct/range {p0 .. p0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 915
    .restart local p0    # "fixedFragment":Landroid/text/SpannableStringBuilder;
    :cond_1fe
    invoke-virtual/range {p0 .. p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p4

    if-eqz p4, :cond_20d

    const-string p4, ", "

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 916
    :cond_20d
    move-object/from16 v0, p0

    move-object v1, v14

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 918
    :cond_213
    invoke-interface {v13}, Ljava/lang/CharSequence;->length()I

    move-result p4

    if-eqz p4, :cond_235

    .line 919
    if-nez p0, :cond_220

    .line 920
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .end local p0    # "fixedFragment":Landroid/text/SpannableStringBuilder;
    invoke-direct/range {p0 .. p0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 922
    .restart local p0    # "fixedFragment":Landroid/text/SpannableStringBuilder;
    :cond_220
    invoke-virtual/range {p0 .. p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p4

    if-eqz p4, :cond_22f

    const-string p4, ", "

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 923
    :cond_22f
    move-object/from16 v0, p0

    move-object v1, v13

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :cond_235
    move-object/from16 p4, p0

    .line 926
    .end local p0    # "fixedFragment":Landroid/text/SpannableStringBuilder;
    .local p4, "fixedFragment":Landroid/text/SpannableStringBuilder;
    if-eqz p4, :cond_3cd

    .line 927
    invoke-virtual/range {p4 .. p4}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p0

    .end local p7    # "fixedFragmentLength":I
    .local p0, "fixedFragmentLength":I
    move/from16 p6, p0

    .line 930
    .end local p0    # "fixedFragmentLength":I
    .local p6, "fixedFragmentLength":I
    :goto_23f
    invoke-virtual/range {p10 .. p10}, Ljava/lang/String;->length()I

    move-result p0

    if-nez p0, :cond_24c

    const/high16 p0, -0x80000000

    move v0, v7

    move/from16 v1, p0

    if-eq v0, v1, :cond_2d4

    :cond_24c
    const/16 p0, 0x1

    .line 932
    .local p0, "normalMessagesExist":Z
    :goto_24e
    const-string p7, ""

    .line 933
    .local p7, "preFixedFragement":Ljava/lang/String;
    if-eqz p0, :cond_3c9

    if-eqz p6, :cond_3c9

    .line 934
    const-string p0, ", "

    .end local p7    # "preFixedFragement":Ljava/lang/String;
    .local p0, "preFixedFragement":Ljava/lang/String;
    move-object/from16 v8, p0

    .line 936
    .end local p0    # "preFixedFragement":Ljava/lang/String;
    .local v8, "preFixedFragement":Ljava/lang/String;
    :goto_258
    const/16 p0, -0x1

    .line 937
    .local p0, "maxPriorityToInclude":I
    invoke-virtual/range {p10 .. p10}, Ljava/lang/String;->length()I

    move-result p7

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result p8

    add-int p7, p7, p8

    add-int p7, p7, p6

    .line 939
    .local p7, "numCharsUsed":I
    const/16 p8, 0x0

    .local p8, "numSendersUsed":I
    move/from16 p9, p8

    .end local p8    # "numSendersUsed":I
    .local p9, "numSendersUsed":I
    move/from16 p8, p0

    .line 940
    .end local p0    # "maxPriorityToInclude":I
    .local p8, "maxPriorityToInclude":I
    :goto_26c
    move/from16 v0, p8

    move v1, v7

    if-ge v0, v1, :cond_2a5

    .line 941
    add-int/lit8 p0, p8, 0x1

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    move-object v0, v12

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2e0

    .line 942
    add-int/lit8 p0, p8, 0x1

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    move-object v0, v12

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    add-int p0, p0, p7

    .line 943
    .local p0, "length":I
    if-lez p7, :cond_299

    add-int/lit8 p0, p0, 0x2

    .line 946
    :cond_299
    move/from16 v0, p0

    move/from16 v1, p2

    if-le v0, v1, :cond_2d8

    const/4 v6, 0x2

    move/from16 v0, p9

    move v1, v6

    if-lt v0, v1, :cond_2d8

    .line 955
    .end local p0    # "length":I
    :cond_2a5
    const/16 p0, 0x0

    .line 956
    .local p0, "numCharsToRemovePerWord":I
    move/from16 v0, p7

    move/from16 v1, p2

    if-le v0, v1, :cond_3c5

    .line 957
    sub-int p0, p7, p2

    div-int p0, p0, p9

    move/from16 p9, p0

    .line 960
    .end local p0    # "numCharsToRemovePerWord":I
    .local p9, "numCharsToRemovePerWord":I
    :goto_2b3
    const/16 p0, 0x0

    .line 961
    .local p0, "elided":Z
    const/16 p2, 0x0

    .end local v7    # "maxFoundPriority":I
    .end local v10    # "numMessages":I
    .end local v12    # "priorityToLength":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local p7    # "numCharsUsed":I
    .local p2, "i":I
    :goto_2b7
    move/from16 v0, p2

    move v1, v9

    if-ge v0, v1, :cond_3ad

    .line 962
    add-int/lit8 p7, p2, 0x1

    .end local p2    # "i":I
    .local p7, "i":I
    aget-object p2, v5, p2

    .line 963
    .local p2, "fragment0":Ljava/lang/String;
    const-string v6, ""

    move-object v0, v6

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2e5

    move/from16 p2, p7

    .end local p7    # "i":I
    .local p2, "i":I
    goto :goto_2b7

    .line 894
    .end local p0    # "elided":Z
    .restart local v7    # "maxFoundPriority":I
    .local v8, "numDrafts":I
    .restart local v10    # "numMessages":I
    .restart local v12    # "priorityToLength":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local p2, "maxChars":I
    .local p4, "draftsStyle":Landroid/text/style/CharacterStyle;
    .local p6, "draftString":Ljava/lang/CharSequence;
    .local p7, "draftPluralString":Ljava/lang/CharSequence;
    .local p8, "sendingString":Ljava/lang/CharSequence;
    .local p9, "sendFailedString":Ljava/lang/CharSequence;
    .local p10, "i":I
    :cond_2ce
    const-string p6, ""

    move-object/from16 p10, p6

    goto/16 :goto_1bc

    .line 930
    .end local p7    # "draftPluralString":Ljava/lang/CharSequence;
    .end local p8    # "sendingString":Ljava/lang/CharSequence;
    .end local p9    # "sendFailedString":Ljava/lang/CharSequence;
    .local p4, "fixedFragment":Landroid/text/SpannableStringBuilder;
    .local p6, "fixedFragmentLength":I
    .local p10, "numMessagesFragment":Ljava/lang/String;
    :cond_2d4
    const/16 p0, 0x0

    goto/16 :goto_24e

    .line 949
    .local v8, "preFixedFragement":Ljava/lang/String;
    .local p0, "length":I
    .local p7, "numCharsUsed":I
    .local p8, "maxPriorityToInclude":I
    .local p9, "numSendersUsed":I
    :cond_2d8
    move/from16 p0, p0

    .line 950
    .end local p7    # "numCharsUsed":I
    .local p0, "numCharsUsed":I
    add-int/lit8 p7, p9, 0x1

    .end local p9    # "numSendersUsed":I
    .local p7, "numSendersUsed":I
    move/from16 p9, p7

    .end local p7    # "numSendersUsed":I
    .restart local p9    # "numSendersUsed":I
    move/from16 p7, p0

    .line 952
    .end local p0    # "numCharsUsed":I
    .local p7, "numCharsUsed":I
    :cond_2e0
    add-int/lit8 p0, p8, 0x1

    .end local p8    # "maxPriorityToInclude":I
    .local p0, "maxPriorityToInclude":I
    move/from16 p8, p0

    .end local p0    # "maxPriorityToInclude":I
    .restart local p8    # "maxPriorityToInclude":I
    goto :goto_26c

    .line 965
    .end local v7    # "maxFoundPriority":I
    .end local v10    # "numMessages":I
    .end local v12    # "priorityToLength":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local p0, "elided":Z
    .local p2, "fragment0":Ljava/lang/String;
    .local p7, "i":I
    .local p9, "numCharsToRemovePerWord":I
    :cond_2e5
    const-string v6, "e"

    move-object v0, v6

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2f5

    .line 966
    const/16 p0, 0x1

    move/from16 p2, p7

    .end local p7    # "i":I
    .local p2, "i":I
    goto :goto_2b7

    .line 967
    .local p2, "fragment0":Ljava/lang/String;
    .restart local p7    # "i":I
    :cond_2f5
    const-string v6, "n"

    move-object v0, v6

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_303

    .line 968
    add-int/lit8 p2, p7, 0x1

    .end local p7    # "i":I
    .local p2, "i":I
    goto :goto_2b7

    .line 969
    .local p2, "fragment0":Ljava/lang/String;
    .restart local p7    # "i":I
    :cond_303
    const-string v6, "d"

    move-object v0, v6

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_311

    .line 970
    add-int/lit8 p2, p7, 0x1

    .end local p7    # "i":I
    .local p2, "i":I
    goto :goto_2b7

    .line 971
    .local p2, "fragment0":Ljava/lang/String;
    .restart local p7    # "i":I
    :cond_311
    const-string v6, "s"

    move-object v0, v6

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_31f

    move/from16 p2, p7

    .end local p7    # "i":I
    .local p2, "i":I
    goto :goto_2b7

    .line 972
    .local p2, "fragment0":Ljava/lang/String;
    .restart local p7    # "i":I
    :cond_31f
    const-string v6, "f"

    move-object v0, v6

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_32d

    move/from16 p2, p7

    .end local p7    # "i":I
    .local p2, "i":I
    goto :goto_2b7

    .line 974
    .local p2, "fragment0":Ljava/lang/String;
    .restart local p7    # "i":I
    :cond_32d
    move-object/from16 v7, p2

    .line 975
    .local v7, "unreadString":Ljava/lang/String;
    add-int/lit8 p2, p7, 0x1

    .end local p7    # "i":I
    .local p2, "i":I
    aget-object v6, v5, p7

    .line 976
    .local v6, "priorityString":Ljava/lang/String;
    add-int/lit8 p7, p2, 0x1

    .end local p2    # "i":I
    .restart local p7    # "i":I
    aget-object p2, v5, p2

    .line 977
    .local p2, "nameString":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_341

    invoke-virtual/range {p5 .. p5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 978
    :cond_341
    if-eqz p9, :cond_357

    .line 979
    const/4 v10, 0x0

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v11

    sub-int v11, v11, p9

    const/4 v12, 0x0

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v11

    move-object/from16 v0, p2

    move v1, v10

    move v2, v11

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 982
    :cond_357
    if-eqz v15, :cond_39a

    move/from16 v7, p11

    .line 984
    .local v7, "unread":Z
    :goto_35b
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 985
    .local v6, "priority":I
    move v0, v6

    move/from16 v1, p8

    if-gt v0, v1, :cond_3a7

    .line 986
    invoke-virtual/range {p1 .. p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    .end local v6    # "priority":I
    if-eqz v6, :cond_375

    .line 987
    if-eqz p0, :cond_3a4

    const-string p0, " .. "

    .end local p0    # "elided":Z
    :goto_36e
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 989
    :cond_375
    const/16 p0, 0x0

    .line 990
    .restart local p0    # "elided":Z
    invoke-virtual/range {p1 .. p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    .line 991
    .local v6, "pos":I
    invoke-virtual/range {p1 .. p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 992
    if-eqz v7, :cond_396

    if-eqz p3, :cond_396

    .line 993
    invoke-static/range {p3 .. p3}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object p2

    .end local p2    # "nameString":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    .end local v7    # "unread":Z
    const/16 v10, 0x21

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move v2, v6

    move v3, v7

    move v4, v10

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_396
    move/from16 p2, p7

    .line 996
    .end local p7    # "i":I
    .local p2, "i":I
    goto/16 :goto_2b7

    .line 982
    .local v6, "priorityString":Ljava/lang/String;
    .local v7, "unreadString":Ljava/lang/String;
    .local p2, "nameString":Ljava/lang/String;
    .restart local p7    # "i":I
    :cond_39a
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .end local v7    # "unreadString":Ljava/lang/String;
    if-eqz v7, :cond_3a2

    const/4 v7, 0x1

    goto :goto_35b

    :cond_3a2
    const/4 v7, 0x0

    goto :goto_35b

    .line 987
    .end local v6    # "priorityString":Ljava/lang/String;
    .local v7, "unread":Z
    :cond_3a4
    const-string p0, ", "

    goto :goto_36e

    .line 997
    .local v6, "priority":I
    :cond_3a7
    const/16 p0, 0x1

    move/from16 p2, p7

    .end local p7    # "i":I
    .local p2, "i":I
    goto/16 :goto_2b7

    .line 1001
    .end local v6    # "priority":I
    .end local v7    # "unread":Z
    :cond_3ad
    move-object/from16 v0, p1

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1002
    if-eqz p6, :cond_130

    .line 1003
    move-object/from16 v0, p1

    move-object v1, v8

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1004
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_130

    .local v7, "maxFoundPriority":I
    .restart local v10    # "numMessages":I
    .restart local v12    # "priorityToLength":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local p0, "numCharsToRemovePerWord":I
    .local p2, "maxChars":I
    .local p7, "numCharsUsed":I
    .local p9, "numSendersUsed":I
    :cond_3c5
    move/from16 p9, p0

    .end local p0    # "numCharsToRemovePerWord":I
    .local p9, "numCharsToRemovePerWord":I
    goto/16 :goto_2b3

    .end local p8    # "maxPriorityToInclude":I
    .end local p9    # "numCharsToRemovePerWord":I
    .local v8, "numDrafts":I
    .local p0, "normalMessagesExist":Z
    .local p7, "preFixedFragement":Ljava/lang/String;
    :cond_3c9
    move-object/from16 v8, p7

    .end local p7    # "preFixedFragement":Ljava/lang/String;
    .local v8, "preFixedFragement":Ljava/lang/String;
    goto/16 :goto_258

    .end local p0    # "normalMessagesExist":Z
    .end local p6    # "fixedFragmentLength":I
    .local v8, "numDrafts":I
    .local p7, "fixedFragmentLength":I
    :cond_3cd
    move/from16 p6, p7

    .end local p7    # "fixedFragmentLength":I
    .restart local p6    # "fixedFragmentLength":I
    goto/16 :goto_23f

    .end local v9    # "numFragments":I
    .end local v14    # "sendingFragment":Ljava/lang/CharSequence;
    .local v6, "maxFoundPriority":I
    .local v7, "numDrafts":I
    .local v8, "numFragments":I
    .local v11, "sendFailedFragment":Ljava/lang/CharSequence;
    .local v13, "sendingFragment":Ljava/lang/CharSequence;
    .local p0, "currentSize":I
    .local p4, "draftsStyle":Landroid/text/style/CharacterStyle;
    .local p6, "draftString":Ljava/lang/CharSequence;
    .local p7, "draftPluralString":Ljava/lang/CharSequence;
    .local p8, "sendingString":Ljava/lang/CharSequence;
    .local p9, "sendFailedString":Ljava/lang/CharSequence;
    .local p10, "draftsFragment":Ljava/lang/CharSequence;
    :cond_3d1
    move v9, v8

    .end local v8    # "numFragments":I
    .restart local v9    # "numFragments":I
    goto/16 :goto_37
.end method

.method public static isLabelUserDefined(Ljava/lang/String;)Z
    .registers 2
    .param p0, "label"    # Ljava/lang/String;

    .prologue
    .line 210
    const-string v0, "^"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isLabelUserSettable(Ljava/lang/String;)Z
    .registers 2
    .param p0, "label"    # Ljava/lang/String;

    .prologue
    .line 226
    sget-object v0, Landroid/provider/Gmail;->USER_SETTABLE_BUILTIN_LABELS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-static {p0}, Landroid/provider/Gmail;->isLabelUserDefined(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public static newConversationLabelIdsSplitter()Landroid/text/TextUtils$StringSplitter;
    .registers 1

    .prologue
    .line 274
    new-instance v0, Landroid/provider/Gmail$CommaStringSplitter;

    invoke-direct {v0}, Landroid/provider/Gmail$CommaStringSplitter;-><init>()V

    return-object v0
.end method

.method public static newMessageLabelIdsSplitter()Landroid/text/TextUtils$StringSplitter;
    .registers 2

    .prologue
    .line 267
    new-instance v0, Landroid/text/TextUtils$SimpleStringSplitter;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Landroid/text/TextUtils$SimpleStringSplitter;-><init>(C)V

    return-object v0
.end method

.method private static toNonnullString(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "source"    # Ljava/lang/String;

    .prologue
    .line 452
    if-nez p0, :cond_5

    .line 453
    const-string v0, ""

    .line 455
    :goto_4
    return-object v0

    :cond_5
    move-object v0, p0

    goto :goto_4
.end method


# virtual methods
.method public addOrRemoveLabelOnConversation(Ljava/lang/String;JJLjava/lang/String;Z)V
    .registers 21
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "conversationId"    # J
    .param p4, "maxServerMessageId"    # J
    .param p6, "label"    # Ljava/lang/String;
    .param p7, "add"    # Z

    .prologue
    .line 630
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 631
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "account is empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 633
    :cond_e
    if-eqz p7, :cond_56

    .line 634
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "content://gmail-ls/conversations/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object v0, v7

    move-wide v1, p2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/labels"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 636
    .local v5, "uri":Landroid/net/Uri;
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 637
    .local v6, "values":Landroid/content/ContentValues;
    const-string v7, "canonicalName"

    move-object v0, v6

    move-object v1, v7

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 638
    const-string v7, "maxMessageId"

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 639
    iget-object v7, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    invoke-virtual {v7, v5, v6}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 653
    .end local v6    # "values":Landroid/content/ContentValues;
    :goto_55
    return-void

    .line 643
    .end local v5    # "uri":Landroid/net/Uri;
    :cond_56
    :try_start_56
    const-string v7, "utf-8"

    move-object/from16 v0, p6

    move-object v1, v7

    invoke-static {v0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_5e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_56 .. :try_end_5e} :catch_b0

    move-result-object v4

    .line 647
    .local v4, "encodedLabel":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "content://gmail-ls/conversations/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object v0, v7

    move-wide v1, p2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/labels/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 650
    .restart local v5    # "uri":Landroid/net/Uri;
    iget-object v7, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    const-string v8, "maxMessageId"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object v0, v11

    move-wide/from16 v1, p4

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v7, v5, v8, v9}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_55

    .line 644
    .end local v4    # "encodedLabel":Ljava/lang/String;
    .end local v5    # "uri":Landroid/net/Uri;
    :catch_b0
    move-exception v7

    move-object v3, v7

    .line 645
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7
.end method

.method public expungeMessage(Ljava/lang/String;J)V
    .registers 8
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "messageId"    # J

    .prologue
    const/4 v3, 0x0

    .line 609
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 610
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "account is empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 612
    :cond_f
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

    .line 613
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    invoke-virtual {v1, v0, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 614
    return-void
.end method

.method public getConversationCursorForCursor(Ljava/lang/String;Landroid/database/Cursor;)Landroid/provider/Gmail$ConversationCursor;
    .registers 5
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 489
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 490
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "account is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 492
    :cond_e
    new-instance v0, Landroid/provider/Gmail$ConversationCursor;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Landroid/provider/Gmail$ConversationCursor;-><init>(Landroid/provider/Gmail;Ljava/lang/String;Landroid/database/Cursor;Landroid/provider/Gmail$1;)V

    return-object v0
.end method

.method public getConversationCursorForQuery(Ljava/lang/String;Ljava/lang/String;Landroid/provider/Gmail$BecomeActiveNetworkCursor;)Landroid/provider/Gmail$ConversationCursor;
    .registers 11
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "query"    # Ljava/lang/String;
    .param p3, "becomeActiveNetworkCursor"    # Landroid/provider/Gmail$BecomeActiveNetworkCursor;

    .prologue
    const/4 v5, 0x0

    .line 542
    invoke-static {p3}, Landroid/provider/Gmail;->getSelectionArguments(Landroid/provider/Gmail$BecomeActiveNetworkCursor;)[Ljava/lang/String;

    move-result-object v4

    .line 543
    .local v4, "selectionArgs":[Ljava/lang/String;
    iget-object v0, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Gmail;->CONVERSATIONS_URI:Landroid/net/Uri;

    invoke-static {v1, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Landroid/provider/Gmail;->CONVERSATION_PROJECTION:[Ljava/lang/String;

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 546
    .local v6, "cursor":Landroid/database/Cursor;
    new-instance v0, Landroid/provider/Gmail$ConversationCursor;

    invoke-direct {v0, p0, p1, v6, v5}, Landroid/provider/Gmail$ConversationCursor;-><init>(Landroid/provider/Gmail;Ljava/lang/String;Landroid/database/Cursor;Landroid/provider/Gmail$1;)V

    return-object v0
.end method

.method public getLabelMap(Ljava/lang/String;)Landroid/provider/Gmail$LabelMap;
    .registers 5
    .param p1, "account"    # Ljava/lang/String;

    .prologue
    .line 1614
    iget-object v1, p0, Landroid/provider/Gmail;->mLabelMaps:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/provider/Gmail$LabelMap;

    .line 1615
    .local v0, "labelMap":Landroid/provider/Gmail$LabelMap;
    if-nez v0, :cond_17

    .line 1616
    new-instance v0, Landroid/provider/Gmail$LabelMap;

    .end local v0    # "labelMap":Landroid/provider/Gmail$LabelMap;
    iget-object v1, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    const/4 v2, 0x1

    invoke-direct {v0, v1, p1, v2}, Landroid/provider/Gmail$LabelMap;-><init>(Landroid/content/ContentResolver;Ljava/lang/String;Z)V

    .line 1617
    .restart local v0    # "labelMap":Landroid/provider/Gmail$LabelMap;
    iget-object v1, p0, Landroid/provider/Gmail;->mLabelMaps:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1619
    :cond_17
    return-object v0
.end method

.method public getLocalMessageCursorForQuery(Ljava/lang/String;Ljava/lang/String;)Landroid/provider/Gmail$MessageCursor;
    .registers 10
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "query"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 576
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 577
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "account is empty"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 579
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "content://gmail-ls/messages/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 580
    .local v1, "uri":Landroid/net/Uri;
    iget-object v0, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v2, Landroid/provider/Gmail;->MESSAGE_PROJECTION:[Ljava/lang/String;

    move-object v3, p2

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 581
    .local v6, "cursor":Landroid/database/Cursor;
    new-instance v0, Landroid/provider/Gmail$MessageCursor;

    iget-object v2, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    invoke-direct {v0, p0, v2, p1, v6}, Landroid/provider/Gmail$MessageCursor;-><init>(Landroid/provider/Gmail;Landroid/content/ContentResolver;Ljava/lang/String;Landroid/database/Cursor;)V

    return-object v0
.end method

.method public getMessageCursorForConversationId(Ljava/lang/String;J)Landroid/provider/Gmail$MessageCursor;
    .registers 11
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "conversationId"    # J

    .prologue
    const/4 v3, 0x0

    .line 592
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 593
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "account is empty"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 595
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "content://gmail-ls/conversations/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/messages"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 597
    .local v1, "uri":Landroid/net/Uri;
    iget-object v0, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v2, Landroid/provider/Gmail;->MESSAGE_PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 599
    .local v6, "cursor":Landroid/database/Cursor;
    new-instance v0, Landroid/provider/Gmail$MessageCursor;

    iget-object v2, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    invoke-direct {v0, p0, v2, p1, v6}, Landroid/provider/Gmail$MessageCursor;-><init>(Landroid/provider/Gmail;Landroid/content/ContentResolver;Ljava/lang/String;Landroid/database/Cursor;)V

    return-object v0
.end method

.method public getMessageCursorForMessageId(Ljava/lang/String;J)Landroid/provider/Gmail$MessageCursor;
    .registers 11
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "messageId"    # J

    .prologue
    const/4 v3, 0x0

    .line 557
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 558
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "account is empty"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 560
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "content://gmail-ls/messages/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 561
    .local v1, "uri":Landroid/net/Uri;
    iget-object v0, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v2, Landroid/provider/Gmail;->MESSAGE_PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 562
    .local v6, "cursor":Landroid/database/Cursor;
    new-instance v0, Landroid/provider/Gmail$MessageCursor;

    iget-object v2, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    invoke-direct {v0, p0, v2, p1, v6}, Landroid/provider/Gmail$MessageCursor;-><init>(Landroid/provider/Gmail;Landroid/content/ContentResolver;Ljava/lang/String;Landroid/database/Cursor;)V

    return-object v0
.end method

.method public getSettings(Ljava/lang/String;)Landroid/provider/Gmail$Settings;
    .registers 10
    .param p1, "account"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 751
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 752
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "account is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 754
    :cond_f
    new-instance v7, Landroid/provider/Gmail$Settings;

    invoke-direct {v7}, Landroid/provider/Gmail$Settings;-><init>()V

    .line 755
    .local v7, "settings":Landroid/provider/Gmail$Settings;
    iget-object v0, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Gmail;->SETTINGS_URI:Landroid/net/Uri;

    invoke-static {v1, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Landroid/provider/Gmail;->SETTINGS_PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 757
    .local v6, "cursor":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    .line 758
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroid/provider/Gmail;->SPACE_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/provider/Gmail$Settings;->labelsIncluded:[Ljava/lang/String;

    .line 759
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroid/provider/Gmail;->SPACE_SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Landroid/provider/Gmail$Settings;->labelsPartial:[Ljava/lang/String;

    .line 760
    const/4 v0, 0x2

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, v7, Landroid/provider/Gmail$Settings;->conversationAgeDays:J

    .line 761
    const/4 v0, 0x3

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, v7, Landroid/provider/Gmail$Settings;->maxAttachmentSizeMb:J

    .line 762
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 763
    return-object v7
.end method

.method public runQueryForConversations(Ljava/lang/String;Landroid/content/AsyncQueryHandler;ILjava/lang/String;Landroid/provider/Gmail$BecomeActiveNetworkCursor;)V
    .registers 14
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "handler"    # Landroid/content/AsyncQueryHandler;
    .param p3, "token"    # I
    .param p4, "query"    # Ljava/lang/String;
    .param p5, "becomeActiveNetworkCursor"    # Landroid/provider/Gmail$BecomeActiveNetworkCursor;

    .prologue
    const/4 v2, 0x0

    .line 523
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 524
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "account is empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 526
    :cond_f
    invoke-static {p5}, Landroid/provider/Gmail;->getSelectionArguments(Landroid/provider/Gmail$BecomeActiveNetworkCursor;)[Ljava/lang/String;

    move-result-object v6

    .line 527
    .local v6, "selectionArgs":[Ljava/lang/String;
    sget-object v0, Landroid/provider/Gmail;->CONVERSATIONS_URI:Landroid/net/Uri;

    invoke-static {v0, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    sget-object v4, Landroid/provider/Gmail;->CONVERSATION_PROJECTION:[Ljava/lang/String;

    move-object v0, p2

    move v1, p3

    move-object v5, p4

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/content/AsyncQueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    return-void
.end method

.method public setSettings(Ljava/lang/String;Landroid/provider/Gmail$Settings;)V
    .registers 8
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "settings"    # Landroid/provider/Gmail$Settings;

    .prologue
    const/4 v4, 0x0

    const-string v3, " "

    .line 770
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 771
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "account is empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 773
    :cond_11
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 774
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "labelsIncluded"

    const-string v2, " "

    iget-object v2, p2, Landroid/provider/Gmail$Settings;->labelsIncluded:[Ljava/lang/String;

    invoke-static {v3, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 777
    const-string v1, "labelsPartial"

    const-string v2, " "

    iget-object v2, p2, Landroid/provider/Gmail$Settings;->labelsPartial:[Ljava/lang/String;

    invoke-static {v3, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 780
    const-string v1, "conversationAgeDays"

    iget-wide v2, p2, Landroid/provider/Gmail$Settings;->conversationAgeDays:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 783
    const-string v1, "maxAttachmentSize"

    iget-wide v2, p2, Landroid/provider/Gmail$Settings;->maxAttachmentSizeMb:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 786
    iget-object v1, p0, Landroid/provider/Gmail;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v2, Landroid/provider/Gmail;->SETTINGS_URI:Landroid/net/Uri;

    invoke-static {v2, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 787
    return-void
.end method
