.class Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;
.super Ljava/lang/Object;
.source "StatusBarNotifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Item"
.end annotation


# instance fields
.field mAvatar:Landroid/graphics/Bitmap;

.field mContext:Landroid/content/Context;

.field mMessage:Ljava/lang/String;

.field mNickname:Ljava/lang/String;

.field mNotificationIntent:Landroid/content/Intent;

.field mResources:Landroid/content/res/Resources;

.field mTitle:Ljava/lang/String;

.field mUsername:Ljava/lang/String;

.field final synthetic this$1:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;


# direct methods
.method public constructor <init>(Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "nickName"    # Ljava/lang/String;
    .param p5, "title"    # Ljava/lang/String;
    .param p6, "message"    # Ljava/lang/String;
    .param p7, "intent"    # Landroid/content/Intent;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->this$1:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object p2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mContext:Landroid/content/Context;

    .line 103
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mResources:Landroid/content/res/Resources;

    .line 104
    iput-object p3, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mUsername:Ljava/lang/String;

    .line 105
    iput-object p4, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mNickname:Ljava/lang/String;

    .line 106
    iput-object p5, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mTitle:Ljava/lang/String;

    .line 107
    iput-object p6, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mMessage:Ljava/lang/String;

    .line 108
    iput-object p7, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mNotificationIntent:Landroid/content/Intent;

    .line 113
    return-void
.end method

.method private getAvatarFromCursor(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;
    .locals 3
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "dataColumn"    # I

    .prologue
    .line 141
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    .line 143
    .local v0, "rawData":[B
    if-nez v0, :cond_0

    .line 144
    const/4 v1, 0x0

    .line 147
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0
.end method

.method private loadAvatar()Landroid/graphics/Bitmap;
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 116
    const/4 v7, 0x0

    .line 118
    .local v7, "retVal":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 119
    .local v0, "r":Landroid/content/ContentResolver;
    sget-object v1, Landroid/provider/Im$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->access$000()[Ljava/lang/String;

    move-result-object v2

    const-string v3, "username=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mUsername:Ljava/lang/String;

    aput-object v5, v4, v8

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 125
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 127
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    const/4 v1, 0x0

    invoke-direct {p0, v6, v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->getAvatarFromCursor(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 131
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 137
    :goto_0
    return-object v7

    .line 131
    :catchall_0
    move-exception v1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v1

    .line 134
    :cond_1
    iget-object v1, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->this$1:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;

    iget-object v1, v1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    const-string v2, "loadAvatar"

    invoke-static {v1, v2}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->access$100(Lcom/google/android/gtalkservice/service/StatusBarNotifier;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "that"    # Ljava/lang/Object;

    .prologue
    .line 153
    sget-boolean v0, Lcom/google/android/gtalkservice/LogTag;->sVerbose:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->this$1:Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;

    iget-object v0, v0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo;->this$0:Lcom/google/android/gtalkservice/service/StatusBarNotifier;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "NotificationInfo.Item.equals: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mUsername:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gtalkservice/service/StatusBarNotifier;->access$200(Lcom/google/android/gtalkservice/service/StatusBarNotifier;Ljava/lang/String;)V

    .line 155
    :cond_0
    instance-of v0, p1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    if-eqz v0, :cond_1

    .line 156
    iget-object v0, p0, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mUsername:Ljava/lang/String;

    check-cast p1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;

    .end local p1    # "that":Ljava/lang/Object;
    iget-object v1, p1, Lcom/google/android/gtalkservice/service/StatusBarNotifier$NotificationInfo$Item;->mUsername:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 159
    :goto_0
    return v0

    .restart local p1    # "that":Ljava/lang/Object;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
