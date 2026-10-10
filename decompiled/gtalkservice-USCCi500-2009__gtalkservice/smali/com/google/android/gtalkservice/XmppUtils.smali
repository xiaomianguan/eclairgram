.class public Lcom/google/android/gtalkservice/XmppUtils;
.super Ljava/lang/Object;
.source "XmppUtils.java"


# static fields
.field private static final GROUP_CHAT_PREFIX:Ljava/lang/String; = "private-chat-"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declineGroupChatInvitation(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "inviter"    # Ljava/lang/String;
    .param p4, "reason"    # Ljava/lang/String;

    .prologue
    const-string v6, "GTalkService"

    .line 75
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    const-string v4, "GTalkService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "declineGroupInvitation: from="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", to="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", room="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", reason="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    :cond_0
    new-instance v2, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/Message;-><init>()V

    .line 83
    .local v2, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 86
    new-instance v3, Lorg/jivesoftware/smackx/packet/MUCUser;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/packet/MUCUser;-><init>()V

    .line 87
    .local v3, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    new-instance v0, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;-><init>()V

    .line 88
    .local v0, "decline":Lorg/jivesoftware/smackx/packet/MUCUser$Decline;
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;->setFrom(Ljava/lang/String;)V

    .line 89
    invoke-virtual {v0, p3}, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;->setTo(Ljava/lang/String;)V

    .line 90
    invoke-virtual {v0, p4}, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;->setReason(Ljava/lang/String;)V

    .line 91
    invoke-virtual {v3, v0}, Lorg/jivesoftware/smackx/packet/MUCUser;->setDecline(Lorg/jivesoftware/smackx/packet/MUCUser$Decline;)V

    .line 92
    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 94
    :try_start_0
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    :goto_0
    return-void

    .line 95
    :catch_0
    move-exception v1

    .line 96
    .local v1, "ex":Ljava/lang/IllegalStateException;
    const-string v4, "GTalkService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sendGroupChatInvitationTo caught "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static isGroupChat(Ljava/lang/String;)Z
    .locals 1
    .param p0, "username"    # Ljava/lang/String;

    .prologue
    .line 101
    const-string v0, "private-chat-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static sendGroupChatInvitationTo(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p1, "room"    # Ljava/lang/String;
    .param p2, "invitee"    # Ljava/lang/String;
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    const-string v6, "GTalkService"

    .line 45
    sget-boolean v4, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v4, :cond_0

    const-string v4, "GTalkService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sendGroupChatInvitationTo: room="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", invitee="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    :cond_0
    new-instance v2, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/Message;-><init>()V

    .line 50
    .local v2, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v2, p1}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 53
    new-instance v3, Lorg/jivesoftware/smackx/packet/MUCUser;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/packet/MUCUser;-><init>()V

    .line 54
    .local v3, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    new-instance v1, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;-><init>()V

    .line 55
    .local v1, "invite":Lorg/jivesoftware/smackx/packet/MUCUser$Invite;
    invoke-virtual {v1, p2}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;->setTo(Ljava/lang/String;)V

    .line 56
    invoke-virtual {v1, p3}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;->setReason(Ljava/lang/String;)V

    .line 57
    invoke-virtual {v3, v1}, Lorg/jivesoftware/smackx/packet/MUCUser;->setInvite(Lorg/jivesoftware/smackx/packet/MUCUser$Invite;)V

    .line 59
    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 62
    :try_start_0
    invoke-virtual {p0, v2}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "ex":Ljava/lang/IllegalStateException;
    const-string v4, "GTalkService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sendGroupChatInvitationTo caught "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static sendPresenceProbe(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V
    .locals 4
    .param p0, "connection"    # Lcom/google/android/gtalkservice/GTalkConnection;
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    const-string v3, "GTalkService"

    .line 33
    const-string v1, "GTalkService"

    const/4 v1, 0x3

    invoke-static {v3, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 34
    const-string v1, "GTalkService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "send presence probe to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v1, Lorg/jivesoftware/smack/packet/Presence$Type;->PROBE:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 38
    .local v0, "probe":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 40
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gtalkservice/GTalkConnection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;Z)Z

    .line 41
    return-void
.end method
