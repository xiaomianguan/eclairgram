.class Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;
.super Ljava/lang/Object;
.source "VCardMgr.java"

# interfaces
.implements Lcom/google/android/gtalkservice/IQPacketHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/VCardMgr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VCardUploader"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/VCardMgr;


# direct methods
.method private constructor <init>(Lcom/google/android/gtalkservice/VCardMgr;)V
    .locals 0

    .prologue
    .line 488
    iput-object p1, p0, Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;->this$0:Lcom/google/android/gtalkservice/VCardMgr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gtalkservice/VCardMgr;Lcom/google/android/gtalkservice/VCardMgr$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/gtalkservice/VCardMgr;
    .param p2, "x1"    # Lcom/google/android/gtalkservice/VCardMgr$1;

    .prologue
    .line 488
    invoke-direct {p0, p1}, Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;-><init>(Lcom/google/android/gtalkservice/VCardMgr;)V

    return-void
.end method


# virtual methods
.method public handlePacket(Lorg/jivesoftware/smack/packet/IQ;)V
    .locals 3
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/IQ;

    .prologue
    .line 504
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v0

    .line 506
    .local v0, "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v0, v1, :cond_1

    .line 513
    :cond_0
    :goto_0
    return-void

    .line 508
    :cond_1
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v0, v1, :cond_0

    .line 509
    const-string v1, "GTalkService"

    const-string v2, "VCardUploader: upload avatar failed!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method uploadToServer([B)V
    .locals 4
    .param p1, "avatarData"    # [B

    .prologue
    .line 490
    sget-boolean v2, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;->this$0:Lcom/google/android/gtalkservice/VCardMgr;

    const-string v3, "upload vcard for user"

    invoke-static {v2, v3}, Lcom/google/android/gtalkservice/VCardMgr;->access$100(Lcom/google/android/gtalkservice/VCardMgr;Ljava/lang/String;)V

    .line 492
    :cond_0
    iget-object v2, p0, Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;->this$0:Lcom/google/android/gtalkservice/VCardMgr;

    invoke-static {v2}, Lcom/google/android/gtalkservice/VCardMgr;->access$300(Lcom/google/android/gtalkservice/VCardMgr;)Lcom/google/android/gtalkservice/GTalkConnectionContext;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gtalkservice/GTalkConnectionContext;->getIQPacketManager()Lcom/google/android/gtalkservice/IQPacketManager;

    move-result-object v0

    .line 493
    .local v0, "iqMgr":Lcom/google/android/gtalkservice/IQPacketManager;
    new-instance v1, Lorg/jivesoftware/smackx/packet/VCard;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/VCard;-><init>()V

    .line 494
    .local v1, "vcard":Lorg/jivesoftware/smackx/packet/VCard;
    iget-object v2, p0, Lcom/google/android/gtalkservice/VCardMgr$VCardUploader;->this$0:Lcom/google/android/gtalkservice/VCardMgr;

    invoke-static {v2}, Lcom/google/android/gtalkservice/VCardMgr;->access$500(Lcom/google/android/gtalkservice/VCardMgr;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/VCard;->setFrom(Ljava/lang/String;)V

    .line 495
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/VCard;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 496
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/packet/VCard;->setAvatarForUpload([B)V

    .line 500
    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Lcom/google/android/gtalkservice/IQPacketManager;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;Lcom/google/android/gtalkservice/IQPacketHandler;Z)V

    .line 501
    return-void
.end method
