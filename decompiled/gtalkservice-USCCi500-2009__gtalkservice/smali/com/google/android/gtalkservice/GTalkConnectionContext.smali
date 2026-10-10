.class public Lcom/google/android/gtalkservice/GTalkConnectionContext;
.super Ljava/lang/Object;
.source "GTalkConnectionContext.java"


# instance fields
.field private mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

.field private mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

.field private mDataMessageMgr:Lcom/google/android/gtalkservice/DataMessageManager;

.field private mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

.field private mHttpResponseMgr:Lcom/google/android/gtalkservice/HttpResponseManager;

.field private mIQMgr:Lcom/google/android/gtalkservice/IQPacketManager;

.field private mOtrMgr:Lcom/google/android/gtalkservice/OtrManager;

.field private mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

.field private mRosterMgr:Lcom/google/android/gtalkservice/RosterManager;

.field private mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

.field private mSubscriptionMgr:Lcom/google/android/gtalkservice/SubscriptionManager;

.field private mVCardMgr:Lcom/google/android/gtalkservice/VCardMgr;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/service/GTalkServiceContext;Lcom/google/android/gtalkservice/GTalkConnection;)V
    .locals 1
    .param p1, "serviceContext"    # Lcom/google/android/gtalkservice/service/GTalkServiceContext;
    .param p2, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    .line 44
    invoke-virtual {p1}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getService()Lcom/google/android/gtalkservice/service/GTalkService;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    .line 45
    iput-object p2, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    .line 47
    new-instance v0, Lcom/google/android/gtalkservice/RosterManager;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/RosterManager;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mRosterMgr:Lcom/google/android/gtalkservice/RosterManager;

    .line 48
    new-instance v0, Lcom/google/android/gtalkservice/ChatMgr;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/ChatMgr;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    .line 49
    new-instance v0, Lcom/google/android/gtalkservice/DataMessageManager;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/DataMessageManager;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mDataMessageMgr:Lcom/google/android/gtalkservice/DataMessageManager;

    .line 50
    new-instance v0, Lcom/google/android/gtalkservice/HttpResponseManager;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/HttpResponseManager;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mHttpResponseMgr:Lcom/google/android/gtalkservice/HttpResponseManager;

    .line 51
    new-instance v0, Lcom/google/android/gtalkservice/SubscriptionManager;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/SubscriptionManager;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mSubscriptionMgr:Lcom/google/android/gtalkservice/SubscriptionManager;

    .line 52
    new-instance v0, Lcom/google/android/gtalkservice/VCardMgr;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/VCardMgr;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mVCardMgr:Lcom/google/android/gtalkservice/VCardMgr;

    .line 53
    new-instance v0, Lcom/google/android/gtalkservice/OtrManager;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/OtrManager;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mOtrMgr:Lcom/google/android/gtalkservice/OtrManager;

    .line 54
    new-instance v0, Lcom/google/android/gtalkservice/IQPacketManager;

    invoke-direct {v0, p2}, Lcom/google/android/gtalkservice/IQPacketManager;-><init>(Lcom/google/android/gtalkservice/GTalkConnection;)V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mIQMgr:Lcom/google/android/gtalkservice/IQPacketManager;

    .line 55
    new-instance v0, Lcom/google/android/gtalkservice/RosterListenerImpl;

    invoke-direct {v0}, Lcom/google/android/gtalkservice/RosterListenerImpl;-><init>()V

    iput-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    .line 56
    return-void
.end method


# virtual methods
.method public getChatManager()Lcom/google/android/gtalkservice/ChatMgr;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    return-object v0
.end method

.method public getDataMessageManager()Lcom/google/android/gtalkservice/DataMessageManager;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mDataMessageMgr:Lcom/google/android/gtalkservice/DataMessageManager;

    return-object v0
.end method

.method public getGTalkConnection()Lcom/google/android/gtalkservice/GTalkConnection;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    return-object v0
.end method

.method public getGtalkAccountId()J
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->getAccountId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getGtalkProviderId()J
    .locals 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mServiceContext:Lcom/google/android/gtalkservice/service/GTalkServiceContext;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/service/GTalkServiceContext;->getGtalkProviderId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getHttpResponseManager()Lcom/google/android/gtalkservice/HttpResponseManager;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mHttpResponseMgr:Lcom/google/android/gtalkservice/HttpResponseManager;

    return-object v0
.end method

.method public getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mIQMgr:Lcom/google/android/gtalkservice/IQPacketManager;

    return-object v0
.end method

.method public getOtrManager()Lcom/google/android/gtalkservice/OtrManager;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mOtrMgr:Lcom/google/android/gtalkservice/OtrManager;

    return-object v0
.end method

.method public getRoster()Lorg/jivesoftware/smack/Roster;
    .locals 3

    .prologue
    .line 92
    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnection;->getConnection()Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v0

    .line 93
    .local v0, "conn":Lorg/jivesoftware/smack/XMPPConnection;
    const/4 v1, 0x0

    .line 95
    .local v1, "roster":Lorg/jivesoftware/smack/Roster;
    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPConnection;->getRoster()Lorg/jivesoftware/smack/Roster;

    move-result-object v1

    .line 99
    :cond_0
    return-object v1
.end method

.method public getRosterHandler()Lcom/google/android/gtalkservice/RosterListenerImpl;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    return-object v0
.end method

.method public getRosterManager()Lcom/google/android/gtalkservice/RosterManager;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mRosterMgr:Lcom/google/android/gtalkservice/RosterManager;

    return-object v0
.end method

.method public getService()Lcom/google/android/gtalkservice/service/GTalkService;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    return-object v0
.end method

.method public getSubscriptionManager()Lcom/google/android/gtalkservice/SubscriptionManager;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mSubscriptionMgr:Lcom/google/android/gtalkservice/SubscriptionManager;

    return-object v0
.end method

.method public getVCardManager()Lcom/google/android/gtalkservice/VCardMgr;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mVCardMgr:Lcom/google/android/gtalkservice/VCardMgr;

    return-object v0
.end method

.method public init(Landroid/os/Handler;)V
    .locals 3
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 59
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v1}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 61
    .local v0, "resolver":Landroid/content/ContentResolver;
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mRosterMgr:Lcom/google/android/gtalkservice/RosterManager;

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v1, v2, v0, p0}, Lcom/google/android/gtalkservice/RosterManager;->init(Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;)V

    .line 62
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mChatMgr:Lcom/google/android/gtalkservice/ChatMgr;

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v1, v2, v0, p0, p1}, Lcom/google/android/gtalkservice/ChatMgr;->init(Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V

    .line 63
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mDataMessageMgr:Lcom/google/android/gtalkservice/DataMessageManager;

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v1, v2, p0, p1}, Lcom/google/android/gtalkservice/DataMessageManager;->init(Landroid/content/Context;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V

    .line 64
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mHttpResponseMgr:Lcom/google/android/gtalkservice/HttpResponseManager;

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v1, v2, p0, p1}, Lcom/google/android/gtalkservice/HttpResponseManager;->init(Landroid/content/Context;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V

    .line 65
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mSubscriptionMgr:Lcom/google/android/gtalkservice/SubscriptionManager;

    invoke-virtual {v1, v0, p0, p1}, Lcom/google/android/gtalkservice/SubscriptionManager;->init(Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V

    .line 66
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mVCardMgr:Lcom/google/android/gtalkservice/VCardMgr;

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v1, v2, p0}, Lcom/google/android/gtalkservice/VCardMgr;->init(Landroid/content/Context;Lcom/google/android/gtalkservice/GTalkConnectionContext;)V

    .line 67
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mOtrMgr:Lcom/google/android/gtalkservice/OtrManager;

    iget-object v2, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mGTalkService:Lcom/google/android/gtalkservice/service/GTalkService;

    invoke-virtual {v1, v2, v0, p0}, Lcom/google/android/gtalkservice/OtrManager;->init(Landroid/content/Context;Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;)V

    .line 68
    iget-object v1, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mRosterListenerImpl:Lcom/google/android/gtalkservice/RosterListenerImpl;

    invoke-virtual {v1, v0, p0, p1}, Lcom/google/android/gtalkservice/RosterListenerImpl;->init(Landroid/content/ContentResolver;Lcom/google/android/gtalkservice/GTalkConnectionContext;Landroid/os/Handler;)V

    .line 69
    return-void
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/google/android/gtalkservice/GTalkConnectionContext;->mConnection:Lcom/google/android/gtalkservice/GTalkConnection;

    invoke-virtual {v0}, Lcom/google/android/gtalkservice/GTalkConnection;->isConnected()Z

    move-result v0

    return v0
.end method
