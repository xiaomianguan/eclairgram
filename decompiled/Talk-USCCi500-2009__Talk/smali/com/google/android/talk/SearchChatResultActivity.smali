.class public Lcom/google/android/talk/SearchChatResultActivity;
.super Landroid/app/Activity;
.source "SearchChatResultActivity.java"

# interfaces
.implements Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/talk/SearchChatResultActivity$5;,
        Lcom/google/android/talk/SearchChatResultActivity$ConversationContentObserver;,
        Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;
    }
.end annotation


# static fields
.field private static final AUTHOR_COLORS:[Ljava/lang/String;

.field private static final BASE_URL:Ljava/lang/String; = "x-thread://"

.field private static final COLLAPSED_MESSAGE_TEMPLATE_0:Ljava/lang/String; = "<table class=\"tableHeader\" id=\""

.field private static final COLLAPSED_MESSAGE_TEMPLATE_1:Ljava/lang/String; = "\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"><tr><td>"

.field private static final COLLAPSED_MESSAGE_TEMPLATE_2:Ljava/lang/String; = "</td><tr><td  class=\"bodyCell\"><div id=\"a:body\"></div></td></tr></table>"

.field private static final EXPANDED_MESSAGE_TEMPLATE_0:Ljava/lang/String; = "<table id=\""

.field private static final EXPANDED_MESSAGE_TEMPLATE_1:Ljava/lang/String; = "\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"><tr><td>"

.field private static final EXPANDED_MESSAGE_TEMPLATE_2:Ljava/lang/String; = "</td><tr><td  class=\"bodyCell\"><div id=\"a:body\">"

.field private static final EXPANDED_MESSAGE_TEMPLATE_3:Ljava/lang/String; = "</div></td></tr></table>"

.field public static final EXTRA_ACCOUNT:Ljava/lang/String; = "account"

.field private static final EXTRA_ACTION:Ljava/lang/String; = "action"

.field public static final EXTRA_CONVERSATION_ID:Ljava/lang/String; = "thread-id"

.field public static final EXTRA_DISPLAYED_LABEL:Ljava/lang/String; = "displayed-label"

.field private static final EXTRA_IN_REFERENCE_TO_MESSAGE_ID:Ljava/lang/String; = "in-reference-to"

.field public static final EXTRA_QUERY:Ljava/lang/String; = "query"

.field private static final EXTRA_TO:Ljava/lang/String; = "to"

.field static final FORWARD:I = 0x3

.field private static final FROM_REGULAR:Ljava/lang/String; = "<td><div onClick=\"contactSender(\'%s\', \'%s\')\" ><img class=\"presenceImg\"id=\"a:presence\" src=\"%s\"/></div></td><td align=\'left\' width=\'99%%\' onClick=\"toggleHeader(\'%s\')\" width=\"50\"><div class=\"fromDiv\"> %s </div></td>"

.field private static final ICICLE_EXPANDED_IDS:Ljava/lang/String; = "expanded-ids"

.field private static final ICICLE_WEBVIEW_Y:Ljava/lang/String; = "webview-y"

.field private static final INITIAL_CONVERSATION_SIZE:I = 0x8000

.field private static final INITIAL_MESSAGE_SIZE:I = 0x4000

.field private static final JAVASCRIPT_HEADER_TAP_FUNCTION:Ljava/lang/String; = "toggleHeader"

.field private static final MESSAGE_BODY_0:Ljava/lang/String; = "<div class=\"bodyDiv\">"

.field private static final MESSAGE_BODY_1:Ljava/lang/String; = "</div>"

.field private static final MESSAGE_FOOTER_0:Ljava/lang/String; = "<div class=\"messageFooterDiv1\">"

.field private static final MESSAGE_FOOTER_0_LAST:Ljava/lang/String; = "<div class=\"messageFooterDiv2\">"

.field private static final MESSAGE_FOOTER_1:Ljava/lang/String; = "<table width=\"100%\"><tr><td><button class=\"footerButton\" onClick=\"window.gmail.replyByChat(\'"

.field private static final MESSAGE_FOOTER_2:Ljava/lang/String; = "\')\"><img class=\"footerIconImg\" src=\"file:///android_asset/ic_reply_talk_default.png\"><div class=\"footerTextElementDiv\">"

.field private static final MESSAGE_FOOTER_3:Ljava/lang/String; = "</div></button><button class=\"footerButton\" onClick=\"window.gmail.reply(\'"

.field private static final MESSAGE_FOOTER_4:Ljava/lang/String; = "\')\"><img class=\"footerIconImg\" src=\"file:///android_asset/ic_reply_gmail_default.png\"><div class=\"footerTextElementDiv\">"

.field private static final MESSAGE_FOOTER_5:Ljava/lang/String; = "</div></button><button class=\"footerButton\" onClick=\"window.gmail.forward(\'"

.field private static final MESSAGE_FOOTER_6:Ljava/lang/String; = "\')\"><img class=\"footerIconImg\" src=\"file:///android_asset/ic_forward_default.png\"><div class=\"footerTextElementDiv\">"

.field private static final MESSAGE_FOOTER_7:Ljava/lang/String; = "</div></button></td></tr></table></div>"

.field private static final MESSAGE_HEADER:Ljava/lang/String; = "<div class=\"headerDiv\"><table border=\"0\" cellpadding=\"0\"><tr>%s</tr></table><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\'99%%\' class=\"%s\"><div id=\"a:line2\">%s</div></td><td style=\'white-space: nowrap; float:right\' valign=\'top\' align=\"right\">%s</td></tr></table></div>"

.field private static final MESSAGE_PREFIX:Ljava/lang/String; = "m"

.field private static final MESSAGE_PREFIX_LENGTH:I

.field private static final PAGE_HEADER:Ljava/lang/String; = "<html><head><link type=\"text/css\" rel=\"stylesheet\" href=\"file:///android_asset/styles.css\"><script type=\"text/javascript\" src=\"file:///android_asset/script.js\"></script></head><body>"

.field private static final PRESENCE_AWAY_PATH:Ljava/lang/String; = "file:///android_asset/presence_away.png"

.field private static final PRESENCE_BUSY_PATH:Ljava/lang/String; = "file:///android_asset/presence_busy.png"

.field private static final PRESENCE_INVISIBLE_PATH:Ljava/lang/String; = "file:///android_asset/presence_invisible.png"

.field private static final PRESENCE_OFFLINE_PATH:Ljava/lang/String; = "file:///android_asset/presence_offline.png"

.field private static final PRESENCE_ONLINE_PATH:Ljava/lang/String; = "file:///android_asset/presence_online.png"

.field static final REPLY:I = 0x1

.field private static final SEPARATOR:Ljava/lang/String; = ":"

.field private static final SNIPPET_MAX:I = 0x23

.field private static final SUPER_COLLAPSED_0:Ljava/lang/String; = "<div id=\""

.field private static final SUPER_COLLAPSED_1:Ljava/lang/String; = "\"><a onClick=\"uncollapse(\'"

.field private static final SUPER_COLLAPSED_2:Ljava/lang/String; = "\', "

.field private static final SUPER_COLLAPSED_3:Ljava/lang/String; = ", "

.field private static final SUPER_COLLAPSED_4:Ljava/lang/String; = ")\"><div class=\"superCollapsedDiv size"

.field private static final SUPER_COLLAPSED_5:Ljava/lang/String; = "\"><div class=\"superCollapsedLabel\">"

.field private static final SUPER_COLLAPSED_6:Ljava/lang/String; = "</div></div></a></div>"


# instance fields
.field private mAccount:Ljava/lang/String;

.field private mCcHeading:Ljava/lang/String;

.field private mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

.field private mContentObserver:Landroid/database/ContentObserver;

.field private mConversationId:Ljava/lang/Long;

.field private mCurrentColorMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mEmailMatcher:Ljava/util/regex/Matcher;

.field private mExpandedMessageIds:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mForwardString:Ljava/lang/String;

.field private mGmail:Landroid/provider/Gmail;

.field private mHandler:Landroid/os/Handler;

.field private mLastFromAddress:Ljava/lang/String;

.field private mLastPresenceEmail:Ljava/lang/String;

.field private mLastPresencePath:Ljava/lang/String;

.field private mLoaded:Z

.field private mMessageCursor:Landroid/provider/Gmail$MessageCursor;

.field private mPresencePath:Ljava/lang/String;

.field private mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

.field private mReplyByChatString:Ljava/lang/String;

.field private mReplyString:Ljava/lang/String;

.field private mToHeading:Ljava/lang/String;

.field private mWebView:Landroid/webkit/WebView;

.field private mWebViewY:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 68
    const-string v0, "m"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lcom/google/android/talk/SearchChatResultActivity;->MESSAGE_PREFIX_LENGTH:I

    .line 1242
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "#00681c"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "#790619"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "#5b1094"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "#c88900"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "#cc0060"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "#008391"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "#009486"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "#b90038"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "#846600"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "#330099"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/talk/SearchChatResultActivity;->AUTHOR_COLORS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 57
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 290
    const-string v0, "\\\"(.*)\\\"\\s*<(.*)>"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mEmailMatcher:Ljava/util/regex/Matcher;

    .line 315
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    .line 322
    iput v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mWebViewY:I

    .line 338
    new-instance v0, Lcom/google/android/talk/SearchChatResultActivity$1;

    invoke-direct {v0, p0}, Lcom/google/android/talk/SearchChatResultActivity$1;-><init>(Lcom/google/android/talk/SearchChatResultActivity;)V

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mHandler:Landroid/os/Handler;

    .line 356
    iput-boolean v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLoaded:Z

    .line 1256
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mCurrentColorMap:Ljava/util/Map;

    .line 1283
    const-string v0, "file:///android_asset/presence_offline.png"

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    .line 1284
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLastPresencePath:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/google/android/talk/SearchChatResultActivity;ZLjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lcom/google/android/talk/SearchChatResultActivity;->launchReplyOrForward(ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/google/android/talk/SearchChatResultActivity;->launchReplyByChat(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mForwardString:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mReplyByChatString:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;
    .param p1, "x1"    # Ljava/lang/StringBuilder;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # Ljava/lang/String;
    .param p6, "x6"    # Ljava/lang/String;
    .param p7, "x7"    # Z
    .param p8, "x8"    # Z

    .prologue
    .line 57
    invoke-direct/range {p0 .. p8}, Lcom/google/android/talk/SearchChatResultActivity;->addExpandedBody(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method static synthetic access$1300(Lcom/google/android/talk/SearchChatResultActivity;Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;
    .param p1, "x1"    # Landroid/provider/Gmail$MessageCursor;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/google/android/talk/SearchChatResultActivity;->getSnippet(Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1400(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/google/android/talk/SearchChatResultActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-boolean v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLoaded:Z

    return v0
.end method

.method static synthetic access$1600(Lcom/google/android/talk/SearchChatResultActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/google/android/talk/SearchChatResultActivity;->buildConversationIfLoaded()V

    return-void
.end method

.method static synthetic access$1700(Lcom/google/android/talk/SearchChatResultActivity;)Lcom/google/android/talk/ContactInfoQuery;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/google/android/talk/SearchChatResultActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mWebViewY:I

    return v0
.end method

.method static synthetic access$1802(Lcom/google/android/talk/SearchChatResultActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;
    .param p1, "x1"    # I

    .prologue
    .line 57
    iput p1, p0, Lcom/google/android/talk/SearchChatResultActivity;->mWebViewY:I

    return p1
.end method

.method static synthetic access$1900(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail$MessageCursor;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/StringBuilder;Landroid/provider/Gmail$MessageCursor;II)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;
    .param p1, "x1"    # Ljava/lang/StringBuilder;
    .param p2, "x2"    # Landroid/provider/Gmail$MessageCursor;
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/talk/SearchChatResultActivity;->addCollapsedHeaders(Ljava/lang/StringBuilder;Landroid/provider/Gmail$MessageCursor;II)V

    return-void
.end method

.method static synthetic access$400(Lcom/google/android/talk/SearchChatResultActivity;Ljava/lang/String;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/google/android/talk/SearchChatResultActivity;->getId(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$500(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mAccount:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/android/talk/SearchChatResultActivity;)Landroid/provider/Gmail;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mGmail:Landroid/provider/Gmail;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/talk/SearchChatResultActivity;Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;
    .param p1, "x1"    # Landroid/provider/Gmail$MessageCursor;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/google/android/talk/SearchChatResultActivity;->getAddressesLine(Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$900(Lcom/google/android/talk/SearchChatResultActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/talk/SearchChatResultActivity;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mReplyString:Ljava/lang/String;

    return-object v0
.end method

.method private addAddresses(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "heading"    # Ljava/lang/String;
    .param p3, "addresses"    # [Ljava/lang/String;

    .prologue
    .line 1169
    array-length v1, p3

    .line 1171
    .local v1, "count":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1173
    const/4 v4, 0x1

    sub-int v3, v1, v4

    .line 1174
    .local v3, "last":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 1175
    aget-object v0, p3, v2

    .line 1176
    .local v0, "address":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/google/android/talk/SearchChatResultActivity;->getDisplayAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1177
    if-ge v2, v3, :cond_0

    .line 1178
    const-string v4, ", "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1174
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1181
    .end local v0    # "address":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private addCollapsedHeaders(Ljava/lang/StringBuilder;Landroid/provider/Gmail$MessageCursor;II)V
    .locals 22
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "messageCursor"    # Landroid/provider/Gmail$MessageCursor;
    .param p3, "firstCollapsed"    # I
    .param p4, "lastCollapsed"    # I

    .prologue
    .line 832
    const/16 v20, 0x0

    .line 833
    .local v20, "lastLabelIds":Ljava/lang/String;
    invoke-static {}, Landroid/provider/Gmail;->newMessageLabelIdsSplitter()Landroid/text/TextUtils$StringSplitter;

    move-result-object v19

    .line 835
    .local v19, "labelIdsSplitter":Landroid/text/TextUtils$StringSplitter;
    move/from16 v16, p3

    .local v16, "i":I
    :goto_0
    move/from16 v0, v16

    move/from16 v1, p4

    if-gt v0, v1, :cond_1

    .line 836
    move-object/from16 v0, p2

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/provider/Gmail$MessageCursor;->moveTo(I)Z

    .line 838
    invoke-virtual/range {p2 .. p2}, Landroid/provider/Gmail$MessageCursor;->getMessageId()J

    move-result-wide v17

    .line 839
    .local v17, "id":J
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "m"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v0, v5

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 840
    .local v7, "messageId":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroid/provider/Gmail$MessageCursor;->getRawLabelIds()Ljava/lang/String;

    move-result-object v21

    .line 841
    .local v21, "rawLabelIds":Ljava/lang/String;
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 842
    move-object/from16 v20, v21

    .line 843
    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Landroid/text/TextUtils$StringSplitter;->setString(Ljava/lang/String;)V

    .line 846
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/provider/Gmail$MessageCursor;->getDateReceivedMs()J

    move-result-wide v13

    .line 847
    .local v13, "date":J
    move-object/from16 v0, p0

    move-wide v1, v13

    invoke-static {v0, v1, v2}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(Landroid/content/Context;J)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 849
    .local v11, "dateStr":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getSenderPersonal(Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Landroid/provider/Gmail$MessageCursor;->getFromAddress()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    move-object v1, v6

    invoke-direct {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getUnencodedSenderEmail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object v2, v5

    move-object v3, v6

    move-object v4, v7

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/talk/SearchChatResultActivity;->buildFromDiv(Landroid/provider/Gmail$MessageCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v15

    .line 856
    .local v15, "fromDiv":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getSnippet(Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->htmlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 858
    .local v10, "snippet":Ljava/lang/String;
    const-string v12, "toggleHeader"

    .line 860
    .local v12, "headerTapFunction":Ljava/lang/String;
    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "snippetDiv"

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    invoke-direct/range {v5 .. v12}, Lcom/google/android/talk/SearchChatResultActivity;->addCollapsedMessage(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 835
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_0

    .line 868
    .end local v7    # "messageId":Ljava/lang/String;
    .end local v10    # "snippet":Ljava/lang/String;
    .end local v11    # "dateStr":Ljava/lang/String;
    .end local v12    # "headerTapFunction":Ljava/lang/String;
    .end local v13    # "date":J
    .end local v15    # "fromDiv":Ljava/lang/CharSequence;
    .end local v17    # "id":J
    .end local v21    # "rawLabelIds":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private addCollapsedMessage(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "messageId"    # Ljava/lang/String;
    .param p3, "fromDiv"    # Ljava/lang/String;
    .param p4, "style"    # Ljava/lang/String;
    .param p5, "line2Str"    # Ljava/lang/String;
    .param p6, "dateStr"    # Ljava/lang/String;
    .param p7, "headerTapFunction"    # Ljava/lang/String;

    .prologue
    .line 1009
    const-string v0, "<table class=\"tableHeader\" id=\""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1010
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1011
    const-string v0, "\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"><tr><td>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1012
    invoke-direct/range {p0 .. p7}, Lcom/google/android/talk/SearchChatResultActivity;->addMessageHeader(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1013
    const-string v0, "</td><tr><td  class=\"bodyCell\"><div id=\"a:body\"></div></td></tr></table>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1014
    return-void
.end method

.method private addExpandedBody(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 7
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "body"    # Ljava/lang/String;
    .param p3, "messageId"    # Ljava/lang/String;
    .param p4, "replyStr"    # Ljava/lang/String;
    .param p5, "forwardStr"    # Ljava/lang/String;
    .param p6, "replyByChatStr"    # Ljava/lang/String;
    .param p7, "containsExternalResources"    # Z
    .param p8, "isLastMessage"    # Z

    .prologue
    .line 983
    const-string v0, "<div class=\"bodyDiv\">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 984
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 985
    const-string v0, "</div>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    move v6, p8

    .line 988
    invoke-direct/range {v0 .. v6}, Lcom/google/android/talk/SearchChatResultActivity;->addFooter(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 989
    return-void
.end method

.method private addExpandedMessage(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 9
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "messageId"    # Ljava/lang/String;
    .param p3, "fromDiv"    # Ljava/lang/String;
    .param p4, "style"    # Ljava/lang/String;
    .param p5, "line2Str"    # Ljava/lang/String;
    .param p6, "dateStr"    # Ljava/lang/String;
    .param p7, "body"    # Ljava/lang/String;
    .param p8, "replyStr"    # Ljava/lang/String;
    .param p9, "forwardStr"    # Ljava/lang/String;
    .param p10, "replyByChatStr"    # Ljava/lang/String;
    .param p11, "containsExternalResources"    # Z
    .param p12, "isLastMessage"    # Z

    .prologue
    .line 962
    const-string v0, "<table id=\""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 963
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 964
    const-string v0, "\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"><tr><td>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 965
    const-string v7, "toggleHeader"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/google/android/talk/SearchChatResultActivity;->addMessageHeader(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 967
    const-string v0, "</td><tr><td  class=\"bodyCell\"><div id=\"a:body\">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p7

    move-object v3, p2

    move-object/from16 v4, p8

    move-object/from16 v5, p9

    move-object/from16 v6, p10

    move/from16 v7, p11

    move/from16 v8, p12

    .line 969
    invoke-direct/range {v0 .. v8}, Lcom/google/android/talk/SearchChatResultActivity;->addExpandedBody(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 972
    const-string v0, "</div></td></tr></table>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 973
    return-void
.end method

.method private addFooter(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "messageId"    # Ljava/lang/String;
    .param p3, "replyStr"    # Ljava/lang/String;
    .param p4, "forwardStr"    # Ljava/lang/String;
    .param p5, "replyByChatStr"    # Ljava/lang/String;
    .param p6, "isLastMessage"    # Z

    .prologue
    .line 1019
    if-eqz p6, :cond_0

    const-string v0, "<div class=\"messageFooterDiv2\">"

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1020
    const-string v0, "<table width=\"100%\"><tr><td><button class=\"footerButton\" onClick=\"window.gmail.replyByChat(\'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1021
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1022
    const-string v0, "\')\"><img class=\"footerIconImg\" src=\"file:///android_asset/ic_reply_talk_default.png\"><div class=\"footerTextElementDiv\">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1023
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1024
    const-string v0, "</div></button><button class=\"footerButton\" onClick=\"window.gmail.reply(\'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1025
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1026
    const-string v0, "\')\"><img class=\"footerIconImg\" src=\"file:///android_asset/ic_reply_gmail_default.png\"><div class=\"footerTextElementDiv\">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1027
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1028
    const-string v0, "</div></button><button class=\"footerButton\" onClick=\"window.gmail.forward(\'"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1029
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1030
    const-string v0, "\')\"><img class=\"footerIconImg\" src=\"file:///android_asset/ic_forward_default.png\"><div class=\"footerTextElementDiv\">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1031
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1032
    const-string v0, "</div></button></td></tr></table></div>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1033
    return-void

    .line 1019
    :cond_0
    const-string v0, "<div class=\"messageFooterDiv1\">"

    goto :goto_0
.end method

.method private addMessageHeader(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "messageId"    # Ljava/lang/String;
    .param p3, "fromDiv"    # Ljava/lang/String;
    .param p4, "style"    # Ljava/lang/String;
    .param p5, "line2Str"    # Ljava/lang/String;
    .param p6, "dateStr"    # Ljava/lang/String;
    .param p7, "toggleFunction"    # Ljava/lang/String;

    .prologue
    .line 932
    const-string v0, "<div class=\"headerDiv\"><table border=\"0\" cellpadding=\"0\"><tr>%s</tr></table><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\'99%%\' class=\"%s\"><div id=\"a:line2\">%s</div></td><td style=\'white-space: nowrap; float:right\' valign=\'top\' align=\"right\">%s</td></tr></table></div>"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p3, v1, v2

    const/4 v2, 0x1

    aput-object p4, v1, v2

    const/4 v2, 0x2

    aput-object p5, v1, v2

    const/4 v2, 0x3

    aput-object p6, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 935
    return-void
.end method

.method private buildConversationIfLoaded()V
    .locals 41

    .prologue
    .line 621
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    move-object/from16 v37, v0

    .line 622
    .local v37, "messageCursor":Landroid/provider/Gmail$MessageCursor;
    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->count()I

    move-result v22

    .line 624
    .local v22, "count":I
    sget-object v5, Lcom/google/android/talk/SearchChatResultActivity$5;->$SwitchMap$android$provider$Gmail$CursorStatus:[I

    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->getStatus()Landroid/provider/Gmail$CursorStatus;

    move-result-object v6

    invoke-virtual {v6}, Landroid/provider/Gmail$CursorStatus;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 646
    :cond_0
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    const v5, 0x8000

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 647
    .local v6, "sb":Ljava/lang/StringBuilder;
    const/4 v5, -0x1

    move-object/from16 v0, v37

    move v1, v5

    invoke-virtual {v0, v1}, Landroid/provider/Gmail$MessageCursor;->moveTo(I)Z

    .line 649
    const-string v5, "<html><head><link type=\"text/css\" rel=\"stylesheet\" href=\"file:///android_asset/styles.css\"><script type=\"text/javascript\" src=\"file:///android_asset/script.js\"></script></head><body>"

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 651
    const/16 v32, 0x0

    .line 652
    .local v32, "lastLabelIds":Ljava/lang/String;
    const/4 v5, 0x1

    sub-int v33, v22, v5

    .line 653
    .local v33, "lastMessage":I
    const/16 v40, 0x0

    .line 655
    .local v40, "whichMessage":I
    const v5, 0x7f060095

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/SearchChatResultActivity;->mReplyString:Ljava/lang/String;

    .line 656
    const v5, 0x7f060096

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/SearchChatResultActivity;->mForwardString:Ljava/lang/String;

    .line 657
    const v5, 0x7f060097

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/SearchChatResultActivity;->mReplyByChatString:Ljava/lang/String;

    .line 658
    const v5, 0x7f060099

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/SearchChatResultActivity;->mToHeading:Ljava/lang/String;

    .line 660
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mReplyString:Ljava/lang/String;

    move-object v13, v0

    .line 661
    .local v13, "replyStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mReplyByChatString:Ljava/lang/String;

    move-object v15, v0

    .line 662
    .local v15, "replyByChatStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mForwardString:Ljava/lang/String;

    move-object v14, v0

    .line 664
    .local v14, "forwardStr":Ljava/lang/String;
    invoke-static {}, Landroid/provider/Gmail;->newMessageLabelIdsSplitter()Landroid/text/TextUtils$StringSplitter;

    move-result-object v31

    .line 666
    .local v31, "labelIdsSplitter":Landroid/text/TextUtils$StringSplitter;
    const/16 v25, -0x1

    .line 672
    .local v25, "firstCollapsed":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mWebViewY:I

    move v5, v0

    if-nez v5, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mWebView:Landroid/webkit/WebView;

    move-object v5, v0

    invoke-virtual {v5}, Landroid/webkit/WebView;->getScrollY()I

    move-result v5

    move v0, v5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/talk/SearchChatResultActivity;->mWebViewY:I

    .line 673
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mWebView:Landroid/webkit/WebView;

    move-object v5, v0

    new-instance v7, Lcom/google/android/talk/SearchChatResultActivity$4;

    move-object v0, v7

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity$4;-><init>(Lcom/google/android/talk/SearchChatResultActivity;)V

    invoke-virtual {v5, v7}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 710
    :goto_1
    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->next()Z

    move-result v5

    if-eqz v5, :cond_d

    .line 721
    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->getMessageId()J

    move-result-wide v29

    .line 722
    .local v29, "id":J
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "m"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v0, v5

    move-wide/from16 v1, v29

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 723
    .local v7, "messageId":Ljava/lang/String;
    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->getBody()Ljava/lang/String;

    move-result-object v12

    .line 724
    .local v12, "body":Ljava/lang/String;
    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->getRawLabelIds()Ljava/lang/String;

    move-result-object v38

    .line 725
    .local v38, "rawLabelIds":Ljava/lang/String;
    move-object/from16 v0, v38

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 726
    move-object/from16 v32, v38

    .line 727
    move-object/from16 v0, v31

    move-object/from16 v1, v38

    invoke-interface {v0, v1}, Landroid/text/TextUtils$StringSplitter;->setString(Ljava/lang/String;)V

    .line 730
    :cond_2
    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->getDateReceivedMs()J

    move-result-wide v23

    .line 731
    .local v23, "date":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v23

    invoke-static {v0, v1, v2}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(Landroid/content/Context;J)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 736
    .local v11, "dateStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    move-object v5, v0

    monitor-enter v5

    .line 737
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    move-object v8, v0

    invoke-static/range {v29 .. v30}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    check-cast v36, Ljava/lang/Boolean;

    .line 738
    .local v36, "manuallySet":Ljava/lang/Boolean;
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 739
    if-eqz v36, :cond_7

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v5, 0x1

    :goto_2
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v35

    .line 740
    .local v35, "manuallyExpanded":Ljava/lang/Boolean;
    if-eqz v36, :cond_8

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_8

    const/4 v5, 0x1

    :goto_3
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v34

    .line 742
    .local v34, "manuallyCollapsed":Ljava/lang/Boolean;
    invoke-virtual/range {v35 .. v35}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v39

    .line 743
    .local v39, "showExpanded":Z
    invoke-virtual/range {v34 .. v34}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v26

    .line 745
    .local v26, "forceCollapsed":Z
    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-direct {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getSenderPersonal(Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->getFromAddress()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object v1, v8

    invoke-direct {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getUnencodedSenderEmail(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object v2, v5

    move-object v3, v8

    move-object v4, v7

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/talk/SearchChatResultActivity;->buildFromDiv(Landroid/provider/Gmail$MessageCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v27

    .line 750
    .local v27, "fromDiv":Ljava/lang/CharSequence;
    if-nez v26, :cond_a

    if-nez v39, :cond_3

    move/from16 v0, v40

    move/from16 v1, v33

    if-ne v0, v1, :cond_a

    .line 751
    :cond_3
    if-ltz v25, :cond_4

    .line 752
    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object v2, v6

    move/from16 v3, v40

    move/from16 v4, v25

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/talk/SearchChatResultActivity;->maybeGenerateSuperCollapse(Landroid/provider/Gmail$MessageCursor;Ljava/lang/StringBuilder;II)V

    .line 753
    const/16 v25, -0x1

    .line 758
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    move-object v5, v0

    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->getMessageId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 759
    invoke-virtual/range {v27 .. v27}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "addressDiv"

    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-direct {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->getAddressesLine(Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->getBodyEmbedsExternalResources()Z

    move-result v16

    move/from16 v0, v33

    move/from16 v1, v40

    if-ne v0, v1, :cond_9

    const/4 v5, 0x1

    move/from16 v17, v5

    :goto_4
    move-object/from16 v5, p0

    invoke-direct/range {v5 .. v17}, Lcom/google/android/talk/SearchChatResultActivity;->addExpandedMessage(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 784
    :cond_5
    :goto_5
    add-int/lit8 v40, v40, 0x1

    .line 785
    goto/16 :goto_1

    .line 627
    .end local v6    # "sb":Ljava/lang/StringBuilder;
    .end local v7    # "messageId":Ljava/lang/String;
    .end local v11    # "dateStr":Ljava/lang/String;
    .end local v12    # "body":Ljava/lang/String;
    .end local v13    # "replyStr":Ljava/lang/String;
    .end local v14    # "forwardStr":Ljava/lang/String;
    .end local v15    # "replyByChatStr":Ljava/lang/String;
    .end local v23    # "date":J
    .end local v25    # "firstCollapsed":I
    .end local v26    # "forceCollapsed":Z
    .end local v27    # "fromDiv":Ljava/lang/CharSequence;
    .end local v29    # "id":J
    .end local v31    # "labelIdsSplitter":Landroid/text/TextUtils$StringSplitter;
    .end local v32    # "lastLabelIds":Ljava/lang/String;
    .end local v33    # "lastMessage":I
    .end local v34    # "manuallyCollapsed":Ljava/lang/Boolean;
    .end local v35    # "manuallyExpanded":Ljava/lang/Boolean;
    .end local v36    # "manuallySet":Ljava/lang/Boolean;
    .end local v38    # "rawLabelIds":Ljava/lang/String;
    .end local v39    # "showExpanded":Z
    .end local v40    # "whichMessage":I
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    move-object v5, v0

    if-nez v5, :cond_6

    .line 628
    new-instance v5, Lcom/google/android/talk/NetworkProgressMonitor;

    const/4 v6, 0x0

    move-object v0, v5

    move-object/from16 v1, p0

    move-object v2, v6

    invoke-direct {v0, v1, v2}, Lcom/google/android/talk/NetworkProgressMonitor;-><init>(Landroid/app/Activity;Ljava/lang/Runnable;)V

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/SearchChatResultActivity;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    .line 629
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    move-object v5, v0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Lcom/google/android/talk/IProgressMonitor;->beginTask(Ljava/lang/CharSequence;I)V

    .line 798
    :cond_6
    :goto_6
    return-void

    .line 634
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    move-object v5, v0

    if-eqz v5, :cond_0

    .line 635
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    move-object v5, v0

    invoke-interface {v5}, Lcom/google/android/talk/IProgressMonitor;->done()V

    .line 636
    const/4 v5, 0x0

    move-object v0, v5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/talk/SearchChatResultActivity;->mProgressMonitor:Lcom/google/android/talk/IProgressMonitor;

    goto/16 :goto_0

    .line 640
    :pswitch_2
    invoke-direct/range {p0 .. p0}, Lcom/google/android/talk/SearchChatResultActivity;->showRetryAlert()V

    goto/16 :goto_0

    .line 738
    .restart local v7    # "messageId":Ljava/lang/String;
    .restart local v11    # "dateStr":Ljava/lang/String;
    .restart local v12    # "body":Ljava/lang/String;
    .restart local v13    # "replyStr":Ljava/lang/String;
    .restart local v14    # "forwardStr":Ljava/lang/String;
    .restart local v15    # "replyByChatStr":Ljava/lang/String;
    .restart local v23    # "date":J
    .restart local v25    # "firstCollapsed":I
    .restart local v29    # "id":J
    .restart local v31    # "labelIdsSplitter":Landroid/text/TextUtils$StringSplitter;
    .restart local v32    # "lastLabelIds":Ljava/lang/String;
    .restart local v33    # "lastMessage":I
    .restart local v38    # "rawLabelIds":Ljava/lang/String;
    .restart local v40    # "whichMessage":I
    :catchall_0
    move-exception v6

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v6

    .line 739
    .restart local v6    # "sb":Ljava/lang/StringBuilder;
    .restart local v36    # "manuallySet":Ljava/lang/Boolean;
    :cond_7
    const/4 v5, 0x0

    goto/16 :goto_2

    .line 740
    .restart local v35    # "manuallyExpanded":Ljava/lang/Boolean;
    :cond_8
    const/4 v5, 0x0

    goto/16 :goto_3

    .line 759
    .restart local v26    # "forceCollapsed":Z
    .restart local v27    # "fromDiv":Ljava/lang/CharSequence;
    .restart local v34    # "manuallyCollapsed":Ljava/lang/Boolean;
    .restart local v39    # "showExpanded":Z
    :cond_9
    const/4 v5, 0x0

    move/from16 v17, v5

    goto :goto_4

    .line 771
    :cond_a
    if-eqz v26, :cond_c

    .line 772
    if-ltz v25, :cond_b

    .line 773
    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object v2, v6

    move/from16 v3, v40

    move/from16 v4, v25

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/talk/SearchChatResultActivity;->maybeGenerateSuperCollapse(Landroid/provider/Gmail$MessageCursor;Ljava/lang/StringBuilder;II)V

    .line 774
    const/16 v25, -0x1

    .line 777
    :cond_b
    move-object/from16 v0, p0

    move-object v1, v6

    move-object/from16 v2, v37

    move/from16 v3, v40

    move/from16 v4, v40

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/talk/SearchChatResultActivity;->addCollapsedHeaders(Ljava/lang/StringBuilder;Landroid/provider/Gmail$MessageCursor;II)V

    .line 778
    move-object/from16 v0, v37

    move/from16 v1, v40

    invoke-virtual {v0, v1}, Landroid/provider/Gmail$MessageCursor;->moveTo(I)Z

    goto :goto_5

    .line 780
    :cond_c
    if-gez v25, :cond_5

    .line 781
    invoke-virtual/range {v37 .. v37}, Landroid/provider/Gmail$MessageCursor;->position()I

    move-result v25

    goto :goto_5

    .line 787
    .end local v7    # "messageId":Ljava/lang/String;
    .end local v11    # "dateStr":Ljava/lang/String;
    .end local v12    # "body":Ljava/lang/String;
    .end local v23    # "date":J
    .end local v26    # "forceCollapsed":Z
    .end local v27    # "fromDiv":Ljava/lang/CharSequence;
    .end local v29    # "id":J
    .end local v34    # "manuallyCollapsed":Ljava/lang/Boolean;
    .end local v35    # "manuallyExpanded":Ljava/lang/Boolean;
    .end local v36    # "manuallySet":Ljava/lang/Boolean;
    .end local v38    # "rawLabelIds":Ljava/lang/String;
    .end local v39    # "showExpanded":Z
    :cond_d
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "x-thread://"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mConversationId:Ljava/lang/Long;

    move-object v7, v0

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 790
    .local v17, "url":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mWebView:Landroid/webkit/WebView;

    move-object/from16 v16, v0

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    const-string v19, "text/html"

    const-string v20, "utf-8"

    const/16 v21, 0x0

    invoke-virtual/range {v16 .. v21}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 792
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mLastFromAddress:Ljava/lang/String;

    move-object v5, v0

    if-eqz v5, :cond_e

    .line 793
    const v5, 0x7f0b000a

    move-object/from16 v0, p0

    move v1, v5

    invoke-virtual {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->findViewById(I)Landroid/view/View;

    move-result-object v28

    check-cast v28, Lcom/android/internal/widget/ContactHeaderWidget;

    .line 794
    .local v28, "headerWidget":Lcom/android/internal/widget/ContactHeaderWidget;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/talk/SearchChatResultActivity;->mLastFromAddress:Ljava/lang/String;

    move-object v5, v0

    invoke-static {v5}, Landroid/provider/Telephony$Mms;->extractAddrSpec(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v28

    move-object v1, v5

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/ContactHeaderWidget;->bindFromEmail(Ljava/lang/String;)V

    .line 797
    .end local v28    # "headerWidget":Lcom/android/internal/widget/ContactHeaderWidget;
    :cond_e
    const/4 v5, 0x1

    move v0, v5

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/google/android/talk/SearchChatResultActivity;->mLoaded:Z

    goto/16 :goto_6

    .line 624
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private buildFromDiv(Landroid/provider/Gmail$MessageCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 5
    .param p1, "messageCursor"    # Landroid/provider/Gmail$MessageCursor;
    .param p2, "senderPersonal"    # Ljava/lang/String;
    .param p3, "senderEmail"    # Ljava/lang/String;
    .param p4, "messageId"    # Ljava/lang/String;

    .prologue
    .line 1226
    const-string v1, "<td><div onClick=\"contactSender(\'%s\', \'%s\')\" ><img class=\"presenceImg\"id=\"a:presence\" src=\"%s\"/></div></td><td align=\'left\' width=\'99%%\' onClick=\"toggleHeader(\'%s\')\" width=\"50\"><div class=\"fromDiv\"> %s </div></td>"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    invoke-direct {p0, p3}, Lcom/google/android/talk/SearchChatResultActivity;->getPresenceImage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object p4, v2, v3

    const/4 v3, 0x4

    invoke-virtual {p1}, Landroid/provider/Gmail$MessageCursor;->position()I

    move-result v4

    invoke-direct {p0, p2, v4}, Lcom/google/android/talk/SearchChatResultActivity;->colorizePersonal(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1230
    .local v0, "result":Ljava/lang/CharSequence;
    return-object v0
.end method

.method private colorizePersonal(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p1, "senderPersonal"    # Ljava/lang/String;
    .param p2, "position"    # I

    .prologue
    .line 1237
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<span style=\'color:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1, p2}, Lcom/google/android/talk/SearchChatResultActivity;->getColor(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</span>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private decodeIds([Ljava/lang/String;)Ljava/util/Map;
    .locals 9
    .param p1, "values"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1202
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v6

    .line 1203
    .local v6, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Boolean;>;"
    if-eqz p1, :cond_0

    .line 1204
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v7, v0, v2

    .line 1205
    .local v7, "value":Ljava/lang/String;
    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 1206
    .local v5, "longBoolean":[Ljava/lang/String;
    new-instance v3, Ljava/lang/Long;

    const/4 v8, 0x0

    aget-object v8, v5, v8

    invoke-direct {v3, v8}, Ljava/lang/Long;-><init>(Ljava/lang/String;)V

    .line 1207
    .local v3, "id":Ljava/lang/Long;
    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-static {v8}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 1208
    .local v1, "b":Ljava/lang/Boolean;
    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1204
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1212
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "b":Ljava/lang/Boolean;
    .end local v2    # "i$":I
    .end local v3    # "id":Ljava/lang/Long;
    .end local v4    # "len$":I
    .end local v5    # "longBoolean":[Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :cond_0
    return-object v6
.end method

.method public static ellipsize(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "maxCharacters"    # I

    .prologue
    .line 876
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 877
    .local v2, "length":I
    if-ge v2, p1, :cond_0

    move-object v4, p0

    .line 891
    :goto_0
    return-object v4

    .line 879
    :cond_0
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 881
    .local v3, "realMax":I
    const-string v4, "."

    invoke-virtual {p0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 882
    .local v1, "index":I
    const-string v0, "\u2026"

    .line 883
    .local v0, "extension":Ljava/lang/String;
    if-ltz v1, :cond_1

    .line 885
    sub-int v4, v2, v1

    const/4 v5, 0x5

    if-ge v4, v5, :cond_1

    .line 886
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 889
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    .line 890
    if-gez v3, :cond_2

    const/4 v3, 0x0

    .line 891
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method private encodeIds(Ljava/util/Map;)[Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Boolean;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1188
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Boolean;>;"
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v5

    new-array v4, v5, [Ljava/lang/String;

    .line 1189
    .local v4, "result":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 1190
    .local v1, "i":I
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .end local p0    # "this":Lcom/google/android/talk/SearchChatResultActivity;
    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1191
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/Boolean;>;"
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    .line 1194
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/Boolean;>;"
    :cond_0
    return-object v4
.end method

.method private getAddressesLine(Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;
    .locals 8
    .param p1, "messageCursor"    # Landroid/provider/Gmail$MessageCursor;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1147
    invoke-virtual {p1}, Landroid/provider/Gmail$MessageCursor;->getToAddresses()[Ljava/lang/String;

    move-result-object v4

    .line 1148
    .local v4, "toAddresses":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/provider/Gmail$MessageCursor;->getCcAddresses()[Ljava/lang/String;

    move-result-object v0

    .line 1149
    .local v0, "ccAddresses":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/provider/Gmail$MessageCursor;->getFromAddress()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLastFromAddress:Ljava/lang/String;

    .line 1151
    array-length v5, v4

    if-lez v5, :cond_3

    move v2, v7

    .line 1152
    .local v2, "hasToAddresses":Z
    :goto_0
    array-length v5, v0

    if-lez v5, :cond_4

    move v1, v7

    .line 1154
    .local v1, "hasCcAddresses":Z
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "<div class=\"addressDiv\">"

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1155
    .local v3, "sb":Ljava/lang/StringBuilder;
    if-eqz v2, :cond_0

    .line 1156
    iget-object v5, p0, Lcom/google/android/talk/SearchChatResultActivity;->mToHeading:Ljava/lang/String;

    invoke-direct {p0, v3, v5, v4}, Lcom/google/android/talk/SearchChatResultActivity;->addAddresses(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1158
    :cond_0
    if-eqz v1, :cond_2

    .line 1159
    if-eqz v2, :cond_1

    .line 1160
    const-string v5, "<br/>"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1162
    :cond_1
    iget-object v5, p0, Lcom/google/android/talk/SearchChatResultActivity;->mCcHeading:Ljava/lang/String;

    invoke-direct {p0, v3, v5, v0}, Lcom/google/android/talk/SearchChatResultActivity;->addAddresses(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)V

    .line 1164
    :cond_2
    const-string v5, "</div>"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1165
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .end local v1    # "hasCcAddresses":Z
    .end local v2    # "hasToAddresses":Z
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    :cond_3
    move v2, v6

    .line 1151
    goto :goto_0

    .restart local v2    # "hasToAddresses":Z
    :cond_4
    move v1, v6

    .line 1152
    goto :goto_1
.end method

.method private getColor(Ljava/lang/String;I)Ljava/lang/String;
    .locals 4
    .param p1, "senderPersonal"    # Ljava/lang/String;
    .param p2, "position"    # I

    .prologue
    .line 1263
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mCurrentColorMap:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1264
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 1269
    .end local v0    # "result":Ljava/lang/String;
    .local v1, "result":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 1267
    .end local v1    # "result":Ljava/lang/String;
    .restart local v0    # "result":Ljava/lang/String;
    :cond_0
    sget-object v2, Lcom/google/android/talk/SearchChatResultActivity;->AUTHOR_COLORS:[Ljava/lang/String;

    sget-object v3, Lcom/google/android/talk/SearchChatResultActivity;->AUTHOR_COLORS:[Ljava/lang/String;

    array-length v3, v3

    rem-int v3, p2, v3

    aget-object v0, v2, v3

    .line 1268
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mCurrentColorMap:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 1269
    .end local v0    # "result":Ljava/lang/String;
    .restart local v1    # "result":Ljava/lang/String;
    goto :goto_0
.end method

.method private getDisplayAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 1098
    invoke-direct {p0, p1}, Lcom/google/android/talk/SearchChatResultActivity;->getUnencodedDisplayAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->htmlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getId(Ljava/lang/String;)J
    .locals 2
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 361
    sget v0, Lcom/google/android/talk/SearchChatResultActivity;->MESSAGE_PREFIX_LENGTH:I

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 362
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method private getPresenceImage(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 908
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLastPresenceEmail:Ljava/lang/String;

    if-eq v0, p1, :cond_0

    .line 909
    iput-object p1, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLastPresenceEmail:Ljava/lang/String;

    .line 910
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/android/talk/ContactInfoQuery;->setContactInfo(JLjava/lang/String;)V

    .line 911
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    invoke-virtual {v0}, Lcom/google/android/talk/ContactInfoQuery;->startQueryForContactInfo()V

    .line 913
    :cond_0
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    return-object v0
.end method

.method private getSenderPersonal(Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;
    .locals 1
    .param p1, "messageCursor"    # Landroid/provider/Gmail$MessageCursor;

    .prologue
    .line 1142
    invoke-virtual {p1}, Landroid/provider/Gmail$MessageCursor;->getFromAddress()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/SearchChatResultActivity;->getDisplayAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSnippet(Landroid/provider/Gmail$MessageCursor;)Ljava/lang/String;
    .locals 2
    .param p1, "cursor"    # Landroid/provider/Gmail$MessageCursor;

    .prologue
    .line 896
    invoke-virtual {p1}, Landroid/provider/Gmail$MessageCursor;->getSnippet()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x23

    invoke-static {v0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->ellipsize(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getUnencodedDisplayAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 1102
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mEmailMatcher:Ljava/util/regex/Matcher;

    invoke-virtual {v2, p1}, Ljava/util/regex/Matcher;->reset(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 1104
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-nez v2, :cond_0

    move-object v2, p1

    .line 1114
    :goto_0
    return-object v2

    .line 1108
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 1110
    .local v1, "s":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    move-object v2, v1

    .line 1111
    goto :goto_0

    .line 1114
    :cond_1
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private getUnencodedSenderEmail(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 1123
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mEmailMatcher:Ljava/util/regex/Matcher;

    invoke-virtual {v2, p1}, Ljava/util/regex/Matcher;->reset(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 1125
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-nez v2, :cond_0

    move-object v2, p1

    .line 1135
    :goto_0
    return-object v2

    .line 1129
    :cond_0
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 1131
    .local v1, "s":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    move-object v2, v1

    .line 1132
    goto :goto_0

    :cond_1
    move-object v2, p1

    .line 1135
    goto :goto_0
.end method

.method private launchReplyByChat(Ljava/lang/String;)V
    .locals 5
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 490
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLastFromAddress:Ljava/lang/String;

    invoke-static {v2}, Landroid/provider/Telephony$Mms;->extractAddrSpec(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 492
    .local v0, "emailReplyAddress":Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SENDTO"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "imto://gtalk/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 495
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/google/android/talk/SearchChatResultActivity;->startActivity(Landroid/content/Intent;)V

    .line 496
    return-void
.end method

.method private launchReplyOrForward(ZLjava/lang/String;)V
    .locals 5
    .param p1, "forward"    # Z
    .param p2, "messageId"    # Ljava/lang/String;

    .prologue
    .line 475
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.SENDTO"

    const-string v4, "mailto:"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 476
    .local v2, "intent":Landroid/content/Intent;
    const-string v3, "action"

    if-eqz p1, :cond_1

    const/4 v4, 0x3

    :goto_0
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 478
    invoke-direct {p0, p2}, Lcom/google/android/talk/SearchChatResultActivity;->getId(Ljava/lang/String;)J

    move-result-wide v0

    .line 479
    .local v0, "id":J
    const-string v3, "in-reference-to"

    invoke-virtual {v2, v3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 480
    if-nez p1, :cond_0

    .line 481
    const-string v3, "to"

    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLastFromAddress:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 483
    :cond_0
    const/high16 v3, 0x80000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 485
    invoke-virtual {p0, v2}, Lcom/google/android/talk/SearchChatResultActivity;->startActivity(Landroid/content/Intent;)V

    .line 486
    return-void

    .line 476
    .end local v0    # "id":J
    :cond_1
    const/4 v4, 0x1

    goto :goto_0
.end method

.method private maybeGenerateSuperCollapse(Landroid/provider/Gmail$MessageCursor;Ljava/lang/StringBuilder;II)V
    .locals 9
    .param p1, "messageCursor"    # Landroid/provider/Gmail$MessageCursor;
    .param p2, "sb"    # Ljava/lang/StringBuilder;
    .param p3, "whichMessage"    # I
    .param p4, "firstCollapsed"    # I

    .prologue
    const/4 v7, 0x1

    .line 803
    invoke-virtual {p1}, Landroid/provider/Gmail$MessageCursor;->position()I

    move-result v5

    sub-int v2, v5, v7

    .line 804
    .local v2, "lastCollapsed":I
    sub-int v5, v2, p4

    add-int/lit8 v0, v5, 0x1

    .line 805
    .local v0, "collapsedCount":I
    if-lt v0, v7, :cond_2

    .line 806
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_collapsed"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 807
    .local v1, "collapsedId":Ljava/lang/String;
    const-string v5, "<div id=\""

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 808
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 809
    const-string v5, "\"><a onClick=\"uncollapse(\'"

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 810
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 811
    const-string v5, "\', "

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 812
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 813
    const-string v5, ", "

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 814
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 815
    const-string v5, ")\"><div class=\"superCollapsedDiv size"

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 816
    sub-int v3, p3, p4

    .line 817
    .local v3, "readMessages":I
    if-ne v3, v7, :cond_0

    const-string v5, "1"

    :goto_0
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 818
    const-string v5, "\"><div class=\"superCollapsedLabel\">"

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 819
    invoke-virtual {p0}, Lcom/google/android/talk/SearchChatResultActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v6, 0x7f080000

    invoke-virtual {v5, v6, v3}, Landroid/content/res/Resources;->getQuantityText(II)Ljava/lang/CharSequence;

    move-result-object v4

    .line 821
    .local v4, "template":Ljava/lang/CharSequence;
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 822
    const-string v5, "</div></div></a></div>"

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 828
    .end local v1    # "collapsedId":Ljava/lang/String;
    .end local v3    # "readMessages":I
    .end local v4    # "template":Ljava/lang/CharSequence;
    :goto_1
    return-void

    .line 817
    .restart local v1    # "collapsedId":Ljava/lang/String;
    .restart local v3    # "readMessages":I
    :cond_0
    const/4 v5, 0x2

    if-ne v3, v5, :cond_1

    const-string v5, "2"

    goto :goto_0

    :cond_1
    const-string v5, "n"

    goto :goto_0

    .line 825
    .end local v1    # "collapsedId":Ljava/lang/String;
    .end local v3    # "readMessages":I
    :cond_2
    invoke-direct {p0, p2, p1, p4, v2}, Lcom/google/android/talk/SearchChatResultActivity;->addCollapsedHeaders(Ljava/lang/StringBuilder;Landroid/provider/Gmail$MessageCursor;II)V

    .line 826
    invoke-virtual {p1, p3}, Landroid/provider/Gmail$MessageCursor;->moveTo(I)Z

    goto :goto_1
.end method

.method public static restrictWebView(Landroid/webkit/WebView;)V
    .locals 2
    .param p0, "webView"    # Landroid/webkit/WebView;

    .prologue
    const/4 v1, 0x0

    .line 587
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 588
    .local v0, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 589
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 590
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 591
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 592
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setBlockNetworkImage(Z)V

    .line 593
    return-void
.end method

.method private showRetryAlert()V
    .locals 4

    .prologue
    .line 596
    new-instance v0, Lcom/google/android/talk/SearchChatResultActivity$2;

    invoke-direct {v0, p0}, Lcom/google/android/talk/SearchChatResultActivity$2;-><init>(Lcom/google/android/talk/SearchChatResultActivity;)V

    .line 603
    .local v0, "buttonListener":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Lcom/google/android/talk/SearchChatResultActivity$3;

    invoke-direct {v1, p0}, Lcom/google/android/talk/SearchChatResultActivity$3;-><init>(Lcom/google/android/talk/SearchChatResultActivity;)V

    .line 609
    .local v1, "cancelListener":Landroid/content/DialogInterface$OnCancelListener;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f060090

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f060091

    invoke-virtual {v2, v3, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 614
    return-void
.end method


# virtual methods
.method public onContactInfoLoaded(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "presenceStatus"    # I
    .param p2, "customStatus"    # Ljava/lang/String;
    .param p3, "nickName"    # Ljava/lang/String;
    .param p4, "avatar"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const-string v1, "file:///android_asset/presence_away.png"

    .line 1291
    packed-switch p1, :pswitch_data_0

    .line 1314
    const-string v0, "file:///android_asset/presence_offline.png"

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    .line 1317
    :goto_0
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLastPresencePath:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    if-eq v0, v1, :cond_0

    .line 1318
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mLastPresencePath:Ljava/lang/String;

    .line 1319
    invoke-direct {p0}, Lcom/google/android/talk/SearchChatResultActivity;->buildConversationIfLoaded()V

    .line 1321
    :cond_0
    return-void

    .line 1293
    :pswitch_0
    const-string v0, "file:///android_asset/presence_online.png"

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    goto :goto_0

    .line 1297
    :pswitch_1
    const-string v0, "file:///android_asset/presence_away.png"

    iput-object v1, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    goto :goto_0

    .line 1301
    :pswitch_2
    const-string v0, "file:///android_asset/presence_away.png"

    iput-object v1, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    goto :goto_0

    .line 1305
    :pswitch_3
    const-string v0, "file:///android_asset/presence_busy.png"

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    goto :goto_0

    .line 1309
    :pswitch_4
    const-string v0, "file:///android_asset/presence_invisible.png"

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mPresencePath:Ljava/lang/String;

    goto :goto_0

    .line 1291
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 533
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 534
    invoke-virtual {p0, v4}, Lcom/google/android/talk/SearchChatResultActivity;->requestWindowFeature(I)Z

    .line 536
    const v0, 0x7f030010

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchChatResultActivity;->setContentView(I)V

    .line 537
    const v0, 0x7f0b002f

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchChatResultActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/webkit/WebView;

    .line 538
    .local v11, "webView":Landroid/webkit/WebView;
    iput-object v11, p0, Lcom/google/android/talk/SearchChatResultActivity;->mWebView:Landroid/webkit/WebView;

    .line 539
    invoke-virtual {p0}, Lcom/google/android/talk/SearchChatResultActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060094

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 540
    .local v10, "loading":Ljava/lang/String;
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<h3><p align=\"center\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</p></h3>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "text/html"

    const-string v3, "utf-8"

    invoke-virtual {v0, v1, v2, v3}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    invoke-static {v11}, Lcom/google/android/talk/SearchChatResultActivity;->restrictWebView(Landroid/webkit/WebView;)V

    .line 546
    invoke-virtual {p0, v11}, Lcom/google/android/talk/SearchChatResultActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 548
    invoke-virtual {v11, v6}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    .line 550
    invoke-virtual {p0}, Lcom/google/android/talk/SearchChatResultActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    .line 551
    .local v9, "extras":Landroid/os/Bundle;
    const-string v0, "account"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mAccount:Ljava/lang/String;

    .line 552
    const-string v0, "thread-id"

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mConversationId:Ljava/lang/Long;

    .line 554
    invoke-static {p0}, Lcom/google/android/talk/TalkApp;->getApplication(Landroid/app/Activity;)Lcom/google/android/talk/TalkApp;

    move-result-object v7

    .line 555
    .local v7, "app":Lcom/google/android/talk/TalkApp;
    invoke-virtual {v7}, Lcom/google/android/talk/TalkApp;->getGmailProvider()Landroid/provider/Gmail;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mGmail:Landroid/provider/Gmail;

    .line 557
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mGmail:Landroid/provider/Gmail;

    iget-object v1, p0, Lcom/google/android/talk/SearchChatResultActivity;->mAccount:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mConversationId:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/provider/Gmail;->getMessageCursorForConversationId(Ljava/lang/String;J)Landroid/provider/Gmail$MessageCursor;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    .line 558
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v0}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/talk/SearchChatResultActivity;->startManagingCursor(Landroid/database/Cursor;)V

    .line 561
    new-instance v0, Lcom/google/android/talk/SearchChatResultActivity$ConversationContentObserver;

    invoke-direct {v0, p0}, Lcom/google/android/talk/SearchChatResultActivity$ConversationContentObserver;-><init>(Lcom/google/android/talk/SearchChatResultActivity;)V

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mContentObserver:Landroid/database/ContentObserver;

    .line 562
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    iget-object v1, p0, Lcom/google/android/talk/SearchChatResultActivity;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/provider/Gmail$MessageCursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 564
    invoke-virtual {v11}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 566
    new-instance v0, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;

    invoke-direct {v0, p0}, Lcom/google/android/talk/SearchChatResultActivity$GmailJsInterface;-><init>(Lcom/google/android/talk/SearchChatResultActivity;)V

    const-string v1, "gmail"

    invoke-virtual {v11, v0, v1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 568
    if-eqz p1, :cond_0

    .line 569
    const-string v0, "expanded-ids"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/SearchChatResultActivity;->decodeIds([Ljava/lang/String;)Ljava/util/Map;

    move-result-object v8

    .line 571
    .local v8, "expandedMessageIds":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Boolean;>;"
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    monitor-enter v0

    .line 572
    :try_start_0
    iput-object v8, p0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    .line 573
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 574
    const-string v0, "webview-y"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mWebViewY:I

    .line 578
    .end local v8    # "expandedMessageIds":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Boolean;>;"
    :cond_0
    new-instance v0, Lcom/google/android/talk/ContactInfoQuery;

    const-wide/16 v2, 0x0

    iget-object v4, p0, Lcom/google/android/talk/SearchChatResultActivity;->mAccount:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/talk/SearchChatResultActivity;->mContentObserver:Landroid/database/ContentObserver;

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/google/android/talk/ContactInfoQuery;-><init>(Landroid/content/Context;JLjava/lang/String;Landroid/database/ContentObserver;Z)V

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    .line 579
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    invoke-virtual {v0, p0}, Lcom/google/android/talk/ContactInfoQuery;->setContactInfoCallback(Lcom/google/android/talk/ContactInfoQuery$ContactInfoQueryCallback;)V

    .line 580
    return-void

    .line 573
    .restart local v8    # "expandedMessageIds":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Boolean;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 1064
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 1065
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v0}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 1067
    const-string v0, "talk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " onPause() finished"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1073
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 1086
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 1087
    const-string v0, "expanded-ids"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/talk/SearchChatResultActivity;->decodeIds([Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    .line 1088
    return-void
.end method

.method public onResume()V
    .locals 5

    .prologue
    .line 1037
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 1041
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->count()I

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->getStatus()Landroid/provider/Gmail$CursorStatus;

    move-result-object v2

    sget-object v3, Landroid/provider/Gmail$CursorStatus;->LOADING:Landroid/provider/Gmail$CursorStatus;

    if-eq v2, v3, :cond_0

    .line 1043
    invoke-virtual {p0}, Lcom/google/android/talk/SearchChatResultActivity;->finish()V

    .line 1054
    :goto_0
    return-void

    .line 1047
    :cond_0
    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mMessageCursor:Landroid/provider/Gmail$MessageCursor;

    invoke-virtual {v2}, Landroid/provider/Gmail$MessageCursor;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 1048
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    move-result v1

    .line 1049
    .local v1, "success":Z
    if-nez v1, :cond_1

    .line 1050
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " onResume() could not requery cursor"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1052
    :cond_1
    invoke-direct {p0}, Lcom/google/android/talk/SearchChatResultActivity;->buildConversationIfLoaded()V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 1077
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 1078
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    monitor-enter v0

    .line 1079
    :try_start_0
    const-string v1, "expanded-ids"

    iget-object v2, p0, Lcom/google/android/talk/SearchChatResultActivity;->mExpandedMessageIds:Ljava/util/Map;

    invoke-direct {p0, v2}, Lcom/google/android/talk/SearchChatResultActivity;->encodeIds(Ljava/util/Map;)[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1080
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1081
    const-string v0, "webview-y"

    iget-object v1, p0, Lcom/google/android/talk/SearchChatResultActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getScrollY()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1082
    return-void

    .line 1080
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 1058
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 1059
    iget-object v0, p0, Lcom/google/android/talk/SearchChatResultActivity;->mContactInfoQuery:Lcom/google/android/talk/ContactInfoQuery;

    invoke-virtual {v0}, Lcom/google/android/talk/ContactInfoQuery;->cleanupContactInfoCursor()V

    .line 1060
    return-void
.end method
