.class public Lcom/google/android/providers/talk/TalkProvider;
.super Landroid/content/ContentProvider;
.source "TalkProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/providers/talk/TalkProvider$DatabaseHelper;
    }
.end annotation


# static fields
.field private static final AUTHORITY:Ljava/lang/String; = "com.google.android.providers.talk"

.field private static final BLOCKEDLIST_JOIN_AVATAR_TABLE:Ljava/lang/String; = "blockedList LEFT OUTER JOIN avatars ON (blockedList.username = avatars.contact AND blockedList.account = avatars.account_id)"

.field private static final BLOCKED_CONTACTS_WHERE_CLAUSE:Ljava/lang/String; = "(contacts.type=3)"

.field private static final CHATS_CONTACT_ID:Ljava/lang/String; = "chats.contact_id"

.field private static final CONTACTS_WITH_NO_PRESENCE_SELECTION:Ljava/lang/String; = "account=? AND _id in (select contacts._id from contacts left outer join presence on contacts._id=presence.contact_id where presence.contact_id IS NULL)"

.field private static final CONTACT_ID:Ljava/lang/String; = "contacts._id"

.field private static final CONTACT_ID_COLUMN:I = 0x0

.field private static final CONTACT_ID_PROJECTION:[Ljava/lang/String;

.field private static final CONTACT_ID_QUERY_SELECTION:Ljava/lang/String; = "account=? AND username=?"

.field private static final CONTACT_JOIN_PRESENCE_CHAT_AVATAR_TABLE:Ljava/lang/String; = "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id) LEFT OUTER JOIN chats ON (contacts._id = chats.contact_id) LEFT OUTER JOIN avatars ON (contacts.username = avatars.contact AND contacts.account = avatars.account_id)"

.field private static final CONTACT_JOIN_PRESENCE_CHAT_TABLE:Ljava/lang/String; = "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id) LEFT OUTER JOIN chats ON (contacts._id = chats.contact_id)"

.field private static final CONTACT_JOIN_PRESENCE_TABLE:Ljava/lang/String; = "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id)"

.field private static final DATABASE_NAME:Ljava/lang/String; = "talk.db"

.field private static final DATABASE_VERSION:I = 0x35

.field private static final DBG:Z = false

.field private static final DELETE_CHATS_SELECTION:Ljava/lang/String; = "contact_id in (select chats.contact_id from chats left outer join contacts on chats.contact_id=contacts._id where contacts._id IS NULL)"

.field private static final DELETE_GROUP_MEMBER_SELECTION:Ljava/lang/String; = "groupId in (select groupMembers.groupId from groupMembers left outer join contacts on groupMembers.groupId=contacts._id where contacts._id IS NULL)"

.field private static final DELETE_GROUP_MESSAGES_SELECTION:Ljava/lang/String; = "thread_id in (select messages.thread_id from messages left outer join contacts on messages.thread_id=contacts._id where contacts._id IS NULL)"

.field private static final DELETE_PRESENCE_SELECTION:Ljava/lang/String; = "contact_id in (select presence.contact_id from presence left outer join contacts on presence.contact_id=contacts._id where contacts._id IS NULL)"

.field private static final GROUP_MEMBER_ID:Ljava/lang/String; = "groupMembers.groupId"

.field private static final GROUP_MESSAGES_ID:Ljava/lang/String; = "messages.thread_id"

.field private static final IN_MEMORY_MESSAGES_JOIN_CONTACT_TABLE:Ljava/lang/String; = "inMemoryMessages LEFT OUTER JOIN contacts ON (contacts._id = inMemoryMessages.thread_id)"

.field private static final LOG_TAG:Ljava/lang/String; = "TalkProvider"

.field protected static final MATCH_ACCOUNTS:I = 0xa

.field protected static final MATCH_ACCOUNTS_BY_ID:I = 0xb

.field protected static final MATCH_ACCOUNTS_STATUS:I = 0x68

.field protected static final MATCH_ACCOUNT_STATUS:I = 0x69

.field protected static final MATCH_AVATAR:I = 0x47

.field protected static final MATCH_AVATARS:I = 0x46

.field protected static final MATCH_AVATAR_BY_PROVIDER:I = 0x48

.field protected static final MATCH_BLOCKEDLIST:I = 0x23

.field protected static final MATCH_BLOCKEDLIST_BY_PROVIDER:I = 0x24

.field protected static final MATCH_BLOCKED_CONTACTS:I = 0x1f

.field protected static final MATCH_BRANDING_RESOURCE_MAP_CACHE:I = 0x6a

.field protected static final MATCH_CHATS:I = 0x50

.field protected static final MATCH_CHATS_BY_ACCOUNT:I = 0x51

.field protected static final MATCH_CHATS_ID:I = 0x52

.field protected static final MATCH_CHATTING_CONTACTS:I = 0x15

.field protected static final MATCH_CHATTING_CONTACTS_BY_PROVIDER:I = 0x17

.field protected static final MATCH_CONTACT:I = 0x1b

.field protected static final MATCH_CONTACTLIST:I = 0x22

.field protected static final MATCH_CONTACTLISTS:I = 0x20

.field protected static final MATCH_CONTACTLISTS_BY_PROVIDER:I = 0x21

.field protected static final MATCH_CONTACTS:I = 0x12

.field protected static final MATCH_CONTACTS_BAREBONE:I = 0x14

.field protected static final MATCH_CONTACTS_BULK:I = 0x1c

.field protected static final MATCH_CONTACTS_BY_PROVIDER:I = 0x16

.field protected static final MATCH_CONTACTS_ETAG:I = 0x26

.field protected static final MATCH_CONTACTS_ETAGS:I = 0x25

.field protected static final MATCH_CONTACTS_JOIN_PRESENCE:I = 0x13

.field protected static final MATCH_GROUP_MEMBERS:I = 0x41

.field protected static final MATCH_GROUP_MEMBERS_BY_GROUP:I = 0x42

.field protected static final MATCH_INVITATION:I = 0x65

.field protected static final MATCH_INVITATIONS:I = 0x64

.field protected static final MATCH_LAST_RMQ_ID:I = 0xcb

.field protected static final MATCH_MESSAGE:I = 0x37

.field protected static final MATCH_MESSAGES:I = 0x32

.field protected static final MATCH_MESSAGES_BY_ACCOUNT:I = 0x36

.field protected static final MATCH_MESSAGES_BY_CONTACT:I = 0x33

.field protected static final MATCH_MESSAGES_BY_PROVIDER:I = 0x35

.field protected static final MATCH_MESSAGES_BY_THREAD_ID:I = 0x34

.field protected static final MATCH_NO_CHATTING_CONTACTS_BY_PROVIDER:I = 0x18

.field protected static final MATCH_OFFLINE_CONTACTS_BY_PROVIDER:I = 0x1a

.field protected static final MATCH_ONLINE_CONTACTS_BY_PROVIDER:I = 0x19

.field protected static final MATCH_ONLINE_CONTACT_COUNT:I = 0x1e

.field protected static final MATCH_OTR_MESSAGE:I = 0x3d

.field protected static final MATCH_OTR_MESSAGES:I = 0x38

.field protected static final MATCH_OTR_MESSAGES_BY_ACCOUNT:I = 0x3c

.field protected static final MATCH_OTR_MESSAGES_BY_CONTACT:I = 0x39

.field protected static final MATCH_OTR_MESSAGES_BY_PROVIDER:I = 0x3b

.field protected static final MATCH_OTR_MESSAGES_BY_THREAD_ID:I = 0x3a

.field protected static final MATCH_OUTGOING_HIGHEST_RMQ_ID:I = 0xca

.field protected static final MATCH_OUTGOING_RMQ_MESSAGE:I = 0xc9

.field protected static final MATCH_OUTGOING_RMQ_MESSAGES:I = 0xc8

.field protected static final MATCH_PRESENCE:I = 0x28

.field protected static final MATCH_PRESENCE_BULK:I = 0x2c

.field protected static final MATCH_PRESENCE_BY_ACCOUNT:I = 0x2a

.field protected static final MATCH_PRESENCE_ID:I = 0x29

.field protected static final MATCH_PRESENCE_SEED_BY_ACCOUNT:I = 0x2b

.field protected static final MATCH_PROVIDERS:I = 0x1

.field protected static final MATCH_PROVIDERS_BY_ID:I = 0x2

.field protected static final MATCH_PROVIDERS_WITH_ACCOUNT:I = 0x3

.field protected static final MATCH_PROVIDER_SETTINGS:I = 0x5a

.field protected static final MATCH_PROVIDER_SETTINGS_BY_ID:I = 0x5b

.field protected static final MATCH_PROVIDER_SETTINGS_BY_ID_AND_NAME:I = 0x5c

.field protected static final MATCH_S2D_RMQ_IDS:I = 0xcc

.field protected static final MATCH_SESSIONS:I = 0x53

.field protected static final MATCH_SESSIONS_BY_PROVIDER:I = 0x54

.field private static final MESSAGE_JOIN_CONTACT_TABLE:Ljava/lang/String; = "messages LEFT OUTER JOIN contacts ON (contacts._id = messages.thread_id)"

.field private static final NON_BLOCKED_CONTACTS_WHERE_CLAUSE:Ljava/lang/String;

.field private static final PRESENCE_CONTACT_ID:Ljava/lang/String; = "presence.contact_id"

.field private static final PROVIDER_JOIN_ACCOUNT_TABLE:Ljava/lang/String; = "providers LEFT OUTER JOIN accounts ON (providers._id = accounts.provider AND accounts.active = 1) LEFT OUTER JOIN accountStatus ON (accounts._id = accountStatus.account)"

.field private static final TABLE_ACCOUNTS:Ljava/lang/String; = "accounts"

.field private static final TABLE_ACCOUNT_STATUS:Ljava/lang/String; = "accountStatus"

.field private static final TABLE_AVATARS:Ljava/lang/String; = "avatars"

.field private static final TABLE_BLOCKED_LIST:Ljava/lang/String; = "blockedList"

.field private static final TABLE_BRANDING_RESOURCE_MAP_CACHE:Ljava/lang/String; = "brandingResMapCache"

.field private static final TABLE_CHATS:Ljava/lang/String; = "chats"

.field private static final TABLE_CONTACTS:Ljava/lang/String; = "contacts"

.field private static final TABLE_CONTACTS_ETAG:Ljava/lang/String; = "contactsEtag"

.field private static final TABLE_CONTACT_LIST:Ljava/lang/String; = "contactList"

.field private static final TABLE_GROUP_MEMBERS:Ljava/lang/String; = "groupMembers"

.field private static final TABLE_INVITATIONS:Ljava/lang/String; = "invitations"

.field private static final TABLE_IN_MEMORY_MESSAGES:Ljava/lang/String; = "inMemoryMessages"

.field private static final TABLE_LAST_RMQ_ID:Ljava/lang/String; = "lastrmqid"

.field private static final TABLE_MESSAGES:Ljava/lang/String; = "messages"

.field private static final TABLE_OUTGOING_RMQ_MESSAGES:Ljava/lang/String; = "outgoingRmqMessages"

.field private static final TABLE_PRESENCE:Ljava/lang/String; = "presence"

.field private static final TABLE_PROVIDERS:Ljava/lang/String; = "providers"

.field private static final TABLE_PROVIDER_SETTINGS:Ljava/lang/String; = "providerSettings"

.field private static final TABLE_S2D_RMQ_IDS:Ljava/lang/String; = "s2dRmqIds"

.field private static final TABLE_SESSION_COOKIES:Ljava/lang/String; = "sessionCookies"

.field private static final USERNAME:Ljava/lang/String; = "username"

.field private static final sBlockedListProjectionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sContactListProjectionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sContactsProjectionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sInMemoryMessagesProjectionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sMessagesProjectionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sProviderAccountsProjectionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final BACKFILL_PROJECTION:[Ljava/lang/String;

.field private final FIND_SHORTCUT_PROJECTION:[Ljava/lang/String;

.field private final mDatabaseName:Ljava/lang/String;

.field private final mDatabaseVersion:I

.field protected mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

.field private mQueryContactIdSelectionArgs1:[Ljava/lang/String;

.field private mQueryContactIdSelectionArgs2:[Ljava/lang/String;

.field private final mTransientDbName:Ljava/lang/String;

.field protected final mUrlMatcher:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const-string v7, "COUNT(*) AS _count"

    const-string v6, "_count"

    const-string v5, "provider"

    const-string v4, "account"

    const-string v3, "_id"

    .line 196
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(type IS NULL OR type!="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/providers/talk/TalkProvider;->NON_BLOCKED_CONTACTS_WHERE_CLAUSE:Ljava/lang/String;

    .line 221
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v3, v0, v1

    sput-object v0, Lcom/google/android/providers/talk/TalkProvider;->CONTACT_ID_PROJECTION:[Ljava/lang/String;

    .line 792
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    .line 793
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v1, "providers._id AS _id"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 795
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "_count"

    const-string v1, "COUNT(*) AS _account"

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 797
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "name"

    const-string v2, "providers.name AS name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "fullname"

    const-string v2, "providers.fullname AS fullname"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 801
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "category"

    const-string v2, "providers.category AS category"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 803
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "account_id"

    const-string v2, "accounts._id AS account_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 805
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "account_username"

    const-string v2, "accounts.username AS account_username"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 807
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "account_pw"

    const-string v2, "accounts.pw AS account_pw"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 809
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "account_locked"

    const-string v2, "accounts.locked AS account_locked"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 811
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "account_keepSignedIn"

    const-string v2, "accounts.keep_signed_in AS account_keepSignedIn"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 813
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "account_presenceStatus"

    const-string v2, "accountStatus.presenceStatus AS account_presenceStatus"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 815
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    const-string v1, "account_connStatus"

    const-string v2, "accountStatus.connStatus AS account_connStatus"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 819
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    .line 822
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v1, "contacts._id AS _id"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 823
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "_count"

    const-string v1, "COUNT(*) AS _count"

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v1, "contacts._id as _id"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 827
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "username"

    const-string v2, "contacts.username as username"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "nickname"

    const-string v2, "contacts.nickname as nickname"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 829
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "provider"

    const-string v1, "contacts.provider as provider"

    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 830
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "account"

    const-string v1, "contacts.account as account"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 831
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "contactList"

    const-string v2, "contacts.contactList as contactList"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 832
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "type"

    const-string v2, "contacts.type as type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 833
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "subscriptionStatus"

    const-string v2, "contacts.subscriptionStatus as subscriptionStatus"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 835
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "subscriptionType"

    const-string v2, "contacts.subscriptionType as subscriptionType"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 837
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "qc"

    const-string v2, "contacts.qc as qc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 838
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "rejected"

    const-string v2, "contacts.rejected as rejected"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 841
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "contact_id"

    const-string v2, "presence.contact_id AS contact_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 843
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "mode"

    const-string v2, "presence.mode AS mode"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 845
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "status"

    const-string v2, "presence.status AS status"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 847
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "client_type"

    const-string v2, "presence.client_type AS client_type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 851
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "chats_contact"

    const-string v2, "chats.contact_id AS chats_contact_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 853
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "jid_resource"

    const-string v2, "chats.jid_resource AS jid_resource"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 855
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "groupchat"

    const-string v2, "chats.groupchat AS groupchat"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 857
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "last_unread_message"

    const-string v2, "chats.last_unread_message AS last_unread_message"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 859
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "last_message_date"

    const-string v2, "chats.last_message_date AS last_message_date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 861
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "unsent_composed_message"

    const-string v2, "chats.unsent_composed_message AS unsent_composed_message"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 863
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "shortcut"

    const-string v2, "chats.SHORTCUT AS shortcut"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 866
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "avatars_hash"

    const-string v2, "avatars.hash AS avatars_hash"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 867
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    const-string v1, "avatars_data"

    const-string v2, "avatars.data AS avatars_data"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 870
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactListProjectionMap:Ljava/util/HashMap;

    .line 871
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactListProjectionMap:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v1, "contactList._id AS _id"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 872
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactListProjectionMap:Ljava/util/HashMap;

    const-string v1, "_count"

    const-string v1, "COUNT(*) AS _count"

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 873
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactListProjectionMap:Ljava/util/HashMap;

    const-string v1, "name"

    const-string v2, "name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 874
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactListProjectionMap:Ljava/util/HashMap;

    const-string v1, "provider"

    const-string v1, "provider"

    invoke-virtual {v0, v5, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 875
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactListProjectionMap:Ljava/util/HashMap;

    const-string v1, "account"

    const-string v1, "account"

    invoke-virtual {v0, v4, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 878
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    .line 879
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v1, "blockedList._id AS _id"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 880
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    const-string v1, "_count"

    const-string v1, "COUNT(*) AS _count"

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 881
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    const-string v1, "username"

    const-string v2, "username"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 882
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    const-string v1, "nickname"

    const-string v2, "nickname"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 883
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    const-string v1, "provider"

    const-string v1, "provider"

    invoke-virtual {v0, v5, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 884
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    const-string v1, "account"

    const-string v1, "account"

    invoke-virtual {v0, v4, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 885
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    const-string v1, "avatars_data"

    const-string v2, "avatars.data AS avatars_data"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 889
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    .line 890
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v1, "messages._id AS _id"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 891
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "_count"

    const-string v1, "COUNT(*) AS _count"

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 892
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "thread_id"

    const-string v2, "messages.thread_id AS thread_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 893
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "packet_id"

    const-string v2, "messages.packet_id AS packet_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 894
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "nickname"

    const-string v2, "messages.nickname AS nickname"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 895
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "body"

    const-string v2, "messages.body AS body"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 896
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "date"

    const-string v2, "messages.date AS date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 897
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "type"

    const-string v2, "messages.type AS type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 898
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "err_code"

    const-string v2, "messages.err_code AS err_code"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 899
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "err_msg"

    const-string v2, "messages.err_msg AS err_msg"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 900
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "is_muc"

    const-string v2, "messages.is_muc AS is_muc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 901
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "show_ts"

    const-string v2, "messages.show_ts AS show_ts"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 903
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "contact"

    const-string v2, "contacts.username AS contact"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 904
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "provider"

    const-string v1, "contacts.provider AS provider"

    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 905
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "account"

    const-string v1, "contacts.account AS account"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 906
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "contact_type"

    const-string v2, "contacts.type AS contact_type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 908
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    .line 909
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v1, "inMemoryMessages._id AS _id"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 911
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "_count"

    const-string v1, "COUNT(*) AS _count"

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 913
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "thread_id"

    const-string v2, "inMemoryMessages.thread_id AS thread_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "packet_id"

    const-string v2, "inMemoryMessages.packet_id AS packet_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 917
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "nickname"

    const-string v2, "inMemoryMessages.nickname AS nickname"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 919
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "body"

    const-string v2, "inMemoryMessages.body AS body"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 921
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "date"

    const-string v2, "inMemoryMessages.date AS date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 923
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "type"

    const-string v2, "inMemoryMessages.type AS type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 925
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "err_code"

    const-string v2, "inMemoryMessages.err_code AS err_code"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 927
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "err_msg"

    const-string v2, "inMemoryMessages.err_msg AS err_msg"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 929
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "is_muc"

    const-string v2, "inMemoryMessages.is_muc AS is_muc"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 931
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "show_ts"

    const-string v2, "inMemoryMessages.show_ts AS show_ts"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 934
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "contact"

    const-string v2, "contacts.username AS contact"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 935
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "provider"

    const-string v1, "contacts.provider AS provider"

    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 936
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "account"

    const-string v1, "contacts.account AS account"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 937
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    const-string v1, "contact_type"

    const-string v2, "contacts.type AS contact_type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 938
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const-string v2, "com.google.android.providers.talk"

    .line 941
    const-string v0, "talk.db"

    const/16 v1, 0x35

    invoke-direct {p0, v0, v1}, Lcom/google/android/providers/talk/TalkProvider;-><init>(Ljava/lang/String;I)V

    .line 943
    const-string v0, "com.google.android.providers.talk"

    invoke-direct {p0, v2}, Lcom/google/android/providers/talk/TalkProvider;->setupImUrlMatchers(Ljava/lang/String;)V

    .line 944
    const-string v0, "com.google.android.providers.talk"

    invoke-direct {p0, v2}, Lcom/google/android/providers/talk/TalkProvider;->setupMcsUrlMatchers(Ljava/lang/String;)V

    .line 945
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;I)V
    .locals 7
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "dbVersion"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x2

    const/4 v2, 0x1

    const-string v6, "shortcut"

    const-string v5, "_id"

    .line 947
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 153
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    .line 212
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v5, v0, v4

    const-string v1, "shortcut"

    aput-object v6, v0, v2

    const-string v1, "last_message_date"

    aput-object v1, v0, v3

    iput-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->BACKFILL_PROJECTION:[Ljava/lang/String;

    .line 216
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v5, v0, v4

    const-string v1, "shortcut"

    aput-object v6, v0, v2

    iput-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->FIND_SHORTCUT_PROJECTION:[Ljava/lang/String;

    .line 234
    new-array v0, v2, [Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mQueryContactIdSelectionArgs1:[Ljava/lang/String;

    .line 241
    new-array v0, v3, [Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mQueryContactIdSelectionArgs2:[Ljava/lang/String;

    .line 948
    iput-object p1, p0, Lcom/google/android/providers/talk/TalkProvider;->mDatabaseName:Ljava/lang/String;

    .line 949
    iput p2, p0, Lcom/google/android/providers/talk/TalkProvider;->mDatabaseVersion:I

    .line 950
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "transient_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    const-string v2, "_"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mTransientDbName:Ljava/lang/String;

    .line 951
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/providers/talk/TalkProvider;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/providers/talk/TalkProvider;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mDatabaseName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/providers/talk/TalkProvider;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/providers/talk/TalkProvider;

    .prologue
    .line 47
    iget v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mDatabaseVersion:I

    return v0
.end method

.method static synthetic access$200(Lcom/google/android/providers/talk/TalkProvider;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/providers/talk/TalkProvider;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mTransientDbName:Ljava/lang/String;

    return-object v0
.end method

.method private addToQuickSwitch(J)V
    .locals 2
    .param p1, "newRow"    # J

    .prologue
    .line 2455
    invoke-direct {p0}, Lcom/google/android/providers/talk/TalkProvider;->findEmptyQuickSwitchSlot()I

    move-result v0

    .line 2457
    .local v0, "slot":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 2462
    :goto_0
    return-void

    .line 2461
    :cond_0
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/providers/talk/TalkProvider;->updateSlotForChat(JI)I

    goto :goto_0
.end method

.method private varargs appendValuesFromUrl(Landroid/content/ContentValues;Landroid/net/Uri;[Ljava/lang/String;)V
    .locals 4
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "url"    # Landroid/net/Uri;
    .param p3, "columns"    # [Ljava/lang/String;

    .prologue
    .line 2408
    invoke-virtual {p2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    array-length v2, p3

    if-gt v1, v2, :cond_0

    .line 2409
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Not enough values in url"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2411
    :cond_0
    const/4 v0, 0x0

    .end local p0    # "this":Lcom/google/android/providers/talk/TalkProvider;
    .local v0, "i":I
    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_2

    .line 2412
    aget-object v1, p3, v0

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2413
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot override the value for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2416
    :cond_1
    aget-object v1, p3, v0

    invoke-virtual {p2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2411
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2418
    :cond_2
    return-void
.end method

.method private static appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 1
    .param p0, "where"    # Ljava/lang/StringBuilder;
    .param p1, "clause"    # Ljava/lang/String;

    .prologue
    .line 3378
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 3379
    const-string v0, " AND "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3381
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3382
    return-void
.end method

.method private static appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "where"    # Ljava/lang/StringBuilder;
    .param p1, "columnName"    # Ljava/lang/String;
    .param p2, "condition"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 3368
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 3369
    const-string v0, " AND "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3371
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3372
    if-eqz p3, :cond_1

    .line 3373
    invoke-static {p0, p3}, Landroid/database/DatabaseUtils;->appendValueToSql(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    .line 3375
    :cond_1
    return-void
.end method

.method private backfillQuickSwitchSlots()V
    .locals 10

    .prologue
    .line 2468
    sget-object v1, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/providers/talk/TalkProvider;->BACKFILL_PROJECTION:[Ljava/lang/String;

    const-string v3, "shortcut=-1"

    const/4 v4, 0x0

    const-string v5, "last_message_date DESC"

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/providers/talk/TalkProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2473
    .local v6, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 2487
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2489
    :goto_0
    return-void

    .line 2477
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/google/android/providers/talk/TalkProvider;->findEmptyQuickSwitchSlot()I

    move-result v9

    .line 2479
    .local v9, "slot":I
    const/4 v0, -0x1

    if-eq v9, v0, :cond_1

    .line 2480
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 2482
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    .line 2484
    .local v7, "id":J
    invoke-direct {p0, v7, v8, v9}, Lcom/google/android/providers/talk/TalkProvider;->updateSlotForChat(JI)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2487
    .end local v7    # "id":J
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .end local v9    # "slot":I
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private buildContactIdSelection(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "columnName"    # Ljava/lang/String;
    .param p2, "contactSelection"    # Ljava/lang/String;

    .prologue
    .line 2603
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2605
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2606
    const-string v1, " in (select "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2607
    const-string v1, "_id"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2608
    const-string v1, " from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2609
    const-string v1, "contacts"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2610
    const-string v1, " where "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2611
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2612
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2614
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private buildQueryContactsByProvider(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/StringBuilder;Landroid/net/Uri;)V
    .locals 3
    .param p1, "qb"    # Landroid/database/sqlite/SQLiteQueryBuilder;
    .param p2, "whereClause"    # Ljava/lang/StringBuilder;
    .param p3, "url"    # Landroid/net/Uri;

    .prologue
    .line 1459
    const-string v0, "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id) LEFT OUTER JOIN chats ON (contacts._id = chats.contact_id) LEFT OUTER JOIN avatars ON (contacts.username = avatars.contact AND contacts.account = avatars.account_id)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1460
    sget-object v0, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1462
    const-string v0, "account"

    const-string v1, "="

    invoke-virtual {p3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1463
    return-void
.end method

.method private static decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "segment"    # Ljava/lang/String;

    .prologue
    .line 3386
    :try_start_0
    const-string v1, "UTF-8"

    invoke-static {p0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 3389
    :goto_0
    return-object v1

    .line 3387
    :catch_0
    move-exception v1

    move-object v0, v1

    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    move-object v1, p0

    .line 3389
    goto :goto_0
.end method

.method private deleteInternal(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 36
    .param p1, "url"    # Landroid/net/Uri;
    .param p2, "userWhere"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 2623
    const/16 v28, 0x0

    .line 2624
    .local v28, "tableToChange2":Ljava/lang/String;
    const/16 v16, 0x0

    .line 2625
    .local v16, "idColumnName":Ljava/lang/String;
    const/4 v8, 0x0

    .line 2626
    .local v8, "changedItemId":Ljava/lang/String;
    const/16 v24, 0x0

    .line 2627
    .local v24, "provider":Ljava/lang/String;
    const/4 v6, 0x0

    .line 2628
    .local v6, "accountStr":Ljava/lang/String;
    const-wide/16 v4, 0x0

    .line 2629
    .local v4, "account":J
    const/4 v9, 0x0

    .line 2630
    .local v9, "contact":Ljava/lang/String;
    const-wide/16 v29, 0x0

    .line 2632
    .local v29, "threadId":J
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    .line 2633
    .local v31, "whereClause":Ljava/lang/StringBuilder;
    if-eqz p2, :cond_0

    .line 2634
    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2637
    :cond_0
    const/16 v22, 0x0

    .line 2638
    .local v22, "notifyMessagesContentUri":Z
    const/16 v20, 0x0

    .line 2639
    .local v20, "notifyMessagesByContactContentUri":Z
    const/16 v21, 0x0

    .line 2640
    .local v21, "notifyMessagesByThreadIdContentUri":Z
    const/16 v19, 0x0

    .line 2641
    .local v19, "notifyContactListContentUri":Z
    const/16 v23, 0x0

    .line 2642
    .local v23, "notifyProviderAccountContentUri":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v17

    .line 2644
    .local v17, "match":I
    const/4 v10, 0x0

    .line 2645
    .local v10, "contactDeleted":Z
    const-wide/16 v13, 0x0

    .line 2647
    .local v13, "deletedContactId":J
    const/4 v7, 0x0

    .line 2649
    .local v7, "backfillQuickSwitchSlots":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12

    .line 2651
    .local v12, "db":Landroid/database/sqlite/SQLiteDatabase;
    sparse-switch v17, :sswitch_data_0

    .line 2977
    new-instance v32, Ljava/lang/UnsupportedOperationException;

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Cannot delete that URL: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-direct/range {v32 .. v33}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v32

    .line 2653
    :sswitch_0
    const-string v27, "providers"

    .line 2654
    .local v27, "tableToChange":Ljava/lang/String;
    const/16 v23, 0x1

    .line 2980
    .end local p1    # "url":Landroid/net/Uri;
    .end local p2    # "userWhere":Ljava/lang/String;
    :goto_0
    if-nez v16, :cond_1

    .line 2981
    const-string v16, "_id"

    .line 2984
    :cond_1
    if-eqz v8, :cond_2

    .line 2985
    const-string v32, "="

    move-object/from16 v0, v31

    move-object/from16 v1, v16

    move-object/from16 v2, v32

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2990
    :cond_2
    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object v0, v12

    move-object/from16 v1, v27

    move-object/from16 v2, v32

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v11

    .line 2993
    .local v11, "count":I
    if-eqz v28, :cond_3

    .line 2994
    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object v0, v12

    move-object/from16 v1, v28

    move-object/from16 v2, v32

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v32

    add-int v11, v11, v32

    .line 2997
    :cond_3
    if-eqz v10, :cond_4

    if-lez v11, :cond_4

    .line 3000
    move-object/from16 v0, p0

    move-wide v1, v13

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->performContactRemovalCleanup(J)V

    .line 3003
    :cond_4
    if-lez v11, :cond_d

    .line 3004
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v26

    .line 3008
    .local v26, "resolver":Landroid/content/ContentResolver;
    const/16 v32, 0x50

    move/from16 v0, v17

    move/from16 v1, v32

    if-eq v0, v1, :cond_5

    const/16 v32, 0x52

    move/from16 v0, v17

    move/from16 v1, v32

    if-eq v0, v1, :cond_5

    const/16 v32, 0x28

    move/from16 v0, v17

    move/from16 v1, v32

    if-eq v0, v1, :cond_5

    const/16 v32, 0x29

    move/from16 v0, v17

    move/from16 v1, v32

    if-eq v0, v1, :cond_5

    const/16 v32, 0x14

    move/from16 v0, v17

    move/from16 v1, v32

    if-ne v0, v1, :cond_6

    .line 3011
    :cond_5
    sget-object v32, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3014
    :cond_6
    const/16 v32, 0x50

    move/from16 v0, v17

    move/from16 v1, v32

    if-ne v0, v1, :cond_7

    .line 3015
    sget-object v32, Landroid/provider/Im$Contacts;->CONTENT_URI_CHAT_CONTACTS:Landroid/net/Uri;

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3018
    :cond_7
    if-eqz v22, :cond_8

    .line 3019
    sget-object v32, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3022
    :cond_8
    if-eqz v20, :cond_9

    .line 3023
    sget-object v32, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3024
    invoke-static {v4, v5, v9}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v32

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3027
    :cond_9
    if-eqz v21, :cond_a

    .line 3028
    sget-object v32, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3029
    invoke-static/range {v29 .. v30}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v32

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3032
    :cond_a
    if-eqz v19, :cond_b

    .line 3033
    sget-object v32, Landroid/provider/Im$ContactList;->CONTENT_URI:Landroid/net/Uri;

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3036
    :cond_b
    if-eqz v23, :cond_c

    .line 3038
    sget-object v32, Landroid/provider/Im$Provider;->CONTENT_URI_WITH_ACCOUNT:Landroid/net/Uri;

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3041
    :cond_c
    if-eqz v7, :cond_d

    .line 3042
    invoke-direct/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->backfillQuickSwitchSlots()V

    .line 3046
    .end local v26    # "resolver":Landroid/content/ContentResolver;
    :cond_d
    return v11

    .line 2658
    .end local v11    # "count":I
    .end local v27    # "tableToChange":Ljava/lang/String;
    .restart local p1    # "url":Landroid/net/Uri;
    .restart local p2    # "userWhere":Ljava/lang/String;
    :sswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2661
    .restart local v8    # "changedItemId":Ljava/lang/String;
    :sswitch_2
    const-string v27, "accounts"

    .line 2662
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const/16 v23, 0x1

    .line 2663
    goto/16 :goto_0

    .line 2666
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_3
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2669
    .restart local v8    # "changedItemId":Ljava/lang/String;
    :sswitch_4
    const-string v27, "accountStatus"

    .line 2670
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const/16 v23, 0x1

    .line 2671
    goto/16 :goto_0

    .line 2675
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_5
    const-string v27, "contacts"

    .line 2676
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const/4 v10, 0x1

    .line 2677
    goto/16 :goto_0

    .line 2680
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_6
    const-string v27, "contacts"

    .line 2681
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2684
    .restart local v8    # "changedItemId":Ljava/lang/String;
    :try_start_0
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v13

    .line 2689
    const/4 v10, 0x1

    .line 2690
    goto/16 :goto_0

    .line 2685
    :catch_0
    move-exception v15

    .line 2686
    .local v15, "ex":Ljava/lang/NumberFormatException;
    new-instance v32, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v32 .. v32}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v32

    .line 2693
    .end local v15    # "ex":Ljava/lang/NumberFormatException;
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_7
    const-string v27, "contacts"

    .line 2694
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const-string v32, "account"

    const-string v33, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v34

    const/16 v35, 0x2

    invoke-interface/range {v34 .. v35}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v34

    invoke-static/range {v31 .. v34}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2695
    const/4 v10, 0x1

    .line 2696
    goto/16 :goto_0

    .line 2699
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_8
    const-string v32, "account"

    const-string v33, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v34

    const/16 v35, 0x2

    invoke-interface/range {v34 .. v35}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v34

    invoke-static/range {v31 .. v34}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2703
    :sswitch_9
    const-string v27, "contactList"

    .line 2704
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const/16 v19, 0x1

    .line 2705
    goto/16 :goto_0

    .line 2708
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_a
    const-string v27, "contactList"

    .line 2709
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2710
    .restart local v8    # "changedItemId":Ljava/lang/String;
    goto/16 :goto_0

    .line 2713
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_b
    const-string v27, "blockedList"

    .line 2714
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2717
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_c
    const-string v27, "blockedList"

    .line 2718
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const-string v32, "account"

    const-string v33, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v34

    const/16 v35, 0x2

    invoke-interface/range {v34 .. v35}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v34

    invoke-static/range {v31 .. v34}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 2722
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_d
    const-string v27, "contactsEtag"

    .line 2723
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2726
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_e
    const-string v27, "contactsEtag"

    .line 2727
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2728
    .restart local v8    # "changedItemId":Ljava/lang/String;
    goto/16 :goto_0

    .line 2731
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_f
    const-string v27, "messages"

    .line 2732
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2735
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_10
    const-string v27, "messages"

    .line 2736
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const-string v28, "inMemoryMessages"

    .line 2738
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    .end local p2    # "userWhere":Ljava/lang/String;
    check-cast p2, Ljava/lang/String;

    invoke-static/range {p2 .. p2}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2740
    :try_start_1
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v4

    .line 2745
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x2

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2746
    const-string v32, "thread_id"

    const-string v33, "="

    move-object/from16 v0, p0

    move-object v1, v12

    move-object v2, v6

    move-object v3, v9

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->getContactId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v34

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v34

    invoke-static/range {v31 .. v34}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2749
    const/16 v22, 0x1

    .line 2750
    goto/16 :goto_0

    .line 2741
    .restart local p1    # "url":Landroid/net/Uri;
    :catch_1
    move-exception v15

    .line 2742
    .restart local v15    # "ex":Ljava/lang/NumberFormatException;
    new-instance v32, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v32 .. v32}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v32

    .line 2753
    .end local v15    # "ex":Ljava/lang/NumberFormatException;
    .end local v27    # "tableToChange":Ljava/lang/String;
    .restart local p2    # "userWhere":Ljava/lang/String;
    :sswitch_11
    const-string v27, "messages"

    .line 2754
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const-string v28, "inMemoryMessages"

    .line 2757
    :try_start_2
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-wide v29

    .line 2762
    const-string v32, "thread_id"

    const-string v33, "="

    invoke-static/range {v29 .. v30}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v34

    invoke-static/range {v31 .. v34}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2764
    const/16 v22, 0x1

    .line 2765
    goto/16 :goto_0

    .line 2758
    :catch_2
    move-exception v32

    move-object/from16 v15, v32

    .line 2759
    .restart local v15    # "ex":Ljava/lang/NumberFormatException;
    new-instance v32, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v32 .. v32}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v32

    .line 2768
    .end local v15    # "ex":Ljava/lang/NumberFormatException;
    .end local v27    # "tableToChange":Ljava/lang/String;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_12
    const-string v27, "messages"

    .line 2770
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 2771
    const-string v32, "thread_id"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "provider=\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->buildContactIdSelection(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 2774
    const/16 v22, 0x1

    .line 2775
    goto/16 :goto_0

    .line 2778
    .end local v27    # "tableToChange":Ljava/lang/String;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_13
    const-string v27, "messages"

    .line 2780
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2781
    const-string v32, "thread_id"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "account=\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object v1, v6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->buildContactIdSelection(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 2784
    const/16 v22, 0x1

    .line 2785
    goto/16 :goto_0

    .line 2788
    .end local v27    # "tableToChange":Ljava/lang/String;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_14
    const-string v27, "messages"

    .line 2789
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2790
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const/16 v22, 0x1

    .line 2791
    goto/16 :goto_0

    .line 2794
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_15
    const-string v27, "inMemoryMessages"

    .line 2795
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2798
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_16
    const-string v27, "inMemoryMessages"

    .line 2800
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    .end local p2    # "userWhere":Ljava/lang/String;
    check-cast p2, Ljava/lang/String;

    invoke-static/range {p2 .. p2}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2802
    :try_start_3
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    move-result-wide v4

    .line 2807
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x2

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2808
    const-string v32, "thread_id"

    const-string v33, "="

    move-object/from16 v0, p0

    move-object v1, v12

    move-object v2, v6

    move-object v3, v9

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->getContactId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v34

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v34

    invoke-static/range {v31 .. v34}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2811
    const/16 v20, 0x1

    .line 2812
    goto/16 :goto_0

    .line 2803
    .restart local p1    # "url":Landroid/net/Uri;
    :catch_3
    move-exception v15

    .line 2804
    .restart local v15    # "ex":Ljava/lang/NumberFormatException;
    new-instance v32, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v32 .. v32}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v32

    .line 2815
    .end local v15    # "ex":Ljava/lang/NumberFormatException;
    .end local v27    # "tableToChange":Ljava/lang/String;
    .restart local p2    # "userWhere":Ljava/lang/String;
    :sswitch_17
    const-string v27, "inMemoryMessages"

    .line 2818
    .restart local v27    # "tableToChange":Ljava/lang/String;
    :try_start_4
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_4

    move-result-wide v29

    .line 2823
    const-string v32, "thread_id"

    const-string v33, "="

    invoke-static/range {v29 .. v30}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v34

    invoke-static/range {v31 .. v34}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2825
    const/16 v21, 0x1

    .line 2826
    goto/16 :goto_0

    .line 2819
    :catch_4
    move-exception v32

    move-object/from16 v15, v32

    .line 2820
    .restart local v15    # "ex":Ljava/lang/NumberFormatException;
    new-instance v32, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v32 .. v32}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v32

    .line 2829
    .end local v15    # "ex":Ljava/lang/NumberFormatException;
    .end local v27    # "tableToChange":Ljava/lang/String;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_18
    const-string v27, "inMemoryMessages"

    .line 2831
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 2832
    const-string v32, "thread_id"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "provider=\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->buildContactIdSelection(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 2836
    const/16 v22, 0x1

    .line 2837
    goto/16 :goto_0

    .line 2840
    .end local v27    # "tableToChange":Ljava/lang/String;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_19
    const-string v27, "inMemoryMessages"

    .line 2842
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2843
    const-string v32, "thread_id"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "account=\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object v1, v6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->buildContactIdSelection(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 2847
    const/16 v22, 0x1

    .line 2848
    goto/16 :goto_0

    .line 2851
    .end local v27    # "tableToChange":Ljava/lang/String;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_1a
    const-string v27, "inMemoryMessages"

    .line 2852
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2853
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const/16 v22, 0x1

    .line 2854
    goto/16 :goto_0

    .line 2857
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_1b
    const-string v27, "groupMembers"

    .line 2858
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2861
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_1c
    const-string v27, "groupMembers"

    .line 2862
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const-string v32, "groupId"

    const-string v33, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v34

    const/16 v35, 0x1

    invoke-interface/range {v34 .. v35}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v34

    invoke-static/range {v31 .. v34}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 2866
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_1d
    const-string v27, "invitations"

    .line 2867
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2870
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_1e
    const-string v27, "invitations"

    .line 2871
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2872
    .restart local v8    # "changedItemId":Ljava/lang/String;
    goto/16 :goto_0

    .line 2875
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_1f
    const-string v27, "avatars"

    .line 2876
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2879
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_20
    const-string v27, "avatars"

    .line 2880
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2881
    .restart local v8    # "changedItemId":Ljava/lang/String;
    goto/16 :goto_0

    .line 2884
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_21
    const-string v27, "avatars"

    .line 2885
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x2

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2886
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const-string v16, "account_id"

    .line 2887
    goto/16 :goto_0

    .line 2890
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_22
    const-string v27, "chats"

    .line 2891
    .restart local v27    # "tableToChange":Ljava/lang/String;
    const/4 v7, 0x1

    .line 2892
    goto/16 :goto_0

    .line 2895
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_23
    const-string v27, "chats"

    .line 2897
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2898
    const-string v32, "contact_id"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "account=\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object v1, v6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->buildContactIdSelection(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 2903
    const/4 v8, 0x0

    .line 2904
    goto/16 :goto_0

    .line 2907
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_24
    const-string v27, "chats"

    .line 2908
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2909
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const-string v16, "contact_id"

    .line 2910
    goto/16 :goto_0

    .line 2913
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_25
    const-string v27, "presence"

    .line 2914
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2917
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_26
    const-string v27, "presence"

    .line 2918
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2919
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const-string v16, "contact_id"

    .line 2920
    goto/16 :goto_0

    .line 2923
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_27
    const-string v27, "presence"

    .line 2925
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2926
    const-string v32, "contact_id"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "account=\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object v1, v6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "\'"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->buildContactIdSelection(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 2930
    const/4 v8, 0x0

    .line 2931
    goto/16 :goto_0

    .line 2934
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_28
    const-string v27, "sessionCookies"

    .line 2935
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2938
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_29
    const-string v27, "sessionCookies"

    .line 2939
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x2

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2940
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const-string v16, "account"

    .line 2941
    goto/16 :goto_0

    .line 2944
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_2a
    const-string v27, "providerSettings"

    .line 2945
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2946
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const-string v16, "provider"

    .line 2947
    goto/16 :goto_0

    .line 2950
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_2b
    const-string v27, "providerSettings"

    .line 2952
    .restart local v27    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x1

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 2953
    .local v25, "providerId":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v32

    const/16 v33, 0x2

    invoke-interface/range {v32 .. v33}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 2955
    .local v18, "name":Ljava/lang/String;
    const-string v32, "provider"

    const-string v33, "="

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v25

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2956
    const-string v32, "name"

    const-string v33, "="

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v18

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 2960
    .end local v18    # "name":Ljava/lang/String;
    .end local v25    # "providerId":Ljava/lang/String;
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_2c
    const-string v27, "brandingResMapCache"

    .line 2961
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2965
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_2d
    const-string v27, "outgoingRmqMessages"

    .line 2966
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2969
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_2e
    const-string v27, "lastrmqid"

    .line 2970
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2973
    .end local v27    # "tableToChange":Ljava/lang/String;
    :sswitch_2f
    const-string v27, "s2dRmqIds"

    .line 2974
    .restart local v27    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 2651
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0xa -> :sswitch_2
        0xb -> :sswitch_1
        0x12 -> :sswitch_5
        0x14 -> :sswitch_5
        0x16 -> :sswitch_7
        0x1b -> :sswitch_6
        0x20 -> :sswitch_9
        0x21 -> :sswitch_8
        0x22 -> :sswitch_a
        0x23 -> :sswitch_b
        0x24 -> :sswitch_c
        0x25 -> :sswitch_d
        0x26 -> :sswitch_e
        0x28 -> :sswitch_25
        0x29 -> :sswitch_26
        0x2a -> :sswitch_27
        0x32 -> :sswitch_f
        0x33 -> :sswitch_10
        0x34 -> :sswitch_11
        0x35 -> :sswitch_12
        0x36 -> :sswitch_13
        0x37 -> :sswitch_14
        0x38 -> :sswitch_15
        0x39 -> :sswitch_16
        0x3a -> :sswitch_17
        0x3b -> :sswitch_18
        0x3c -> :sswitch_19
        0x3d -> :sswitch_1a
        0x41 -> :sswitch_1b
        0x42 -> :sswitch_1c
        0x46 -> :sswitch_1f
        0x47 -> :sswitch_20
        0x48 -> :sswitch_21
        0x50 -> :sswitch_22
        0x51 -> :sswitch_23
        0x52 -> :sswitch_24
        0x53 -> :sswitch_28
        0x54 -> :sswitch_29
        0x5b -> :sswitch_2a
        0x5c -> :sswitch_2b
        0x64 -> :sswitch_1d
        0x65 -> :sswitch_1e
        0x68 -> :sswitch_4
        0x69 -> :sswitch_3
        0x6a -> :sswitch_2c
        0xc8 -> :sswitch_2d
        0xcb -> :sswitch_2e
        0xcc -> :sswitch_2f
    .end sparse-switch
.end method

.method private deleteWithSelection(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "tableName"    # Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 2598
    invoke-virtual {p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 2600
    .local v0, "count":I
    return-void
.end method

.method private findEmptyQuickSwitchSlot()I
    .locals 13

    .prologue
    .line 2501
    sget-object v1, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/providers/talk/TalkProvider;->FIND_SHORTCUT_PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/providers/talk/TalkProvider;->queryInternal(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 2502
    .local v7, "c":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v6

    .line 2506
    .local v6, "N":I
    const/16 v0, 0xa

    if-lt v6, v0, :cond_0

    .line 2507
    const/4 v0, -0x1

    .line 2543
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :goto_0
    return v0

    .line 2510
    :cond_0
    const/4 v12, 0x0

    .line 2511
    .local v12, "slots":I
    :try_start_0
    const-string v0, "shortcut"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    .line 2516
    .local v8, "column":I
    const/16 v0, 0xa

    new-array v10, v0, [I

    fill-array-data v10, :array_0

    .line 2523
    .local v10, "map":[I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_1
    invoke-interface {v7}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2524
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 2526
    .local v11, "slot":I
    const/4 v0, -0x1

    if-eq v11, v0, :cond_1

    .line 2527
    const/4 v0, 0x1

    aget v1, v10, v11

    shl-int/2addr v0, v1

    or-int/2addr v12, v0

    .line 2523
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 2543
    .end local v8    # "column":I
    .end local v10    # "map":[I
    .end local v11    # "slot":I
    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v0

    .line 2535
    .restart local v8    # "column":I
    .restart local v10    # "map":[I
    :cond_2
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_2
    const/16 v0, 0xa

    if-ge v9, v0, :cond_4

    .line 2536
    const/4 v0, 0x1

    shl-int/2addr v0, v9

    and-int/2addr v0, v12

    if-nez v0, :cond_3

    .line 2537
    :try_start_1
    aget v0, v10, v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2543
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 2535
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 2541
    :cond_4
    const/4 v0, -0x1

    .line 2543
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 2516
    nop

    :array_0
    .array-data 4
        0x0
        0x9
        0x8
        0x7
        0x6
        0x5
        0x4
        0x3
        0x2
        0x1
    .end array-data
.end method

.method private getContactId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)J
    .locals 12
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "accountId"    # Ljava/lang/String;
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x0

    .line 2422
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 2423
    .local v0, "qb":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v1, "contacts"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 2424
    sget-object v1, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 2426
    iget-object v1, p0, Lcom/google/android/providers/talk/TalkProvider;->mQueryContactIdSelectionArgs2:[Ljava/lang/String;

    aput-object p2, v1, v2

    .line 2427
    iget-object v1, p0, Lcom/google/android/providers/talk/TalkProvider;->mQueryContactIdSelectionArgs2:[Ljava/lang/String;

    const/4 v2, 0x1

    aput-object p3, v1, v2

    .line 2429
    sget-object v2, Lcom/google/android/providers/talk/TalkProvider;->CONTACT_ID_PROJECTION:[Ljava/lang/String;

    const-string v3, "account=? AND username=?"

    iget-object v4, p0, Lcom/google/android/providers/talk/TalkProvider;->mQueryContactIdSelectionArgs2:[Ljava/lang/String;

    move-object v1, p1

    move-object v6, v5

    move-object v7, v5

    move-object v8, v5

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 2435
    .local v9, "c":Landroid/database/Cursor;
    const-wide/16 v10, 0x0

    .line 2438
    .local v10, "contactId":J
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2439
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v10

    .line 2442
    :cond_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2445
    return-wide v10

    .line 2442
    :catchall_0
    move-exception v1

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private insertInternal(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 27
    .param p1, "url"    # Landroid/net/Uri;
    .param p2, "initialValues"    # Landroid/content/ContentValues;

    .prologue
    .line 2051
    const/16 v19, 0x0

    .line 2052
    .local v19, "resultUri":Landroid/net/Uri;
    const-wide/16 v20, 0x0

    .line 2053
    .local v20, "rowID":J
    const-wide/16 v4, 0x0

    .line 2054
    .local v4, "account":J
    const/4 v8, 0x0

    .line 2055
    .local v8, "contact":Ljava/lang/String;
    const-wide/16 v22, 0x0

    .line 2057
    .local v22, "threadId":J
    const/4 v13, 0x0

    .line 2058
    .local v13, "notifyContactListContentUri":Z
    const/4 v12, 0x0

    .line 2059
    .local v12, "notifyContactContentUri":Z
    const/16 v16, 0x0

    .line 2060
    .local v16, "notifyMessagesContentUri":Z
    const/4 v14, 0x0

    .line 2061
    .local v14, "notifyMessagesByContactContentUri":Z
    const/4 v15, 0x0

    .line 2062
    .local v15, "notifyMessagesByThreadIdContentUri":Z
    const/16 v17, 0x0

    .line 2064
    .local v17, "notifyProviderAccountContentUri":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v9

    .line 2065
    .local v9, "db":Landroid/database/sqlite/SQLiteDatabase;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v11

    .line 2068
    .local v11, "match":I
    sparse-switch v11, :sswitch_data_0

    .line 2364
    new-instance v24, Ljava/lang/UnsupportedOperationException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Cannot insert into URL: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 2071
    :sswitch_0
    const-string v24, "providers"

    const-string v25, "name"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2072
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_0

    .line 2073
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Provider;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    .line 2075
    :cond_0
    const/16 v17, 0x1

    .line 2368
    .end local p1    # "url":Landroid/net/Uri;
    :cond_1
    :goto_0
    if-eqz v19, :cond_8

    .line 2369
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v18

    .line 2373
    .local v18, "resolver":Landroid/content/ContentResolver;
    if-eqz v12, :cond_2

    .line 2374
    sget-object v24, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/16 v25, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2377
    :cond_2
    const/16 v24, 0x50

    move v0, v11

    move/from16 v1, v24

    if-ne v0, v1, :cond_3

    .line 2378
    sget-object v24, Landroid/provider/Im$Contacts;->CONTENT_URI_CHAT_CONTACTS:Landroid/net/Uri;

    const/16 v25, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2381
    :cond_3
    if-eqz v13, :cond_4

    .line 2382
    sget-object v24, Landroid/provider/Im$ContactList;->CONTENT_URI:Landroid/net/Uri;

    const/16 v25, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2385
    :cond_4
    if-eqz v16, :cond_5

    .line 2386
    sget-object v24, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    const/16 v25, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2389
    :cond_5
    if-eqz v14, :cond_6

    .line 2390
    sget-object v24, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    const/16 v25, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2391
    invoke-static {v4, v5, v8}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v24

    const/16 v25, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2394
    :cond_6
    if-eqz v15, :cond_7

    .line 2395
    sget-object v24, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    const/16 v25, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2396
    invoke-static/range {v22 .. v23}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v24

    const/16 v25, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2399
    :cond_7
    if-eqz v17, :cond_8

    .line 2401
    sget-object v24, Landroid/provider/Im$Provider;->CONTENT_URI_WITH_ACCOUNT:Landroid/net/Uri;

    const/16 v25, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2404
    .end local v18    # "resolver":Landroid/content/ContentResolver;
    :cond_8
    return-object v19

    .line 2080
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_1
    const-string v24, "accounts"

    const-string v25, "name"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2081
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_9

    .line 2082
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Account;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    .line 2084
    :cond_9
    const/16 v17, 0x1

    .line 2085
    goto/16 :goto_0

    .line 2088
    :sswitch_2
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "provider"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "account"

    aput-object v26, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendValuesFromUrl(Landroid/content/ContentValues;Landroid/net/Uri;[Ljava/lang/String;)V

    .line 2094
    :sswitch_3
    const-string v24, "contacts"

    const-string v25, "username"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2095
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_a

    .line 2096
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    .line 2099
    :cond_a
    const/4 v12, 0x1

    .line 2100
    goto/16 :goto_0

    .line 2103
    :sswitch_4
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->insertBulkContacts(Landroid/content/ContentValues;)Z

    move-result v24

    if-eqz v24, :cond_b

    .line 2107
    sget-object v19, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 2109
    :cond_b
    const/4 v12, 0x1

    .line 2110
    goto/16 :goto_0

    .line 2113
    :sswitch_5
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "provider"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "account"

    aput-object v26, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendValuesFromUrl(Landroid/content/ContentValues;Landroid/net/Uri;[Ljava/lang/String;)V

    .line 2118
    :sswitch_6
    const-string v24, "contactList"

    const-string v25, "name"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2119
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_c

    .line 2120
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$ContactList;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    .line 2122
    :cond_c
    const/4 v13, 0x1

    .line 2123
    goto/16 :goto_0

    .line 2126
    :sswitch_7
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "provider"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "account"

    aput-object v26, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendValuesFromUrl(Landroid/content/ContentValues;Landroid/net/Uri;[Ljava/lang/String;)V

    .line 2131
    :sswitch_8
    const-string v24, "blockedList"

    const-string v25, "username"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2132
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2133
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$BlockedList;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2139
    :sswitch_9
    const-string v24, "contactsEtag"

    const-string v25, "etag"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2140
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2141
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$ContactsEtag;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2146
    :sswitch_a
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x1

    invoke-interface/range {v24 .. v25}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "account":J
    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2148
    .local v6, "accountStr":Ljava/lang/String;
    :try_start_0
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    .line 2153
    .restart local v4    # "account":J
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x2

    invoke-interface/range {v24 .. v25}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 2154
    const-string v24, "thread_id"

    move-object/from16 v0, p0

    move-object v1, v9

    move-object v2, v6

    move-object v3, v8

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->getContactId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v25

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2156
    const/16 v16, 0x1

    .line 2160
    :try_start_1
    const-string v24, "messages"

    const-string v25, "thread_id"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2161
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2162
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v19

    goto/16 :goto_0

    .line 2149
    .end local v4    # "account":J
    .restart local p1    # "url":Landroid/net/Uri;
    :catch_0
    move-exception v10

    .line 2150
    .local v10, "ex":Ljava/lang/NumberFormatException;
    new-instance v24, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v24 .. v24}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v24

    .line 2164
    .end local v10    # "ex":Ljava/lang/NumberFormatException;
    .end local p1    # "url":Landroid/net/Uri;
    .restart local v4    # "account":J
    :catch_1
    move-exception v24

    move-object/from16 v10, v24

    .line 2165
    .local v10, "ex":Landroid/database/SQLException;
    const-string v24, "TalkProvider"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "[TalkProvider] caught "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object v1, v10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " inserting message "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2172
    .end local v6    # "accountStr":Ljava/lang/String;
    .end local v10    # "ex":Landroid/database/SQLException;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_b
    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "thread_id"

    aput-object v26, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendValuesFromUrl(Landroid/content/ContentValues;Landroid/net/Uri;[Ljava/lang/String;)V

    .line 2177
    :sswitch_c
    const/16 v16, 0x1

    .line 2180
    :try_start_2
    const-string v24, "messages"

    const-string v25, "thread_id"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2181
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2182
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_2
    .catch Landroid/database/SQLException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v19

    goto/16 :goto_0

    .line 2184
    :catch_2
    move-exception v24

    move-object/from16 v10, v24

    .line 2185
    .restart local v10    # "ex":Landroid/database/SQLException;
    const-string v24, "TalkProvider"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "[TalkProvider] caught "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object v1, v10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " inserting message "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2192
    .end local v10    # "ex":Landroid/database/SQLException;
    :sswitch_d
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x1

    invoke-interface/range {v24 .. v25}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "account":J
    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2195
    .local v7, "accountStr2":Ljava/lang/String;
    :try_start_3
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    move-result-wide v4

    .line 2200
    .restart local v4    # "account":J
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x2

    invoke-interface/range {v24 .. v25}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 2201
    const-string v24, "thread_id"

    move-object/from16 v0, p0

    move-object v1, v9

    move-object v2, v7

    move-object v3, v8

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->getContactId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v25

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2203
    const/4 v14, 0x1

    .line 2207
    :try_start_4
    const-string v24, "inMemoryMessages"

    const-string v25, "thread_id"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2208
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2209
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_4
    .catch Landroid/database/SQLException; {:try_start_4 .. :try_end_4} :catch_4

    move-result-object v19

    goto/16 :goto_0

    .line 2196
    .end local v4    # "account":J
    .restart local p1    # "url":Landroid/net/Uri;
    :catch_3
    move-exception v10

    .line 2197
    .local v10, "ex":Ljava/lang/NumberFormatException;
    new-instance v24, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v24 .. v24}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v24

    .line 2211
    .end local v10    # "ex":Ljava/lang/NumberFormatException;
    .end local p1    # "url":Landroid/net/Uri;
    .restart local v4    # "account":J
    :catch_4
    move-exception v24

    move-object/from16 v10, v24

    .line 2212
    .local v10, "ex":Landroid/database/SQLException;
    const-string v24, "TalkProvider"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "[TalkProvider] caught "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object v1, v10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " inserting message "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2220
    .end local v7    # "accountStr2":Ljava/lang/String;
    .end local v10    # "ex":Landroid/database/SQLException;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_e
    :try_start_5
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x1

    invoke-interface/range {v24 .. v25}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_5

    move-result-wide v22

    .line 2225
    const-string v24, "thread_id"

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2227
    const/4 v15, 0x1

    .line 2233
    :sswitch_f
    :try_start_6
    const-string v24, "inMemoryMessages"

    const-string v25, "thread_id"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2234
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2235
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Messages;->OTR_MESSAGES_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_6
    .catch Landroid/database/SQLException; {:try_start_6 .. :try_end_6} :catch_6

    move-result-object v19

    goto/16 :goto_0

    .line 2221
    :catch_5
    move-exception v24

    move-object/from16 v10, v24

    .line 2222
    .local v10, "ex":Ljava/lang/NumberFormatException;
    new-instance v24, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v24 .. v24}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v24

    .line 2237
    .end local v10    # "ex":Ljava/lang/NumberFormatException;
    :catch_6
    move-exception v24

    move-object/from16 v10, v24

    .line 2238
    .local v10, "ex":Landroid/database/SQLException;
    const-string v24, "TalkProvider"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "[TalkProvider] caught "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object v1, v10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " inserting message "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2245
    .end local v10    # "ex":Landroid/database/SQLException;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_10
    const-string v24, "invitations"

    const/16 v25, 0x0

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2246
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2247
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Invitation;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2252
    :sswitch_11
    const-string v24, "groupMembers"

    const-string v25, "nickname"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2253
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2254
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$GroupMembers;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2259
    :sswitch_12
    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "groupId"

    aput-object v26, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendValuesFromUrl(Landroid/content/ContentValues;Landroid/net/Uri;[Ljava/lang/String;)V

    .line 2260
    const-string v24, "groupMembers"

    const-string v25, "nickname"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2261
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2262
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$GroupMembers;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2267
    :sswitch_13
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "provider_id"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "account_id"

    aput-object v26, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendValuesFromUrl(Landroid/content/ContentValues;Landroid/net/Uri;[Ljava/lang/String;)V

    .line 2271
    :sswitch_14
    const-string v24, "avatars"

    const-string v25, "contact"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2272
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2273
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Avatars;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2278
    :sswitch_15
    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "contact_id"

    aput-object v26, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendValuesFromUrl(Landroid/content/ContentValues;Landroid/net/Uri;[Ljava/lang/String;)V

    .line 2282
    :sswitch_16
    const-string v24, "shortcut"

    const/16 v25, -0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2283
    const-string v24, "chats"

    const-string v25, "contact_id"

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2284
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_d

    .line 2285
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    .line 2286
    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->addToQuickSwitch(J)V

    .line 2288
    :cond_d
    const/4 v12, 0x1

    .line 2289
    goto/16 :goto_0

    .line 2292
    :sswitch_17
    const-string v24, "presence"

    const/16 v25, 0x0

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2293
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_e

    .line 2294
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$Presence;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    .line 2296
    :cond_e
    const/4 v12, 0x1

    .line 2297
    goto/16 :goto_0

    .line 2301
    :sswitch_18
    :try_start_7
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v24

    move-object/from16 v0, p0

    move-wide/from16 v1, v24

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->seedInitialPresenceByAccount(J)V

    .line 2302
    sget-object v19, Landroid/provider/Im$Presence;->CONTENT_URI:Landroid/net/Uri;
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_7

    goto/16 :goto_0

    .line 2303
    :catch_7
    move-exception v24

    move-object/from16 v10, v24

    .line 2304
    .local v10, "ex":Ljava/lang/NumberFormatException;
    new-instance v24, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v24 .. v24}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v24

    .line 2309
    .end local v10    # "ex":Ljava/lang/NumberFormatException;
    :sswitch_19
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "provider"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "account"

    aput-object v26, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendValuesFromUrl(Landroid/content/ContentValues;Landroid/net/Uri;[Ljava/lang/String;)V

    .line 2313
    :sswitch_1a
    const-string v24, "sessionCookies"

    const/16 v25, 0x0

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2314
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2315
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$SessionCookies;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2320
    :sswitch_1b
    const-string v24, "providerSettings"

    const/16 v25, 0x0

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2321
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2322
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$ProviderSettings;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2327
    :sswitch_1c
    const-string v24, "accountStatus"

    const/16 v25, 0x0

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2328
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_f

    .line 2329
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$AccountStatus;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    .line 2331
    :cond_f
    const/16 v17, 0x1

    .line 2332
    goto/16 :goto_0

    .line 2335
    :sswitch_1d
    const-string v24, "brandingResMapCache"

    const/16 v25, 0x0

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2336
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2337
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$BrandingResourceMapCache;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2343
    :sswitch_1e
    const-string v24, "outgoingRmqMessages"

    const/16 v25, 0x0

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2344
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2345
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$OutgoingRmq;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2350
    :sswitch_1f
    const-string v24, "lastrmqid"

    const/16 v25, 0x0

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2351
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2352
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$LastRmqId;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2357
    :sswitch_20
    const-string v24, "s2dRmqIds"

    const/16 v25, 0x0

    move-object v0, v9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 2358
    const-wide/16 v24, 0x0

    cmp-long v24, v20, v24

    if-lez v24, :cond_1

    .line 2359
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v25, Landroid/provider/Im$ServerToDeviceRmqIds;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    goto/16 :goto_0

    .line 2068
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_3
        0x14 -> :sswitch_3
        0x16 -> :sswitch_2
        0x1c -> :sswitch_4
        0x20 -> :sswitch_6
        0x21 -> :sswitch_5
        0x23 -> :sswitch_8
        0x24 -> :sswitch_7
        0x25 -> :sswitch_9
        0x28 -> :sswitch_17
        0x2b -> :sswitch_18
        0x32 -> :sswitch_c
        0x33 -> :sswitch_a
        0x34 -> :sswitch_b
        0x38 -> :sswitch_f
        0x39 -> :sswitch_d
        0x3a -> :sswitch_e
        0x41 -> :sswitch_11
        0x42 -> :sswitch_12
        0x46 -> :sswitch_14
        0x48 -> :sswitch_13
        0x50 -> :sswitch_16
        0x52 -> :sswitch_15
        0x53 -> :sswitch_1a
        0x54 -> :sswitch_19
        0x5a -> :sswitch_1b
        0x64 -> :sswitch_10
        0x68 -> :sswitch_1c
        0x6a -> :sswitch_1d
        0xc8 -> :sswitch_1e
        0xcb -> :sswitch_1f
        0xcc -> :sswitch_20
    .end sparse-switch
.end method

.method static log(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 3394
    const-string v0, "TalkProvider"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3395
    return-void
.end method

.method private performContactRemovalCleanup(J)V
    .locals 8
    .param p1, "contactId"    # J

    .prologue
    const/16 v5, 0x3d

    const/4 v4, 0x0

    const-string v7, "presence"

    const-string v6, "groupMembers"

    .line 2573
    iget-object v2, p0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 2575
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-lez v2, :cond_0

    .line 2576
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2579
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v2, "contact_id"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 2580
    const-string v2, "presence"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v7, v2, v4}, Lcom/google/android/providers/talk/TalkProvider;->deleteWithSelection(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 2583
    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 2584
    const-string v2, "groupId"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 2585
    const-string v2, "groupMembers"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v6, v2, v4}, Lcom/google/android/providers/talk/TalkProvider;->deleteWithSelection(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 2593
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    :goto_0
    return-void

    .line 2588
    :cond_0
    const-string v2, "presence"

    const-string v2, "contact_id in (select presence.contact_id from presence left outer join contacts on presence.contact_id=contacts._id where contacts._id IS NULL)"

    invoke-direct {p0, v1, v7, v2, v4}, Lcom/google/android/providers/talk/TalkProvider;->deleteWithSelection(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 2591
    const-string v2, "groupMembers"

    const-string v2, "groupId in (select groupMembers.groupId from groupMembers left outer join contacts on groupMembers.groupId=contacts._id where contacts._id IS NULL)"

    invoke-direct {p0, v1, v6, v2, v4}, Lcom/google/android/providers/talk/TalkProvider;->deleteWithSelection(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0
.end method

.method private seedInitialPresenceByAccount(J)V
    .locals 21
    .param p1, "account"    # J

    .prologue
    .line 1834
    new-instance v5, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v5}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1835
    .local v5, "qb":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v7, "contacts"

    invoke-virtual {v5, v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1836
    sget-object v7, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1838
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mQueryContactIdSelectionArgs1:[Ljava/lang/String;

    move-object v7, v0

    const/4 v8, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    .line 1840
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object v7, v0

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    .line 1841
    .local v6, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1843
    const/4 v15, 0x0

    .line 1846
    .local v15, "c":Landroid/database/Cursor;
    :try_start_0
    new-instance v19, Landroid/content/ContentValues;

    invoke-direct/range {v19 .. v19}, Landroid/content/ContentValues;-><init>()V

    .line 1847
    .local v19, "presenceValues":Landroid/content/ContentValues;
    const-string v7, "mode"

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    move-object/from16 v0, v19

    move-object v1, v7

    move-object v2, v8

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1848
    const-string v7, "status"

    const-string v8, ""

    move-object/from16 v0, v19

    move-object v1, v7

    move-object v2, v8

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1851
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 1852
    .local v14, "buf":Ljava/lang/StringBuilder;
    const-string v7, "contact_id"

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1853
    const-string v7, " in (select "

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1854
    const-string v7, "_id"

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1855
    const-string v7, " from "

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1856
    const-string v7, "contacts"

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1857
    const-string v7, " where "

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1858
    const-string v7, "account"

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1859
    const-string v7, "=?) "

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1861
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 1864
    .local v20, "selection":Ljava/lang/String;
    const-string v7, "presence"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mQueryContactIdSelectionArgs1:[Ljava/lang/String;

    move-object v8, v0

    move-object v0, v6

    move-object v1, v7

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    move-object v4, v8

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v16

    .line 1877
    .local v16, "count":I
    sget-object v7, Lcom/google/android/providers/talk/TalkProvider;->CONTACT_ID_PROJECTION:[Ljava/lang/String;

    const-string v8, "account=? AND _id in (select contacts._id from contacts left outer join presence on contacts._id=presence.contact_id where presence.contact_id IS NULL)"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mQueryContactIdSelectionArgs1:[Ljava/lang/String;

    move-object v9, v0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual/range {v5 .. v13}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 1885
    const/16 v16, 0x0

    .line 1887
    :cond_0
    :goto_0
    invoke-interface {v15}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1888
    const/4 v7, 0x0

    invoke-interface {v15, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v17

    .line 1889
    .local v17, "id":J
    const-string v7, "contact_id"

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    move-object/from16 v0, v19

    move-object v1, v7

    move-object v2, v8

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1892
    :try_start_1
    const-string v7, "presence"

    const/4 v8, 0x0

    move-object v0, v6

    move-object v1, v7

    move-object v2, v8

    move-object/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteConstraintException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-lez v7, :cond_0

    .line 1893
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 1905
    .end local v17    # "id":J
    :cond_1
    :try_start_2
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1907
    if-eqz v15, :cond_2

    .line 1908
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 1910
    :cond_2
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1912
    return-void

    .line 1907
    .end local v14    # "buf":Ljava/lang/StringBuilder;
    .end local v16    # "count":I
    .end local v19    # "presenceValues":Landroid/content/ContentValues;
    .end local v20    # "selection":Ljava/lang/String;
    :catchall_0
    move-exception v7

    if-eqz v15, :cond_3

    .line 1908
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 1910
    :cond_3
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v7

    .line 1895
    .restart local v14    # "buf":Ljava/lang/StringBuilder;
    .restart local v16    # "count":I
    .restart local v17    # "id":J
    .restart local v19    # "presenceValues":Landroid/content/ContentValues;
    .restart local v20    # "selection":Ljava/lang/String;
    :catch_0
    move-exception v7

    goto :goto_0
.end method

.method private setupImUrlMatchers(Ljava/lang/String;)V
    .locals 3
    .param p1, "authority"    # Ljava/lang/String;

    .prologue
    .line 954
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "providers"

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 955
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "providers/#"

    const/4 v2, 0x2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 956
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "providers/account"

    const/4 v2, 0x3

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 958
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "accounts"

    const/16 v2, 0xa

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 959
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "accounts/#"

    const/16 v2, 0xb

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 961
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contacts"

    const/16 v2, 0x12

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 962
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contactsWithPresence"

    const/16 v2, 0x13

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 963
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contactsBarebone"

    const/16 v2, 0x14

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 964
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contacts/#/#"

    const/16 v2, 0x16

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 965
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contacts_chatting"

    const/16 v2, 0x15

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 966
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contacts/chatting/#/#"

    const/16 v2, 0x17

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 967
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contacts/online/#/#"

    const/16 v2, 0x19

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 968
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contacts/offline/#/#"

    const/16 v2, 0x1a

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 969
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contacts/#"

    const/16 v2, 0x1b

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 970
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contacts/blocked"

    const/16 v2, 0x1f

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 971
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "bulk_contacts"

    const/16 v2, 0x1c

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 972
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contacts/onlineCount"

    const/16 v2, 0x1e

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 974
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contactLists"

    const/16 v2, 0x20

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 975
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contactLists/#/#"

    const/16 v2, 0x21

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 976
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contactLists/#"

    const/16 v2, 0x22

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 977
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "blockedList"

    const/16 v2, 0x23

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 978
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "blockedList/#/#"

    const/16 v2, 0x24

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 980
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contactsEtag"

    const/16 v2, 0x25

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 981
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "contactsEtag/#"

    const/16 v2, 0x26

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 983
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "presence"

    const/16 v2, 0x28

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 984
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "presence/#"

    const/16 v2, 0x29

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 985
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "presence/account/#"

    const/16 v2, 0x2a

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 986
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "seed_presence/account/#"

    const/16 v2, 0x2b

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 987
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "bulk_presence"

    const/16 v2, 0x2c

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 989
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "messages"

    const/16 v2, 0x32

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 990
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "messagesByAcctAndContact/#/*"

    const/16 v2, 0x33

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 991
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "messagesByThreadId/#"

    const/16 v2, 0x34

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 992
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "messagesByProvider/#"

    const/16 v2, 0x35

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 993
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "messagesByAccount/#"

    const/16 v2, 0x36

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 994
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "messages/#"

    const/16 v2, 0x37

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 996
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "otrMessages"

    const/16 v2, 0x38

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 997
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "otrMessagesByAcctAndContact/#/*"

    const/16 v2, 0x39

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 999
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "otrMessagesByThreadId/#"

    const/16 v2, 0x3a

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1000
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "otrMessagesByProvider/#"

    const/16 v2, 0x3b

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1001
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "otrMessagesByAccount/#"

    const/16 v2, 0x3c

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1002
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "otrMessages/#"

    const/16 v2, 0x3d

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1004
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "groupMembers"

    const/16 v2, 0x41

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1005
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "groupMembers/#"

    const/16 v2, 0x42

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1007
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "avatars"

    const/16 v2, 0x46

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1008
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "avatars/#"

    const/16 v2, 0x47

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1009
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "avatarsBy/#/#"

    const/16 v2, 0x48

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1010
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "chats"

    const/16 v2, 0x50

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1011
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "chats/account/#"

    const/16 v2, 0x51

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1012
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "chats/#"

    const/16 v2, 0x52

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1014
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "sessionCookies"

    const/16 v2, 0x53

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1015
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "sessionCookiesBy/#/#"

    const/16 v2, 0x54

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1016
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "providerSettings"

    const/16 v2, 0x5a

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1017
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "providerSettings/#"

    const/16 v2, 0x5b

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1018
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "providerSettings/#/*"

    const/16 v2, 0x5c

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1021
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "invitations"

    const/16 v2, 0x64

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1022
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "invitations/#"

    const/16 v2, 0x65

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1024
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "accountStatus"

    const/16 v2, 0x68

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1025
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "accountStatus/#"

    const/16 v2, 0x69

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1027
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "brandingResMapCache"

    const/16 v2, 0x6a

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1028
    return-void
.end method

.method private setupMcsUrlMatchers(Ljava/lang/String;)V
    .locals 3
    .param p1, "authority"    # Ljava/lang/String;

    .prologue
    .line 1031
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "outgoingRmqMessages"

    const/16 v2, 0xc8

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1032
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "outgoingRmqMessages/#"

    const/16 v2, 0xc9

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1033
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "outgoingHighestRmqId"

    const/16 v2, 0xca

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1034
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "lastRmqId"

    const/16 v2, 0xcb

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1035
    iget-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    const-string v1, "s2dids"

    const/16 v2, 0xcc

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1036
    return-void
.end method

.method private updateBulkPresence(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 35
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "userWhere"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 1915
    const-string v32, "username"

    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v31

    .line 1916
    .local v31, "usernames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 1917
    .local v9, "count":I
    const-string v32, "account"

    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    .line 1919
    .local v5, "account":Ljava/lang/Long;
    const-string v32, "priority"

    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v22

    .line 1920
    .local v22, "priorityArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v32, "mode"

    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v17

    .line 1921
    .local v17, "modeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v32, "status"

    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v28

    .line 1923
    .local v28, "statusArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v32, "client_type"

    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v8

    .line 1924
    .local v8, "clientTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v32, "jid_resource"

    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v23

    .line 1927
    .local v23, "resourceArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 1929
    .local v6, "buf":Ljava/lang/StringBuilder;
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v32

    if-nez v32, :cond_0

    .line 1930
    move-object v0, v6

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1931
    const-string v32, " AND "

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1934
    :cond_0
    const-string v32, "contact_id"

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1935
    const-string v32, " in (select "

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1936
    const-string v32, "_id"

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1937
    const-string v32, " from "

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1938
    const-string v32, "contacts"

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1939
    const-string v32, " where "

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1940
    const-string v32, "account"

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1941
    const-string v32, "=? AND "

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1944
    const-string v32, "username"

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1945
    const-string v32, " LIKE ?) AND ("

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1947
    const-string v32, "priority"

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1948
    const-string v32, "<=? OR "

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1949
    const-string v32, "priority"

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1950
    const-string v32, " IS NULL OR "

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1951
    const-string v32, "jid_resource"

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1952
    const-string v32, "=?)"

    move-object v0, v6

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1954
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 1958
    .local v25, "selection":Ljava/lang/String;
    if-eqz p3, :cond_1

    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v32, v0

    add-int/lit8 v32, v32, 0x4

    move/from16 v18, v32

    .line 1959
    .local v18, "numArgs":I
    :goto_0
    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v26, v0

    .line 1960
    .local v26, "selectionArgs":[Ljava/lang/String;
    const/16 v24, 0x0

    .line 1962
    .local v24, "selArgsIndex":I
    if-eqz p3, :cond_2

    .line 1963
    const/16 v24, 0x0

    :goto_1
    const/16 v32, 0x1

    sub-int v32, v18, v32

    move/from16 v0, v24

    move/from16 v1, v32

    if-ge v0, v1, :cond_2

    .line 1964
    aget-object v32, p3, v24

    aput-object v32, v26, v24

    .line 1963
    add-int/lit8 v24, v24, 0x1

    goto :goto_1

    .line 1958
    .end local v18    # "numArgs":I
    .end local v24    # "selArgsIndex":I
    .end local v26    # "selectionArgs":[Ljava/lang/String;
    :cond_1
    const/16 v32, 0x4

    move/from16 v18, v32

    goto :goto_0

    .line 1968
    .restart local v18    # "numArgs":I
    .restart local v24    # "selArgsIndex":I
    .restart local v26    # "selectionArgs":[Ljava/lang/String;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v10

    .line 1970
    .local v10, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1971
    const/16 v29, 0x0

    .line 1974
    .local v29, "sum":I
    :try_start_0
    new-instance v20, Landroid/content/ContentValues;

    invoke-direct/range {v20 .. v20}, Landroid/content/ContentValues;-><init>()V

    .line 1976
    .local v20, "presenceValues":Landroid/content/ContentValues;
    const/4 v12, 0x0

    .end local p0    # "this":Lcom/google/android/providers/talk/TalkProvider;
    .local v12, "i":I
    :goto_2
    if-ge v12, v9, :cond_c

    .line 1977
    move-object/from16 v0, v31

    move v1, v12

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/lang/String;

    .line 1978
    .local v30, "username":Ljava/lang/String;
    const/16 v21, 0x0

    .line 1979
    .local v21, "priority":I
    const/16 v16, 0x0

    .line 1980
    .local v16, "mode":I
    move-object/from16 v0, v28

    move v1, v12

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Ljava/lang/String;

    .line 1981
    .local v27, "status":Ljava/lang/String;
    if-nez v23, :cond_a

    const-string v32, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object/from16 v15, v32

    .line 1982
    .local v15, "jidResource":Ljava/lang/String;
    :goto_3
    const/4 v7, 0x0

    .line 1985
    .local v7, "clientType":I
    if-eqz v22, :cond_3

    .line 1986
    :try_start_1
    move-object/from16 v0, v22

    move v1, v12

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v21

    .line 1988
    :cond_3
    if-eqz v17, :cond_4

    .line 1989
    move-object/from16 v0, v17

    move v1, v12

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    .line 1991
    :cond_4
    if-eqz v8, :cond_5

    .line 1992
    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    .line 2006
    :cond_5
    :goto_4
    if-eqz v17, :cond_6

    .line 2007
    :try_start_2
    const-string v32, "mode"

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2009
    :cond_6
    if-eqz v22, :cond_7

    .line 2010
    const-string v32, "priority"

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2012
    :cond_7
    const-string v32, "status"

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2013
    if-eqz v8, :cond_8

    .line 2014
    const-string v32, "client_type"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2017
    :cond_8
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v32

    if-nez v32, :cond_9

    .line 2018
    const-string v32, "jid_resource"

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    move-object v2, v15

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2022
    :cond_9
    move/from16 v13, v24

    .line 2023
    .local v13, "idx":I
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "idx":I
    .local v14, "idx":I
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v32

    aput-object v32, v26, v13

    .line 2024
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "idx":I
    .restart local v13    # "idx":I
    aput-object v30, v26, v14

    .line 2025
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "idx":I
    .restart local v14    # "idx":I
    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v32

    aput-object v32, v26, v13

    .line 2026
    aput-object v15, v26, v14

    .line 2028
    const-string v32, "presence"

    move-object v0, v10

    move-object/from16 v1, v32

    move-object/from16 v2, v20

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v19

    .line 2030
    .local v19, "numUpdated":I
    if-nez v19, :cond_b

    .line 2031
    const-string v32, "TalkProvider"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "[TalkProvider] updateBulkPresence: failed for "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2038
    :goto_5
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->yieldIfContended()Z

    .line 1976
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_2

    .line 1981
    .end local v7    # "clientType":I
    .end local v14    # "idx":I
    .end local v15    # "jidResource":Ljava/lang/String;
    .end local v19    # "numUpdated":I
    :cond_a
    move-object/from16 v0, v23

    move v1, v12

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    move-object/from16 v15, p0

    goto/16 :goto_3

    .line 1994
    .restart local v7    # "clientType":I
    .restart local v15    # "jidResource":Ljava/lang/String;
    :catch_0
    move-exception v32

    move-object/from16 v11, v32

    .line 1995
    .local v11, "ex":Ljava/lang/NumberFormatException;
    const-string v32, "TalkProvider"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "[TalkProvider] updateBulkPresence: caught "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object v1, v11

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_4

    .line 2043
    .end local v7    # "clientType":I
    .end local v11    # "ex":Ljava/lang/NumberFormatException;
    .end local v12    # "i":I
    .end local v15    # "jidResource":Ljava/lang/String;
    .end local v16    # "mode":I
    .end local v20    # "presenceValues":Landroid/content/ContentValues;
    .end local v21    # "priority":I
    .end local v27    # "status":Ljava/lang/String;
    .end local v30    # "username":Ljava/lang/String;
    :catchall_0
    move-exception v32

    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v32

    .line 2033
    .restart local v7    # "clientType":I
    .restart local v12    # "i":I
    .restart local v14    # "idx":I
    .restart local v15    # "jidResource":Ljava/lang/String;
    .restart local v16    # "mode":I
    .restart local v19    # "numUpdated":I
    .restart local v20    # "presenceValues":Landroid/content/ContentValues;
    .restart local v21    # "priority":I
    .restart local v27    # "status":Ljava/lang/String;
    .restart local v30    # "username":Ljava/lang/String;
    :cond_b
    add-int v29, v29, v19

    goto :goto_5

    .line 2041
    .end local v7    # "clientType":I
    .end local v14    # "idx":I
    .end local v15    # "jidResource":Ljava/lang/String;
    .end local v16    # "mode":I
    .end local v19    # "numUpdated":I
    .end local v21    # "priority":I
    .end local v27    # "status":Ljava/lang/String;
    .end local v30    # "username":Ljava/lang/String;
    :cond_c
    :try_start_3
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2043
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 2047
    return v29
.end method

.method private updateInternal(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 32
    .param p1, "url"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "userWhere"    # Ljava/lang/String;
    .param p4, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 3052
    const/4 v14, 0x0

    .line 3053
    .local v14, "idColumnName":Ljava/lang/String;
    const/4 v8, 0x0

    .line 3054
    .local v8, "changedItemId":Ljava/lang/String;
    const/4 v7, 0x0

    .line 3055
    .local v7, "accountStr":Ljava/lang/String;
    const-wide/16 v5, 0x0

    .line 3056
    .local v5, "account":J
    const/4 v9, 0x0

    .line 3057
    .local v9, "contact":Ljava/lang/String;
    const-wide/16 v25, 0x0

    .line 3060
    .local v25, "threadId":J
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    .line 3061
    .local v27, "whereClause":Ljava/lang/StringBuilder;
    if-eqz p3, :cond_0

    .line 3062
    move-object/from16 v0, v27

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3065
    :cond_0
    const/16 v20, 0x0

    .line 3066
    .local v20, "notifyMessagesContentUri":Z
    const/16 v18, 0x0

    .line 3067
    .local v18, "notifyMessagesByContactContentUri":Z
    const/16 v19, 0x0

    .line 3068
    .local v19, "notifyMessagesByThreadIdContentUri":Z
    const/16 v17, 0x0

    .line 3069
    .local v17, "notifyContactListContentUri":Z
    const/16 v21, 0x0

    .line 3071
    .local v21, "notifyProviderAccountContentUri":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v15

    .line 3072
    .local v15, "match":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12

    .line 3074
    .local v12, "db":Landroid/database/sqlite/SQLiteDatabase;
    sparse-switch v15, :sswitch_data_0

    .line 3307
    new-instance v28, Ljava/lang/UnsupportedOperationException;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Cannot update URL: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 3076
    :sswitch_0
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3079
    .restart local v8    # "changedItemId":Ljava/lang/String;
    :sswitch_1
    const-string v24, "providers"

    .line 3310
    .end local p1    # "url":Landroid/net/Uri;
    .end local p3    # "userWhere":Ljava/lang/String;
    .local v24, "tableToChange":Ljava/lang/String;
    :goto_0
    if-nez v14, :cond_1

    .line 3311
    const-string v14, "_id"

    .line 3313
    :cond_1
    if-eqz v8, :cond_2

    .line 3314
    const-string v28, "="

    move-object/from16 v0, v27

    move-object v1, v14

    move-object/from16 v2, v28

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3319
    :cond_2
    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object v0, v12

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move-object/from16 v3, v28

    move-object/from16 v4, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v10

    .line 3321
    .local v10, "count":I
    if-lez v10, :cond_9

    .line 3322
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v23

    .line 3326
    .local v23, "resolver":Landroid/content/ContentResolver;
    const/16 v28, 0x50

    move v0, v15

    move/from16 v1, v28

    if-eq v0, v1, :cond_3

    const/16 v28, 0x52

    move v0, v15

    move/from16 v1, v28

    if-eq v0, v1, :cond_3

    const/16 v28, 0x28

    move v0, v15

    move/from16 v1, v28

    if-eq v0, v1, :cond_3

    const/16 v28, 0x29

    move v0, v15

    move/from16 v1, v28

    if-eq v0, v1, :cond_3

    const/16 v28, 0x14

    move v0, v15

    move/from16 v1, v28

    if-ne v0, v1, :cond_4

    .line 3329
    :cond_3
    sget-object v28, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/16 v29, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3332
    :cond_4
    if-eqz v20, :cond_5

    .line 3334
    sget-object v28, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    const/16 v29, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3337
    :cond_5
    if-eqz v18, :cond_6

    .line 3338
    sget-object v28, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    const/16 v29, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3339
    invoke-static {v5, v6, v9}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v28

    const/16 v29, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3342
    :cond_6
    if-eqz v19, :cond_7

    .line 3343
    sget-object v28, Landroid/provider/Im$Messages;->CONTENT_URI:Landroid/net/Uri;

    const/16 v29, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3344
    invoke-static/range {v25 .. v26}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v28

    const/16 v29, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3347
    :cond_7
    if-eqz v17, :cond_8

    .line 3348
    sget-object v28, Landroid/provider/Im$ContactList;->CONTENT_URI:Landroid/net/Uri;

    const/16 v29, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 3351
    :cond_8
    if-eqz v21, :cond_9

    .line 3353
    sget-object v28, Landroid/provider/Im$Provider;->CONTENT_URI_WITH_ACCOUNT:Landroid/net/Uri;

    const/16 v29, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .end local v23    # "resolver":Landroid/content/ContentResolver;
    :cond_9
    move v11, v10

    .line 3357
    .end local v10    # "count":I
    .end local v24    # "tableToChange":Ljava/lang/String;
    .local v11, "count":I
    :goto_1
    return v11

    .line 3083
    .end local v11    # "count":I
    .restart local p1    # "url":Landroid/net/Uri;
    .restart local p3    # "userWhere":Ljava/lang/String;
    :sswitch_2
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3086
    .restart local v8    # "changedItemId":Ljava/lang/String;
    :sswitch_3
    const-string v24, "accounts"

    .line 3087
    .restart local v24    # "tableToChange":Ljava/lang/String;
    const/16 v21, 0x1

    .line 3088
    goto/16 :goto_0

    .line 3091
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_4
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3094
    .restart local v8    # "changedItemId":Ljava/lang/String;
    :sswitch_5
    const-string v24, "accountStatus"

    .line 3095
    .restart local v24    # "tableToChange":Ljava/lang/String;
    const/16 v21, 0x1

    .line 3096
    goto/16 :goto_0

    .line 3100
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_6
    const-string v24, "contacts"

    .line 3101
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3104
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_7
    const-string v24, "contacts"

    .line 3105
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x2

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3106
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const-string v14, "account"

    .line 3107
    goto/16 :goto_0

    .line 3110
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_8
    const-string v24, "contacts"

    .line 3111
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3112
    .restart local v8    # "changedItemId":Ljava/lang/String;
    goto/16 :goto_0

    .line 3115
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_9
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->updateBulkContacts(Landroid/content/ContentValues;Ljava/lang/String;)I

    move-result v10

    .line 3119
    .restart local v10    # "count":I
    if-lez v10, :cond_a

    .line 3120
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v28

    sget-object v29, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/16 v30, 0x0

    invoke-virtual/range {v28 .. v30}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    :cond_a
    move v11, v10

    .line 3123
    .end local v10    # "count":I
    .restart local v11    # "count":I
    goto :goto_1

    .line 3126
    .end local v11    # "count":I
    :sswitch_a
    const-string v24, "contactList"

    .line 3127
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3128
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const/16 v17, 0x1

    .line 3129
    goto/16 :goto_0

    .line 3132
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_b
    const-string v24, "contactsEtag"

    .line 3133
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3136
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_c
    const-string v24, "contactsEtag"

    .line 3137
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3138
    .restart local v8    # "changedItemId":Ljava/lang/String;
    goto/16 :goto_0

    .line 3141
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_d
    const-string v24, "messages"

    .line 3142
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3145
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_e
    const-string v24, "messages"

    .line 3147
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    .end local p3    # "userWhere":Ljava/lang/String;
    check-cast p3, Ljava/lang/String;

    invoke-static/range {p3 .. p3}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 3149
    :try_start_0
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v5

    .line 3154
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x2

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 3155
    const-string v28, "thread_id"

    const-string v29, "="

    move-object/from16 v0, p0

    move-object v1, v12

    move-object v2, v7

    move-object v3, v9

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->getContactId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v30

    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v30

    invoke-static/range {v27 .. v30}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3158
    const/16 v20, 0x1

    .line 3159
    goto/16 :goto_0

    .line 3150
    .restart local p1    # "url":Landroid/net/Uri;
    :catch_0
    move-exception v13

    .line 3151
    .local v13, "ex":Ljava/lang/NumberFormatException;
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v28 .. v28}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v28

    .line 3162
    .end local v13    # "ex":Ljava/lang/NumberFormatException;
    .end local v24    # "tableToChange":Ljava/lang/String;
    .restart local p3    # "userWhere":Ljava/lang/String;
    :sswitch_f
    const-string v24, "messages"

    .line 3165
    .restart local v24    # "tableToChange":Ljava/lang/String;
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v25

    .line 3170
    const-string v28, "thread_id"

    const-string v29, "="

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v30

    invoke-static/range {v27 .. v30}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3172
    const/16 v20, 0x1

    .line 3173
    goto/16 :goto_0

    .line 3166
    :catch_1
    move-exception v28

    move-object/from16 v13, v28

    .line 3167
    .restart local v13    # "ex":Ljava/lang/NumberFormatException;
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v28 .. v28}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v28

    .line 3176
    .end local v13    # "ex":Ljava/lang/NumberFormatException;
    .end local v24    # "tableToChange":Ljava/lang/String;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_10
    const-string v24, "messages"

    .line 3177
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3178
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const/16 v20, 0x1

    .line 3179
    goto/16 :goto_0

    .line 3182
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_11
    const-string v24, "inMemoryMessages"

    .line 3183
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3186
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_12
    const-string v24, "inMemoryMessages"

    .line 3188
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    .end local p3    # "userWhere":Ljava/lang/String;
    check-cast p3, Ljava/lang/String;

    invoke-static/range {p3 .. p3}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 3190
    :try_start_2
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-wide v5

    .line 3195
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x2

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 3196
    const-string v28, "thread_id"

    const-string v29, "="

    move-object/from16 v0, p0

    move-object v1, v12

    move-object v2, v7

    move-object v3, v9

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->getContactId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v30

    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v30

    invoke-static/range {v27 .. v30}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3199
    const/16 v18, 0x1

    .line 3200
    goto/16 :goto_0

    .line 3191
    .restart local p1    # "url":Landroid/net/Uri;
    :catch_2
    move-exception v13

    .line 3192
    .restart local v13    # "ex":Ljava/lang/NumberFormatException;
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v28 .. v28}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v28

    .line 3203
    .end local v13    # "ex":Ljava/lang/NumberFormatException;
    .end local v24    # "tableToChange":Ljava/lang/String;
    .restart local p3    # "userWhere":Ljava/lang/String;
    :sswitch_13
    const-string v24, "inMemoryMessages"

    .line 3206
    .restart local v24    # "tableToChange":Ljava/lang/String;
    :try_start_3
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "url":Landroid/net/Uri;
    check-cast p1, Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    move-result-wide v25

    .line 3211
    const-string v28, "thread_id"

    const-string v29, "="

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v30

    invoke-static/range {v27 .. v30}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3213
    const/16 v19, 0x1

    .line 3214
    goto/16 :goto_0

    .line 3207
    :catch_3
    move-exception v28

    move-object/from16 v13, v28

    .line 3208
    .restart local v13    # "ex":Ljava/lang/NumberFormatException;
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v28 .. v28}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v28

    .line 3217
    .end local v13    # "ex":Ljava/lang/NumberFormatException;
    .end local v24    # "tableToChange":Ljava/lang/String;
    .restart local p1    # "url":Landroid/net/Uri;
    :sswitch_14
    const-string v24, "inMemoryMessages"

    .line 3218
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3219
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const/16 v20, 0x1

    .line 3220
    goto/16 :goto_0

    .line 3223
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_15
    const-string v24, "avatars"

    .line 3224
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3227
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_16
    const-string v24, "avatars"

    .line 3228
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3229
    .restart local v8    # "changedItemId":Ljava/lang/String;
    goto/16 :goto_0

    .line 3232
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_17
    const-string v24, "avatars"

    .line 3233
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x2

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3234
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const-string v14, "account_id"

    .line 3235
    goto/16 :goto_0

    .line 3238
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_18
    const-string v24, "chats"

    .line 3239
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3242
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_19
    const-string v24, "chats"

    .line 3243
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3244
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const-string v14, "contact_id"

    .line 3245
    goto/16 :goto_0

    .line 3249
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_1a
    const-string v24, "presence"

    .line 3250
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3253
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_1b
    const-string v24, "presence"

    .line 3254
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3255
    .restart local v8    # "changedItemId":Ljava/lang/String;
    const-string v14, "contact_id"

    .line 3256
    goto/16 :goto_0

    .line 3259
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_1c
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->updateBulkPresence(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v10

    .line 3263
    .restart local v10    # "count":I
    if-lez v10, :cond_b

    .line 3264
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v28

    sget-object v29, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/16 v30, 0x0

    invoke-virtual/range {v28 .. v30}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    :cond_b
    move v11, v10

    .line 3267
    .end local v10    # "count":I
    .restart local v11    # "count":I
    goto/16 :goto_1

    .line 3270
    .end local v11    # "count":I
    :sswitch_1d
    const-string v24, "invitations"

    .line 3271
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "changedItemId":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3272
    .restart local v8    # "changedItemId":Ljava/lang/String;
    goto/16 :goto_0

    .line 3275
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_1e
    const-string v24, "sessionCookies"

    .line 3276
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3279
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_1f
    const-string v24, "providerSettings"

    .line 3281
    .restart local v24    # "tableToChange":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x1

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    .line 3282
    .local v22, "providerId":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    const/16 v29, 0x2

    invoke-interface/range {v28 .. v29}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 3284
    .local v16, "name":Ljava/lang/String;
    const-string v28, "provider"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v28

    if-nez v28, :cond_c

    const-string v28, "name"

    move-object/from16 v0, p2

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v28

    if-eqz v28, :cond_d

    .line 3286
    :cond_c
    new-instance v28, Ljava/lang/SecurityException;

    const-string v29, "Cannot override the value for provider|name"

    invoke-direct/range {v28 .. v29}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 3289
    :cond_d
    const-string v28, "provider"

    const-string v29, "="

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    move-object/from16 v3, v22

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3290
    const-string v28, "name"

    const-string v29, "="

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    move-object/from16 v3, v16

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 3295
    .end local v16    # "name":Ljava/lang/String;
    .end local v22    # "providerId":Ljava/lang/String;
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_20
    const-string v24, "outgoingRmqMessages"

    .line 3296
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3299
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_21
    const-string v24, "lastrmqid"

    .line 3300
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3303
    .end local v24    # "tableToChange":Ljava/lang/String;
    :sswitch_22
    const-string v24, "s2dRmqIds"

    .line 3304
    .restart local v24    # "tableToChange":Ljava/lang/String;
    goto/16 :goto_0

    .line 3074
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_0
        0xa -> :sswitch_3
        0xb -> :sswitch_2
        0x12 -> :sswitch_6
        0x14 -> :sswitch_6
        0x16 -> :sswitch_7
        0x1b -> :sswitch_8
        0x1c -> :sswitch_9
        0x22 -> :sswitch_a
        0x25 -> :sswitch_b
        0x26 -> :sswitch_c
        0x28 -> :sswitch_1a
        0x29 -> :sswitch_1b
        0x2c -> :sswitch_1c
        0x32 -> :sswitch_d
        0x33 -> :sswitch_e
        0x34 -> :sswitch_f
        0x37 -> :sswitch_10
        0x38 -> :sswitch_11
        0x39 -> :sswitch_12
        0x3a -> :sswitch_13
        0x3d -> :sswitch_14
        0x46 -> :sswitch_15
        0x47 -> :sswitch_16
        0x48 -> :sswitch_17
        0x50 -> :sswitch_18
        0x52 -> :sswitch_19
        0x53 -> :sswitch_1e
        0x5c -> :sswitch_1f
        0x65 -> :sswitch_1d
        0x68 -> :sswitch_5
        0x69 -> :sswitch_4
        0xc8 -> :sswitch_20
        0xcb -> :sswitch_21
        0xcc -> :sswitch_22
    .end sparse-switch
.end method

.method private updateSlotForChat(JI)I
    .locals 6
    .param p1, "chatId"    # J
    .param p3, "slot"    # I

    .prologue
    .line 2492
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2494
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "shortcut"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2496
    sget-object v1, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "_id=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p0, v1, v0, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method


# virtual methods
.method public final delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .param p1, "url"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 1068
    iget-object v2, p0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1069
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1071
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/providers/talk/TalkProvider;->deleteInternal(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1072
    .local v1, "result":I
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1074
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1076
    if-lez v1, :cond_0

    .line 1077
    invoke-virtual {p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, p1, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    .line 1080
    :cond_0
    return v1

    .line 1074
    .end local v1    # "result":I
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v2
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .param p1, "url"    # Landroid/net/Uri;

    .prologue
    .line 1467
    iget-object v1, p0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    .line 1468
    .local v0, "match":I
    packed-switch v0, :pswitch_data_0

    .line 1564
    :pswitch_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unknown URL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1470
    :pswitch_1
    const-string v1, "vnd.android.cursor.dir/gtalk-providers"

    .line 1561
    :goto_0
    return-object v1

    .line 1473
    :pswitch_2
    const-string v1, "vnd.android.cursor.item/gtalk-providers"

    goto :goto_0

    .line 1476
    :pswitch_3
    const-string v1, "vnd.android.cursor.dir/gtalk-accounts"

    goto :goto_0

    .line 1479
    :pswitch_4
    const-string v1, "vnd.android.cursor.item/gtalk-accounts"

    goto :goto_0

    .line 1488
    :pswitch_5
    const-string v1, "vnd.android.cursor.dir/gtalk-contacts"

    goto :goto_0

    .line 1491
    :pswitch_6
    const-string v1, "vnd.android.cursor.item/gtalk-contacts"

    goto :goto_0

    .line 1495
    :pswitch_7
    const-string v1, "vnd.android.cursor.dir/gtalk-contactLists"

    goto :goto_0

    .line 1498
    :pswitch_8
    const-string v1, "vnd.android.cursor.item/gtalk-contactLists"

    goto :goto_0

    .line 1502
    :pswitch_9
    const-string v1, "vnd.android.cursor.dir/gtalk-blockedList"

    goto :goto_0

    .line 1506
    :pswitch_a
    const-string v1, "vnd.android.cursor.dir/gtalk-contactsEtag"

    goto :goto_0

    .line 1518
    :pswitch_b
    const-string v1, "vnd.android.cursor.dir/gtalk-messages"

    goto :goto_0

    .line 1522
    :pswitch_c
    const-string v1, "vnd.android.cursor.item/gtalk-messages"

    goto :goto_0

    .line 1526
    :pswitch_d
    const-string v1, "vnd.android.cursor.dir/gtalk-presence"

    goto :goto_0

    .line 1529
    :pswitch_e
    const-string v1, "vnd.android.cursor.dir/gtalk-avatars"

    goto :goto_0

    .line 1532
    :pswitch_f
    const-string v1, "vnd.android.cursor.item/gtalk-avatars"

    goto :goto_0

    .line 1535
    :pswitch_10
    const-string v1, "vnd.android.cursor.dir/gtalk-chats"

    goto :goto_0

    .line 1538
    :pswitch_11
    const-string v1, "vnd.android.cursor.item/gtalk-chats"

    goto :goto_0

    .line 1541
    :pswitch_12
    const-string v1, "vnd.android.cursor.dir/gtalk-invitations"

    goto :goto_0

    .line 1544
    :pswitch_13
    const-string v1, "vnd.android.cursor.item/gtalk-invitations"

    goto :goto_0

    .line 1548
    :pswitch_14
    const-string v1, "vnd.android.cursor.dir/gtalk-groupMembers"

    goto :goto_0

    .line 1552
    :pswitch_15
    const-string v1, "vnd.android-dir/gtalk-sessionCookies"

    goto :goto_0

    .line 1555
    :pswitch_16
    const-string v1, "vnd.android-dir/gtalk-providerSettings"

    goto :goto_0

    .line 1558
    :pswitch_17
    const-string v1, "vnd.android.cursor.dir/gtalk-account-status"

    goto :goto_0

    .line 1561
    :pswitch_18
    const-string v1, "vnd.android.cursor.item/gtalk-account-status"

    goto :goto_0

    .line 1468
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_5
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_9
        :pswitch_a
        :pswitch_a
        :pswitch_0
        :pswitch_d
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_d
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_14
        :pswitch_14
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_e
        :pswitch_f
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_10
        :pswitch_0
        :pswitch_11
        :pswitch_15
        :pswitch_15
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_16
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_12
        :pswitch_13
        :pswitch_0
        :pswitch_0
        :pswitch_17
        :pswitch_18
    .end packed-switch
.end method

.method public final insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 5
    .param p1, "url"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 1086
    iget-object v2, p0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1087
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1089
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/providers/talk/TalkProvider;->insertInternal(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 1090
    .local v1, "result":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1092
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1094
    if-eqz v1, :cond_0

    .line 1095
    invoke-virtual {p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, p1, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    .line 1098
    :cond_0
    return-object v1

    .line 1092
    .end local v1    # "result":Landroid/net/Uri;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v2
.end method

.method insertBulkContacts(Landroid/content/ContentValues;)Z
    .locals 34
    .param p1, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 1572
    const-string v31, "username"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v30

    .line 1573
    .local v30, "usernames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "nickname"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v13

    .line 1574
    .local v13, "nicknames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->size()I

    move-result v29

    .line 1575
    .local v29, "usernameCount":I
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 1577
    .local v12, "nicknameCount":I
    move/from16 v0, v29

    move v1, v12

    if-eq v0, v1, :cond_0

    .line 1578
    const-string v31, "TalkProvider"

    const-string v32, "[TalkProvider] insertBulkContacts: input bundle username & nickname lists have diff. length!"

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1580
    const/16 v31, 0x0

    .line 1709
    .end local p0    # "this":Lcom/google/android/providers/talk/TalkProvider;
    :goto_0
    return v31

    .line 1583
    .restart local p0    # "this":Lcom/google/android/providers/talk/TalkProvider;
    :cond_0
    const-string v31, "type"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    .line 1584
    .local v5, "contactTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "subscriptionStatus"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v23

    .line 1586
    .local v23, "subscriptionStatusArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "subscriptionType"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v25

    .line 1588
    .local v25, "subscriptionTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "qc"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v17

    .line 1589
    .local v17, "quickContactArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "rejected"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v19

    .line 1590
    .local v19, "rejectedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v26, 0x0

    .line 1592
    .local v26, "sum":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    .line 1594
    .local v7, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1596
    :try_start_0
    const-string v31, "provider"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v15

    .line 1597
    .local v15, "provider":Ljava/lang/Long;
    const-string v31, "account"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    .line 1598
    .local v4, "account":Ljava/lang/Long;
    const-string v31, "contactList"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v10

    .line 1600
    .local v10, "listId":Ljava/lang/Long;
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 1601
    .local v6, "contactValues":Landroid/content/ContentValues;
    const-string v31, "provider"

    move-object v0, v6

    move-object/from16 v1, v31

    move-object v2, v15

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1602
    const-string v31, "account"

    move-object v0, v6

    move-object/from16 v1, v31

    move-object v2, v4

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1603
    const-string v31, "contactList"

    move-object v0, v6

    move-object/from16 v1, v31

    move-object v2, v10

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1604
    new-instance v14, Landroid/content/ContentValues;

    invoke-direct {v14}, Landroid/content/ContentValues;-><init>()V

    .line 1605
    .local v14, "presenceValues":Landroid/content/ContentValues;
    const-string v31, "mode"

    const/16 v32, 0x0

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v14

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1608
    const/4 v9, 0x0

    .end local p0    # "this":Lcom/google/android/providers/talk/TalkProvider;
    .local v9, "i":I
    :goto_1
    move v0, v9

    move/from16 v1, v29

    if-ge v0, v1, :cond_a

    .line 1609
    move-object/from16 v0, v30

    move v1, v9

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/String;

    .line 1610
    .local v28, "username":Ljava/lang/String;
    invoke-virtual {v13, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1611
    .local v11, "nickname":Ljava/lang/String;
    const/16 v27, 0x0

    .line 1612
    .local v27, "type":I
    const/16 v22, 0x0

    .line 1613
    .local v22, "subscriptionStatus":I
    const/16 v24, 0x0

    .line 1614
    .local v24, "subscriptionType":I
    const/16 v16, 0x0

    .line 1615
    .local v16, "quickContact":I
    const/16 v18, 0x0

    .line 1618
    .local v18, "rejected":I
    :try_start_1
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v27

    .line 1619
    if-eqz v23, :cond_1

    .line 1620
    move-object/from16 v0, v23

    move v1, v9

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    .line 1622
    :cond_1
    if-eqz v25, :cond_2

    .line 1623
    move-object/from16 v0, v25

    move v1, v9

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v24

    .line 1625
    :cond_2
    if-eqz v17, :cond_3

    .line 1626
    move-object/from16 v0, v17

    move v1, v9

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    .line 1628
    :cond_3
    if-eqz v19, :cond_4

    .line 1629
    move-object/from16 v0, v19

    move v1, v9

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v18

    .line 1642
    :cond_4
    :goto_2
    :try_start_2
    const-string v31, "username"

    move-object v0, v6

    move-object/from16 v1, v31

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1643
    const-string v31, "nickname"

    move-object v0, v6

    move-object/from16 v1, v31

    move-object v2, v11

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1644
    const-string v31, "type"

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v6

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1645
    if-eqz v23, :cond_5

    .line 1646
    const-string v31, "subscriptionStatus"

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v6

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1648
    :cond_5
    if-eqz v25, :cond_6

    .line 1649
    const-string v31, "subscriptionType"

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v6

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1651
    :cond_6
    if-eqz v17, :cond_7

    .line 1652
    const-string v31, "qc"

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v6

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1654
    :cond_7
    if-eqz v19, :cond_8

    .line 1655
    const-string v31, "rejected"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v6

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1682
    :cond_8
    const-string v31, "contacts"

    const-string v32, "username"

    move-object v0, v7

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    move-object v3, v6

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v20

    .line 1683
    .local v20, "rowId":J
    const-wide/16 v31, 0x0

    cmp-long v31, v20, v31

    if-lez v31, :cond_9

    .line 1684
    add-int/lit8 v26, v26, 0x1

    .line 1688
    const-string v31, "contact_id"

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v32

    move-object v0, v14

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1691
    :try_start_3
    const-string v31, "presence"

    const/16 v32, 0x0

    move-object v0, v7

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    move-object v3, v14

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteConstraintException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1699
    :cond_9
    :goto_3
    :try_start_4
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->yieldIfContended()Z

    .line 1608
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 1631
    .end local v20    # "rowId":J
    :catch_0
    move-exception v31

    move-object/from16 v8, v31

    .line 1632
    .local v8, "ex":Ljava/lang/NumberFormatException;
    const-string v31, "TalkProvider"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "insertBulkContacts: caught "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_2

    .line 1704
    .end local v4    # "account":Ljava/lang/Long;
    .end local v6    # "contactValues":Landroid/content/ContentValues;
    .end local v8    # "ex":Ljava/lang/NumberFormatException;
    .end local v9    # "i":I
    .end local v10    # "listId":Ljava/lang/Long;
    .end local v11    # "nickname":Ljava/lang/String;
    .end local v14    # "presenceValues":Landroid/content/ContentValues;
    .end local v15    # "provider":Ljava/lang/Long;
    .end local v16    # "quickContact":I
    .end local v18    # "rejected":I
    .end local v22    # "subscriptionStatus":I
    .end local v24    # "subscriptionType":I
    .end local v27    # "type":I
    .end local v28    # "username":Ljava/lang/String;
    :catchall_0
    move-exception v31

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v31

    .line 1692
    .restart local v4    # "account":Ljava/lang/Long;
    .restart local v6    # "contactValues":Landroid/content/ContentValues;
    .restart local v9    # "i":I
    .restart local v10    # "listId":Ljava/lang/Long;
    .restart local v11    # "nickname":Ljava/lang/String;
    .restart local v14    # "presenceValues":Landroid/content/ContentValues;
    .restart local v15    # "provider":Ljava/lang/Long;
    .restart local v16    # "quickContact":I
    .restart local v18    # "rejected":I
    .restart local v20    # "rowId":J
    .restart local v22    # "subscriptionStatus":I
    .restart local v24    # "subscriptionType":I
    .restart local v27    # "type":I
    .restart local v28    # "username":Ljava/lang/String;
    :catch_1
    move-exception v31

    move-object/from16 v8, v31

    .line 1693
    .local v8, "ex":Landroid/database/sqlite/SQLiteConstraintException;
    :try_start_5
    const-string v31, "TalkProvider"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "insertBulkContacts: seeding presence caught "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 1702
    .end local v8    # "ex":Landroid/database/sqlite/SQLiteConstraintException;
    .end local v11    # "nickname":Ljava/lang/String;
    .end local v16    # "quickContact":I
    .end local v18    # "rejected":I
    .end local v20    # "rowId":J
    .end local v22    # "subscriptionStatus":I
    .end local v24    # "subscriptionType":I
    .end local v27    # "type":I
    .end local v28    # "username":Ljava/lang/String;
    :cond_a
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1704
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1709
    const/16 v31, 0x1

    goto/16 :goto_0
.end method

.method public onCreate()Z
    .locals 2

    .prologue
    .line 1040
    new-instance v0, Lcom/google/android/providers/talk/TalkProvider$DatabaseHelper;

    invoke-virtual {p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/providers/talk/TalkProvider$DatabaseHelper;-><init>(Lcom/google/android/providers/talk/TalkProvider;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 1041
    const/4 v0, 0x1

    return v0
.end method

.method public openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 3363
    invoke-virtual {p0, p1, p2}, Lcom/google/android/providers/talk/TalkProvider;->openFileHelper(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public final query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "url"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 1105
    invoke-virtual/range {p0 .. p5}, Lcom/google/android/providers/talk/TalkProvider;->queryInternal(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public queryInternal(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 33
    .param p1, "url"    # Landroid/net/Uri;
    .param p2, "projectionIn"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sort"    # Ljava/lang/String;

    .prologue
    .line 1110
    new-instance v5, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v5}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1111
    .local v5, "qb":Landroid/database/sqlite/SQLiteQueryBuilder;
    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    .line 1112
    .local v32, "whereClause":Ljava/lang/StringBuilder;
    if-eqz p3, :cond_0

    .line 1113
    move-object/from16 v0, v32

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1115
    :cond_0
    const/16 v16, 0x0

    .line 1116
    .local v16, "groupBy":Ljava/lang/String;
    const/16 v19, 0x0

    .line 1119
    .local v19, "limit":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mUrlMatcher:Landroid/content/UriMatcher;

    move-object v6, v0

    move-object v0, v6

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v25

    .line 1130
    .local v25, "match":I
    sparse-switch v25, :sswitch_data_0

    .line 1422
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown URL "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object v0, v7

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1132
    :sswitch_0
    const-string v6, "_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1136
    :sswitch_1
    const-string v6, "providers"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1426
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object v6, v0

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12

    .line 1427
    .local v12, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/16 v21, 0x0

    .line 1430
    .local v21, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    const/16 v17, 0x0

    move-object v11, v5

    move-object/from16 v13, p2

    move-object/from16 v15, p4

    move-object/from16 v18, p5

    invoke-virtual/range {v11 .. v19}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v21

    .line 1432
    if-eqz v21, :cond_1

    .line 1433
    packed-switch v25, :pswitch_data_0

    .line 1448
    :goto_1
    :pswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    move-object/from16 v0, v21

    move-object v1, v6

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_2
    move-object/from16 v6, v21

    .line 1454
    .end local v12    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v21    # "c":Landroid/database/Cursor;
    .end local p3    # "selection":Ljava/lang/String;
    :goto_3
    return-object v6

    .line 1140
    .restart local p3    # "selection":Ljava/lang/String;
    :sswitch_2
    const-string v6, "providers LEFT OUTER JOIN accounts ON (providers._id = accounts.provider AND accounts.active = 1) LEFT OUTER JOIN accountStatus ON (accounts._id = accountStatus.account)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1141
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sProviderAccountsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    goto :goto_0

    .line 1145
    :sswitch_3
    const-string v6, "_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1148
    :sswitch_4
    const-string v6, "accounts"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto :goto_0

    .line 1152
    :sswitch_5
    const-string v6, "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id) LEFT OUTER JOIN chats ON (contacts._id = chats.contact_id) LEFT OUTER JOIN avatars ON (contacts.username = avatars.contact AND contacts.account = avatars.account_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1153
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    goto :goto_0

    .line 1157
    :sswitch_6
    const-string v6, "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1158
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    goto :goto_0

    .line 1162
    :sswitch_7
    const-string v6, "contacts"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto :goto_0

    .line 1166
    :sswitch_8
    const-string v6, "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id) LEFT OUTER JOIN chats ON (contacts._id = chats.contact_id) LEFT OUTER JOIN avatars ON (contacts.username = avatars.contact AND contacts.account = avatars.account_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1167
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1168
    const-string v6, "chats.last_message_date IS NOT NULL"

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1174
    :sswitch_9
    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v32

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->buildQueryContactsByProvider(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/StringBuilder;Landroid/net/Uri;)V

    .line 1175
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->NON_BLOCKED_CONTACTS_WHERE_CLAUSE:Ljava/lang/String;

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1179
    :sswitch_a
    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v32

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->buildQueryContactsByProvider(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/StringBuilder;Landroid/net/Uri;)V

    .line 1180
    const-string v6, "chats.last_message_date IS NOT NULL"

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1186
    :sswitch_b
    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v32

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->buildQueryContactsByProvider(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/StringBuilder;Landroid/net/Uri;)V

    .line 1187
    const-string v6, "chats.last_message_date IS NULL"

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 1188
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->NON_BLOCKED_CONTACTS_WHERE_CLAUSE:Ljava/lang/String;

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1192
    :sswitch_c
    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v32

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->buildQueryContactsByProvider(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/StringBuilder;Landroid/net/Uri;)V

    .line 1193
    const-string v6, "mode"

    const-string v7, "!="

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1194
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->NON_BLOCKED_CONTACTS_WHERE_CLAUSE:Ljava/lang/String;

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1198
    :sswitch_d
    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v32

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->buildQueryContactsByProvider(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/StringBuilder;Landroid/net/Uri;)V

    .line 1199
    const-string v6, "mode"

    const-string v7, "="

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1200
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->NON_BLOCKED_CONTACTS_WHERE_CLAUSE:Ljava/lang/String;

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1204
    :sswitch_e
    const-string v6, "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id) LEFT OUTER JOIN chats ON (contacts._id = chats.contact_id) LEFT OUTER JOIN avatars ON (contacts.username = avatars.contact AND contacts.account = avatars.account_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1205
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1206
    const-string v6, "(contacts.type=3)"

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1210
    :sswitch_f
    const-string v6, "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id) LEFT OUTER JOIN chats ON (contacts._id = chats.contact_id) LEFT OUTER JOIN avatars ON (contacts.username = avatars.contact AND contacts.account = avatars.account_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1211
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1212
    const-string v6, "contacts._id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1216
    :sswitch_10
    const-string v6, "contacts LEFT OUTER JOIN presence ON (contacts._id = presence.contact_id) LEFT OUTER JOIN chats ON (contacts._id = chats.contact_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1217
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sContactsProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1218
    const-string v6, "mode"

    const-string v7, "!="

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1219
    const-string v6, "chats.last_message_date IS NULL"

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 1220
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->NON_BLOCKED_CONTACTS_WHERE_CLAUSE:Ljava/lang/String;

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 1221
    const-string v16, "contactList"

    .line 1222
    goto/16 :goto_0

    .line 1225
    :sswitch_11
    const-string v6, "account"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x2

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1229
    :sswitch_12
    const-string v6, "contactList"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1230
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sContactListProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    goto/16 :goto_0

    .line 1234
    :sswitch_13
    const-string v6, "contactList"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1235
    const-string v6, "_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1239
    :sswitch_14
    const-string v6, "blockedList LEFT OUTER JOIN avatars ON (blockedList.username = avatars.contact AND blockedList.account = avatars.account_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1240
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    goto/16 :goto_0

    .line 1244
    :sswitch_15
    const-string v6, "blockedList LEFT OUTER JOIN avatars ON (blockedList.username = avatars.contact AND blockedList.account = avatars.account_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1245
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sBlockedListProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1246
    const-string v6, "account"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x2

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1251
    :sswitch_16
    const-string v6, "contactsEtag"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1255
    :sswitch_17
    const-string v6, "contactsEtag"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1256
    const-string v6, "_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1260
    :sswitch_18
    const-string v6, "thread_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1264
    :sswitch_19
    const-string v6, "messages"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1266
    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1267
    .local v7, "selectionClause":Ljava/lang/String;
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v6, p2

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 1271
    .local v30, "query1":Ljava/lang/String;
    new-instance v5, Landroid/database/sqlite/SQLiteQueryBuilder;

    .end local v5    # "qb":Landroid/database/sqlite/SQLiteQueryBuilder;
    invoke-direct {v5}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1272
    .restart local v5    # "qb":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v6, "inMemoryMessages"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1273
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v6, p2

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 1277
    .local v31, "query2":Ljava/lang/String;
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v30, v6, v7

    .end local v7    # "selectionClause":Ljava/lang/String;
    const/4 v7, 0x1

    aput-object v31, v6, v7

    const/4 v7, 0x0

    move-object v0, v5

    move-object v1, v6

    move-object/from16 v2, p5

    move-object v3, v7

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildUnionQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 1278
    .local v29, "query":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object v6, v0

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12

    .line 1279
    .restart local v12    # "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, "messages"

    move-object v0, v12

    move-object v1, v6

    move-object/from16 v2, v29

    move-object v3, v7

    move-object v4, v8

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQueryWithFactory(Landroid/database/sqlite/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v21

    .line 1280
    .restart local v21    # "c":Landroid/database/Cursor;
    if-eqz v21, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->isTemporary()Z

    move-result v6

    if-nez v6, :cond_2

    .line 1281
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    move-object/from16 v0, v21

    move-object v1, v6

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    :cond_2
    move-object/from16 v6, v21

    .line 1283
    goto/16 :goto_3

    .line 1286
    .end local v12    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v21    # "c":Landroid/database/Cursor;
    .end local v29    # "query":Ljava/lang/String;
    .end local v30    # "query1":Ljava/lang/String;
    .end local v31    # "query2":Ljava/lang/String;
    :sswitch_1a
    const-string v6, "messages"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1287
    const-string v6, "_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1291
    :sswitch_1b
    const-string v6, "messages LEFT OUTER JOIN contacts ON (contacts._id = messages.thread_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1292
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sMessagesProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1294
    const-string v6, "account"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1295
    const-string v6, "contacts.username"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x2

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    .end local p3    # "selection":Ljava/lang/String;
    check-cast p3, Ljava/lang/String;

    invoke-static/range {p3 .. p3}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1298
    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1299
    .local v10, "sel":Ljava/lang/String;
    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object v8, v5

    move-object/from16 v9, p2

    invoke-virtual/range {v8 .. v15}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 1302
    .local v26, "q1":Ljava/lang/String;
    new-instance v5, Landroid/database/sqlite/SQLiteQueryBuilder;

    .end local v5    # "qb":Landroid/database/sqlite/SQLiteQueryBuilder;
    invoke-direct {v5}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1303
    .restart local v5    # "qb":Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v6, "inMemoryMessages LEFT OUTER JOIN contacts ON (contacts._id = inMemoryMessages.thread_id)"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1304
    sget-object v6, Lcom/google/android/providers/talk/TalkProvider;->sInMemoryMessagesProjectionMap:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1305
    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object v8, v5

    move-object/from16 v9, p2

    invoke-virtual/range {v8 .. v15}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 1308
    .local v27, "q2":Ljava/lang/String;
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v26, v6, v7

    const/4 v7, 0x1

    aput-object v27, v6, v7

    const/4 v7, 0x0

    move-object v0, v5

    move-object v1, v6

    move-object/from16 v2, p5

    move-object v3, v7

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildUnionQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 1309
    .local v28, "q3":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object v6, v0

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v23

    .line 1310
    .local v23, "db2":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, "messages LEFT OUTER JOIN contacts ON (contacts._id = messages.thread_id)"

    move-object/from16 v0, v23

    move-object v1, v6

    move-object/from16 v2, v28

    move-object v3, v7

    move-object v4, v8

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQueryWithFactory(Landroid/database/sqlite/SQLiteDatabase$CursorFactory;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v22

    .line 1311
    .local v22, "c2":Landroid/database/Cursor;
    if-eqz v22, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->isTemporary()Z

    move-result v6

    if-nez v6, :cond_3

    .line 1312
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    move-object/from16 v0, v22

    move-object v1, v6

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    :cond_3
    move-object/from16 v6, v22

    .line 1314
    goto/16 :goto_3

    .line 1317
    .end local v10    # "sel":Ljava/lang/String;
    .end local v22    # "c2":Landroid/database/Cursor;
    .end local v23    # "db2":Landroid/database/sqlite/SQLiteDatabase;
    .end local v26    # "q1":Ljava/lang/String;
    .end local v27    # "q2":Ljava/lang/String;
    .end local v28    # "q3":Ljava/lang/String;
    .restart local p3    # "selection":Ljava/lang/String;
    :sswitch_1c
    const-string v6, "invitations"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1321
    :sswitch_1d
    const-string v6, "invitations"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1322
    const-string v6, "_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1326
    :sswitch_1e
    const-string v6, "groupMembers"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1330
    :sswitch_1f
    const-string v6, "groupMembers"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1331
    const-string v6, "groupId"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1335
    :sswitch_20
    const-string v6, "avatars"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1339
    :sswitch_21
    const-string v6, "avatars"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1340
    const-string v6, "account_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x2

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1344
    :sswitch_22
    const-string v6, "chats"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1348
    :sswitch_23
    const-string v6, "chats"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1349
    const-string v6, "contact_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1353
    :sswitch_24
    const-string v6, "chats"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1354
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/providers/talk/TalkProvider;->decodeURLSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 1355
    .local v20, "accountStr":Ljava/lang/String;
    const-string v6, "contact_id"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "account=\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object v0, v7

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    move-object v1, v6

    move-object v2, v7

    invoke-direct {v0, v1, v2}, Lcom/google/android/providers/talk/TalkProvider;->buildContactIdSelection(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v32

    move-object v1, v6

    invoke-static {v0, v1}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1360
    .end local v20    # "accountStr":Ljava/lang/String;
    :sswitch_25
    const-string v6, "presence"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1364
    :sswitch_26
    const-string v6, "presence"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1365
    const-string v6, "contact_id"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1369
    :sswitch_27
    const-string v6, "sessionCookies"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1373
    :sswitch_28
    const-string v6, "sessionCookies"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1374
    const-string v6, "account"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x2

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1378
    :sswitch_29
    const-string v6, "name"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x2

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1381
    :sswitch_2a
    const-string v6, "provider"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1384
    :sswitch_2b
    const-string v6, "providerSettings"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1388
    :sswitch_2c
    const-string v6, "accountStatus"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1392
    :sswitch_2d
    const-string v6, "accountStatus"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1393
    const-string v6, "account"

    const-string v7, "="

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v32

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/providers/talk/TalkProvider;->appendWhere(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1398
    :sswitch_2e
    const-string v6, "brandingResMapCache"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1403
    :sswitch_2f
    const-string v6, "outgoingRmqMessages"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1407
    :sswitch_30
    const-string v6, "outgoingRmqMessages"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1408
    const-string p5, "rmq_id DESC"

    .line 1409
    const-string v19, "1"

    .line 1410
    goto/16 :goto_0

    .line 1413
    :sswitch_31
    const-string v6, "lastrmqid"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1414
    const-string v19, "1"

    .line 1415
    goto/16 :goto_0

    .line 1418
    :sswitch_32
    const-string v6, "s2dRmqIds"

    invoke-virtual {v5, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1441
    .restart local v12    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v21    # "c":Landroid/database/Cursor;
    :pswitch_1
    :try_start_1
    sget-object p1, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 1442
    goto/16 :goto_1

    .line 1444
    :pswitch_2
    sget-object p1, Landroid/provider/Im$Contacts;->CONTENT_URI_CHAT_CONTACTS:Landroid/net/Uri;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 1450
    :catch_0
    move-exception v6

    move-object/from16 v24, v6

    .line 1451
    .local v24, "ex":Ljava/lang/Exception;
    const-string v6, "TalkProvider"

    const-string v7, "query db caught "

    move-object v0, v6

    move-object v1, v7

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2

    .line 1130
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_0
        0x3 -> :sswitch_2
        0xa -> :sswitch_4
        0xb -> :sswitch_3
        0x12 -> :sswitch_5
        0x13 -> :sswitch_6
        0x14 -> :sswitch_7
        0x15 -> :sswitch_8
        0x16 -> :sswitch_9
        0x17 -> :sswitch_a
        0x18 -> :sswitch_b
        0x19 -> :sswitch_c
        0x1a -> :sswitch_d
        0x1b -> :sswitch_f
        0x1e -> :sswitch_10
        0x1f -> :sswitch_e
        0x20 -> :sswitch_12
        0x21 -> :sswitch_11
        0x22 -> :sswitch_13
        0x23 -> :sswitch_14
        0x24 -> :sswitch_15
        0x25 -> :sswitch_16
        0x26 -> :sswitch_17
        0x28 -> :sswitch_25
        0x29 -> :sswitch_26
        0x32 -> :sswitch_19
        0x33 -> :sswitch_1b
        0x34 -> :sswitch_18
        0x37 -> :sswitch_1a
        0x41 -> :sswitch_1e
        0x42 -> :sswitch_1f
        0x46 -> :sswitch_20
        0x48 -> :sswitch_21
        0x50 -> :sswitch_22
        0x51 -> :sswitch_24
        0x52 -> :sswitch_23
        0x53 -> :sswitch_27
        0x54 -> :sswitch_28
        0x5a -> :sswitch_2b
        0x5b -> :sswitch_2a
        0x5c -> :sswitch_29
        0x64 -> :sswitch_1c
        0x65 -> :sswitch_1d
        0x68 -> :sswitch_2c
        0x69 -> :sswitch_2d
        0x6a -> :sswitch_2e
        0xc8 -> :sswitch_2f
        0xca -> :sswitch_30
        0xcb -> :sswitch_31
        0xcc -> :sswitch_32
    .end sparse-switch

    .line 1433
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .param p1, "url"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 1048
    const/4 v1, 0x0

    .line 1049
    .local v1, "result":I
    iget-object v2, p0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1050
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1052
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/providers/talk/TalkProvider;->updateInternal(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1053
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1055
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1057
    if-lez v1, :cond_0

    .line 1058
    invoke-virtual {p0}, Lcom/google/android/providers/talk/TalkProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, p1, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    .line 1061
    :cond_0
    return v1

    .line 1055
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v2
.end method

.method updateBulkContacts(Landroid/content/ContentValues;Ljava/lang/String;)I
    .locals 34
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "userWhere"    # Ljava/lang/String;

    .prologue
    .line 1714
    const-string v31, "username"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v30

    .line 1715
    .local v30, "usernames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "nickname"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v13

    .line 1717
    .local v13, "nicknames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->size()I

    move-result v29

    .line 1718
    .local v29, "usernameCount":I
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 1720
    .local v12, "nicknameCount":I
    move/from16 v0, v29

    move v1, v12

    if-eq v0, v1, :cond_0

    .line 1721
    const-string v31, "TalkProvider"

    const-string v32, "[TalkProvider] updateBulkContacts: input bundle username & nickname lists have diff. length!"

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1723
    const/16 v31, 0x0

    .line 1810
    .end local p0    # "this":Lcom/google/android/providers/talk/TalkProvider;
    :goto_0
    return v31

    .line 1726
    .restart local p0    # "this":Lcom/google/android/providers/talk/TalkProvider;
    :cond_0
    const-string v31, "type"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 1727
    .local v6, "contactTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "subscriptionStatus"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v21

    .line 1729
    .local v21, "subscriptionStatusArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "subscriptionType"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v23

    .line 1731
    .local v23, "subscriptionTypeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "qc"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v17

    .line 1732
    .local v17, "quickContactArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v31, "rejected"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v19

    .line 1733
    .local v19, "rejectedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/providers/talk/TalkProvider;->mOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8

    .line 1735
    .local v8, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1736
    const/16 v24, 0x0

    .line 1739
    .local v24, "sum":I
    :try_start_0
    const-string v31, "provider"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v15

    .line 1740
    .local v15, "provider":Ljava/lang/Long;
    const-string v31, "account"

    move-object/from16 v0, p1

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    .line 1742
    .local v5, "account":Ljava/lang/Long;
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 1743
    .local v7, "contactValues":Landroid/content/ContentValues;
    const-string v31, "provider"

    move-object v0, v7

    move-object/from16 v1, v31

    move-object v2, v15

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1744
    const-string v31, "account"

    move-object v0, v7

    move-object/from16 v1, v31

    move-object v2, v5

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1746
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    .line 1747
    .local v26, "updateSelection":Ljava/lang/StringBuilder;
    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v27, v0

    .line 1749
    .local v27, "updateSelectionArgs":[Ljava/lang/String;
    const/4 v10, 0x0

    .end local p0    # "this":Lcom/google/android/providers/talk/TalkProvider;
    .local v10, "i":I
    :goto_1
    move v0, v10

    move/from16 v1, v29

    if-ge v0, v1, :cond_2

    .line 1750
    move-object/from16 v0, v30

    move v1, v10

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/String;

    .line 1751
    .local v28, "username":Ljava/lang/String;
    invoke-virtual {v13, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1752
    .local v11, "nickname":Ljava/lang/String;
    const/16 v25, 0x0

    .line 1753
    .local v25, "type":I
    const/16 v20, 0x0

    .line 1754
    .local v20, "subscriptionStatus":I
    const/16 v22, 0x0

    .line 1755
    .local v22, "subscriptionType":I
    const/16 v16, 0x0

    .line 1756
    .local v16, "quickContact":I
    const/16 v18, 0x0

    .line 1759
    .local v18, "rejected":I
    :try_start_1
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    .line 1760
    move-object/from16 v0, v21

    move v1, v10

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v20

    .line 1761
    move-object/from16 v0, v23

    move v1, v10

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    .line 1762
    move-object/from16 v0, v17

    move v1, v10

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    .line 1763
    move-object/from16 v0, v19

    move v1, v10

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static/range {p0 .. p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v18

    .line 1773
    :goto_2
    :try_start_2
    const-string v31, "username"

    move-object v0, v7

    move-object/from16 v1, v31

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1774
    const-string v31, "nickname"

    move-object v0, v7

    move-object/from16 v1, v31

    move-object v2, v11

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1775
    const-string v31, "type"

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v7

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1776
    const-string v31, "subscriptionStatus"

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v7

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1777
    const-string v31, "subscriptionType"

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v7

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1778
    const-string v31, "qc"

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v7

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1779
    const-string v31, "rejected"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v0, v7

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1782
    const/16 v31, 0x0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->length()I

    move-result v32

    move-object/from16 v0, v26

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 1783
    move-object/from16 v0, v26

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1784
    const-string v31, " AND "

    move-object/from16 v0, v26

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1785
    const-string v31, "username"

    move-object/from16 v0, v26

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1786
    const-string v31, "=?"

    move-object/from16 v0, v26

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1788
    const/16 v31, 0x0

    aput-object v28, v27, v31

    .line 1790
    const-string v31, "contacts"

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object v0, v8

    move-object/from16 v1, v31

    move-object v2, v7

    move-object/from16 v3, v32

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v14

    .line 1792
    .local v14, "numUpdated":I
    if-nez v14, :cond_1

    .line 1793
    const-string v31, "TalkProvider"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "[TalkProvider] updateBulkContacts:  update failed for selection = "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1801
    :goto_3
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->yieldIfContended()Z

    .line 1749
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_1

    .line 1764
    .end local v14    # "numUpdated":I
    :catch_0
    move-exception v31

    move-object/from16 v9, v31

    .line 1765
    .local v9, "ex":Ljava/lang/NumberFormatException;
    const-string v31, "TalkProvider"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "insertBulkContacts: caught "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object v1, v9

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_2

    .line 1806
    .end local v5    # "account":Ljava/lang/Long;
    .end local v7    # "contactValues":Landroid/content/ContentValues;
    .end local v9    # "ex":Ljava/lang/NumberFormatException;
    .end local v10    # "i":I
    .end local v11    # "nickname":Ljava/lang/String;
    .end local v15    # "provider":Ljava/lang/Long;
    .end local v16    # "quickContact":I
    .end local v18    # "rejected":I
    .end local v20    # "subscriptionStatus":I
    .end local v22    # "subscriptionType":I
    .end local v25    # "type":I
    .end local v26    # "updateSelection":Ljava/lang/StringBuilder;
    .end local v27    # "updateSelectionArgs":[Ljava/lang/String;
    .end local v28    # "username":Ljava/lang/String;
    :catchall_0
    move-exception v31

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v31

    .line 1796
    .restart local v5    # "account":Ljava/lang/Long;
    .restart local v7    # "contactValues":Landroid/content/ContentValues;
    .restart local v10    # "i":I
    .restart local v11    # "nickname":Ljava/lang/String;
    .restart local v14    # "numUpdated":I
    .restart local v15    # "provider":Ljava/lang/Long;
    .restart local v16    # "quickContact":I
    .restart local v18    # "rejected":I
    .restart local v20    # "subscriptionStatus":I
    .restart local v22    # "subscriptionType":I
    .restart local v25    # "type":I
    .restart local v26    # "updateSelection":Ljava/lang/StringBuilder;
    .restart local v27    # "updateSelectionArgs":[Ljava/lang/String;
    .restart local v28    # "username":Ljava/lang/String;
    :cond_1
    add-int v24, v24, v14

    goto :goto_3

    .line 1804
    .end local v11    # "nickname":Ljava/lang/String;
    .end local v14    # "numUpdated":I
    .end local v16    # "quickContact":I
    .end local v18    # "rejected":I
    .end local v20    # "subscriptionStatus":I
    .end local v22    # "subscriptionType":I
    .end local v25    # "type":I
    .end local v28    # "username":Ljava/lang/String;
    :cond_2
    :try_start_3
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1806
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    move/from16 v31, v24

    .line 1810
    goto/16 :goto_0
.end method
