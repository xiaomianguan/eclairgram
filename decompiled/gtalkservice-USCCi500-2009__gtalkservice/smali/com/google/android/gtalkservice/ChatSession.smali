.class public Lcom/google/android/gtalkservice/ChatSession;
.super Ljava/lang/Object;
.source "ChatSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;
    }
.end annotation


# static fields
.field static final CHATS_ID_PROJECTION:[Ljava/lang/String;

.field private static final DBG:Z = false

.field private static final LAST_UNREAD_PROJECTION:[Ljava/lang/String;

.field private static final MAX_MESSAGE_LENGTH:I = 0x7d0

.field static final UNSENT_COMPOSED_MESSAGE_PROJECTION:[Ljava/lang/String;

.field private static final UPDATE_OTR_STATUS_SELECTION:Ljava/lang/String; = "username=?"


# instance fields
.field private LAST_UNREAD_COLUMN:I

.field private mAccountId:J

.field private mChatListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gtalkservice/IChatListener;",
            ">;"
        }
    .end annotation
.end field

.field private mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

.field private mContext:Landroid/content/Context;

.field private mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

.field private mGroupChat:Z

.field private mGroupChatNickname:Ljava/lang/String;

.field private mGroupChatPassword:Ljava/lang/String;

.field private mGroupContactId:J

.field private mLastChatReceivedTsMs:J

.field private mLastMessageTimestamp:J

.field private mLastUnreadMessage:Ljava/lang/String;

.field private mMyGroupChatNickname:Ljava/lang/String;

.field private mOffTheRecordValue:I

.field private mOtrCursor:Landroid/database/Cursor;

.field private mOtrCursorContentObserver:Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;

.field private mProviderId:J

.field private mResolver:Landroid/content/ContentResolver;

.field private mTo:Ljava/lang/String;

.field private mToBareJid:Ljava/lang/String;

.field private mUpdateOtrStatusSelectionArgs:[Ljava/lang/String;

.field private mUsername:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 50
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "last_unread_message"

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/android/gtalkservice/ChatSession;->LAST_UNREAD_PROJECTION:[Ljava/lang/String;

    .line 53
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "unsent_composed_message"

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/android/gtalkservice/ChatSession;->UNSENT_COMPOSED_MESSAGE_PROJECTION:[Ljava/lang/String;

    .line 56
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/android/gtalkservice/ChatSession;->CHATS_ID_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gtalkservice/ChatMgr;Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnection;JJLjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "chatMgr"    # Lcom/google/android/gtalkservice/ChatMgr;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "resolver"    # Landroid/content/ContentResolver;
    .param p4, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p5, "providerId"    # J
    .param p7, "accountId"    # J
    .param p9, "username"    # Ljava/lang/String;
    .param p10, "to"    # Ljava/lang/String;

    .prologue
    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gtalkservice/ChatSession;->LAST_UNREAD_COLUMN:I

    .line 85
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mUpdateOtrStatusSelectionArgs:[Ljava/lang/String;

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    .line 132
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    .line 133
    iput-object p2, p0, Lcom/google/android/gtalkservice/ChatSession;->mContext:Landroid/content/Context;

    .line 134
    iput-object p3, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    .line 135
    iput-object p4, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 136
    iput-wide p5, p0, Lcom/google/android/gtalkservice/ChatSession;->mProviderId:J

    .line 137
    iput-wide p7, p0, Lcom/google/android/gtalkservice/ChatSession;->mAccountId:J

    .line 138
    iput-object p9, p0, Lcom/google/android/gtalkservice/ChatSession;->mUsername:Ljava/lang/String;

    .line 139
    iput-object p10, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    .line 140
    invoke-static {p10}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mToBareJid:Ljava/lang/String;

    .line 141
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->queryOtrCursor()V

    .line 143
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->initializeChat()V

    .line 144
    return-void
.end method

.method public constructor <init>(Lcom/google/android/gtalkservice/ChatMgr;Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnection;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "chatMgr"    # Lcom/google/android/gtalkservice/ChatMgr;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "resolver"    # Landroid/content/ContentResolver;
    .param p4, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p5, "providerId"    # J
    .param p7, "accountId"    # J
    .param p9, "username"    # Ljava/lang/String;
    .param p10, "room"    # Ljava/lang/String;
    .param p11, "myGroupChatNickname"    # Ljava/lang/String;
    .param p12, "password"    # Ljava/lang/String;

    .prologue
    .line 151
    invoke-direct/range {p0 .. p10}, Lcom/google/android/gtalkservice/ChatSession;-><init>(Lcom/google/android/gtalkservice/ChatMgr;Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnection;JJLjava/lang/String;Ljava/lang/String;)V

    .line 152
    iput-object p11, p0, Lcom/google/android/gtalkservice/ChatSession;->mMyGroupChatNickname:Ljava/lang/String;

    .line 153
    invoke-virtual {p0, p11}, Lcom/google/android/gtalkservice/ChatSession;->setGroupChatNickname(Ljava/lang/String;)V

    .line 154
    iput-object p12, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChatPassword:Ljava/lang/String;

    .line 155
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->setIsGroupChat(Z)V

    .line 156
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/gtalkservice/ChatSession;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->requeryOtrCursor()V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/gtalkservice/ChatSession;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatSession;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/android/gtalkservice/ChatSession;)Landroid/content/ContentResolver;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/gtalkservice/ChatSession;)J
    .locals 2
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatSession;

    .prologue
    .line 45
    iget-wide v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    return-wide v0
.end method

.method static synthetic access$500(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatSession;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # J

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gtalkservice/ChatSession;->notifyConversionToGroupChat(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$600(Lcom/google/android/gtalkservice/ChatSession;Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatSession;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatSession;->tryRemoveChatListener(Lcom/google/android/gtalkservice/IChatListener;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/android/gtalkservice/ChatSession;Lcom/google/android/gtalkservice/IChatListener;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatSession;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IChatListener;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # J

    .prologue
    .line 45
    invoke-direct/range {p0 .. p5}, Lcom/google/android/gtalkservice/ChatSession;->notifyConvertedToGroupChat(Lcom/google/android/gtalkservice/IChatListener;Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$800(Lcom/google/android/gtalkservice/ChatSession;Lcom/google/android/gtalkservice/IChatListener;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gtalkservice/ChatSession;
    .param p1, "x1"    # Lcom/google/android/gtalkservice/IChatListener;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Z

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gtalkservice/ChatSession;->notifyParticipantPresence(Lcom/google/android/gtalkservice/IChatListener;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method private addChatInDb(JLjava/lang/String;Ljava/lang/String;ZZ)V
    .locals 7
    .param p1, "pid"    # J
    .param p3, "resource"    # Ljava/lang/String;
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "outgoing"    # Z
    .param p6, "groupchat"    # Z

    .prologue
    const/4 v1, 0x0

    const-string v6, "last_unread_message"

    .line 1026
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1027
    .local v0, "values":Landroid/content/ContentValues;
    const-string v2, "contact_id"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1028
    const-string v2, "jid_resource"

    invoke-virtual {v0, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1029
    const-string v2, "groupchat"

    invoke-static {p6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1030
    const-string v2, "last_message_date"

    new-instance v3, Ljava/lang/Long;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mLastMessageTimestamp:J

    invoke-direct {v3, v4, v5}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1033
    if-nez p5, :cond_0

    .line 1034
    invoke-direct {p0, p4}, Lcom/google/android/gtalkservice/ChatSession;->setUnreadMessage(Ljava/lang/String;)V

    .line 1035
    const-string v1, "last_unread_message"

    invoke-virtual {v0, v6, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1041
    :goto_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 1042
    return-void

    .line 1037
    :cond_0
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/ChatSession;->setUnreadMessage(Ljava/lang/String;)V

    .line 1038
    const-string v2, "last_unread_message"

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v6, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private addGroupMessageToDatabase(Ljava/lang/String;Ljava/lang/String;I)Landroid/net/Uri;
    .locals 9
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/String;
    .param p3, "messageType"    # I

    .prologue
    .line 878
    const/4 v2, 0x0

    const-wide/16 v4, 0x0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v7

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v6, p3

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gtalkservice/ChatSession;->addGroupMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIJ)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private addGroupMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIJ)Landroid/net/Uri;
    .locals 6
    .param p1, "nickname"    # Ljava/lang/String;
    .param p2, "packetId"    # Ljava/lang/String;
    .param p3, "body"    # Ljava/lang/String;
    .param p4, "timestamp"    # J
    .param p6, "messageType"    # I
    .param p7, "accountId"    # J

    .prologue
    .line 894
    iget-wide v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gtz v2, :cond_0

    .line 895
    const-string v2, "GTalkService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "addGroupMessageToDb: invalid group id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 898
    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 899
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "nickname"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 900
    const-string v2, "body"

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 901
    const-string v2, "type"

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 902
    const-string v2, "is_muc"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 904
    invoke-direct {p0, v1, p4, p5}, Lcom/google/android/gtalkservice/ChatSession;->addTimeStamp(Landroid/content/ContentValues;J)V

    .line 906
    if-eqz p2, :cond_1

    .line 907
    const-string v2, "packet_id"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 917
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->isOffTheRecord()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-direct {p0, p6}, Lcom/google/android/gtalkservice/ChatSession;->isOtrMessageType(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 918
    :cond_2
    iget-wide v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    invoke-static {v2, v3}, Landroid/provider/Im$Messages;->getOtrMessagesContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v0

    .line 923
    .local v0, "uri":Landroid/net/Uri;
    :goto_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v2, v0, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    return-object v2

    .line 920
    .end local v0    # "uri":Landroid/net/Uri;
    :cond_3
    iget-wide v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    invoke-static {v2, v3}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v0

    .restart local v0    # "uri":Landroid/net/Uri;
    goto :goto_0
.end method

.method private addGroupMessageToDatabase(Lorg/jivesoftware/smack/packet/Message;Ljava/lang/String;Ljava/lang/String;Z)Landroid/net/Uri;
    .locals 11
    .param p1, "msg"    # Lorg/jivesoftware/smack/packet/Message;
    .param p2, "contact"    # Ljava/lang/String;
    .param p3, "nickname"    # Ljava/lang/String;
    .param p4, "outgoing"    # Z

    .prologue
    .line 855
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getBody()Ljava/lang/String;

    move-result-object v3

    .line 857
    .local v3, "body":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 858
    const/4 v0, 0x0

    .line 874
    :goto_0
    return-object v0

    .line 861
    :cond_0
    iget-object v10, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    .line 862
    .local v10, "room":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v7

    .line 864
    .local v7, "accountId":J
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getPacketID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getTimestamp()J

    move-result-wide v4

    if-eqz p4, :cond_1

    const/4 v0, 0x0

    move v6, v0

    :goto_1
    move-object v0, p0

    move-object v1, p2

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gtalkservice/ChatSession;->addGroupMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIJ)Landroid/net/Uri;

    move-result-object v9

    .local v9, "retVal":Landroid/net/Uri;
    move-object v0, p0

    move-object v1, v10

    move-object v2, p3

    move v4, p4

    move-wide v5, v7

    .line 872
    invoke-direct/range {v0 .. v6}, Lcom/google/android/gtalkservice/ChatSession;->updateGroupChatInDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    move-object v0, v9

    .line 874
    goto :goto_0

    .line 864
    .end local v9    # "retVal":Landroid/net/Uri;
    :cond_1
    const/4 v0, 0x1

    move v6, v0

    goto :goto_1
.end method

.method private addMessageToDatabase(Ljava/lang/String;I)Landroid/net/Uri;
    .locals 9
    .param p1, "body"    # Ljava/lang/String;
    .param p2, "messageType"    # I

    .prologue
    .line 793
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const-wide/16 v5, 0x0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v7

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gtalkservice/ChatSession;->addMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJJ)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private addMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJJ)Landroid/net/Uri;
    .locals 4
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "packetId"    # Ljava/lang/String;
    .param p3, "body"    # Ljava/lang/String;
    .param p4, "messageType"    # I
    .param p5, "timestamp"    # J
    .param p7, "accountId"    # J

    .prologue
    .line 805
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 806
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "body"

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 807
    const-string v2, "type"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 809
    invoke-direct {p0, v1, p5, p6}, Lcom/google/android/gtalkservice/ChatSession;->addTimeStamp(Landroid/content/ContentValues;J)V

    .line 811
    if-eqz p2, :cond_0

    .line 812
    const-string v2, "packet_id"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 822
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->isOffTheRecord()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-direct {p0, p4}, Lcom/google/android/gtalkservice/ChatSession;->isOtrMessageType(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 823
    :cond_1
    invoke-static {p7, p8, p1}, Landroid/provider/Im$Messages;->getOtrMessagesContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 828
    .local v0, "uri":Landroid/net/Uri;
    :goto_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v2, v0, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    return-object v2

    .line 825
    .end local v0    # "uri":Landroid/net/Uri;
    :cond_2
    invoke-static {p7, p8, p1}, Landroid/provider/Im$Messages;->getContentUriByContact(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .restart local v0    # "uri":Landroid/net/Uri;
    goto :goto_0
.end method

.method private addMessageToDatabase(Lorg/jivesoftware/smack/packet/Message;Z)Landroid/net/Uri;
    .locals 19
    .param p1, "msg"    # Lorg/jivesoftware/smack/packet/Message;
    .param p2, "outgoing"    # Z

    .prologue
    .line 755
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getBody()Ljava/lang/String;

    move-result-object v4

    .line 756
    .local v4, "body":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getPacketID()Ljava/lang/String;

    move-result-object v3

    .line 757
    .local v3, "packetId":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getTimestamp()J

    move-result-wide v6

    .line 759
    .local v6, "timestamp":J
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 760
    const/4 v1, 0x0

    .line 789
    :goto_0
    return-object v1

    .line 763
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    move-object/from16 v17, v0

    .line 764
    .local v17, "jid":Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 765
    .local v14, "resource":Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 767
    .local v2, "bareJid":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v8

    .line 771
    .local v8, "accountId":J
    if-eqz p2, :cond_2

    const/4 v1, 0x0

    move v5, v1

    :goto_1
    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gtalkservice/ChatSession;->addMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJJ)Landroid/net/Uri;

    move-result-object v18

    .line 779
    .local v18, "retVal":Landroid/net/Uri;
    if-eqz v18, :cond_1

    .line 783
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    move-object v1, v0

    invoke-static {v1, v2, v8, v9}, Lcom/google/android/gtalkservice/DatabaseHelper;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v11

    .line 786
    .local v11, "id":J
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smack/packet/Message;->getBody()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v10, p0

    move-object v13, v2

    move/from16 v16, p2

    invoke-direct/range {v10 .. v16}, Lcom/google/android/gtalkservice/ChatSession;->updateChatInDb(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .end local v11    # "id":J
    :cond_1
    move-object/from16 v1, v18

    .line 789
    goto :goto_0

    .line 771
    .end local v18    # "retVal":Landroid/net/Uri;
    :cond_2
    const/4 v1, 0x1

    move v5, v1

    goto :goto_1
.end method

.method private addParticipant(Ljava/lang/String;)Z
    .locals 6
    .param p1, "nickname"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 453
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    iget-wide v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    invoke-static {v1, v2, v3, p1}, Lcom/google/android/gtalkservice/DatabaseHelper;->insertGroupMember(Landroid/content/ContentResolver;JLjava/lang/String;)Z

    move-result v0

    .line 454
    .local v0, "added":Z
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-direct {p0, v1, p1, v4}, Lcom/google/android/gtalkservice/ChatSession;->notifyParticipantPresence(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 457
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->updateGroupChatDisplayName()V

    .line 459
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getParticipants()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 460
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Landroid/provider/Im$Presence;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    const/4 v5, 0x5

    invoke-static {v1, v2, v3, v4, v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->setPresence(Landroid/content/ContentResolver;Landroid/net/Uri;JI)V

    .line 462
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/RosterManager;->notifyPresenceChanged()V

    .line 464
    :cond_0
    return v0
.end method

.method private addTimeStamp(Landroid/content/ContentValues;J)V
    .locals 8
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "timestamp"    # J

    .prologue
    const-wide/16 v5, 0x0

    const-string v7, "date"

    .line 832
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 836
    .local v0, "now":J
    const-string v2, "real_date"

    cmp-long v3, p2, v5

    if-eqz v3, :cond_0

    move-wide v3, p2

    :goto_0
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 844
    cmp-long v2, p2, v5

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccount()Lcom/google/android/gtalkservice/Account;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/Account;->getOldChatMessageThresholdMs()I

    move-result v2

    int-to-long v2, v2

    sub-long v2, v0, v2

    cmp-long v2, p2, v2

    if-gez v2, :cond_1

    .line 846
    const-string v2, "date"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1, v7, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 847
    const-string v2, "show_ts"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 851
    :goto_1
    return-void

    :cond_0
    move-wide v3, v0

    .line 836
    goto :goto_0

    .line 849
    :cond_1
    const-string v2, "date"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1, v7, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1
.end method

.method private closeChat(J)V
    .locals 3
    .param p1, "pid"    # J

    .prologue
    const/4 v2, 0x0

    .line 1228
    sget-object v1, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 1230
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v1, v0, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1231
    return-void
.end method

.method private closeOtrCursor()V
    .locals 2

    .prologue
    .line 203
    monitor-enter p0

    .line 204
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursorContentObserver:Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 206
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 207
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    .line 208
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursorContentObserver:Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;

    .line 210
    :cond_0
    monitor-exit p0

    .line 211
    return-void

    .line 210
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private createGroupChatInDatabase(Ljava/lang/String;)V
    .locals 14
    .param p1, "room"    # Ljava/lang/String;

    .prologue
    const/4 v13, 0x0

    const/4 v10, 0x0

    .line 1067
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getGroupChatDisplayName()Ljava/lang/String;

    move-result-object v8

    .line 1069
    .local v8, "displayName":Ljava/lang/String;
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v0, :cond_0

    .line 1070
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createGroupChatInDatabase("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") displayName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 1074
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getProviderId()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    const/4 v9, 0x2

    const/4 v11, 0x4

    move-object v7, p1

    invoke-static/range {v0 .. v11}, Lcom/google/android/gtalkservice/DatabaseHelper;->addContact(Landroid/content/ContentResolver;JJJLjava/lang/String;Ljava/lang/String;III)Landroid/net/Uri;

    move-result-object v12

    .line 1086
    .local v12, "uri":Landroid/net/Uri;
    if-eqz v12, :cond_1

    .line 1087
    invoke-static {v12}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    .line 1091
    iget-wide v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    const/4 v6, 0x1

    move-object v0, p0

    move-object v3, v13

    move-object v4, v13

    move v5, v10

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gtalkservice/ChatSession;->addChatInDb(JLjava/lang/String;Ljava/lang/String;ZZ)V

    .line 1093
    :cond_1
    return-void
.end method

.method private doUpdateChatInDb(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 9
    .param p1, "pid"    # J
    .param p3, "to"    # Ljava/lang/String;
    .param p4, "resource"    # Ljava/lang/String;
    .param p5, "message"    # Ljava/lang/String;
    .param p6, "outgoing"    # Z
    .param p7, "groupchat"    # Z

    .prologue
    const/4 v4, 0x0

    const-string v8, "last_unread_message"

    .line 1046
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 1048
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "jid_resource"

    invoke-virtual {v2, v3, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1049
    const-string v3, "groupchat"

    invoke-static/range {p7 .. p7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 1050
    const-string v3, "last_message_date"

    new-instance v5, Ljava/lang/Long;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/google/android/gtalkservice/ChatSession;->mLastMessageTimestamp:J

    invoke-direct {v5, v6, v7}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1053
    if-nez p6, :cond_0

    .line 1054
    invoke-direct {p0, p5}, Lcom/google/android/gtalkservice/ChatSession;->setUnreadMessage(Ljava/lang/String;)V

    .line 1055
    const-string v3, "last_unread_message"

    invoke-virtual {v2, v8, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1061
    :goto_0
    sget-object v3, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v3, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 1063
    .local v1, "uri":Landroid/net/Uri;
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {v3, v1, v2, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1064
    return-void

    .line 1057
    .end local v1    # "uri":Landroid/net/Uri;
    :cond_0
    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/ChatSession;->setUnreadMessage(Ljava/lang/String;)V

    .line 1058
    const-string v3, "last_unread_message"

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v3, v0

    invoke-virtual {v2, v8, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private fixMucUnderscore(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "nickname"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x40

    const/4 v2, -0x1

    .line 1128
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ne v1, v2, :cond_0

    .line 1129
    const/16 v1, 0x5f

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 1130
    .local v0, "underscore":I
    if-le v0, v2, :cond_0

    .line 1131
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1135
    .end local v0    # "underscore":I
    :cond_0
    return-object p1
.end method

.method private getChatUri(Ljava/lang/String;)Landroid/net/Uri;
    .locals 5
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 346
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v3

    invoke-static {v2, p1, v3, v4}, Lcom/google/android/gtalkservice/DatabaseHelper;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 347
    .local v0, "pid":J
    sget-object v2, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    return-object v2
.end method

.method private getContactBareAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 267
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getGroupChatDisplayName()Ljava/lang/String;
    .locals 8

    .prologue
    .line 495
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getParticipants()Ljava/util/List;

    move-result-object v3

    .line 496
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 497
    .local v5, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 499
    .local v0, "i":I
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 500
    .local v4, "name":Ljava/lang/String;
    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/ChatSession;->getGroupChatShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 502
    .local v6, "shortName":Ljava/lang/String;
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    if-lez v0, :cond_0

    .line 503
    const-string v7, ", "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    :cond_0
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v0, v1

    .line 506
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_0

    .line 508
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "shortName":Ljava/lang/String;
    :cond_1
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method private getGroupChatShortName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "nickname"    # Ljava/lang/String;

    .prologue
    .line 681
    if-nez p1, :cond_0

    .line 682
    const/4 v1, 0x0

    .line 694
    :goto_0
    return-object v1

    .line 685
    :cond_0
    const/16 v1, 0x40

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 686
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 687
    const/16 v1, 0x5f

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 690
    :cond_1
    if-ltz v0, :cond_2

    .line 691
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_2
    move-object v1, p1

    .line 694
    goto :goto_0
.end method

.method private getProviderId()J
    .locals 2

    .prologue
    .line 239
    iget-wide v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mProviderId:J

    return-wide v0
.end method

.method private getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 247
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mUsername:Ljava/lang/String;

    return-object v0
.end method

.method private handleOffTheRecordExtension(Lorg/jivesoftware/smack/packet/Message;Ljava/lang/String;)V
    .locals 6
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;
    .param p2, "from"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 725
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->hasNoSave()Z

    move-result v3

    if-nez v3, :cond_1

    .line 749
    :cond_0
    :goto_0
    return-void

    .line 729
    :cond_1
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getNoSave()Z

    move-result v1

    .line 730
    .local v1, "otrEnabled":Z
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->isOffTheRecord()Z

    move-result v0

    .line 732
    .local v0, "oldOtrEnabled":Z
    sget-boolean v3, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v3, :cond_2

    .line 733
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleOffTheRecordExtension: new="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", old="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 736
    :cond_2
    if-eq v1, v0, :cond_0

    .line 740
    if-eqz v1, :cond_3

    const/4 v3, 0x1

    move v2, v3

    .line 741
    .local v2, "otrValue":I
    :goto_1
    invoke-direct {p0, v2}, Lcom/google/android/gtalkservice/ChatSession;->setOffTheRecordValue(I)V

    .line 742
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->addOffTheRecordStatusChange()V

    .line 744
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mUpdateOtrStatusSelectionArgs:[Ljava/lang/String;

    aput-object p2, v3, v5

    .line 745
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    const-string v4, "username=?"

    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatSession;->mUpdateOtrStatusSelectionArgs:[Ljava/lang/String;

    invoke-static {v3, v2, v4, v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateOtrForContacts(Landroid/content/ContentResolver;ILjava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .end local v2    # "otrValue":I
    :cond_3
    move v2, v5

    .line 740
    goto :goto_1
.end method

.method private initializeChat()V
    .locals 15

    .prologue
    const/4 v3, 0x0

    const-string v14, ""

    .line 271
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getContactBareAddress()Ljava/lang/String;

    move-result-object v10

    .line 272
    .local v10, "contact":Ljava/lang/String;
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v4

    invoke-static {v0, v10, v4, v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v12

    .line 273
    .local v12, "pid":J
    sget-object v0, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, v12, v13}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 274
    .local v1, "uri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/google/android/gtalkservice/ChatSession;->LAST_UNREAD_PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 277
    .local v9, "c":Landroid/database/Cursor;
    const/4 v11, 0x0

    .line 279
    .local v11, "hasChat":Z
    if-eqz v9, :cond_2

    .line 281
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 282
    const/4 v11, 0x1

    .line 283
    iget v0, p0, Lcom/google/android/gtalkservice/ChatSession;->LAST_UNREAD_COLUMN:I

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->setUnreadMessage(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 286
    :cond_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 292
    :goto_0
    if-nez v11, :cond_1

    .line 297
    const-string v0, ""

    const-string v0, ""

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v2, p0

    move-wide v3, v12

    move-object v5, v14

    move-object v6, v14

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gtalkservice/ChatSession;->addChatInDb(JLjava/lang/String;Ljava/lang/String;ZZ)V

    .line 299
    :cond_1
    return-void

    .line 286
    :catchall_0
    move-exception v0

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v0

    .line 289
    :cond_2
    const-string v0, "markAsRead"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private isOtrMessageType(I)Z
    .locals 1
    .param p1, "messageType"    # I

    .prologue
    .line 927
    packed-switch p1, :pswitch_data_0

    .line 935
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 932
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 927
    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private leaveGroupChat()V
    .locals 5

    .prologue
    .line 619
    new-instance v1, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 620
    .local v1, "leavePresence":Lorg/jivesoftware/smack/packet/Presence;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mMyGroupChatNickname:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 623
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 627
    :goto_0
    return-void

    .line 624
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 625
    .local v0, "ex":Ljava/lang/IllegalStateException;
    const-string v2, "GTalkService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "leaveGroupChat caught "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1446
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ChatSession] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1447
    return-void
.end method

.method private logEmptyCursor(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 1450
    const-string v0, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ChatSession] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": empty cursor, possibly low memory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1451
    return-void
.end method

.method private messageTargetedForAnotherClient(Ljava/lang/String;)Z
    .locals 3
    .param p1, "toAddr"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 1246
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    .line 1265
    :goto_0
    return v1

    .line 1250
    :cond_0
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1253
    .local v0, "resource":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    .line 1254
    goto :goto_0

    .line 1257
    :cond_1
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getGTalkService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->getJidResource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v2

    .line 1258
    goto :goto_0

    .line 1261
    :cond_2
    const-string v1, "GTalkService"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1262
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "messageTargetedForAnotherClient: true, toAddr="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 1265
    :cond_3
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private notifyChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)V
    .locals 11
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "toAddress"    # Ljava/lang/String;
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "groupId"    # J
    .param p7, "statusbarNotify"    # Z

    .prologue
    .line 1287
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    iget-object v1, v1, Lcom/google/android/gtalkservice/ChatMgr;->mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    new-instance v3, Lcom/google/android/gtalkservice/ChatSession$3;

    invoke-direct {v3, p0, p1, p4}, Lcom/google/android/gtalkservice/ChatSession$3;-><init>(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    move-result v10

    .line 1304
    .local v10, "notified":Z
    const-string v1, "GTalkService"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1305
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "notifyChat for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", notified="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", # chat session listeners="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 1309
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    invoke-virtual {v1, p1, p4}, Lcom/google/android/gtalkservice/ChatMgr;->notifyChat(Ljava/lang/String;Ljava/lang/String;)V

    .line 1311
    if-eqz p7, :cond_2

    .line 1312
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->getStatusBarNotifier()Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    move-result-object v0

    .line 1314
    .local v0, "notifier":Lcom/google/android/gtalkservice/service/StatusBarNotifier;
    move-object v3, p4

    .line 1316
    .local v3, "snippet":Ljava/lang/String;
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1317
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseAbbrevAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1320
    :cond_1
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getProviderId()J

    move-result-wide v4

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v6

    move-object v1, p1

    move-object v2, p2

    move-wide/from16 v8, p5

    invoke-virtual/range {v0 .. v10}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->notifyChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJJZ)V

    .line 1323
    .end local v0    # "notifier":Lcom/google/android/gtalkservice/service/StatusBarNotifier;
    .end local v3    # "snippet":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private notifyConversionToGroupChat(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 8
    .param p1, "oldJid"    # Ljava/lang/String;
    .param p2, "room"    # Ljava/lang/String;
    .param p3, "groupId"    # J

    .prologue
    .line 1393
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    iget-object v6, v0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v7, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    new-instance v0, Lcom/google/android/gtalkservice/ChatSession$6;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gtalkservice/ChatSession$6;-><init>(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v6, v7, v0}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    .line 1400
    return-void
.end method

.method private notifyConvertedToGroupChat(Lcom/google/android/gtalkservice/IChatListener;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;
    .param p2, "oldJid"    # Ljava/lang/String;
    .param p3, "room"    # Ljava/lang/String;
    .param p4, "groupId"    # J

    .prologue
    .line 1405
    :try_start_0
    invoke-interface {p1, p2, p3, p4, p5}, Lcom/google/android/gtalkservice/IChatListener;->convertedToGroupChat(Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1414
    :goto_0
    return-void

    .line 1406
    :catch_0
    move-exception v0

    .line 1407
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[ChatSession] notifyConvertedToGroupChat caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing listener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1410
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    monitor-enter v1

    .line 1411
    :try_start_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1412
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private notifyParticipantPresence(Lcom/google/android/gtalkservice/IChatListener;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;
    .param p2, "room"    # Ljava/lang/String;
    .param p3, "nickname"    # Ljava/lang/String;
    .param p4, "joined"    # Z

    .prologue
    .line 1430
    if-eqz p4, :cond_0

    .line 1431
    :try_start_0
    invoke-interface {p1, p2, p3}, Lcom/google/android/gtalkservice/IChatListener;->participantJoined(Ljava/lang/String;Ljava/lang/String;)V

    .line 1443
    :goto_0
    return-void

    .line 1433
    :cond_0
    invoke-interface {p1, p2, p3}, Lcom/google/android/gtalkservice/IChatListener;->participantLeft(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1435
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1436
    .local v0, "ex":Landroid/os/RemoteException;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[ChatSession] notifyParticipantPresence caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing listener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1439
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    monitor-enter v1

    .line 1440
    :try_start_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1441
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private notifyParticipantPresence(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 3
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "joined"    # Z

    .prologue
    .line 1418
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    iget-object v0, v0, Lcom/google/android/gtalkservice/ChatMgr;->mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    new-instance v2, Lcom/google/android/gtalkservice/ChatSession$7;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/google/android/gtalkservice/ChatSession$7;-><init>(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    .line 1425
    return-void
.end method

.method private queryOtrCursor()V
    .locals 4

    .prologue
    .line 159
    monitor-enter p0

    .line 160
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mAccountId:J

    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mToBareJid:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/gtalkservice/DatabaseHelper;->getOffTheRecordCursor(Landroid/content/ContentResolver;JLjava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    .line 161
    new-instance v0, Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/ChatMgr;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;-><init>(Lcom/google/android/gtalkservice/ChatSession;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursorContentObserver:Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;

    .line 162
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursorContentObserver:Lcom/google/android/gtalkservice/ChatSession$ChangeObserver;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 163
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->updateOffTheRecordFromCursor()V

    .line 164
    monitor-exit p0

    .line 165
    return-void

    .line 164
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private removeGroupMessageFromDatabase()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 939
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    invoke-static {v1, v2}, Landroid/provider/Im$Messages;->getContentUriByThreadId(J)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 940
    return-void
.end method

.method private removeParticipant(Ljava/lang/String;)Z
    .locals 6
    .param p1, "nickname"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 468
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    iget-wide v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    invoke-static {v1, v2, v3, p1}, Lcom/google/android/gtalkservice/DatabaseHelper;->deleteGroupMember(Landroid/content/ContentResolver;JLjava/lang/String;)Z

    move-result v0

    .line 469
    .local v0, "removed":Z
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-direct {p0, v1, p1, v5}, Lcom/google/android/gtalkservice/ChatSession;->notifyParticipantPresence(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 472
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->updateGroupChatDisplayName()V

    .line 474
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getParticipants()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 475
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Landroid/provider/Im$Presence;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    invoke-static {v1, v2, v3, v4, v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->setPresence(Landroid/content/ContentResolver;Landroid/net/Uri;JI)V

    .line 477
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnection;->getSessionContext()Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getRosterManager()Lcom/google/android/gtalkservice/RosterManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/RosterManager;->notifyPresenceChanged()V

    .line 479
    :cond_0
    return v0
.end method

.method private requeryOtrCursor()V
    .locals 1

    .prologue
    .line 168
    monitor-enter p0

    .line 169
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    if-nez v0, :cond_0

    .line 170
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->queryOtrCursor()V

    .line 175
    :goto_0
    monitor-exit p0

    .line 176
    return-void

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    .line 173
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->updateOffTheRecordFromCursor()V

    goto :goto_0

    .line 175
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private sendChatRead(Ljava/lang/String;)V
    .locals 5
    .param p1, "contact"    # Ljava/lang/String;

    .prologue
    .line 597
    new-instance v1, Lcom/google/android/gtalkservice/extensions/ChatRead;

    invoke-direct {v1, p1}, Lcom/google/android/gtalkservice/extensions/ChatRead;-><init>(Ljava/lang/String;)V

    .line 598
    .local v1, "readPacket":Lcom/google/android/gtalkservice/extensions/ChatRead;
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getServerAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gtalkservice/extensions/ChatRead;->setTo(Ljava/lang/String;)V

    .line 610
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;Z)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 614
    :goto_0
    return-void

    .line 611
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 612
    .local v0, "ex":Ljava/lang/IllegalStateException;
    const-string v2, "GTalkService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sendChatRead caught "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setIsGroupChat(Z)V
    .locals 8
    .param p1, "isGroupChat"    # Z

    .prologue
    const/4 v3, 0x0

    .line 303
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eq v0, p1, :cond_0

    .line 304
    iput-boolean p1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    .line 305
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->createGroupChatInDatabase(Ljava/lang/String;)V

    .line 307
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChatNickname:Ljava/lang/String;

    iget-wide v5, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    const/4 v7, 0x0

    move-object v0, p0

    move-object v4, v3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gtalkservice/ChatSession;->notifyChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)V

    .line 315
    :cond_0
    return-void
.end method

.method private setOffTheRecordValue(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 197
    monitor-enter p0

    .line 198
    :try_start_0
    iput p1, p0, Lcom/google/android/gtalkservice/ChatSession;->mOffTheRecordValue:I

    .line 199
    monitor-exit p0

    .line 200
    return-void

    .line 199
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private setUnreadMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 263
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatSession;->mLastUnreadMessage:Ljava/lang/String;

    .line 264
    return-void
.end method

.method private tryRemoveChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 1383
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1384
    :try_start_1
    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1385
    monitor-exit v1

    .line 1389
    :goto_0
    return-void

    .line 1385
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 1386
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1387
    .local v0, "ex":Ljava/lang/Exception;
    const-string v1, "GTalkService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "tryRemoveChatListener "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private updateChatInDb(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 12
    .param p1, "pid"    # J
    .param p3, "bareJid"    # Ljava/lang/String;
    .param p4, "jidResource"    # Ljava/lang/String;
    .param p5, "message"    # Ljava/lang/String;
    .param p6, "outgoing"    # Z

    .prologue
    .line 998
    sget-object v0, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 999
    .local v1, "uri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/google/android/gtalkservice/ChatSession;->CHATS_ID_PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 1002
    .local v11, "c":Landroid/database/Cursor;
    const/4 v10, 0x1

    .line 1004
    .local v10, "add":Z
    if-eqz v11, :cond_2

    .line 1006
    :try_start_0
    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 1007
    const/4 v9, 0x0

    move-object v2, p0

    move-wide v3, p1

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move/from16 v8, p6

    invoke-direct/range {v2 .. v9}, Lcom/google/android/gtalkservice/ChatSession;->doUpdateChatInDb(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1008
    const/4 v10, 0x0

    .line 1011
    :cond_0
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 1017
    :goto_0
    if-eqz v10, :cond_1

    .line 1018
    const/4 v8, 0x0

    move-object v2, p0

    move-wide v3, p1

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gtalkservice/ChatSession;->addChatInDb(JLjava/lang/String;Ljava/lang/String;ZZ)V

    .line 1020
    :cond_1
    return-void

    .line 1011
    :catchall_0
    move-exception v0

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    throw v0

    .line 1014
    :cond_2
    const-string v0, "updateChatInDb"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private updateGroupChatDisplayName()V
    .locals 12

    .prologue
    .line 1096
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getGroupChatDisplayName()Ljava/lang/String;

    move-result-object v8

    .line 1097
    .local v8, "displayName":Ljava/lang/String;
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getProviderId()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    iget-object v7, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    const/4 v9, 0x2

    const/4 v10, 0x0

    const/4 v11, 0x4

    invoke-static/range {v0 .. v11}, Lcom/google/android/gtalkservice/DatabaseHelper;->updateContact(Landroid/content/ContentResolver;JJJLjava/lang/String;Ljava/lang/String;III)I

    .line 1106
    return-void
.end method

.method private updateGroupChatInDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 9
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "body"    # Ljava/lang/String;
    .param p4, "outgoing"    # Z
    .param p5, "accountId"    # J

    .prologue
    .line 1110
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v0, p1, p5, p6}, Lcom/google/android/gtalkservice/DatabaseHelper;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v1

    .line 1112
    .local v1, "id":J
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1113
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {p0, p2}, Lcom/google/android/gtalkservice/ChatSession;->fixMucUnderscore(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1114
    .local v8, "buf":Ljava/lang/StringBuilder;
    const-string v0, ": "

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1115
    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1116
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 1119
    .end local v8    # "buf":Ljava/lang/StringBuilder;
    :cond_0
    const/4 v4, 0x0

    const/4 v7, 0x1

    move-object v0, p0

    move-object v3, p1

    move-object v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gtalkservice/ChatSession;->doUpdateChatInDb(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 1120
    return-void
.end method

.method private updateOffTheRecordFromCursor()V
    .locals 4

    .prologue
    .line 183
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-nez v1, :cond_0

    .line 194
    :goto_0
    return-void

    .line 187
    :cond_0
    sget-boolean v1, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v1, :cond_1

    .line 188
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    const-string v3, "username"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "contact":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateOffTheRecordFromCursor for contact "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 193
    .end local v0    # "contact":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mOtrCursor:Landroid/database/Cursor;

    const-string v3, "otr"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mOffTheRecordValue:I

    goto :goto_0
.end method


# virtual methods
.method public addOffTheRecordStatusChange()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 216
    iget v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mOffTheRecordValue:I

    packed-switch v1, :pswitch_data_0

    .line 227
    const/16 v0, 0x9

    .line 231
    .local v0, "messageType":I
    :goto_0
    iget-boolean v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v1, :cond_0

    .line 232
    invoke-direct {p0, v2, v2, v0}, Lcom/google/android/gtalkservice/ChatSession;->addGroupMessageToDatabase(Ljava/lang/String;Ljava/lang/String;I)Landroid/net/Uri;

    .line 236
    :goto_1
    return-void

    .line 218
    .end local v0    # "messageType":I
    :pswitch_0
    const/16 v0, 0xa

    .line 219
    .restart local v0    # "messageType":I
    goto :goto_0

    .line 221
    .end local v0    # "messageType":I
    :pswitch_1
    const/16 v0, 0xb

    .line 222
    .restart local v0    # "messageType":I
    goto :goto_0

    .line 224
    .end local v0    # "messageType":I
    :pswitch_2
    const/16 v0, 0xc

    .line 225
    .restart local v0    # "messageType":I
    goto :goto_0

    .line 234
    :cond_0
    invoke-direct {p0, v2, v0}, Lcom/google/android/gtalkservice/ChatSession;->addMessageToDatabase(Ljava/lang/String;I)Landroid/net/Uri;

    goto :goto_1

    .line 216
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public addRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 5
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 390
    invoke-interface {p1}, Lcom/google/android/gtalkservice/IChatListener;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    .line 392
    .local v0, "binder":Landroid/os/IBinder;
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    monitor-enter v3

    .line 393
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/IChatListener;

    .line 394
    .local v1, "cl":Lcom/google/android/gtalkservice/IChatListener;
    invoke-interface {v1}, Lcom/google/android/gtalkservice/IChatListener;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-ne v4, v0, :cond_0

    .line 395
    monitor-exit v3

    .line 401
    .end local v1    # "cl":Lcom/google/android/gtalkservice/IChatListener;
    :goto_0
    return-void

    .line 399
    :cond_1
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 400
    monitor-exit v3

    goto :goto_0

    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public closeChat(Z)V
    .locals 8
    .param p1, "removeChatSession"    # Z

    .prologue
    .line 1198
    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    .line 1202
    .local v5, "jid":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v3

    .line 1204
    .local v3, "accountId":J
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-nez v0, :cond_0

    .line 1205
    invoke-static {v5}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1208
    :cond_0
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-static {v0, v5, v3, v4}, Lcom/google/android/gtalkservice/DatabaseHelper;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v6

    .line 1209
    .local v6, "id":J
    const-wide/16 v0, 0x0

    cmp-long v0, v6, v0

    if-lez v0, :cond_1

    .line 1210
    invoke-direct {p0, v6, v7}, Lcom/google/android/gtalkservice/ChatSession;->closeChat(J)V

    .line 1213
    :cond_1
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v0, :cond_2

    .line 1216
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getProviderId()J

    move-result-wide v1

    invoke-static/range {v0 .. v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->deleteContact(Landroid/content/ContentResolver;JJLjava/lang/String;)I

    .line 1220
    :cond_2
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->closeOtrCursor()V

    .line 1222
    if-eqz p1, :cond_3

    .line 1223
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    invoke-virtual {v0, p0}, Lcom/google/android/gtalkservice/ChatMgr;->removeChatSession(Lcom/google/android/gtalkservice/ChatSession;)V

    .line 1225
    :cond_3
    return-void
.end method

.method convertToGroupChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Runnable;
    .locals 7
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "nickname"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 1141
    iget-boolean v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v3, :cond_0

    move-object v3, v6

    .line 1177
    :goto_0
    return-object v3

    .line 1146
    :cond_0
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-static {v3}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1149
    .local v2, "oldBareJid":Ljava/lang/String;
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v4

    invoke-static {v3, v2, v4, v5}, Lcom/google/android/gtalkservice/DatabaseHelper;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 1151
    .local v0, "id":J
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-lez v3, :cond_1

    .line 1153
    invoke-direct {p0, v0, v1}, Lcom/google/android/gtalkservice/ChatSession;->closeChat(J)V

    .line 1157
    :cond_1
    const-string v3, "GTalkService"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1161
    :goto_1
    iput-object p2, p0, Lcom/google/android/gtalkservice/ChatSession;->mMyGroupChatNickname:Ljava/lang/String;

    .line 1162
    iput-object p3, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChatPassword:Ljava/lang/String;

    .line 1166
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mUsername:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/google/android/gtalkservice/ChatSession;->setGroupChatNickname(Ljava/lang/String;)V

    .line 1168
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    .line 1169
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-static {v3}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mToBareJid:Ljava/lang/String;

    .line 1170
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/ChatSession;->setIsGroupChat(Z)V

    .line 1172
    const/4 v3, 0x6

    invoke-direct {p0, v6, v6, v3}, Lcom/google/android/gtalkservice/ChatSession;->addGroupMessageToDatabase(Ljava/lang/String;Ljava/lang/String;I)Landroid/net/Uri;

    .line 1174
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->closeOtrCursor()V

    .line 1175
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->queryOtrCursor()V

    .line 1177
    new-instance v3, Lcom/google/android/gtalkservice/ChatSession$2;

    invoke-direct {v3, p0, v2, p1}, Lcom/google/android/gtalkservice/ChatSession$2;-><init>(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1158
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "convertToGroupChat: mTo="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", myNickname="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public declineGroupChatInvitation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "inviter"    # Ljava/lang/String;

    .prologue
    .line 517
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mUsername:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mContext:Landroid/content/Context;

    const v3, 0x7f05000e

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, p1, v1, p2, v2}, Lcom/google/android/gtalkservice/XmppUtils;->declineGroupChatInvitation(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    return-void
.end method

.method public getAccountId()J
    .locals 2

    .prologue
    .line 243
    iget-wide v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mAccountId:J

    return-wide v0
.end method

.method getGroupChatNickname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 323
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChatNickname:Ljava/lang/String;

    return-object v0
.end method

.method getGroupChatPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 333
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChatPassword:Ljava/lang/String;

    return-object v0
.end method

.method getGroupContactId()J
    .locals 2

    .prologue
    .line 338
    iget-wide v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    return-wide v0
.end method

.method public getLastMessageTimestamp()J
    .locals 2

    .prologue
    .line 255
    iget-wide v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mLastMessageTimestamp:J

    return-wide v0
.end method

.method public getParticipants()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 491
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    iget-wide v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    invoke-static {v0, v1, v2}, Lcom/google/android/gtalkservice/DatabaseHelper;->getGroupMemberList(Landroid/content/ContentResolver;J)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getToAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 513
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    return-object v0
.end method

.method public getUnsentComposedMessage()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v2, 0x0

    .line 969
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 970
    .local v6, "bareJid":Ljava/lang/String;
    const-string v3, "contact_id in (select _id from contacts where account=? AND username=?)"

    .line 972
    .local v3, "selection":Ljava/lang/String;
    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v2

    const/4 v0, 0x1

    aput-object v6, v4, v0

    .line 974
    .local v4, "selectionArgs":[Ljava/lang/String;
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/google/android/gtalkservice/ChatSession;->UNSENT_COMPOSED_MESSAGE_PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 980
    .local v7, "cursor":Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 981
    .local v8, "unsentComposedMessage":Ljava/lang/String;
    if-eqz v7, :cond_1

    .line 983
    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 984
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v8

    .line 987
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 993
    :goto_0
    return-object v8

    .line 987
    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v0

    .line 990
    :cond_1
    const-string v0, "getUnsentComposedMessage"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->logEmptyCursor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method groupChatParticipantPresenceChanged(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 4
    .param p1, "participant"    # Ljava/lang/String;
    .param p2, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 424
    iget-boolean v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mMyGroupChatNickname:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 450
    :cond_0
    :goto_0
    return-void

    .line 430
    :cond_1
    invoke-virtual {p2}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v2

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->UNAVAILABLE:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v2, v3, :cond_3

    .line 431
    iget-boolean v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v2, :cond_2

    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatSession;->removeParticipant(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 434
    :cond_2
    const/4 v0, 0x5

    .line 449
    .local v0, "messageType":I
    :goto_1
    const/4 v2, 0x0

    invoke-direct {p0, p1, v2, v0}, Lcom/google/android/gtalkservice/ChatSession;->addGroupMessageToDatabase(Ljava/lang/String;Ljava/lang/String;I)Landroid/net/Uri;

    goto :goto_0

    .line 436
    .end local v0    # "messageType":I
    :cond_3
    invoke-virtual {p2}, Lorg/jivesoftware/smack/packet/Presence;->getMode()Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-result-object v1

    .line 437
    .local v1, "mode":Lorg/jivesoftware/smack/packet/Presence$Mode;
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Mode;->AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-eq v1, v2, :cond_4

    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Mode;->EXTENDED_AWAY:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-ne v1, v2, :cond_5

    .line 438
    :cond_4
    const/4 v0, 0x3

    .restart local v0    # "messageType":I
    goto :goto_1

    .line 439
    .end local v0    # "messageType":I
    :cond_5
    sget-object v2, Lorg/jivesoftware/smack/packet/Presence$Mode;->DO_NOT_DISTURB:Lorg/jivesoftware/smack/packet/Presence$Mode;

    if-ne v1, v2, :cond_6

    .line 440
    const/4 v0, 0x4

    .restart local v0    # "messageType":I
    goto :goto_1

    .line 442
    .end local v0    # "messageType":I
    :cond_6
    iget-boolean v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v2, :cond_7

    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/ChatSession;->addParticipant(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 445
    :cond_7
    const/4 v0, 0x2

    .restart local v0    # "messageType":I
    goto :goto_1
.end method

.method public hasUnreadMessage()Z
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mLastUnreadMessage:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public inviteContact(Ljava/lang/String;)V
    .locals 4
    .param p1, "invitee"    # Ljava/lang/String;

    .prologue
    .line 528
    iget-boolean v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-nez v1, :cond_0

    .line 529
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    .line 530
    .local v0, "invitees":[Ljava/lang/String;
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    aput-object v2, v0, v1

    .line 531
    const/4 v1, 0x1

    aput-object p1, v0, v1

    .line 533
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getUsername()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p0, v2, v0}, Lcom/google/android/gtalkservice/ChatMgr;->convertToGroupChatSession(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;[Ljava/lang/String;)V

    .line 546
    .end local v0    # "invitees":[Ljava/lang/String;
    :goto_0
    return-void

    .line 539
    :cond_0
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    const-string v3, ""

    invoke-static {v1, v2, p1, v3}, Lcom/google/android/gtalkservice/XmppUtils;->sendGroupChatInvitationTo(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public isGroupChat()Z
    .locals 1

    .prologue
    .line 251
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    return v0
.end method

.method public isOffTheRecord()Z
    .locals 1

    .prologue
    .line 179
    iget v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mOffTheRecordValue:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public leave()V
    .locals 1

    .prologue
    .line 1185
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->closeChat(Z)V

    .line 1187
    iget-boolean v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v0, :cond_0

    .line 1188
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->leaveGroupChat()V

    .line 1190
    :cond_0
    return-void
.end method

.method public markAsRead()V
    .locals 1

    .prologue
    .line 342
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->markAsRead(Z)V

    .line 343
    return-void
.end method

.method markAsRead(Z)V
    .locals 7
    .param p1, "sendToServer"    # Z

    .prologue
    const/4 v5, 0x0

    .line 351
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->hasUnreadMessage()Z

    move-result v4

    if-nez v4, :cond_1

    .line 386
    :cond_0
    :goto_0
    return-void

    .line 356
    :cond_1
    const-string v4, "GTalkService"

    const/4 v6, 0x3

    invoke-static {v4, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 357
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "markAsRead for "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", sendToServer="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 360
    :cond_2
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 361
    .local v3, "values":Landroid/content/ContentValues;
    const-string v6, "last_unread_message"

    move-object v0, v5

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v6, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/ChatSession;->setUnreadMessage(Ljava/lang/String;)V

    .line 364
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getContactBareAddress()Ljava/lang/String;

    move-result-object v1

    .line 365
    .local v1, "contact":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/ChatSession;->getChatUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 370
    .local v2, "uri":Landroid/net/Uri;
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/google/android/gtalkservice/ChatSession$1;

    invoke-direct {v5, p0, v2, v3}, Lcom/google/android/gtalkservice/ChatSession$1;-><init>(Lcom/google/android/gtalkservice/ChatSession;Landroid/net/Uri;Landroid/content/ContentValues;)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    .line 383
    if-eqz p1, :cond_0

    .line 384
    invoke-direct {p0, v1}, Lcom/google/android/gtalkservice/ChatSession;->sendChatRead(Ljava/lang/String;)V

    goto :goto_0
.end method

.method notifyChatClosed(Ljava/lang/String;)V
    .locals 4
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 1359
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    iget-object v1, v1, Lcom/google/android/gtalkservice/ChatMgr;->mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    new-instance v3, Lcom/google/android/gtalkservice/ChatSession$5;

    invoke-direct {v3, p0, p1}, Lcom/google/android/gtalkservice/ChatSession$5;-><init>(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    move-result v0

    .line 1376
    .local v0, "notified":Z
    if-nez v0, :cond_0

    .line 1377
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getProviderId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3, p1}, Lcom/google/android/gtalkservice/ChatMgr;->notifyChatClosed(JLjava/lang/String;)V

    .line 1379
    :cond_0
    return-void
.end method

.method notifyChatRead(Ljava/lang/String;)V
    .locals 4
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 1331
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    iget-object v1, v1, Lcom/google/android/gtalkservice/ChatMgr;->mChatListenerCallback:Lcom/google/android/gtalkservice/RemoteListenerCallback;

    iget-object v2, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    new-instance v3, Lcom/google/android/gtalkservice/ChatSession$4;

    invoke-direct {v3, p0, p1}, Lcom/google/android/gtalkservice/ChatSession$4;-><init>(Lcom/google/android/gtalkservice/ChatSession;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gtalkservice/RemoteListenerCallback;->call(Ljava/util/ArrayList;Lcom/google/android/gtalkservice/RemoteListenerCallback$Callable;)Z

    move-result v0

    .line 1348
    .local v0, "notified":Z
    if-nez v0, :cond_0

    .line 1349
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->getProviderId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3, p1}, Lcom/google/android/gtalkservice/ChatMgr;->notifyChatRead(JLjava/lang/String;)V

    .line 1351
    :cond_0
    return-void
.end method

.method onReceiveGroupMessage(Lorg/jivesoftware/smack/packet/Message;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;
    .param p2, "room"    # Ljava/lang/String;
    .param p3, "fullNickname"    # Ljava/lang/String;

    .prologue
    .line 699
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mMyGroupChatNickname:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mMyGroupChatNickname:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 716
    :cond_0
    :goto_0
    return-void

    .line 703
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/google/android/gtalkservice/ChatSession;->handleOffTheRecordExtension(Lorg/jivesoftware/smack/packet/Message;Ljava/lang/String;)V

    .line 705
    invoke-direct {p0, p3}, Lcom/google/android/gtalkservice/ChatSession;->getGroupChatShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 707
    .local v2, "nickname":Ljava/lang/String;
    const/4 v0, 0x0

    invoke-direct {p0, p1, p3, v2, v0}, Lcom/google/android/gtalkservice/ChatSession;->addGroupMessageToDatabase(Lorg/jivesoftware/smack/packet/Message;Ljava/lang/String;Ljava/lang/String;Z)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 708
    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getTo()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getBody()Ljava/lang/String;

    move-result-object v4

    iget-wide v5, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupContactId:J

    const/4 v7, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gtalkservice/ChatSession;->notifyChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)V

    goto :goto_0
.end method

.method onReceiveMessage(Lorg/jivesoftware/smack/packet/Message;)V
    .locals 12
    .param p1, "message"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 631
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v1

    .line 633
    .local v1, "from":Ljava/lang/String;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mLastChatReceivedTsMs:J

    .line 635
    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 640
    .local v8, "bareJid":Ljava/lang/String;
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getUsername()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    move v9, v6

    .line 641
    .local v9, "incoming":Z
    :goto_0
    if-nez v9, :cond_3

    move v0, v6

    :goto_1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gtalkservice/ChatSession;->addMessageToDatabase(Lorg/jivesoftware/smack/packet/Message;Z)Landroid/net/Uri;

    move-result-object v11

    .line 646
    .local v11, "result":Landroid/net/Uri;
    if-eqz v11, :cond_1

    .line 648
    const/4 v2, 0x0

    .line 650
    .local v2, "nickname":Ljava/lang/String;
    if-eqz v9, :cond_5

    .line 651
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->isRead()Z

    move-result v10

    .line 653
    .local v10, "isRead":Z
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceiveMessage: got incoming msg from "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", isRead="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 658
    :cond_0
    iput-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    .line 659
    iget-object v0, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    iget-wide v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mAccountId:J

    invoke-static {v0, v8, v3, v4}, Lcom/google/android/gtalkservice/DatabaseHelper;->getNicknameForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v2

    .line 660
    if-nez v10, :cond_4

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getTo()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->messageTargetedForAnotherClient(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    move v7, v6

    .line 668
    .end local v10    # "isRead":Z
    .local v7, "statusBarNotify":Z
    :goto_2
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getTo()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getBody()Ljava/lang/String;

    move-result-object v4

    const-wide/16 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gtalkservice/ChatSession;->notifyChat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)V

    .line 675
    .end local v2    # "nickname":Ljava/lang/String;
    .end local v7    # "statusBarNotify":Z
    :cond_1
    return-void

    .end local v9    # "incoming":Z
    .end local v11    # "result":Landroid/net/Uri;
    :cond_2
    move v9, v5

    .line 640
    goto :goto_0

    .restart local v9    # "incoming":Z
    :cond_3
    move v0, v5

    .line 641
    goto :goto_1

    .restart local v2    # "nickname":Ljava/lang/String;
    .restart local v10    # "isRead":Z
    .restart local v11    # "result":Landroid/net/Uri;
    :cond_4
    move v7, v5

    .line 660
    goto :goto_2

    .line 662
    .end local v10    # "isRead":Z
    :cond_5
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_6

    const-string v0, "onReceiveMessage: got own msg"

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 663
    :cond_6
    const/4 v7, 0x0

    .restart local v7    # "statusBarNotify":Z
    goto :goto_2
.end method

.method public prepareToClose()V
    .locals 2

    .prologue
    .line 1235
    const-string v0, "GTalkService"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1236
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "prepareToClose for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 1239
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->isGroupChat()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1240
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->leaveGroupChat()V

    .line 1242
    :cond_1
    invoke-direct {p0}, Lcom/google/android/gtalkservice/ChatSession;->closeOtrCursor()V

    .line 1243
    return-void
.end method

.method public removeRemoteChatListener(Lcom/google/android/gtalkservice/IChatListener;)V
    .locals 5
    .param p1, "listener"    # Lcom/google/android/gtalkservice/IChatListener;

    .prologue
    .line 404
    invoke-interface {p1}, Lcom/google/android/gtalkservice/IChatListener;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    .line 406
    .local v0, "binder":Landroid/os/IBinder;
    iget-object v3, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    monitor-enter v3

    .line 407
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gtalkservice/IChatListener;

    .line 408
    .local v1, "cl":Lcom/google/android/gtalkservice/IChatListener;
    invoke-interface {v1}, Lcom/google/android/gtalkservice/IChatListener;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-ne v4, v0, :cond_0

    .line 409
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 410
    monitor-exit v3

    .line 414
    .end local v1    # "cl":Lcom/google/android/gtalkservice/IChatListener;
    :goto_0
    return-void

    .line 413
    :cond_1
    monitor-exit v3

    goto :goto_0

    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public saveUnsentComposedMessage(Ljava/lang/String;)V
    .locals 11
    .param p1, "unsentMessage"    # Ljava/lang/String;

    .prologue
    .line 943
    iget-object v7, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-static {v7}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 944
    .local v0, "bareJid":Ljava/lang/String;
    const-string v4, "contact_id in (select _id from contacts where account=? AND username=?)"

    .line 946
    .local v4, "selection":Ljava/lang/String;
    const/4 v7, 0x2

    new-array v5, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    const/4 v7, 0x1

    aput-object v0, v5, v7

    .line 947
    .local v5, "selectionArgs":[Ljava/lang/String;
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 948
    .local v6, "values":Landroid/content/ContentValues;
    const-string v7, "unsent_composed_message"

    invoke-virtual {v6, v7, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 949
    iget-object v7, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    sget-object v8, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v7, v8, v6, v4, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    if-lez v7, :cond_1

    .line 966
    :cond_0
    :goto_0
    return-void

    .line 956
    :cond_1
    if-eqz p1, :cond_0

    .line 958
    iget-object v7, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-static {v7}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 959
    .local v3, "resource":Ljava/lang/String;
    iget-object v7, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->getAccountId()J

    move-result-wide v8

    invoke-static {v7, v0, v8, v9}, Lcom/google/android/gtalkservice/DatabaseHelper;->getIdForContact(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v1

    .line 961
    .local v1, "pid":J
    const-string v7, "contact_id"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 962
    const-string v7, "jid_resource"

    invoke-virtual {v6, v7, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 963
    const-string v7, "groupchat"

    iget-boolean v8, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 964
    const-string v7, "last_message_date"

    new-instance v8, Ljava/lang/Long;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-direct {v8, v9, v10}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 965
    iget-object v7, p0, Lcom/google/android/gtalkservice/ChatSession;->mResolver:Landroid/content/ContentResolver;

    sget-object v8, Landroid/provider/Im$Chats;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v7, v8, v6}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    goto :goto_0
.end method

.method public sendChatMessage(Ljava/lang/String;)V
    .locals 9
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 550
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 594
    :goto_0
    return-void

    .line 554
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x7d0

    if-le v4, v5, :cond_1

    .line 555
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mContext:Landroid/content/Context;

    const v5, 0x7f050015

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x7

    invoke-direct {p0, v4, v5}, Lcom/google/android/gtalkservice/ChatSession;->addMessageToDatabase(Ljava/lang/String;I)Landroid/net/Uri;

    goto :goto_0

    .line 560
    :cond_1
    new-instance v1, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v1}, Lorg/jivesoftware/smack/packet/Message;-><init>()V

    .line 561
    .local v1, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/packet/Message;->setBody(Ljava/lang/String;)V

    .line 564
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Message;->getPacketID()Ljava/lang/String;

    .line 566
    invoke-virtual {p0}, Lcom/google/android/gtalkservice/ChatSession;->isGroupChat()Z

    move-result v4

    if-nez v4, :cond_3

    .line 567
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    invoke-virtual {v4}, Lcom/google/android/gtalkservice/ChatMgr;->getUserBareJidTimeout()J

    move-result-wide v2

    .line 568
    .local v2, "useBareJidTimeout":J
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/google/android/gtalkservice/ChatSession;->mLastChatReceivedTsMs:J

    sub-long/2addr v4, v6

    cmp-long v4, v4, v2

    if-lez v4, :cond_3

    .line 569
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sendChatMessage: it\'s been "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-wide/32 v5, 0xea60

    div-long v5, v2, v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mins since receiving a message from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". Use bareJid to send message"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/google/android/gtalkservice/ChatSession;->log(Ljava/lang/String;)V

    .line 572
    :cond_2
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-static {v4}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    .line 576
    .end local v2    # "useBareJidTimeout":J
    :cond_3
    iget-boolean v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v4, :cond_4

    sget-object v4, Lorg/jivesoftware/smack/packet/Message$Type;->GROUP_CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    :goto_1
    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/Message;->setType(Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 577
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mTo:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 578
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/packet/Message;->setIsIncoming(Z)V

    .line 582
    iget-boolean v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChat:Z

    if-eqz v4, :cond_5

    .line 583
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChatNickname:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChatNickname:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/google/android/gtalkservice/ChatSession;->getGroupChatShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v1, v4, v5, v8}, Lcom/google/android/gtalkservice/ChatSession;->addGroupMessageToDatabase(Lorg/jivesoftware/smack/packet/Message;Ljava/lang/String;Ljava/lang/String;Z)Landroid/net/Uri;

    .line 590
    :goto_2
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gtalkservice/ChatSession;->mGTalkConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v4, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 591
    :catch_0
    move-exception v4

    move-object v0, v4

    .line 592
    .local v0, "ex":Ljava/lang/IllegalStateException;
    const-string v4, "GTalkService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sendChatMessage caught "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 576
    .end local v0    # "ex":Ljava/lang/IllegalStateException;
    :cond_4
    sget-object v4, Lorg/jivesoftware/smack/packet/Message$Type;->CHAT:Lorg/jivesoftware/smack/packet/Message$Type;

    goto :goto_1

    .line 586
    :cond_5
    invoke-direct {p0, v1, v8}, Lcom/google/android/gtalkservice/ChatSession;->addMessageToDatabase(Lorg/jivesoftware/smack/packet/Message;Z)Landroid/net/Uri;

    goto :goto_2
.end method

.method setGroupChatNickname(Ljava/lang/String;)V
    .locals 0
    .param p1, "nickname"    # Ljava/lang/String;

    .prologue
    .line 328
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatSession;->mGroupChatNickname:Ljava/lang/String;

    .line 329
    return-void
.end method

.method setMyGroupChatNickname(Ljava/lang/String;)V
    .locals 0
    .param p1, "nickname"    # Ljava/lang/String;

    .prologue
    .line 318
    iput-object p1, p0, Lcom/google/android/gtalkservice/ChatSession;->mMyGroupChatNickname:Ljava/lang/String;

    .line 319
    return-void
.end method
