.class Lcom/google/android/gtalkservice/GTalkConnection$1;
.super Ljava/lang/Object;
.source "GTalkConnection.java"

# interfaces
.implements Lcom/google/android/gtalkservice/IQPacketHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gtalkservice/GTalkConnection;->requestBatchQuery(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/gtalkservice/GTalkConnection;

.field final synthetic val$username:Ljava/lang/String;

.field final synthetic val$vcardMgr:Lcom/google/android/gtalkservice/VCardMgr;


# direct methods
.method constructor <init>(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;Lcom/google/android/gtalkservice/VCardMgr;)V
    .locals 0

    .prologue
    .line 1332
    iput-object p1, p0, Lcom/google/android/gtalkservice/GTalkConnection$1;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    iput-object p2, p0, Lcom/google/android/gtalkservice/GTalkConnection$1;->val$username:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gtalkservice/GTalkConnection$1;->val$vcardMgr:Lcom/google/android/gtalkservice/VCardMgr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handlePacket(Lorg/jivesoftware/smack/packet/IQ;)V
    .locals 9
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/IQ;

    .prologue
    .line 1333
    instance-of v6, p1, Lorg/jivesoftware/smackx/packet/VCard;

    if-nez v6, :cond_1

    .line 1334
    sget-boolean v6, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v6, :cond_0

    .line 1335
    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkConnection$1;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "requestBatchQuery handlePacket: got packet of class "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", ignore"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->access$800(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V

    .line 1359
    :cond_0
    :goto_0
    return-void

    .line 1344
    :cond_1
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smackx/packet/VCard;

    move-object v5, v0

    .line 1345
    .local v5, "vcard":Lorg/jivesoftware/smackx/packet/VCard;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/VCard;->hasModified()Z

    move-result v2

    .line 1346
    .local v2, "hasModified":Z
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/VCard;->isModified()Z

    move-result v4

    .line 1348
    .local v4, "isModified":Z
    sget-boolean v6, Lcom/google/android/gtalkservice/LogTag;->sDebug:Z

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkConnection$1;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "requestBatchQuery.handlePacket: received "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->access$800(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V

    .line 1350
    :cond_2
    if-eqz v2, :cond_3

    if-nez v4, :cond_3

    .line 1351
    sget-boolean v6, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkConnection$1;->this$0:Lcom/google/android/gtalkservice/GTalkConnection;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "avatar for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/gtalkservice/GTalkConnection$1;->val$username:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " isn\'t modified"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/google/android/gtalkservice/GTalkConnection;->access$800(Lcom/google/android/gtalkservice/GTalkConnection;Ljava/lang/String;)V

    goto :goto_0

    .line 1353
    :cond_3
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/VCard;->getAvatar()[B

    move-result-object v1

    .line 1354
    .local v1, "data":[B
    if-nez v1, :cond_4

    if-eqz v2, :cond_0

    if-eqz v4, :cond_0

    .line 1355
    :cond_4
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/VCard;->getAvatarHash()Ljava/lang/String;

    move-result-object v3

    .line 1356
    .local v3, "hash":Ljava/lang/String;
    iget-object v6, p0, Lcom/google/android/gtalkservice/GTalkConnection$1;->val$vcardMgr:Lcom/google/android/gtalkservice/VCardMgr;

    iget-object v7, p0, Lcom/google/android/gtalkservice/GTalkConnection$1;->val$username:Ljava/lang/String;

    invoke-virtual {v6, v7, v1, v3}, Lcom/google/android/gtalkservice/VCardMgr;->storeAvatarData(Ljava/lang/String;[BLjava/lang/String;)V

    goto :goto_0
.end method
