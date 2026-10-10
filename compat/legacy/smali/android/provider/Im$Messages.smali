.class public final Landroid/provider/Im$Messages;
.super Ljava/lang/Object;
.source "Im.java"

# interfaces
.implements Landroid/provider/BaseColumns;
.implements Landroid/provider/Im$MessageColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/Im;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Messages"
.end annotation


# static fields
.field public static final CONTACT:Ljava/lang/String; = "contact"

.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/gtalk-messages"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/gtalk-messages"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

.field public static final CONTENT_URI_MESSAGES_BY_ACCOUNT_AND_CONTACT:Landroid/net/Uri;

.field public static final CONTENT_URI_MESSAGES_BY_PROVIDER:Landroid/net/Uri;

.field public static final CONTENT_URI_MESSAGES_BY_THREAD_ID:Landroid/net/Uri;

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "date ASC"

.field public static final OTR_MESSAGES_CONTENT_URI:Landroid/net/Uri;

.field public static final OTR_MESSAGES_CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

.field public static final OTR_MESSAGES_CONTENT_URI_BY_ACCOUNT_AND_CONTACT:Landroid/net/Uri;

.field public static final OTR_MESSAGES_CONTENT_URI_BY_PROVIDER:Landroid/net/Uri;

.field public static final OTR_MESSAGES_CONTENT_URI_BY_THREAD_ID:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1068
    const-string v0, "content://com.google.android.providers.talk/messages"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    .line 1074
    const-string v0, "content://com.google.android.providers.talk/messagesByThreadId"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->CONTENT_URI_MESSAGES_BY_THREAD_ID:Landroid/net/Uri;

    .line 1080
    const-string v0, "content://com.google.android.providers.talk/messagesByAcctAndContact"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->CONTENT_URI_MESSAGES_BY_ACCOUNT_AND_CONTACT:Landroid/net/Uri;

    .line 1086
    const-string v0, "content://com.google.android.providers.talk/messagesByProvider"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->CONTENT_URI_MESSAGES_BY_PROVIDER:Landroid/net/Uri;

    .line 1092
    const-string v0, "content://com.google.android.providers.talk/messagesByAccount"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

    .line 1098
    const-string v0, "content://com.google.android.providers.talk/otrMessages"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI:Landroid/net/Uri;

    .line 1104
    const-string v0, "content://com.google.android.providers.talk/otrMessagesByThreadId"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI_BY_THREAD_ID:Landroid/net/Uri;

    .line 1110
    const-string v0, "content://com.google.android.providers.talk/otrMessagesByAcctAndContact"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI_BY_ACCOUNT_AND_CONTACT:Landroid/net/Uri;

    .line 1116
    const-string v0, "content://com.google.android.providers.talk/otrMessagesByProvider"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI_BY_PROVIDER:Landroid/net/Uri;

    .line 1122
    const-string v0, "content://com.google.android.providers.talk/otrMessagesByAccount"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 959
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getContentUriByAccount(J)Landroid/net/Uri;
    .registers 4
    .param p0, "accountId"    # J

    .prologue
    .line 1008
    sget-object v1, Landroid/provider/Im$Messages;->CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 1009
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-static {v0, p0, p1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 1010
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public static final getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;
    .registers 5
    .param p0, "accountId"    # J
    .param p2, "username"    # Ljava/lang/String;

    .prologue
    .line 983
    sget-object v1, Landroid/provider/Im$Messages;->CONTENT_URI_MESSAGES_BY_ACCOUNT_AND_CONTACT:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 984
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-static {v0, p0, p1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 985
    invoke-virtual {v0, p2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 986
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public static final getContentUriByProvider(J)Landroid/net/Uri;
    .registers 4
    .param p0, "providerId"    # J

    .prologue
    .line 996
    sget-object v1, Landroid/provider/Im$Messages;->CONTENT_URI_MESSAGES_BY_PROVIDER:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 997
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-static {v0, p0, p1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 998
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public static final getContentUriByThreadId(J)Landroid/net/Uri;
    .registers 4
    .param p0, "threadId"    # J

    .prologue
    .line 968
    sget-object v1, Landroid/provider/Im$Messages;->CONTENT_URI_MESSAGES_BY_THREAD_ID:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 969
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-static {v0, p0, p1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 970
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public static final getOtrMessagesContentUriByAccount(J)Landroid/net/Uri;
    .registers 4
    .param p0, "accountId"    # J

    .prologue
    .line 1060
    sget-object v1, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI_BY_ACCOUNT:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 1061
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-static {v0, p0, p1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 1062
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public static final getOtrMessagesContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;
    .registers 5
    .param p0, "accountId"    # J
    .param p2, "username"    # Ljava/lang/String;

    .prologue
    .line 1035
    sget-object v1, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI_BY_ACCOUNT_AND_CONTACT:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 1036
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-static {v0, p0, p1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 1037
    invoke-virtual {v0, p2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 1038
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public static final getOtrMessagesContentUriByProvider(J)Landroid/net/Uri;
    .registers 4
    .param p0, "providerId"    # J

    .prologue
    .line 1048
    sget-object v1, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI_BY_PROVIDER:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 1049
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-static {v0, p0, p1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 1050
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public static final getOtrMessagesContentUriByThreadId(J)Landroid/net/Uri;
    .registers 4
    .param p0, "threadId"    # J

    .prologue
    .line 1020
    sget-object v1, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI_BY_THREAD_ID:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 1021
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-static {v0, p0, p1}, Landroid/content/ContentUris;->appendId(Landroid/net/Uri$Builder;J)Landroid/net/Uri$Builder;

    .line 1022
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method
